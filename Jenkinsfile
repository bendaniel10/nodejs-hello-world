pipeline {
    agent none
    stages {
        stage('install code dependencies') {
            agent {
                docker { image 'node:15-alpine' }
            }
            environment { HOME="." }
            steps {
                sh 'npm install'
            }
        }
        stage('Linting source') {
            agent {
                docker { image 'node:15-alpine' }
            }
            environment { HOME="." }
            steps {
                sh 'npx eslint *.js'
            }
        }
        stage('Linting Dockerfile') {
            agent any
            environment { HOME="." }
            steps {
                sh 'hadolint Dockerfile'
            }
        }
        stage('Tests') {
            agent {
                docker { image 'node:15-alpine' }
            }
            environment { HOME="." }
            steps {
                sh 'npm run test'
            }
        }
        stage('Analyse dependencies') {
            agent {
                docker { image 'node:15-alpine' }
            }
            environment { HOME="." }
            steps {
                sh 'npm audit --audit-level=critical'
            }
        }
        stage('Publish docker image') {
            agent any
            steps {
                sh 'docker login --username $DOCKER_USERNAME --password $DOCKER_PASSWORD'
                sh 'docker build --tag=udacity-project-capstone:prod .'
                sh 'docker tag udacity-project-capstone:prod bendaniel10/udacity-project-capstone:prod'
                sh 'docker push bendaniel10/udacity-project-capstone:prod'
            }
        }
        stage('Clean old docker image'){
            steps {
                sh "docker rmi bendaniel10/udacity-project-capstone:prod"
            }
        }
        stage('Deploy app on cluster') {
            agent any
            steps {
                sh 'aws eks update-kubeconfig --name udacity-project-capstone'
                sh 'kubectl apply -f .kubernetes/config.yaml'
            }
        }
    }
}