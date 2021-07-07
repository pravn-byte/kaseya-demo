#!groovy

// Build Parameters
properties([ parameters([
  string( name: 'AWS_ACCESS_KEY_ID', defaultValue: 'AKIAU4GLDMB4SDYNEGLZ'),
  string( name: 'AWS_SECRET_ACCESS_KEY', defaultValue: '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')
]), pipelineTriggers([]) ])

// Environment Variables
env.AWS_ACCESS_KEY_ID = AWS_ACCESS_KEY_ID
env.AWS_SECRET_ACCESS_KEY = AWS_SECRET_ACCESS_KEY

node {
  stage ('Checkout') {
    git branch: 'main',
       url: 'https://github.com/pravn-byte/kaseya-demo.git'
  }

  stage ('Terraform Plan') {
    sh 'cd /var/lib/jenkins/workspace/jenkins-terraform-integration/terraform'
    sh 'terraform init'
    sh 'terraform plan -no-color -out=create.tfplan'
  }

  stage ('Terraform Apply') {
    sh 'terraform apply -no-color -auto-approve create.tfplan'
  }

  stage ('Post Run Tests') {
    echo "Insert your infrastructure test of choice and/or application validation here."
    sleep 2
    sh 'terraform show'
    sh 'cp terraform.tfstate /var/lib/jenkins/workspace/AWS-Terraform_destroy/terraform.tfstate'
  }

  stage ('Notification') {
    echo "Sent mail notification"
    mail from: "pravn8049@gmail.com",
         to: "pravn8049@gmail.com",
         subject: "Terraform build complete",
         body: "Jenkins job ${env.JOB_NAME} - build ${env.BUILD_NUMBER} complete"
        
  }
}
