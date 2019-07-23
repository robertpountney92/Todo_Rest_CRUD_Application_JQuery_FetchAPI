pipeline {
    agent { docker { image 'node:6.3' } }
    stages {
        
        stage('Test') {
            steps {
                sh 'echo "Perform some tests here"'
            }
        }
        stage('Build Infrastructure') {
            steps {
                sh 'cd terraform'
                sh 'terraform init'
                sh 'terraform apply -y'
            }
        }
        stage('Configure Server') {
            steps {
                sh 'cd ansible'
                sh 'ansible-playbook -i hosts setup.yml'
            }
        }
        stage('Deploy Application') {
            steps {
                sh 'cd ansible'
                sh 'ansible-playbook -i hosts setup.yml'
            }
        }
    }
}