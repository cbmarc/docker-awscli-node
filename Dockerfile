FROM node:14

ARG VERSION=1.18.190
ENV AWS_CLI_VERSION=$VERSION

RUN apt-get update && apt-get install -y openssh-client \
    git \
    python \
    python-pip \
    && pip install --no-cache-dir awscli==$AWS_CLI_VERSION \
    && rm -rf /root/.cache/pip/*

WORKDIR /root
VOLUME /root/.aws

ENTRYPOINT [ "aws" ]
CMD ["--version"]
