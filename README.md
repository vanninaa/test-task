#запуск через docker-compose

#приложение доступно по порту 8080 prometheus по порту 9090 grafana по порту 3000

docker-compose up
__________________
#через k8-s

#сбилдить образ 

docker build -t test-task . 

#загрузить образ в minikube
minikube image load test-task

#загрузить и обновить чарты

helm repo add my-repo https://charts.bitnami.com/bitnami

helm repo add comunity https://grafana.github.io/helm-charts

helm repo update

#создать configmap

kubectl create configmap my-config --from-file=./grafana/microservices-spring-boot-2-1_rev1.json

#установить чарты с необходимыми values

helm install my-prometheus prometheus-community/prometheus -f ./k8s/prometheus/values2.yml

helm install my-grafana grafana/grafana -f ./k8s/grafana/values.yml

#запустить приложение

kubectl apply -f deploy.yml
