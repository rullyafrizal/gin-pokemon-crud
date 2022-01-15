FROM golang:alpine
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