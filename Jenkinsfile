pipeline{
    agent any
    params {
        string(name: 'bucket_url', defaultValue: "s3://terraform-bucket-daniel-public")
    }
    stages {
        stage('Terraform init'){
            steps{
                sh 'terraform init'
                
            }
        }
        stage('Terraform apply'){
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
        stage('graph creation'){
            steps{
                sh "terraform graph > ${params.graph_file}"
                sh "dot -Tpng ${params.graph_file} -o ${params.graph_img}"
                sh "aws s3 cp ./${params.graph_img} ${params.bucket_url}"
            }
        }
    }
}
