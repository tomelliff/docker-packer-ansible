FROM williamyeh/ansible:alpine3

LABEL maintainer "tomelliff@gmail.com"

ENV PACKER_VERSION=1.0.0
ENV PACKER_SHA256SUM=ed697ace39f8bb7bf6ccd78e21b2075f53c0f23cdfb5276c380a053a7b906853

RUN apk add --update git curl openssh make && \
    curl https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip > packer_${PACKER_VERSION}_linux_amd64.zip && \
    echo "${PACKER_SHA256SUM}  packer_${PACKER_VERSION}_linux_amd64.zip" > packer_${PACKER_VERSION}_SHA256SUMS && \
    cat packer_${PACKER_VERSION}_SHA256SUMS && \
    sha256sum packer_${PACKER_VERSION}_linux_amd64.zip && \
    sha256sum -c packer_${PACKER_VERSION}_SHA256SUMS && \
    unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /bin && \
    rm -f packer_${PACKER_VERSION}_linux_amd64.zip

ENTRYPOINT [ "/bin/sh" ]
