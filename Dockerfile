# Utilisez une image Python plus légère
FROM python:3.8-slim

# Créez un utilisateur non-root
RUN useradd -ms /bin/bash appuser

# Définissez le répertoire de travail et les variables d'environnement
ENV DockerHOME=/home/app/webapp
WORKDIR $DockerHOME
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Copiez uniquement le fichier requirements.txt pour profiter du cache Docker
COPY requirements.txt $DockerHOME/

# Installez les dépendances en spécifiant les versions et en évitant le cache
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copiez le reste des fichiers
COPY . $DockerHOME/

# Définissez l'utilisateur comme utilisateur par défaut
USER appuser

# Port où l'application Django s'exécute
EXPOSE 8000

# Point d'entrée pour lancer l'application
CMD ["./entrypoint.sh"]
