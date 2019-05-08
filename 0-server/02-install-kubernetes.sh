
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config


cat EOF<< > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
<<EOF



yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

cat <<EOF >  /etc/sysctl.d/k8s.conf
   net.bridge.bridge-nf-call-ip6tables = 1
   net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system
sysctl -p

modprobe br_netfilter


mkdir -p /etc/default/
cat EOF<< > /etc/default/kubelet
KUBELET_EXTRA_ARGS=--fail-swap-on=false
<<EOF



kubeadm config images list

./supporting/pull-k8s-images.sh




kubeadm init  --kubernetes-version=v1.14.1 \
   --pod-network-cidr=10.244.0.0/16  \
   --apiserver-advertise-address=172.26.46.87  \
   --ignore-preflight-errors=Swap



mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl taint nodes --all node-role.kubernetes.io/master-

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

