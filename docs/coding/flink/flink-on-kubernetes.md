---
Title: Flink On Kubernetes
Author: m
Date: 31082023
---

# Intro

Ok! With document i will try to log my learning process for running Flink on Kubernetes. By this i will try concept of "faster learning via teaching". Let's go!

# In

I have several working Flink jobs (on AWS EMR), which does some simple ETL process, getting data from Kafka and Sending them to Kinesis. My task is to run them on Kubernetes, due to it's scalability, flexibility, general company inention to move to Kube.

Additional complexity is that i have PyFlink jobs, and usually Python version of flink is slightly more complicated and less documented than Java version.

# Options

I see 3 major options to run Flink on K8s.

https://stackoverflow.com/questions/63270800/how-different-is-the-flink-deployment-on-kubernetes-and-native-kubernetes


- Standalone
  Same as running Flink app on local machine, but using K8s pods and nodes. K8s doesn't know anything about flink...

- Native
  Didn't work for me, so i started reading about...

- Flink K8s Operator
  This is what i do...

# Flink K8s Operator install with Helm

Helm install is described [here](https://nightlies.apache.org/flink/flink-kubernetes-operator-docs-main/docs/try-flink-kubernetes-operator/quick-start/)

Also, given article worked for me to run basic Java flink job. As usual, it was different exeperience for PyFlink - no out-of-the-box success. Ok so,

# First PyFlink job

[This](https://github.com/apache/flink-kubernetes-operator/tree/main/examples/flink-python-example) was what helped me, with one exception. As im new to K8s and Docker, it wasn't obvious for me that i had to push **image: flink-python-example:latest** to some repo. After this push all worked

```
TODO - commands for port forwaring, logs, start and delete
```

# Docker issue

I met problem that docker doesn't capture my script cahnges - Dockerfile actually copies script, and if there changes there, it doesn't actually notice it. As a result

docker build --build-arg CACHEBUST=$(date +%s) --tag flink-python-example:latest .


# Monitoring Flink with Prometheus
So the task is to get Flink metrics in K8s cluster (AWS based in my case, with AWS EKS), there shopuld be no manual tuning of dlink jobs to get metrics, nice to have - metrics about general status of Flink Operator. All is helm-based releases.

Task consist of 3 parts:
  - Setting up Prometheus to scrap metrics
  - Setting up Flink to expose metrics
  - Make Prometheus know waht exactly to scrap

## Prometheus
I'm talking about general [prometheus-community](https://github.com/prometheus-community/helm-charts) app. It is installed as helm release. Basic settings make scrapping very simple: Your Kubernetes POD (important) should have annotiations like
```
prometheus.io/path: "/"
prometheus.io/port: "9249"
prometheus.io/scrape: "true"
```
So basically no need to change settings, basic Prometheus config is fine.

## Exposing metrics
For jobmanager and taskmanager, this is set from flink-conf.yaml. In K8s context, this is basically set in config yaml of the Flink app like this:

```spec:
  ...
  flinkConfiguration:
    ...
    metrics.reporters: prom
    metrics.reporter.prom.factory.class: org.apache.flink.metrics.prometheus.PrometheusReporterFactory
    metrics.reporter.prom.port: "9249"
    ...
```    
Other settings are described in Flink documentation.

As for Flink K8s Operator, exposing metrics are done via same file, but i did it on helm install, by changing defaultConfiguration property this way:

```defaultConfiguration:
  create: trueso
  append: true
  flink-conf.yaml: |+
    kubernetes.operator.metrics.reporter.prom.factory.class: org.apache.flink.metrics.prometheus.PrometheusReporterFactory
    kubernetes.operator.metrics.reporter.prom.port: 9249
```

## How to make Prometheus notice exposed metrics?
This is where i spent most of the time with this task...
It is important to understand that prometheus with basic config gets metrics from PODS with specific annotattion. Trying to mark flinkdeployment, some service accounts or anything else didn't work form me. What actually worked was exactly [this part of docs](https://nightlies.apache.org/flink/flink-kubernetes-operator-docs-main/docs/custom-resource/pod-template/) which sets how pod annotations should look like.

For Flink Operator, this is set in values for helm install this way:
```operatorPod:
  annotations:
    prometheus.io/path: "/"
    prometheus.io/port: "9249"
    prometheus.io/scrape: "true"
```

Also, i used
```
k describe pods/...
```

To check how actual annotastions look like after settings changes. Also, this can be checked from prometheus UI - Main Menu -> Status -> Targets show all targets which are scrapped, also Pods. JobManager pod, TaskManager pod, Flink K8s Operator should be there for monitoring to work.


# Service Accounts stuff

So basically Flink k8s operator creates 2 service accounts - "flink-operator" for infra-related things and "flink" for jobs and task-managers.

In AWS environment, for accessing its resources like Kinesis or S3, it's needed to bind IAM role to flink service account. This is done by this article info - https://docs.aws.amazon.com/eks/latest/userguide/associate-service-account-role.html

But actually all is needed add somehow this annotation to any service account ("flink" or created one):

```annotations:
  eks.amazonaws.com/role-arn: "arn:aws:iam::588639172377:role/kube-dataplatform-fave-by-test"
```
Also, additional policy is needed to assume this role (described in article above):

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::111122223333:oidc-provider/oidc.eks.region-code.amazonaws.com/id/EXAMPLED539D4633E53DE1B71EXAMPLE"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "oidc.eks.region-code.amazonaws.com/id/EXAMPLED539D4633E53DE1B71EXAMPLE:sub": "system:serviceaccount:default:my-service-account",
                    "oidc.eks.region-code.amazonaws.com/id/EXAMPLED539D4633E53DE1B71EXAMPLE:aud": "sts.amazonaws.com"
                }
            }
        }
    ]
}
```

Small neat thing:
```
brew install iam-policy-json-to-terraform
```
we use terraform to configure IAM roles for flink, and this simple console utility is good enough to covert exisiting IAM Json to terraform format.

# Issues which i've met worth some attention

1.
```
Caused by: java.lang.ClassCastException: cannot assign instance of org.apache.kafka.clients.consumer.OffsetResetStrategy to field org.apache.flink.connector.kafka.source.enumerator.initializer.ReaderHandledOffsetsInitializer.offsetResetStrategy of type org.apache.kafka.clients.consumer.OffsetResetStrategy in instance of org.apache.flink.connector.kafka.source.enumerator.initializer.ReaderHandledOffsetsInitializer
```
https://stackoverflow.com/questions/72266646/flink-application-classcastexception

2.
Always check examples configuration - to match actually used Flink version.
I spend lots of time trying to fix issue, which was connected to Dockerfile which builds custom PyFlink image. I my case, Flink 1.15 didn't need liblzma-dev library, but 1.16 actyulally needed it. So when i tried to start example for the newes version, it failed to start with very ugly error, which didn't lead me to any ideas...



# Flink On Kubernetes important links:

[Examples, also pyflink](https://github.com/apache/flink-kubernetes-operator/tree/main/examples)

[some real flink app on k8s setting up](https://github.com/rmetzger/flink-reactive-mode-k8s-demo/blob/main/README.md)
