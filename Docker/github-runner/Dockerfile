FROM debian:bullseye-slim

ARG RUNNER_VERSION="2.299.1"
ARG RUNNER_WORK_DIRECTORY="/root"

ENV RUNNER_NAME=""
ENV RUNNER_REPOSITORY=""
ENV RUNNER_WORK_DIRECTORY=${RUNNER_WORK_DIRECTORY}
ENV RUNNER_TOKEN=""

WORKDIR ${RUNNER_WORK_DIRECTORY}

COPY ./entrypoint.sh ./

RUN apt-get update && \
    apt-get install --no-install-recommends -y ca-certificates curl gnupg lsb-release git jq unzip && \
    apt-get clean

RUN curl -fsSL 'https://download.docker.com/linux/debian/gpg' | gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg && \
    echo "deb https://download.docker.com/linux/debian bullseye stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install --no-install-recommends -y docker-ce-cli docker-compose-plugin && \
    apt-get clean

RUN mkdir -p /opt/actions-runner && \
    curl -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -o /tmp/actions-runner.tgz && \
    tar -xzf /tmp/actions-runner.tgz -C /opt/actions-runner/ && \
    rm -f /tmp/actions-runner.tgz

ENTRYPOINT ["./entrypoint.sh"]
