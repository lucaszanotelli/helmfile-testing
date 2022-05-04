## adicionar repositórios
helm repo add https://airflow.apache.org
helm repo add https://github.com/contra/helm-charts/

## adicionar parametros ssm nas variáveis de ambiente
eval $(AWS_PROFILE=quero2pay AWS_ENV_PATH=/indicium AWS_REGION=sa-east-1 ./aws-env --recursive)
