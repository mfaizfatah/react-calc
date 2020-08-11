pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                bat "docker build -t mfaizfatah/belajar:alpha ."
            }
        }
        
        stage('DockerHub Push') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
              // some block
              bat "docker logn -u mfaizfatah -p ${dockerHubPwd}"
              bat "docker push mfaizfatah/belajar:alpha"
            }
            }
        }
    }
}