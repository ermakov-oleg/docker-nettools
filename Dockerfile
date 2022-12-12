FROM debian:bullseye-slim

RUN apt update && \
    apt install -y \
    	curl \
	jq \
	netcat \
	dnsutils

CMD [ "/bin/bash" ]


