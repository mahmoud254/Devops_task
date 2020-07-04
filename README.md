# DevOps Task

# versions of tools used in this project
* Terraform v0.11.14
* minikube version: v1.11.0
* Docker version 19.03.4
* Darwin Kernel Version 17.7.0


## install and configure minikube
```
brew install minikube
```
```
minikube start --driver=docker
```
```
minikube status
```

## to create k8s resources by terraform
``` 
cd terraform_files
```
```
terraform init
```
```
terraform plan -var-file="values.tfvars"
```
```
terraform apply  -var-file="values.tfvars"
```
## to check created resources
```
kubectl get pods --all-namespaces
```

## to allow nexus registry with http in docker daemon just for testing
```
docker exec -it minikube bash 
```
```
echo '# /etc/default/docker\nDOCKER_OPTS="--insecure-registry=localhost:30004”' > /var/default/docker
```

## configuring nexus docker registry

### to get nexus url
```
minikube service nexus --url --namespace build
```
### to get admin password
```
kubectl exec -it  nexus --n build bash
```
```
cat /nexus-data/admin.password
```
```
then change admin passsword
```
## testing docker registry
```
kubectl exec -it  jenkins --n build bash
```
```
docker login localhost:30004
```

## configuring jenkins
### to get jenkins url
```
minikube service jenkins --url --namespace build
```
### to get admin password
```
cat /var/jenkins_home/secrets/initialAdminPassword
```
```
then install suggested plugins
```
```
create user and password
```

## to create build pipeline
* First configure maven tool in configure system tools
* Create nexus credential with id mysql
* Create pipeline 
* Choose This project is parameterized
* Add string parameter COMMIT_ID
* Choose pipeline script



## to create deploy pipeline
* Create mysql credential with id mysql
* Create pipeline 
* Choose This project is parameterized
* Add choice parameter and add dev and test
* Choose pipeline script


## to test the spring app is up and running
### to get url for the app
```
minikube service nexus --url --namespace build
```
```
in the browser paste the following
<url>/categories
```

