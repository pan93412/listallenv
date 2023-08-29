FROM golang AS builder

WORKDIR /app
COPY . .
RUN go build -o hi .

FROM scratch AS runner

COPY --from=builder /app/hi /hi
CMD ["/hi"]