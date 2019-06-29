
# See https://akomljen.com/get-kubernetes-logs-with-efk-stack-in-5-minutes/
helm repo add akomljen-charts https://raw.githubusercontent.com/komljen/helm-charts/master/charts/

helm install --name es-operator --namespace logging akomljen-charts/elasticsearch-operator


# kubectl get CustomResourceDefinition
helm install --name efk  --namespace logging  akomljen-charts/efk


# kubectl delete ElasticsearchCluster/efk-cluster
# kubectl apply -f ./1-patch-es.yaml
# kubectl apply -f ./2-kibana-service.yaml
# kubectl apply -f ./3-filebit-config.yaml
# kubectl apply -f ./4-filebit-ds.yaml