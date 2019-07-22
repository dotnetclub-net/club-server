
helm install --name pg-release -f ./supporting/pg-chart-values-production.yaml stable/postgresql


# helm delete pg-release
# helm del --purge pg-release