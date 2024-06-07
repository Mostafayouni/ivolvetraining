
```markdown
# Deploying HTML Application using Source-to-Image (S2I) on OpenShift

This guide walks you through the process of deploying an HTML application using the Source-to-Image (S2I) workflow on OpenShift. We'll use both the `oc` CLI and the OpenShift Console to create and manage the BuildConfig for the application.

## Prerequisites

- Access to an OpenShift cluster
- OpenShift CLI (`oc`) installed and configured
- A project/namespace created in OpenShift (e.g., `myproject`)

## Steps

### 1. Using the OpenShift CLI (oc)

#### Step 1: Log in to your OpenShift cluster

```sh
oc login <your-cluster-url> --token=<your-token>
```

#### Step 2: Create a new application

```sh
oc new-app --image=registry.access.redhat.com/rhscl/nginx-114-rhel7:latest --code=https://github.com/IbrahimmAdel/html.git --name=my-html-app -n <your-namespace>
```

#### Step 3: Start a new build

```sh
oc start-build my-html-app -n <your-namespace>
```

#### Step 4: View build logs

```sh
oc logs -f bc/my-html-app -n <your-namespace>
```

#### Step 5: Expose the application service

```sh
oc expose svc/my-html-app
```

#### Step 6: Retrieve the route to access the application

```sh
oc get route
```

You should see an output similar to this:

```
NAME          HOST/PORT                                     PATH      SERVICES      PORT       TERMINATION   WILDCARD
my-html-app   my-html-app-myproject.apps.your-cluster.com             my-html-app   8080-tcp                 None
```

Access the application by navigating to the `HOST/PORT` URL in your browser.

### 2. Using the OpenShift Console

#### Step 1: Log in to the OpenShift Console

Navigate to the OpenShift Console URL and log in with your credentials.
![oc1](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/3828adee-cde9-4b4f-a937-36b7625aec93)


#### Step 2: Create a new application from source code

1. Go to the **Developer** view.
2. Click on **+Add**.
3. Select **Import from Git**.
4. Enter the Git repository URL: `https://github.com/IbrahimmAdel/html.git`.
5. Choose **Nginx** as the builder image.
6. Set the **Application Name** to `my-html-app`.
7. Select or create a new project/namespace if necessary.
8. Click **Create** to start the build process.

   ![oc2](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/c2977f0d-8470-4285-8221-346b1fb37055)


#### Step 3: Monitor the build

1. Go to **Builds** > **Build Configs**.
2. Click on `my-html-app`.
3. Monitor the build logs by selecting the build instance.

#### Step 4: Expose the application service

1. Go to **Networking** > **Services**.
2. Find the service named `my-html-app`.
3. Click on **Create Route**.
4. Set the **Name** and **Hostname** as desired.
5. Click **Create**.

![oc2](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/e308e466-574e-48b8-80be-6697c215c6d0)
![oc5](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/56e89f3b-41b7-4d6d-8084-866b36aee945)


#### Step 5: Access the application

Navigate to the URL of the created route to access your HTML application.

![oc7](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/08fbd0b0-6e2f-4986-b345-2946e19a6353)
![oc9](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/078fe4d3-abac-4a0a-bed9-98d0e207e4c0)


## Cleanup

To delete the application, you can use the OpenShift Console:

1. Right-click on the application.
2. Select **Delete Application**.

Alternatively, you can use the `oc` CLI:

```sh
oc delete all -l app=my-html-app -n <your-namespace>
```

## Conclusion

This README provided steps to deploy an HTML application on OpenShift using both the `oc` CLI and the OpenShift Console. Follow these instructions to successfully create, build, and expose your application.
```

Feel free to customize the `README.md` file further based on your specific requirements and environment setup.
