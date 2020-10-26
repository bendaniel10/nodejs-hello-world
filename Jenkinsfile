pipeline {
    agent none
    stages {
        stage('Linting') {
            agent {
                docker { image 'node:15-alpine' }
            }
            steps {
                sh 'npm install'
                sh 'npm run lint'
            }
        }
    }
}