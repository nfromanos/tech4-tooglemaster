FROM golang:1.26-alpine

RUN apk update && apk upgrade --no-cache

ENV PORT="8004"

ENV REDIS_URL="redis://localhost:6379"

ENV FLAG_SERVICE_URL="http://localhost:8002"
ENV TARGETING_SERVICE_URL="http://localhost:8003"

ENV SERVICE_API_KEY="SUA_CHAVE_DE_SERVICO"

# --- Configuração da AWS (Obrigatório para o desafio) ---
# Cole a URL da fila SQS que você criou no console da AWS
ENV AWS_SQS_URL="[https://sqs.us-east-1.amazonaws.com/123456789012/sua-fila](https://sqs.us-east-1.amazonaws.com/123456789012/sua-fila)"

# Região da sua fila SQS
ENV AWS_REGION="us-east-1" 

WORKDIR /app

COPY . .

RUN go mod tidy

EXPOSE 8004

ENTRYPOINT ["go", "run", "."]