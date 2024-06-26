
---

# NGINX Chart Deployment using Helm

This repository contains a Helm chart to deploy NGINX server on Kubernetes using Helm.

## Prerequisites

- [Helm](https://helm.sh/docs/intro/install/)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)

## Installation

1. Clone this repository:

    ```bash
    $ git clone https://github.com/mostafayouni/nginx-chart.git
    ```

2. Navigate to the repository directory:

    ```bash
    $ cd nginx-chart
    ```

3. Open `values.yaml` file and change the value of `service.type` to `NodePort`.

4. Deploy the Helm chart:

    ```bash
    $ helm install nginx-release nginx-chart
    ```

## Accessing NGINX Server

To access the NGINX server, run the following command:

```bash
$ minikube service nginx-release --url
```
![lab8 4](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/088e02e2-8892-4a30-90d2-835c3a98bdd3)

## Deleting NGINX Release

To delete the NGINX release, run:

```bash
$ helm delete nginx-release
```

