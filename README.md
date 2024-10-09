# Guide d'Installation de Neo4j

## Introduction
Neo4j est une base de données orientée graphe, idéale pour les applications nécessitant des relations complexes entre les données. Ce guide vous aidera à installer Neo4j sur Windows, Linux et Mac.

## Installation sur Windows

1. **Télécharger Neo4j Desktop** :
   - Rendez-vous sur le site officiel de [Neo4j](https://neo4j.com/download-center/).
   - Téléchargez le fichier d'installation pour Windows.

2. **Installer Neo4j Desktop** :
   - Exécutez le fichier téléchargé.
   - Suivez les instructions à l'écran pour installer Neo4j Desktop.
   - Une fois l'installation terminée, lancez Neo4j Desktop.

3. **Configurer Neo4j** :
   - Lors du premier lancement, vous devrez peut-être entrer une clé d'activation. Vous pouvez obtenir cette clé sur le site de Neo4j.
   - Créez un nouveau projet et une nouvelle base de données.
   - Démarrez la base de données et accédez à l'interface de Neo4j Browser pour commencer à utiliser Neo4j.

## Installation sur Linux

1. **Télécharger Neo4j** :
   - Ouvrez un terminal.
   - Ajoutez la clé Neo4j à votre gestionnaire de paquets :
     ```bash
     wget -O - https://debian.neo4j.com/neotechnology.gpg.key | sudo apt-key add -
     ```
   - Ajoutez le dépôt Neo4j à votre liste de sources :
     ```bash
     echo 'deb https://debian.neo4j.com/repo stable/' | sudo tee /etc/apt/sources.list.d/neo4j.list
     ```
   - Mettez à jour votre gestionnaire de paquets :
     ```bash
     sudo apt-get update
     ```

2. **Installer Neo4j** :
   - Installez Neo4j Community Edition :
     ```bash
     sudo apt-get install neo4j
     ```

3. **Démarrer Neo4j** :
   - Démarrez le service Neo4j :
     ```bash
     sudo systemctl start neo4j
     ```
   - Vérifiez que Neo4j fonctionne :
     ```bash
     sudo systemctl status neo4j
     ```

4. **Accéder à Neo4j** :
   - Ouvrez votre navigateur web et allez à l'adresse [http://localhost:7474](http://localhost:7474).
   - Connectez-vous avec le nom d'utilisateur `neo4j` et le mot de passe par défaut `neo4j`. Vous serez invité à changer le mot de passe.

## Installation sur Mac

1. **Télécharger Neo4j Desktop** :
   - Rendez-vous sur le site officiel de [Neo4j](https://neo4j.com/download-center/).
   - Téléchargez le fichier `.dmg` pour Mac.

2. **Installer Neo4j Desktop** :
   - Ouvrez le fichier `.dmg` téléchargé.
   - Glissez-déposez l'icône Neo4j dans le dossier Applications.

3. **Configurer Neo4j** :
   - Lancez Neo4j Desktop depuis le dossier Applications.
   - Entrez la clé d'activation si nécessaire.
   - Créez un nouveau projet et une nouvelle base de données.
   - Démarrez la base de données et accédez à l'interface de Neo4j Browser pour commencer à utiliser Neo4j.

## Conclusion
Vous avez maintenant installé Neo4j sur votre système. Vous pouvez commencer à explorer les fonctionnalités de cette puissante base de données orientée graphe. Bon apprentissage !


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