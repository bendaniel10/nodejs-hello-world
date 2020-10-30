# Udacity Capstone Project

This project is a fork from [nodejs-hello-world](https://github.com/fhinkel/nodejs-hello-world). 

I have added the additional configurations to ensure that the project can be deployed to a kubernetes cluster.

## Installation.
Install node and run `npm start` to view the application. You must also install everything mentioned in the [Project uses](#Project uses:).
You can then create a new ec2 instance which has at least 2 cores, this would be used as the Jenkins server. Minikube
requires at least 2 cores to start. 

## Configuration
The application runs on port `80`

These environment variables are required to be set on your system before running the ansible script. 
`CAPSTONE_AWS_ACCESS_KEY_ID`, `CAPSTONE_AWS_SECRET_ACCESS_KEY`, `CAPSTONE_AWS_DEFAULT_REGION`, `CAPSTONE_DOCKER_USERNAME`,
`CAPSTONE_DOCKER_USERNAME`, `CAPSTONE_DOCKER_PASSWORD`.

You can configure your jenkins server by specifying your ec2 ip in the [jenkins_inventory.txt](.ansible/jenkins_inventory.txt) file. 
Then you can follow the instructions in the [Building on Jenkins](#Building on Jenkins) section.

## Building on Jenkins
The Jenkins server is initialized using the [create_jenkins_server](create_jenkins_server.sh) script. This simply proxies
to ansible to perform the necessary intializations which would ensure that building, liniting and deploying the project
would be possible on the server.

## Deployment strategy.
This project uses a rolling deployment strategy, this can be seen in the `Deploy app on cluster` stage in the [Jenkinsfile](Jenkinsfile)

## K8 Cluster deployment.
This is done using [eksctl](https://eksctl.io/) which has eliminated most of the cumbersome steps required to set up a k8 cluster.
The [create_k8_cluster.sh](create_k8_cluster.sh) file creates the cluster where the apps would be deployed to.

### Project uses: 
- Ansible
- Nodejs
- Docker
- Jenkins
- eksctl
- kubectl
- hadolint

