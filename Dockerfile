# Utiliser une image minimale de Go avec Alpine
FROM golang:1.22.4-alpine

# Définir le répertoire de travail dans le container
WORKDIR /app

# Copier les fichiers Go et HTML dans le conteneur
COPY . .

# Télécharger les dépendances
RUN go mod tidy

# Compiler le programme Go
RUN go build -o app

# Exposer le port 3000
EXPOSE 3000

# Exécuter l'application
CMD [ "./app" ]
