---
Title: Pip
Author: m
Date: 25082023
---

# Indexes

**Q: One-time install with different index**

```
pip install -i https://pypi.org/simple pip-tools
```

**Q: How to change source index?**
Modify pip.conf. For global settings - ~/.pip/pip.conf, for venv - .venv/pip.conf:

```
[global]
index-url = https://pypi.org/simple
```
