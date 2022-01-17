# Build Stage
FROM golang:alpine AS builder
RUN mkdir /pokemon-docker

WORKDIR /pokemon-docker

ADD go.mod .
ADD go.sum .

RUN go mod download
ADD . .
COPY ./entry.sh /entry.sh

RUN go get github.com/githubnemo/CompileDaemon

EXPOSE 8080

ADD https://raw.githubusercontent.com/eficode/wait-for/v2.1.0/wait-for /usr/local/bin/wait-for
RUN chmod +rx /usr/local/bin/wait-for /entry.sh

ENTRYPOINT ["sh", "/entry.sh"]


# Run stage
FROM alpine:latest
WORKDIR /pokemon-docker

COPY --from=builder /pokemon-docker/main .

CMD ["/pokemon-docker/main"]