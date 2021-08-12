pipeline {
    agent any
    tools {
        terraform 'Terraform'
    }
    stages{       
        
        stage('Terraform init'){
            steps{
                sh 'terraform init'
            }
        }
        
        stage('Terraform apply'){
            steps{
                withAWS(credentials: 'aws_credentials', region: 'ap-south-1') {
                    sh 'terraform plan'
                    //sh 'terraform apply --auto-approve'
                    sh 'terraform destroy --auto-approve'
                }
            }
        }
    }
}
