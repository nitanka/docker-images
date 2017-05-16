FROM ubuntu:14.04
LABEL maintainer "NVIDIA CORPORATION <cudatools@nvidia.com>"

LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV CUDA_VERSION 8.0.61
ENV CUDA_PKG_VERSION 8-0=$CUDA_VERSION-1
ENV CUDNN_VERSION 5.1.10
ARG PYTHON35_URL="https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz"

RUN NVIDIA_GPGKEY_SUM=d1be581509378368edeec8c1eb2958702feedf3bc3d17011adbf24efacce4ab5 && \
    NVIDIA_GPGKEY_FPR=ae09fe4bbd223a84b2ccfce3f60f4b3d7fa2af80 && \
    apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/7fa2af80.pub && \
    apt-key adv --export --no-emit-version -a $NVIDIA_GPGKEY_FPR | tail -n +2 > cudasign.pub && \
    echo "$NVIDIA_GPGKEY_SUM  cudasign.pub" | sha256sum -c --strict - && rm cudasign.pub && \
    echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64 /" > /etc/apt/sources.list.d/cuda.list && \
    echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list && \ 
    apt-get update && apt-get install -y --no-install-recommends \
    cuda-nvrtc-$CUDA_PKG_VERSION \
    cuda-nvgraph-$CUDA_PKG_VERSION \
    cuda-cusolver-$CUDA_PKG_VERSION \
    cuda-cublas-8-0=8.0.61.1-1 \
    cuda-cufft-$CUDA_PKG_VERSION \
    cuda-curand-$CUDA_PKG_VERSION \
    cuda-cusparse-$CUDA_PKG_VERSION \
    cuda-npp-$CUDA_PKG_VERSION \
    cuda-cudart-$CUDA_PKG_VERSION && \
    ln -s cuda-8.0 /usr/local/cuda && \
    echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf.d/cuda.conf && \
    ldconfig && \
    echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf && \
    apt-get install -y --no-install-recommends libcudnn5=$CUDNN_VERSION-1+cuda8.0 && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update && \
    apt-get install -y software-properties-common python-software-properties curl build-essential checkinstall && \
    apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev tk-dev libgdbm-dev libc6-dev libbz2-dev && \
    rm -rf /var/lib/apt/lists/* && \
    cd /tmp && curl -O ${PYTHON35_URL} && \
    tar -xzf `basename ${PYTHON35_URL}` && \
    rm `basename ${PYTHON35_URL}` && \
    mv `basename -s .tgz ${PYTHON35_URL}` /usr/src/ && \
    cd /usr/src/`basename -s .tgz ${PYTHON35_URL}` && ./configure && make altinstall && \
    python3.5 -m pip install --upgrade pip tensorflow-gpu && \
    python3.5 -m pip install --upgrade pip boto pyhdfs smart_open matplotlib sphinx_rtd_theme jsonpickle jinja2 flask flask-httpauth \
    pandas boto3 scipy sklearn gitchangelog pythonbenchmark pyhdfs typeguard sphinx-autodoc-typehints pyyaml cython nose coloredlogs \
    check-manifest flake8 bunch coverage


ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64
