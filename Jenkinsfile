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
                  }
              }
         }

        stage('Deploy AWS infra') {
              steps{
                  echo 'Deploying Infra'
                  withAWS(credentials: 'cf924a3f-913b-416f-8710-3f4ca1cf7b63', region: 'us-east-1') {
                      sh "aws eks --region us-east-1 update-kubeconfig --name devopscluster"
                      sh "kubectl config use-context arn:aws:eks:us-east-1:946032756242:cluster/devopscluster"
                      sh "kubectl set image deployments/devopsapp devopsapp=gastudillo/devopsapp:latest"
                      sh "kubectl apply -f deploy/deploy.yml"
                      sh "kubectl get nodes"
                      sh "kubectl get deploy"
                      sh "kubectl get pod -o wide"
                      sh "kubectl get service/capstone-cloud-devops"
                  }
              }
        }
        stage("Clean") {
              steps{
                    echo 'Cleaning'
                    sh "docker system prune"
              }
        }
    }
}
