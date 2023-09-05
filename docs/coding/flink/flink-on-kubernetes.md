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


# Issues which i've met

```
Caused by: java.lang.ClassCastException: cannot assign instance of org.apache.kafka.clients.consumer.OffsetResetStrategy to field org.apache.flink.connector.kafka.source.enumerator.initializer.ReaderHandledOffsetsInitializer.offsetResetStrategy of type org.apache.kafka.clients.consumer.OffsetResetStrategy in instance of org.apache.flink.connector.kafka.source.enumerator.initializer.ReaderHandledOffsetsInitializer
```
https://stackoverflow.com/questions/72266646/flink-application-classcastexception



# Flink k8s Operator Commands:




# Flink On Kubernetes important links:

[Examples, also pyflink](https://github.com/apache/flink-kubernetes-operator/tree/main/examples)

[some real flink app on k8s setting up](https://github.com/rmetzger/flink-reactive-mode-k8s-demo/blob/main/README.md)
