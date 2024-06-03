Below is a basic README.md file that outlines how to deploy NGINX, perform a rolling update to Apache, and then rollback to NGINX using Kubernetes.

```markdown
# NGINX to Apache Rolling Update and Rollback

This guide demonstrates how to deploy NGINX using Kubernetes, perform a rolling update to Apache, and then rollback to NGINX.

## Prerequisites

-OpenShift cluster
- oc configured to connect to your cluster

## Deployment

### 1. Deploy NGINX

Deploy NGINX using the provided YAML file.

```bash
oc apply -f nginx-deployment.yaml
```
![3](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/5165a9b7-423d-41ed-9618-c55344725864)

### 2. Verify NGINX Deployment

Ensure NGINX is deployed and running.

```bash
oc get pods
```
![3](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/f91aef78-830c-4664-a61c-803138c218ad)

### 3. Access NGINX Service

Forward port 80 of the NGINX service to your local machine.

```bash
oc port-forward service/nginx-deployt 8888:80
```

Access NGINX service at http://localhost:8888.
![33](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/d534218f-35ab-443a-81d8-0c647a9d565d)

### 4. Perform Rolling Update to Apache

Update the NGINX deployment to use the Apache image.

```bash
oc set image deployment/nginx-deploy nginx=httpd:latest
```

Wait for the rolling update to complete.

```bash
oc rollout status deployment/nginx-deploy
```
![4](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/71ce6ea8-9dc6-4f28-84b4-e9c0453b2441)

### 5. Verify Apache Deployment

Ensure Apache is deployed and running.

```bash
oc get pods
```

### 6. Access Apache Service

Forward port 80 of the Apache service to your local machine.

```bash
oc port-forward service/nginx-deploy 8888:80
```

Access Apache service at http://localhost:8888.

## Rollback to NGINX

### 1. Rollback to NGINX

Rollback the deployment to the previous NGINX version.

```bash
oc rollout undo deployment/my-deployment
```

Wait for the rollback to complete.

```bash
oc rollout status deployment/my-deployment
```
![33](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/53321272-caf6-4956-b1e1-b25d9788e68b)

### 2. Verify NGINX Rollback

Ensure NGINX is deployed and running.

```bash
oc get pods
```
![3](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/5165a9b7-423d-41ed-9618-c55344725864)

### 3. Access NGINX Service

Forward port 80 of the NGINX service to your local machine.

```bash
oc port-forward service/my-deployment 8888:80
```

Access NGINX service at http://localhost:8888.

```
![33](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/9c44df20-f386-4eba-a0f9-a499dc2d1a77)

