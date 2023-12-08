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
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'makrem1', passwordVariable: 'dckr_pat_KdQe8sbXLMzshXxSE0cF5aU91Rs')]) {
                        sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                        sh 'docker tag django-app $DOCKER_USERNAME/django-app:latest'
                        sh 'docker push $DOCKER_USERNAME/django-app:latest'
                    }
                }
            }
        }
    }
}
