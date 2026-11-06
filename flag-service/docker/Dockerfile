FROM python:3.12-alpine

RUN apk update && apk upgrade --no-cache

RUN pip install --upgrade pip

COPY . /app/

WORKDIR /app/

RUN pip install -r requirements.txt

ENV AUTH_SERVICE_URL="http://localhost:8001"
ENV PORT="8002"
ENV DATABASE_URL="postgres://SEU_USUARIO:SUA_SENHA@localhost:5432/flags_db"

EXPOSE 8005

ENTRYPOINT ["opentelemetry-instrument", "gunicorn", "--bind", "0.0.0.0:8002", "app:app"]
