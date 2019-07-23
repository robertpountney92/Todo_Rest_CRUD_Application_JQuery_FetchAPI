pipeline {
    agent { docker { image 'node:6.3' } }
    stages {
        stage('build') {
            steps {
                sh 'echo hellothere'
            }
        }
        stage('test') {
            steps {
                sh 'echo "Perform some tests here"'
            }
        }
    }
}