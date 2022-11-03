<h1>docker-compose</h1>

в папке с проектом выполнить:
<code>docker-compose up</code>


сервисы доступны по следующим ссылкам:

[приложение](http://localhost:8080/)

[метрики приложения](http://localhost:8080/actuator/prometheus/metrics)

[prometheus](http://localhost:9090/)</p>

[grafana](http://localhost:3000/)
<p>логин пароль для grafana <strong>admin</strong> <strong>admin</strong></p>
__________________
<h1>k8-s</h1>

сбилдить образ: docker build -t test-task . 

загрузить образ в minikube: minikube image load test-task

загрузить и обновить чарты:

<code>helm repo add my-repo https://charts.bitnami.com/bitnami</code>

<code>helm repo add comunity https://grafana.github.io/helm-charts</code>

<code>helm repo update</code>

создать configmap:

<code>kubectl create configmap my-config --from-file=./grafana/microservices-spring-boot-2-1_rev1.json</code>

#установить чарты с необходимыми values

<code>helm install my-prometheus prometheus-community/prometheus -f ./k8s/prometheus/values2.yml</code>

<code>helm install my-grafana grafana/grafana -f ./k8s/grafana/values.yml</code>

#запустить приложение

<code>kubectl apply -f deploy.yml</code>
