# P41-DevOps-Challenge  -   Entry Level

## The Challenge

Create a simple microservice in any programming language of your choice, as follows:

* The application should be a web server that returns a JSON response with the following structure, when its / URL path is accessed:

```json
{
  "timestamp": "<current date and time>",
  "ip": "<the IP address of the visitor>"
}
```

* Create a Dockerfile for this microservice and publish the image to Docker Hub. Your application must be configured to run as a non-root user in the container.

* Create a Kubernetes manifest in YAML format, containing a Deployment and a Service, to deploy your microservice on Kubernetes. Your Deployment must use your public Docker image.

* Publish your code, Dockerfile, and Kubernetes manifests to a public Git repository in a platform of your choice (e.g. GitHub, GitLab, Bitbucket, etc.), so that it can be cloned by the team.

## Criteria
Your task will be considered successful if a colleague is able to deploy your manifests to a running Kubernetes cluster and use your microservice.

Assuming that your manifest file is named microservice.yml (but you can name it whatever you want), the command:

```sh
kubectl apply -f microservice.yml # i.e. your manifest file
```

must be the only command needed to deploy your microservice to Kubernetes.

Other criteria for evaluation will be:

* Code quality and style: your code must be easy for others to read, and properly documented when relevant

* Container best practices: your container image should be as small as possible, without unnecessary bloat

# Challenge Solution

## Prerequisite 

There is a few dependencies that need to be install in order to complet this challenge:

    - Docker for MAC or Windows ( If on linux just Docker )
    - Kubernetes cluster ( with Docker-desktop install on MAC or Window you just need to enable the kubernetes functionallity ). If you are using a linux distibution install something like minikube or any flavor of kubernetes distribution of your choice.
    - kubectl
    - Git

After all the dependencies are install make sure docker and kubernetes are running fine by running these commands:

    $ docker info 
output:
```
    Client:
 Context:    default
 Debug Mode: false
 Plugins:
  buildx: Build with BuildKit (Docker Inc., v0.5.1-docker)
  compose: Docker Compose (Docker Inc., v2.0.0-beta.6)
  scan: Docker Scan (Docker Inc., v0.8.0)

Server:
 Containers: 21
  Running: 20
  Paused: 0
  Stopped: 1
 Images: 13
 Server Version: 20.10.7
 ........
 Insecure Registries:
  127.0.0.0/8
 Live Restore Enabled: false
 ```
    $ kubectl get node
output:
```
NAME             STATUS   ROLES                  AGE   VERSION
docker-desktop   Ready    control-plane,master   49m   v1.21.2
```
```
NOTE: for linux user the will need to start their chose kubenetes distribution after they install it

For example:    minikube start
```

## Quick Start

Once all the above tools are set up correctly you are ready to Deploy your microservice locally with the following commands:

    $ git clone https://github.com/xmaeltht/p41-challenge-entry.git

    $ cd p41-challenge-entry 

    $ kubectl aapply -f microservice.yml

    $ kubectl get svc | grep microservice 
output:
```
    microservice-service   NodePort    10.96.129.38   <none>        80:32229/TCP   60m
```

If you are on docker-desktop got to your browser and you can access your microservice to 

```
            localhost:<port assign by docker-destop to your service deploymemt>
            example: localhost:32229
```

### Cleaning Up
To clean up you just need to run

    $ kubect delete deploy <deployment name>

    $ kubectl delete service <service name>

