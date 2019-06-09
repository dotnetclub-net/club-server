# follow instructions here: https://github.com/jetstack/cert-manager/tree/master/deploy/charts/cert-manager
# namespace: club
# use customized values
helm install --debug --name lec-1 -f cert-manager-values.yaml jetstack/cert-manager