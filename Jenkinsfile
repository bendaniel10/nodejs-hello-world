pipeline {
    agent none
    stages {
        stage('Test') {
            agent {
                docker { image 'node:15-alpine' }
            }
            steps {
                sh 'npm install'
            }
        }
    }
}