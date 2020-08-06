# capstone-cloud-devops
This is the repository fo the capstone project of the udacity course "Cloud Devops Engineer"

In this project I applied the skills and knowledge which were developed throughout the Cloud DevOps Nanodegree program. These include:

- Working in AWS
- Using Jenkins to implement Continuous Integration and Continuous Deployment
- Building pipelines
- Working with Ansible and CloudFormation to deploy clusters
- Building Kubernetes clusters
- Building Docker containers in pipelines

I created a CI/CD pipeline for microservices applications with rolling deployment. I developed Continuous Integration steps, such as linting. I also developed Contiguous Deployment steps. These includes:
- Pushing the built Docker containers to docker hub
- Deploying these Docker containers to a AWS EKS
- I ran these from Jenkins.


&nbsp;

## _Files:_

- Index.html: The web app that runs the service.
- Makefile: File that allows to automate common task for easy setup of the project.
- Dockerfile: This file has the setup for creating a Docker image for the microservice.
- run_docker.sh: This script creates a docker image from the Dockerfile, list the images and starts a container.
- upload_docker.sh: This script uploads a docker image to your docker hub account.
- run_kubernetes.sh: This script runs the docker image in a kubernetes cluster.