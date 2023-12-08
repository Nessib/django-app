pipeline {
    agent any

    stages {
        stage('Lint Dockerfile') {
            steps {
                script {
                    // Inspect and lint Dockerfile
                    sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t django-app:tag .'
                }
            }
        }

        stage('Publish to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Log in to Docker Hub
                        sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"

                        // Tag and push the Docker image to Docker Hub
                        sh 'docker tag mon_image:latest mon_username/mon_image:latest'
                        sh 'docker push mon_username/mon_image:latest'
                    }
                }
            }
        }
    }
}
