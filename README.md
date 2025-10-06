# Guide d'Installation de Neo4j (2025)

## Introduction
Neo4j est une base de données orientée graphe, idéale pour les applications nécessitant des relations complexes entre les données. Ce guide vous aidera à installer Neo4j sur Windows, Ubuntu/Linux, macOS et vous présente également l'option cloud Neo4j AuraDB.

**Version actuelle (2025):** Neo4j 2025.09 (Latest) | Neo4j 5.26 (LTS - Long Term Support)

## Installation sur Ubuntu/Linux

### Prérequis
- Java 21 (OpenJDK 21 ou ZuluJDK 21)

### Méthode 1 : Installation via Debian Package (Recommandé pour Ubuntu)

1. **Installer Java 21** :
   ```bash
   sudo apt-get update
   sudo apt-get install openjdk-21-jdk
   ```

2. **Ajouter le dépôt Neo4j** :
   ```bash
   wget -O - https://debian.neo4j.com/neotechnology.gpg.key | sudo apt-key add -
   echo 'deb https://debian.neo4j.com stable latest' | sudo tee /etc/apt/sources.list.d/neo4j.list
   sudo apt-get update
   ```

3. **Installer Neo4j** :
   ```bash
   sudo apt-get install neo4j
   ```

4. **Démarrer Neo4j** :
   ```bash
   sudo systemctl enable neo4j
   sudo systemctl start neo4j
   sudo systemctl status neo4j
   ```

