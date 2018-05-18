FROM centos:7
ARG docker_version=17.12.0

ENV DIND_COMMIT 3b5fac462d21ca164b3778647420016315289034
ENV DCOS_INSTALLER_URL https://downloads.dcos.io/dcos/stable/dcos_generate_config.sh

RUN yum install -y \
    bzip2 \
    git \
    iptables \
    lxc \
    unzip \
    zip

# Install docker
RUN yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo \
    && yum install -y docker-ce-${docker_version}.ce

RUN curl -sSL https://raw.githubusercontent.com/docker/docker/${DIND_COMMIT}/hack/dind -o /usr/local/bin/dind \
    && chmod a+x /usr/local/bin/dind

COPY ./entrypoint /usr/local/bin/entrypoint
RUN chmod a+x /usr/local/bin/entrypoint

COPY ./generate-install-files /usr/local/bin/generate-install-files
RUN chmod a+x /usr/local/bin/generate-install-files

VOLUME /var/lib/docker
ENTRYPOINT ["entrypoint"]
CMD ["generate-install-files"]
