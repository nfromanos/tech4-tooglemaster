# Observabilidade

Os values desta pasta assumem que os charts Prometheus e OpenTelemetry são instalados no namespace `monitoring`, com o release Helm `kube-prometheus-stack` para o Prometheus.

## Fluxo

- Os três serviços Python usam `opentelemetry-instrument` com instrumentações Flask, Requests, psycopg2 e Botocore conforme as dependências de cada serviço.
- Os dois serviços Go inicializam os exporters OTLP HTTP e instrumentam HTTP de entrada/saída; o evaluation-service também propaga o contexto W3C pela mensagem SQS até o analytics-service.
- Os serviços enviam OTLP HTTP para `otel-gateway.monitoring.svc.cluster.local:4318`.
- O Collector Gateway encaminha traces por OTLP para Jaeger e métricas por Prometheus Remote Write.
- A amostragem inicial de traces é de 10% para limitar o volume; ajuste `OTEL_TRACES_SAMPLER_ARG` nos micros conforme a carga e a capacidade do Jaeger.
- Jaeger é instalado pelo chart oficial via Argo CD; o chart usa o armazenamento em memória padrão, adequado somente para laboratório e sujeito à perda dos traces em reinicializações.
- O Prometheus Remote Write Receiver fica habilitado e acessível somente pelo Service interno do cluster.

Se o release Helm ou namespace do Prometheus forem diferentes, ajuste o endpoint `prometheusremotewrite` em `opentelemetry-kube-stack/values.yaml`. Se Jaeger estiver em outro namespace ou tiver outro nome de release, ajuste o endpoint OTLP do gateway e o datasource Jaeger em `kube-prometheus-stack/values.yaml`.

Os arquivos em `k8s/` são manifests alternativos; os Applications Argo CD dos microsserviços apontam para `gitops/workloads/`. Para esta implantação GitOps, os valores de telemetria estão nos charts em `gitops/workloads/`.
