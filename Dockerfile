FROM node:15-alpine

ARG VERSION=1.18.190
ENV AWS_CLI_VERSION=$VERSION

RUN apk --update --no-cache add \
    openssh-client \
    python \
    py-pip \
    jq \
    bash \
    git \
    groff \
    less \
    mailcap \
    bash \
    && pip install --no-cache-dir awscli==$AWS_CLI_VERSION \
    && apk del py-pip \
    && rm -rf /var/cache/apk/* /root/.cache/pip/*

WORKDIR /root
VOLUME /root/.aws

ENTRYPOINT [ "aws" ]
CMD ["--version"]
