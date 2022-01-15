wait-for "pokemon-docker-db:3306" -- "$@"

# Watch your .go files and invoke go build if the files changed.
CompileDaemon --build="go build main.go"  --command=./main