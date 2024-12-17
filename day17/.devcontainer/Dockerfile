FROM haskell:latest

WORKDIR /app

RUN curl -sSL https://get.haskellstack.org/ | sh

COPY . .

RUN stack setup

CMD ["stack", "run"]
