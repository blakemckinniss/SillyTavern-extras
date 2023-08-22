FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu20.04

EXPOSE 5100

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
        python3 python3-venv wget build-essential

WORKDIR /sillytavern-extras/
COPY . .

ARG REQUIREMENTS
RUN pip install -r $REQUIREMENTS

ARG MODULES
CMD ["python","server.py","--enable-modules=$MODULES"]
