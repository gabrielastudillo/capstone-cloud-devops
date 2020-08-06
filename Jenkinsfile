pipeline {
     agent any
     stages {
         stage('Build') {
              steps {
                  sh 'echo Building...'
              }
         }
         stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
         stage('Build Docker Image') {
              steps {
                  sh 'docker build -t capstone-cloud-devops .'
              }
         }
         stage('Push Docker Image') {
              steps {
                  withDockerRegistry([url: "", credentialsId: "dockerhub_id"]) {
                      sh "docker tag capstone-cloud-devops gastudillo/capstone-cloud-devops"
                      sh 'docker push gastudillo/capstone-cloud-devops'
        stage('Deploy AWS infra') {
              steps{
                  echo 'Deploying Infra'
                  withAWS(credentials: 'aws', region: 'us-east-1') {
                      sh "aws eks --region us-east-1 update-kubeconfig --name devopscluster"
                      sh "kubectl config use-context arn:aws:eks:us-east-1:946032756242:cluster/devopscluster"
                      sh "kubectl set image deployments/capstone-cloud-devops capstone-cloud-devops=gastudillo/capstone-cloud-devops:latest"
                      sh "kubectl apply -f deployment/deployment.yml"
                      sh "kubectl get nodes"
                      sh "kubectl get deployment"
                      sh "kubectl get pod -o wide"
                      sh "kubectl get service/capstone-cloud-devops"
                  }
              }
        }
                  }
              }
         }
     }
}
