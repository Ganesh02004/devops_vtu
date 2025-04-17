pipeline {
    agent any

    environment {
        IMAGE_NAME = 'ganesh02004/myapp:latest'
        DOCKER_CREDENTIALS_ID = 'dockerhub-creds' // or Harbor creds
        SONARQUBE_ENV = 'SonarQube'               // SonarQube server name in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Static Code Analysis - SonarQube') {
            steps {
                withSonarQubeEnv("${SONARQUBE_ENV}") {
                    sh 'sonar-scanner'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Vulnerability Scan - Trivy') {
            steps {
                sh 'trivy image --exit-code 1 --severity HIGH,CRITICAL $IMAGE_NAME'
            }
        }

        stage('Push Image to Harbor') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh '''
                        echo $PASSWORD | docker login -u $USERNAME --password-stdin yourregistry.domain.com
                        docker push $IMAGE_NAME
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f kubernetes/'
            }
        }
    }

    post {
        failure {
            mail to: 'satishpurma46@gmail.com',
                subject: "Build Failed: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: "Check Jenkins for details: ${env.BUILD_URL}"
        }
    }
}
