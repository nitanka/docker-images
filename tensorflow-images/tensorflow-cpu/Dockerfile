FROM ubuntu:14.04

MAINTAINER devops <nitanka.gogoi@razorthink.com>

ARG PYTHON35_URL="https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz"
#ARG TENSORFLOW=""

RUN apt-get update && \
    apt-get install -y software-properties-common python-software-properties curl build-essential checkinstall && \
    apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev tk-dev libgdbm-dev libc6-dev libbz2-dev && \
    rm -rf /var/lib/apt/lists/* && \
    cd /tmp && curl -O ${PYTHON35_URL} && \
    tar -xzf `basename ${PYTHON35_URL}` && \
    rm `basename ${PYTHON35_URL}` && \
    mv `basename -s .tgz ${PYTHON35_URL}` /usr/src/ && \
    cd /usr/src/`basename -s .tgz ${PYTHON35_URL}` && ./configure && make altinstall && \
    python3.5 -m pip install --upgrade pip tensorflow && \
    python3.5 -m pip install --upgrade numpy sphinx matplotlib sphinx_rtd_theme jsonpickle jinja2 && \
    python3.5 -m pip install --upgrade flask flask-httpauth pandas boto3 scipy sklearn gitchangelog pythonbenchmark pyhdfs typeguard && \
    python3.5 -m pip install --upgrade sphinx-autodoc-typehints pyyaml cython nose coloredlogs check-manifest flake8 bunch coverage 
    
    
