FROM golang:1.16-buster

RUN apt-get update && apt-get install -y protobuf-compiler

RUN go get \
    github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway \
    github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger \
    github.com/golang/protobuf/protoc-gen-go

RUN mkdir /app

RUN echo "#!/usr/bin/env bash \n protoc -I/usr/local/include -I. \
             -I$GOPATH/src \
             -I/app \
             -I$GOPATH/pkg/mod/github.com/grpc-ecosystem/grpc-gateway@v1.16.0/third_party/googleapis \
             --swagger_out=logtostderr=true:. \
             --grpc-gateway_out=logtostderr=true:. \
             --go_out=plugins=grpc:. \$1" > /bin/protobuf-builder

RUN chmod 777 /bin/protobuf-builder

WORKDIR /app

ENTRYPOINT ["/bin/protobuf-builder"]