#!/bin/bash
images=(
k8s.gcr.io/pause:3.1=gcr.azk8s.cn/google-containers/pause:3.1
gcr.io/google_containers/defaultbackend-amd64:1.4=gcr.azk8s.cn/google-containers/defaultbackend-amd64:1.4
k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.1=registry.cn-hangzhou.aliyuncs.com/google_containers/kubernetes-dashboard-amd64:v1.10.1
k8s.gcr.io/heapster-amd64:v1.5.2=registry.cn-hangzhou.aliyuncs.com/google_containers/heapster-amd64:v1.5.2
k8s.gcr.io/heapster-influxdb-amd64:v1.3.3=registry.cn-hangzhou.aliyuncs.com/google_containers/heapster-influxdb-amd64:v1.3.3
k8s.gcr.io/heapster-grafana-amd64:v4.4.3=registry.cn-hangzhou.aliyuncs.com/google_containers/heapster-grafana-amd64:v4.4.3
)

OIFS=$IFS; # 保存旧值

for image in ${images[@]};do
    IFS='='
    set $image
   sudo docker pull $2
   sudo docker tag  $2 $1
   sudo docker rmi  $2
   sudo docker save $1 > 1.tar && microk8s.ctr i import 1.tar && rm 1.tar
    IFS=$OIFS; # 还原旧值
done


eyJhbGciOiJSUzI1NiIsImtpZCI6InYxSXBacXBoMFhNN0w2NVB0Rk5lNFZnUTRfd1g4aG5VdXM4WEdRTmE3d0kifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJkZWZhdWx0LXRva2VuLXFxcWJ2Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6ImRlZmF1bHQiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiJlY2UxYzc0Yy1jYjAxLTQwM2ItYmFjZC1iY2I0NjU1MDNmMjQiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZS1zeXN0ZW06ZGVmYXVsdCJ9.POTTiUmpMayKoIW0y9Puvh9KaboDoiJI05FEcHlszzfUWO7D7OmwVrIJVpHF3WoODEiAv9Z6GTVGNWEavDPl8dPShwjeydPyJGFHwt1ch5GliOSp1eOcWiD2ZFRuU8dBDACW0vOL8cix6JeUMVAdLBEe98rf-9La5e4EvILf4v89zR5nM2LuYs4Ntq-Hm4G6Af-XkXi1NGcmHtXVPS_iKAfetL9fFqzpMrQexWrtjli5_bpVaRx9jSE_kLedWr9j4NabJDHeIBFJY01ysmhm8t0I_YUfdDI-dj_KfWiGtRkYRz6B4yup0mKQZVx344CAw2PkSa_XeG7p7UDyA3a6og
