pipeline { 
    agent any 
    stages { 
        stage('Terraform Instance creation and docker deployment'){
                steps{
                    withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-key', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    bat 'terraform apply -auto-approve'
                    }
                }
            }
        }
}
