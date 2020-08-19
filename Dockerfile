FROM golang:1.14-alpine AS builder

WORKDIR $GOPATH/src/github.com/arschles/msdev

COPY . .

RUN GO111MODULE=on GOPROXY="https://proxy.golang.org" go build -o /bin/msdev .

FROM alpine:3.11.5

COPY --from=builder /bin/msdev /bin/msdev

EXPOSE 8080

CMD ["/bin/msdev"]