### 📌 **README.md**
```markdown
# QuelPoké 🏆 - Docker Setup

**QuelPoké** est un projet développé en **Go**. 
Ce guide explique **comment exécuter l'application avec Docker**.

---

## 🐳 **Installation avec Docker**

### **1️⃣ Prérequis**
Avant de commencer, assurez-vous d'avoir **Docker** installé sur votre machine.

- 📌 **Installer Docker** : [Guide officiel](https://docs.docker.com/get-docker/)
- 📌 **Vérifier l'installation** :
  ```bash
  docker --version
  ```

---

### **2️⃣ Cloner le projet**
Téléchargez le projet en local :
```bash
git clone https://github.com/DB-Alexandre/quelpoke.git
cd quelpoke
```

---

### **3️⃣ Construire et exécuter le conteneur**
1. **Construire l’image Docker** :
   ```bash
   docker build -t quelpoke .
   ```
   📌 Cela va compiler le code Go et préparer une image Docker.

2. **Lancer le conteneur** :
   ```bash
   docker run -p 3000:3000 quelpoke
   ```
   📌 **Accéder à l’application** :  
   Ouvrez un navigateur et allez sur :
   ```
   http://localhost:3000
   ```

---

### **4️⃣ Personnalisation des Variables d’Environnement**
Si l’application utilise un fichier **`.env`**, vous pouvez le monter dans le conteneur :

```bash
docker run -p 3000:3000 --env-file .env quelpoke
```

---

### **5️⃣ Développement (Hot Reload)**
Si vous souhaitez développer sans reconstruire l’image à chaque fois :

```bash
docker run -p 3000:3000 -v $(pwd):/app quelpoke
```

Cela montera le code source à l’intérieur du conteneur.

---

### **6️⃣ Arrêter et supprimer le conteneur**
Pour **arrêter le conteneur** :
```bash
docker stop $(docker ps -q --filter ancestor=quelpoke)
```
Pour **supprimer le conteneur et l’image** :
```bash
docker rm $(docker ps -aq --filter ancestor=quelpoke)
docker rmi quelpoke
```

---

## 🔍 **Débogage & Logs**
- **Voir les logs du conteneur** :
  ```bash
  docker logs $(docker ps -q --filter ancestor=quelpoke)
  ```
- **Accéder au shell du conteneur** :
  ```bash
  docker exec -it $(docker ps -q --filter ancestor=quelpoke) sh
  ```