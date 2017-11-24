# k8s_tutz
``` docker to kube tutorial ```

As we are going to build new version of image if you see app.py i have added v2
and in dbbuild.sh i have updated the tag with V2 to build run
```./dbuild.sh ```


# start the deployments with older image
``` kubectl create -f kubernetes_yamls/redis-dep.yaml ```
``` kubectl create -f kubernetes_yamls/web-dep.yaml --record ```

# check revision history
``` kubectl rollout history deployment/web-deployment ```

# update image version for web container
``` kubectl set image deployment/web-deployment web=abhishekk/sampleapp:v2 ```

# check the status again
``` kubectl rollout history deployment/web-deployment ```

# now if you do
``` http:<ip>:32001 ```
you wil see the Hello Container World! I have been seen 5 times.
V2

# again you can rollout to new older version
``` kubectl rollout undo deployment/web-deployment ```

# go back to specfic revision
``` kubectl rollout undo deployment/web-deployment --to-revision=3 ```





# now we are going to deploy wordpress stateless app

why stateless because it doesnot save the data , when container goes down, data lost


```  kubectl create -f kubernetes_yamls/wordpress/wordpress-secrets.yml --record ```

```  kubectl create -f kubernetes_yamls/wordpress/wordpress-service.yml --record ```

```  kubectl create -f kubernetes_yamls/wordpress/wordpress-single-deployment-no-volumes.yml --record ```
