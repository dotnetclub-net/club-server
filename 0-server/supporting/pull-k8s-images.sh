#!/bin/bash

# exported from `kubeadm config images list`
images=(
        kube-apiserver:v1.14.1
        kube-controller-manager:v1.14.1
        kube-scheduler:v1.14.1
        kube-proxy:v1.14.1
        pause:3.1
        etcd:3.3.10
        coredns:1.3.1
)

for imageName in ${images[@]} ; do
    docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
    docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName k8s.gcr.io/$imageName
done