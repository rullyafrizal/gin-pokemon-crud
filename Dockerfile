FROM golang:alpine
RUN mkdir /pokemon-docker

WORKDIR /pokemon-docker

ADD go.mod .
ADD go.sum .

RUN go mod download
ADD . .

RUN go get github.com/githubnemo/CompileDaemon

EXPOSE 8080

ENTRYPOINT CompileDaemon --build="go build main.go"  --command=./main