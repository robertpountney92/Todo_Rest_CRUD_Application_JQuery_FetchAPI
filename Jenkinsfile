pipeline {
    agent { docker { image 'robertpountney71/terraforrm-ansible' } }
    stages {
        
        stage('Test') {
            steps {
                sh 'echo "Perform some tests here"'
            }
        }

        stage('Jenkins setup') {
            steps {
                sh 'echo "Perform some tests here"'
            }
        }

        stage('Build Infrastructure') {
            steps {
                dir('terraform') {
                    sh 'cd terraform'
                    sh 'terraform init'
                    sh 'terraform apply -y'
                }
            }
        }
        stage('Configure App Server') {
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