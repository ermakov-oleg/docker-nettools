FROM python:3.11-slim-bullseye

RUN apt update && \
    apt install -y \
        curl \
        jq \
        gnupg2 \
        netcat \
        dnsutils \
        vim \
        tmux \
        telnet \
        watch \
        iputils-ping

RUN echo "deb http://packages.azlux.fr/debian/ buster main" | tee /etc/apt/sources.list.d/azlux.list && \
    curl https://azlux.fr/repo.gpg.key | apt-key add - && \
    apt update && \
    apt install oha

RUN curl -o /usr/bin/hey https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64 && chmod +x /usr/bin/hey

RUN pip install py-spy

STOPSIGNAL SIGKILL

CMD [ "/bin/bash" ]
