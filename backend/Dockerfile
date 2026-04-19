#----------build stage -------------
FROM golang:1.25-alpine AS builder

WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY go.mod .

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -o app

#----------runtime stage -------------
FROM alpine:3.20

WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY --from=builder /app/app .

USER appuser 

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
    CMD wget -qO- http://localhost:8080/ || exit 1

CMD ["./app"]




