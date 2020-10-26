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
        stage('Linting') {
            agent {
                docker { image 'node:15-alpine' }
            }
            environment { HOME="." }
            steps {
                sh 'npx eslint *.js'
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
        stage('Analzye dependencies') {
            agent {
                docker { image 'node:15-alpine' }
            }
            environment { HOME="." }
            steps {
                sh 'npm audit --audit-level=critical'
            }
        }
    }
}