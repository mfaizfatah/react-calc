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
              bat "docker login -u mfaizfatah -p ${dockerHubPwd}"
              bat "docker push mfaizfatah/belajar:alpha"
            }
            }
        }

        stage('Push Notification') {
            steps {
                withCredentials([string(credentialsId: 'telegramToken', variable: 'TOKEN'), 
                string(credentialsId: 'telegramChatId', variable: 'CHAT_ID')]) {
                    bat """
                    curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendMessage -d chat_id=${CHAT_ID} -d parse_mode="HTML" -d text="<b>Project</b> : POC \
                    <b>Branch</b>: master \
                    <b>Build </b> : OK"
                    """
                }			
            }
        }
    }
}