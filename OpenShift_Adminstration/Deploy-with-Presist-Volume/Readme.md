
1. **Create NGINX Deployment**:


Apply the deployment:

```bash
kubectl apply -f nginx-deployment.yaml
```

2. **Exec into NGINX Pod and Create File**:

```bash
kubectl exec -it $(kubectl get pods -l app=nginx -o jsonpath='{.items[0].metadata.name}') -- /bin/bash
echo "hello, this is <your-name>" > /usr/share/nginx/html/hello.txt
exit
```

3. **Verify File is Served by NGINX**:

```bash
kubectl port-forward $(kubectl get pods -l app=nginx -o jsonpath='{.items[0].metadata.name}') 8080:80
curl localhost:8080/hello.txt
```

4. **Delete NGINX Pod**:

```bash
kubectl delete pod $(kubectl get pods -l app=nginx -o jsonpath='{.items[0].metadata.name}')
```

5. **Wait for Deployment to Create New Pod**:

```bash
kubectl wait --for=condition=available deployment/my-deployment --timeout=300s
```

6. **Exec into New Pod and Verify File is Not Present**:

```bash
kubectl exec -it $(kubectl get pods -l app=nginx -o jsonpath='{.items[0].metadata.name}') -- /bin/bash
ls /usr/share/nginx/html/hello.txt
exit
```

7. **Create Persistent Volume Claim (PVC)**:

Create a file named `nginx-pvc.yaml` with the following content:



Apply the PVC:

```bash
kubectl apply -f nginx-pvc.yaml
```

8. **Modify Deployment to Attach PVC**:

Update the `nginx-deployment.yaml` file to use the PVC:


        

Apply the updated deployment:

```bash
kubectl apply -f nginx-deployment.yaml
```

![final2](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/f149c58d-0364-45c2-937a-47032c18b77a)

9. **Repeat Previous Steps and Verify File Persists Across Pod Deletions**:

Repeat steps 2 to 6, and you should see that the file persists even after deleting the pod.
![final](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/c76b3cf0-3faa-4324-957a-4186a9432a9d)


