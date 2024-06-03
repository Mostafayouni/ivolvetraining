Here's a step-by-step guide to accomplish your task:

1. **Create a ServiceAccount**:

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: my-service-account
  namespace: your-namespace
```

Replace `your-namespace` with the namespace where you want to create the ServiceAccount.

Apply the YAML using:

```bash
kubectl apply -f service-account.yaml
```

2. **Define a Role for Pod Reading**:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: pod-reader
  namespace: your-namespace
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list", "watch"]
```

Replace `your-namespace` with the namespace where you want to define the Role.

Apply the YAML using:

```bash
kubectl apply -f role.yaml
```

3. **Bind the Role to the ServiceAccount**:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: pod-reader-binding
  namespace: your-namespace
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: pod-reader
subjects:
- kind: ServiceAccount
  name: my-service-account
  namespace: your-namespace
```

Replace `your-namespace` with the namespace where you created the ServiceAccount and defined the Role.

Apply the YAML using:

```bash
kubectl apply -f role-binding.yaml
```

4. **Get ServiceAccount Token**:

After you've created the ServiceAccount and bound the Role to it, you can get the ServiceAccount token using the following command:

```bash
kubectl get secret $(kubectl get sa my-service-account -n your-namespace -o jsonpath='{.secrets[0].name}') -n your-namespace -o jsonpath='{.data.token}' | base64 --decode
```

Replace `my-service-account` and `your-namespace` with the appropriate values.

This command retrieves the secret associated with the ServiceAccount, extracts the token, and decodes it from base64 encoding.

Now you have the ServiceAccount token, which you can use for authentication when accessing the Kubernetes API on behalf of the ServiceAccount.

Let me know if you need further assistance!
