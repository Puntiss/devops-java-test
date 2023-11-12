pipeline {
    agent any
    tools {
        jdk 'jdk-14.0.1'
    }
    environment {
        registry = "puntiss/devops-automation"
        registryCredential = 'docker-token'
        dockerImage = ''
    }
    stages {
        stage('Maven Build') {
            steps {
                bat 'mvn -v'
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Puntiss/devops-java-test']])
                bat 'mvn clean install'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                  dockerImage = docker.build registry
                }
            }
        }
        stage('Docker Push') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
