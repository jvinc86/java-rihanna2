pipeline {
    agent any

    stages {

        stage('Code') {
            steps {
                git 'https://github.com/jvinc86/java-rihanna2.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
                // sh 'docker stop contenedor'
                // sh 'docker rm contenedor'
                sh 'docker build -t vincenup/nasaimagen:v${BUILD_NUMBER} .'
            }
        }

        stage('Test') {
            steps {
                echo 'Ingresa en la pagina http://neoastronauta'
            }
        }

        stage('Release') {
            steps {
                sh 'docker tag vincenup/nasaimagen:v${BUILD_NUMBER} vincenup/nasaimagen:latest'
                sh 'docker login -u "vincenup" -p "85c91b79-68d8-496a-89d2-470d97fff5a6" docker.io'
                sh 'docker push vincenup/nasaimagen:v${BUILD_NUMBER}'
                sh 'docker push vincenup/nasaimagen:latest'
                sh 'docker rmi vincenup/nasaimagen:v${BUILD_NUMBER}'
                sh 'docker rmi vincenup/nasaimagen:latest'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d -p 80:80 --name contenedor vincenup/nasaimagen:latest'
            }
        }

    }
}