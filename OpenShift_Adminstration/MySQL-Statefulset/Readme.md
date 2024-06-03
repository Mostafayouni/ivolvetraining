Here's a YAML file for configuring a MySQL StatefulSet:

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: mysql
spec:
  serviceName: mysql
  replicas: 3
  selector:
    matchLabels:
      app: mysql
  template:
    metadata:
      labels:
        app: mysql
    spec:
      containers:
      - name: mysql
        image: mysql:latest
        env:
        - name: MYSQL_ROOT_PASSWORD
          value: your_root_password
        - name: MYSQL_DATABASE
          value: your_database_name
        - name: MYSQL_USER
          value: your_database_user
        - name: MYSQL_PASSWORD
          value: your_database_password
        ports:
        - containerPort: 3306
        volumeMounts:
        - name: mysql-persistent-storage
          mountPath: /var/lib/mysql
  volumeClaimTemplates:
  - metadata:
      name: mysql-persistent-storage
    spec:
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 1Gi
```
      
    oc create -f mysql.yaml

 bash 

    oc get statefulset
bash
![55](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/56745ebc-12c2-44e6-b9d2-c2cf9da30490)
![6](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/bdc6eea7-ddc4-4e3f-9113-f30594c37269)


And here's a YAML file to define a service for the MySQL StatefulSet:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: mysql
spec:
  selector:
    app: mysql
  ports:
    - protocol: TCP
      port: 3306
```
     oc create -f mysql-service.yaml
  bash
![7](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/4dec8cee-35ee-4500-b524-ad29f2f959d0)
