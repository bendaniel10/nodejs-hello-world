pipeline {
    agent none
    stages {
        stage('Linting') {
            agent {
                docker { image 'node:15-alpine' }
            }
            environment { HOME="." }
            steps {
                sh 'npm install eslint --save-dev'
                sh 'npx eslint *.js'
            }
        }
    }
}