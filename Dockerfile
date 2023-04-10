FROM golang:1.18 AS builder
WORKDIR /usr/src/app
COPY . .
RUN CGO_ENABLED=0 go build -ldflags="-w -s" main.go

FROM scratch
COPY --from=builder /usr/src/app/main /main
CMD ["/main"]