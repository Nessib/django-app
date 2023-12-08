pipeline {
    agent any

    stages {
        stage('Lint Dockerfile') {
            steps {
                script {
                    sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'docker build -t django-app .'
                }
            }
        }

        stage('Publish to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                        sh 'docker tag django-app $DOCKER_USERNAME/django-app:latest'
                        sh 'docker push $DOCKER_USERNAME/django-app:latest'
                    }
                }
            }
        }
    }
}
