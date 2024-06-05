**Lab7: Multi-container Applications**

**Objective:** 
Create a deployment for Jenkins with an init container that sleeps for 10 seconds before the Jenkins container starts. Utilize readiness and liveness probes to monitor Jenkins. Establish a NodePort service to expose Jenkins. Verify the successful execution of the init container and initialization of Jenkins.

**Understanding Differences:**
Before diving into the solution steps, let's briefly understand the distinctions between readiness and liveness probes, as well as init and sidecar containers:

- **Readiness Probe vs. Liveness Probe**:
  - **Readiness Probe**: Ensures that the container is ready to accept traffic before it receives any. Used to determine when a container is available to start serving requests.
  - **Liveness Probe**: Monitors the ongoing health of the container. If the liveness probe fails, Kubernetes restarts the container to attempt recovery.

- **Init Container vs. Sidecar Container**:
  - **Init Container**: Executes before the main application container starts and typically handles tasks like setup, initialization, or waiting for dependencies to become available.
  - **Sidecar Container**: Runs alongside the main application container within the same pod, providing supplemental functionalities such as logging, monitoring, or proxying.

**Solution Steps:**

**Step 1:** Create Jenkins Deployment YAML File

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: jenkins-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: jenkins
  template:
    metadata:
      labels:
        app: jenkins
    spec:
      containers:
        - name: jenkins-container
          image: jenkins/jenkins
          ports:
            - containerPort: 8080
              name: http
          readinessProbe:
            httpGet:
              path: /login
              port: 8080
            initialDelaySeconds: 30
            periodSeconds: 5
          livenessProbe:
            httpGet:
              path: /login
              port: 8080
            initialDelaySeconds: 60
            periodSeconds: 5
      initContainers:
        - name: init
          image: busybox
          command: ['sh', '-c', 'sleep 10']

```

**Step 2:** Create a NodePort Service to Expose Jenkins

```yaml
apiVersion: v1
kind: Service
metadata:
  name: jenkins-service
spec:
  type: NodePort
  selector:
    app: jenkins-deployment
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 8080
      nodePort: 30008
```

**Step 3:** Verify that the Init Container Runs Successfully and Jenkins is Properly Initialized.
![image](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/58a7147a-b704-4777-b282-fce1ed82e48f)
![image](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/8493d14a-96f3-4b3a-82f9-985433d902ad)
![lab7 4](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/8e9155fd-5bbb-47ca-8f89-6bfbbe1ec913)























