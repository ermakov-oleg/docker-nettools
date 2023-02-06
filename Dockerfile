FROM debian:bullseye-slim

RUN apt update && \
    apt install -y \
        curl \
	jq \
	netcat \
	dnsutils \
        vim \
	watch

RUN curl -o /usr/bin/hey https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64 && chmod +x /usr/bin/hey

STOPSIGNAL SIGKILL

CMD [ "/bin/bash" ]
