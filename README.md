# Golang protobuf builder

## Builds your proto3 files and emits golang and swagger files

## Usage
You should mount folder with your `.proto` files to `/app` folder and specify file pattern

```bash
docker run --rm -v "$(pwd)/api:/app" ivanuskov/go-protobuf-builder myapp.proto
```

Command emits .go files and swagger schema

## On Docker Hub
```
https://hub.docker.com/r/ivanuskov/go-protobuf-builder
```