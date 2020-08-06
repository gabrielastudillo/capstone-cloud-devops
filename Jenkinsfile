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
     }
}
