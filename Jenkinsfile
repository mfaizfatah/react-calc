pipeline {
    agent any
    stages {
        stage ('Build Docker Image') {
            steps {
                bat "docker build -t mfaizfatah/belajar:alpha ."
            }
        }
    }
}