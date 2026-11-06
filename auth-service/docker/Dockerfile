FROM golang:1.26-alpine

RUN apk update && apk upgrade --no-cache


ENV DATABASE_URL="postgres://SEU_USUARIO:SUA_SENHA@localhost:5432/auth_db"
ENV PORT="8001"
ENV MASTER_KEY="admin-secreto-123"

WORKDIR /app

COPY . .

RUN go mod tidy

EXPOSE 8001

ENTRYPOINT ["go", "run", "."]