5. **Accéder à Neo4j** :
   - Ouvrez votre navigateur à [http://localhost:7474](http://localhost:7474)
   - Nom d'utilisateur par défaut: `neo4j`
   - Mot de passe par défaut: `neo4j` (vous serez invité à le changer)

### Méthode 2 : Neo4j Desktop (Interface Graphique)

1. Téléchargez le fichier `.AppImage` depuis [https://neo4j.com/download/](https://neo4j.com/download/)
2. Rendez le fichier exécutable et lancez-le :
   ```bash
   chmod +x neo4j-desktop-*.AppImage
   ./neo4j-desktop-*.AppImage
   ```

## Installation sur Windows

### Prérequis
- Java 21 (OpenJDK 21 ou Oracle Java 21)
- Windows Server 2025 est maintenant supporté

### Méthode 1 : Installation via Archive ZIP

1. **Installer Java 21** :
   - Téléchargez et installez OpenJDK 21 ou Oracle Java 21

2. **Télécharger Neo4j** :
   - Visitez le [Neo4j Deployment Center](https://neo4j.com/download/)
   - Téléchargez la distribution ZIP pour Windows

3. **Extraire et Installer** :
   - Extrayez le fichier ZIP dans votre répertoire d'installation préféré (ex: `C:\neo4j`)

4. **Installer comme Service** :
   ```powershell
   C:\neo4j\bin\neo4j.bat windows-service install
   ```

5. **Démarrer Neo4j** :
   ```powershell
   C:\neo4j\bin\neo4j.bat start
   ```

6. **Accéder à Neo4j** :
   - Ouvrez [http://localhost:7474](http://localhost:7474) dans votre navigateur
   - Connectez-vous avec `neo4j` / `neo4j` et changez le mot de passe

### Méthode 2 : Neo4j Desktop

1. Téléchargez Neo4j Desktop depuis [https://neo4j.com/download/](https://neo4j.com/download/)
2. Exécutez l'installateur et suivez les instructions
3. Lancez Neo4j Desktop et créez un nouveau projet/database

## Installation sur macOS

### Prérequis
- Java 21 (OpenJDK 21 ou ZuluJDK 21)
- macOS 13, 14, ou 15

### Méthode 1 : Installation via Homebrew (Recommandé)

1. **Installer Homebrew** (si pas déjà installé) :
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Installer Neo4j** :
   ```bash
   brew install neo4j
   ```

3. **Démarrer Neo4j** :
   ```bash
   brew services start neo4j
   ```

4. **Accéder à Neo4j** :
   - Ouvrez [http://localhost:7474](http://localhost:7474) dans votre navigateur
   - Connectez-vous avec `neo4j` / `neo4j`

5. **Fichier de configuration** :
   - Situé à : `/opt/homebrew/Cellar/neo4j/2025.09.0/libexec/conf/neo4j.conf`

### Méthode 2 : Archive TAR

1. Téléchargez l'archive TAR depuis [Neo4j Deployment Center](https://neo4j.com/download/)
2. Extrayez l'archive :
   ```bash
   tar -xf neo4j-*.tar.gz
   cd neo4j-*
   ```
3. Démarrez Neo4j :
   ```bash
   bin/neo4j start
   ```

### Méthode 3 : Neo4j Desktop

1. Téléchargez Neo4j Desktop depuis [https://neo4j.com/download/](https://neo4j.com/download/)
2. Ouvrez le fichier `.dmg` et glissez-déposez dans Applications
3. Lancez Neo4j Desktop et configurez votre database

## Option Cloud : Neo4j AuraDB

Neo4j AuraDB est une **base de données cloud entièrement gérée** - pas besoin d'installation locale !

### Avantages
- Aucune gestion d'infrastructure
- Mise à l'échelle automatique
- Sécurité et sauvegardes intégrées
- Disponible sur AWS, Azure et Google Cloud
- Support pour les applications AI/ML avec Neo4j Aura Graph Analytics

### Plans Disponibles
- **AuraDB Free** : Gratuit pour débuter
- **AuraDB Professional** : Pay-as-you-go
- **AuraDB Business Critical** : Pour les applications critiques
- **AuraDB Virtual Dedicated Cloud** : Infrastructure dédiée

### Démarrage Rapide

1. **Créer un compte** :
   - Visitez [https://console.neo4j.io/](https://console.neo4j.io/)
   - Inscrivez-vous gratuitement

2. **Créer une instance** :
   - Cliquez sur "Create Instance"
   - Choisissez votre plan (Free pour commencer)
   - Sélectionnez votre région cloud
   - Notez vos identifiants de connexion

3. **Se connecter** :
   - Utilisez l'URL de connexion fournie
   - Connectez-vous avec vos identifiants
   - Commencez à construire votre graphe !

### Nouveautés 2025
- **Neo4j Aura Graph Analytics** : Analytics sans serveur avec Zero ETL
- **Neo4j Aura Agent** : Création rapide d'agents AI sur vos données
- Intégration avec Databricks, Snowflake, Google BigQuery, Microsoft OneLake

## Ressources Officielles

- Documentation officielle : [https://neo4j.com/docs/](https://neo4j.com/docs/)
- Centre de téléchargement : [https://neo4j.com/download/](https://neo4j.com/download/)
- Documentation d'installation : [https://neo4j.com/docs/operations-manual/current/installation/](https://neo4j.com/docs/operations-manual/current/installation/)
- Neo4j AuraDB : [https://neo4j.com/product/auradb/](https://neo4j.com/product/auradb/)

## Conclusion
Vous avez maintenant plusieurs options pour installer Neo4j selon vos besoins : installation locale sur Ubuntu, Windows ou macOS, ou utilisation de la solution cloud AuraDB. Choisissez la méthode qui convient le mieux à votre projet !


# IoT Modeling using Neo4J

## Step 1: Install Neo4j Desktop

1. Visit the Neo4j Download Page and download the **Neo4j Desktop** application.
2. Once downloaded, run the installer and follow the on-screen instructions to install Neo4j Desktop.

## Step 2: Create a New Database

1. Open Neo4j Desktop.
2. Click on **New Graph**.
3. Click on **Create a Local Graph**.
4. Fill in the **Database Name** and **Password** fields, then click **Create**.

## Step 3: Install APOC Plugin

1. Click on your newly created database from the **Projects** tab.
2. Go to the **Plugins** tab.
3. Find the **APOC** plugin and click **Install**.

## Step 4: Start the Database

1. Go back to the **Details** tab.
2. Click on **Start** to start your database.

## Step 5: Open Neo4j Browser

1. Once the database is started, click on **Open with Neo4j Browser**.