FROM python:3.12-alpine

RUN apk update && apk upgrade --no-cache

COPY . /app/

WORKDIR /app/

RUN pip install -r requirements.txt

ENV PORT="8005"
ENV AWS_SQS_URL="httpsiso://[sqs.us-east-1.amazonaws.com/123456789012/sua-fila](https://sqs.us-east-1.amazonaws.com/123456789012/sua-fila)"
ENV AWS_DYNAMODB_TABLE="ToggleMasterAnalytics"
ENV AWS_REGION="us-east-1"

EXPOSE 8005

ENTRYPOINT ["opentelemetry-instrument", "gunicorn", "--bind", "0.0.0.0:8005", "app:app"]