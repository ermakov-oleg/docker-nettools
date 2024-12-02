FROM python:3.12-slim-bullseye

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
        tcpdump \
        iputils-ping \
        iproute2 \
        lsof \
        gdb

RUN echo "deb [signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian/ stable main" | tee /etc/apt/sources.list.d/azlux.list && \
    curl https://azlux.fr/repo.gpg -o /usr/share/keyrings/azlux-archive-keyring.gpg && \
    apt update && \
    apt install oha

RUN curl -o /usr/bin/hey https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64 && chmod +x /usr/bin/hey

RUN pip install memray py-spy httpstat

STOPSIGNAL SIGKILL

CMD [ "/bin/bash" ]
