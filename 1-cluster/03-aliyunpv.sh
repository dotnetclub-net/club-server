
for each node:
    vi /etc/sysconfig/kubelet
        KUBELET_EXTRA_ARGS=--enable-controller-attach-detach=false
    systemctl restart kubelet
    # kubectl edit node $name   
        # annotation  "enable-controller-attach-detach"   => false
# kube-system/configmap/kubelet-config-v1.4   enableControllerAttachDetach   =>  false

kubectl apply -f supporting/aliyunpv.yaml
