FROM golang:1.18.5-alpine AS Build

WORKDIR /root

COPY ./webhook_handler.go ./

RUN go build -ldflags="-s -w" webhook_handler.go


FROM alpine:latest

WORKDIR /root

COPY --from=Build /root/webhook_handler ./

EXPOSE 5002/tcp

ENTRYPOINT ["./webhook_handler"]

CMD ["-l", "0.0.0.0:5002"]
