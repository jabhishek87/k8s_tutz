# k8s_tutz
``` docker to kube tutorial ```

# download docker images
docker pull redis
``` docker pull python:2.7 ```



# Build the containers

``` sh dbuild.sh ```

# if you want to run through docker run
``` docker-compose up ```

# to delete run
``` docker-compose down ```

# to create k8s deployment run
``` kubectl create -f kubernetes_yamls/redis-dep.yaml ```
``` kubectl create -f kubernetes_yamls/web-dep.yaml ```

# to access web for minikube run
    ``` minikube service web --url ```

    here you will alwasys see that web port is static to  ``` 32001 ```
