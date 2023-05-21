pipeline {
    agent any
    stages {
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform apply') {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
        stage('Generate Environment Graph') {
            steps {
                sh 'terraform graph | dot -Tpng > environment_graph.png'
            }
        }
        stage('Upload to S3') {
            steps {
                withAWS(credentials: 'aws-credentials') {
                    sh 'aws s3 cp environment_graph.png s3://terraform-bucket-daniel/'
                }
            }
        }
    }
}