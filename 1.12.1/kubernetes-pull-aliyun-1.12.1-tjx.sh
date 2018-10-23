#!/bin/bash
echo ""
echo "=========================================================="
echo "Pull Kubernetes v1.12.1 Images from aliyuncs.com ......"
echo "=========================================================="
echo ""

MY_REGISTRY=registry.cn-hangzhou.aliyuncs.com/juxing1

images=(kube-apiserver:v1.12.1 kube-controller-manager:v1.12.1 kube-scheduler:v1.12.1 kube-proxy:v1.12.1 etcd:3.2.24 pause:3.1 coredns:1.2.2 defaultbackend:1.4 kubernetes-dashboard-amd64:v1.10.0)

for image in ${images[@]}; do
  docker pull ${MY_REGISTRY}/$image
  docker tag ${MY_REGISTRY}/$image k8s.gcr.io/$image
done

## 拉取其他镜像
docker pull ${MY_REGISTRY}/tiller:v2.11.0
docker pull ${MY_REGISTRY}/metrics-server-amd64:v0.3.1

## 添加Tag
docker tag ${MY_REGISTRY}/tiller:v2.11.0 gcr.io/kubernetes-helm/tiller:v2.11.0
docker tag ${MY_REGISTRY}/metrics-server-amd64:v0.3.1 gcr.io/google_containers/metrics-server-amd64:v0.3.1


echo ""
echo "=========================================================="
echo "Pull Kubernetes v1.12.1 Images FINISHED."
echo "into registry.cn-hangzhou.aliyuncs.com/openthings, "
echo "           by openthings@https://my.oschina.net/u/2306127."
echo "=========================================================="

echo ""
