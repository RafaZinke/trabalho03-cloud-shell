FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    bash \
    curl \
    apache2 \
    procps \
    && apt-get clean

WORKDIR /app

COPY scripts/ /app/scripts/
COPY source/  /app/source/

RUN chmod +x /app/scripts/*.sh

EXPOSE 80

CMD ["bash", "-c", "service apache2 start && tail -f /dev/null"]