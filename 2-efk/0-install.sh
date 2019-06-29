
# See https://akomljen.com/get-kubernetes-logs-with-efk-stack-in-5-minutes/
helm repo add akomljen-charts https://raw.githubusercontent.com/komljen/helm-charts/master/charts/

helm install --name es-operator --namespace logging akomljen-charts/elasticsearch-operator
helm install --name efk  --namespace logging  akomljen-charts/efk


