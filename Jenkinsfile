pipeline {
    agent any

    stages {
       stages {
        stage('Build and Run Django App') {
            steps {
                script {
                    // Construire l'image Docker
                    docker.build('django-app')

                    // Exécuter le conteneur Docker
                    docker.image('django-app').run('-p 8000:8000', '--name django-container')

                    // Attendre quelques secondes pour que l'application démarre (ajuster si nécessaire)
                    sleep 10

                    // Exécutez des commandes de test ou de vérification si nécessaire
                    // par exemple : sh 'docker exec django-container python manage.py test'
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
