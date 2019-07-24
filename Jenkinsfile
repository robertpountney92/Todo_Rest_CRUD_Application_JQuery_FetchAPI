pipeline {
    agent { 
        docker { 
            image 'robertpountney71/terraforrm-ansible:latest' 
        }
    }
    stages {
        stage('Test') {
            steps {
                echo 'Perform some tests here'
            }
        }

        stage('Jenkins setup') {
            steps {
                echo 'Perform some tests here'
            }
        }

        stage('Build Infrastructure') {
            environment {
                TF_VAR_region = "eu-west-1"
                TF_VAR_aws_key_name = "robertkeypairtwo"
                TF_VAR_ami = "ami-01e6a0b85de033c99"
                TF_VAR_instance_type = "t2.micro"
                TF_VAR_public_ip = "18.200.71.192"
            }
            steps {
                dir('terraform') {
                    withCredentials(
                        [sshUserPrivateKey(
                            credentialsId: 'ROB-PRIVATE-KEY', 
                            keyFileVariable: 'TF_VAR_private_key')
                        ]
                    ) {
                        withCredentials([[
                            $class: 'AmazonWebServicesCredentialsBinding',
                            credentialsId: 'AWS-CREDS',
                            accessKeyVariable: 'TF_VAR_access_key',
                            secretKeyVariable: 'TF_VAR_secret_key'
                        ]]) {
                            sh 'terraform init -backend-config="access_key=${TF_VAR_access_key}" -backend-config="secret_key=${TF_VAR_secret_key}"'
                            sh 'terraform plan'
                            sh 'terraform apply --auto-approve'
                        }
                    }
                }
            }
        }
        stage('Configure App Server') {
            steps {
                withCredentials(
                    [sshUserPrivateKey(
                        credentialsId: 'ROB-PRIVATE-KEY', 
                        usernameVariable: 'SSH_USERNAME',
                        keyFileVariable: 'SSH_PRIVATE_KEY')
                    ]
                ) {
                    dir('ansible') {
                        sh 'ansible-playbook -u ${SSH_USERNAME} --private-key=${SSH_PRIVATE_KEY} -i hosts setup.yml'
                    }
                }
            }
        }
        stage('Deploy Application') {
            steps {
                withCredentials(
                    [sshUserPrivateKey(
                        credentialsId: 'ROB-PRIVATE-KEY', 
                        usernameVariable: 'SSH_USERNAME',
                        keyFileVariable: 'SSH_PRIVATE_KEY')
                    ]
                ) {
                    dir('ansible') {
                        sh 'ansible-playbook -u ${SSH_USERNAME} --private-key=${SSH_PRIVATE_KEY} -i hosts deploy.yml'
                    }
                }
            }
        }
    }
}