FROM  golang:alpine AS builder

COPY hello-world.go .

RUN go run hello-world.go

RUN go build hello-world.go

FROM scratch

COPY --from=builder /go/hello-world /go/hello-world

ENTRYPOINT ["/go/hello-world"]