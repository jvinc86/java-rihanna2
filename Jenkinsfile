pipeline {
    agent any

    tools { maven "Maven" }

    stages {

        stage('Build') {
            steps {
                sh 'mvn clean install'
                sh 'docker stop contenedor'
                sh 'docker rm contenedor'
                sh 'docker build -t vincenup/${JOB_NAME}:v${BUILD_NUMBER} .'
            }
        }

        stage('Test') {
            steps {
                echo 'Ingresa en la pagina http://debian'
            }
        }

        stage('Release') {
            steps {
                sh 'docker tag vincenup/${}:v${BUILD_NUMBER} vincenup/${}:latest'
                sh 'docker login -u "vincenup" -p "85c91b79-68d8-496a-89d2-470d97fff5a6" docker.io'
                sh 'docker push vincenup/${}:v${BUILD_NUMBER}'
                sh 'docker push vincenup/${}:latest'
                sh 'docker rmi vincenup/${}:v${BUILD_NUMBER}'
                sh 'docker rmi vincenup/${}:latest'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d -p 80:80 --name contenedor vincenup/${}:latest'
            }
        }

    }
}