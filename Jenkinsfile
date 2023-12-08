pipeline {
    agent any

    stages {
        stage('Lint Dockerfile') {
            steps {
                script {
                    sh 'docker run --rm hadolint/hadolint:latest-debian hadolint Dockerfile'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t makrem1/django-app:latest .'
                }
            }
        }

        stage('Publish to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'makrem1', passwordVariable: 'dckr_pat_KdQe8sbXLMzshXxSE0cF5aU91Rs')]) {
                        sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                        sh 'docker push makrem1/django-app:latest'
                    }
                }
            }
        }
    }
}
