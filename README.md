# Udacity Capstone Project

This project is a fork from [nodejs-hello-world](https://github.com/fhinkel/nodejs-hello-world). 

I have added the additional configurations to ensure that the project can be deployed to a kubernetes cluster.

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

