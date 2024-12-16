FROM debian:latest

RUN apt-get update && apt-get install -y \
    love git wget && \
    apt-get clean

WORKDIR /workspace

COPY . /workspace

CMD ["love", "."]
