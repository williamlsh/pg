build:
    @docker build -t ghcr.io/williamlsh/pg .

run:
    @docker run --rm --name pg -e POSTGRES_PASSWORD=mysecretpassword ghcr.io/williamlsh/pg

push:
    @docker push ghcr.io/williamlsh/pg
