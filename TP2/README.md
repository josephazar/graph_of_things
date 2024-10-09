
# TP 2 : Modélisation d'un bâtiment intelligent

Dans ce TP, vous allez modéliser un **bâtiment intelligent** de trois étages, chacun contenant plusieurs **appareils** et **capteurs**. Ces appareils jouent un rôle essentiel dans la gestion de l'environnement du bâtiment, la sécurité et d'autres fonctions.

Votre objectif est de modéliser le bâtiment, en identifiant les **nœuds** (les appareils, les capteurs, les pièces, les étages) et les **relations** (par exemple, un capteur connecté à une pièce, une pièce liée à un étage, etc.). Vous devrez ensuite répondre à des questions basées sur cette modélisation.


## Description du bâtiment

Le bâtiment **Innovative Tech Hub** est un bâtiment intelligent moderne de trois étages situé au cœur d'une grande ville. Ce bâtiment abrite plusieurs entreprises spécialisées dans la technologie, avec un focus particulier sur l'innovation numérique. Chaque étage est équipé de systèmes intelligents qui permettent de surveiller l'environnement (température, humidité), la sécurité (caméras, détecteurs de mouvement), et l'éclairage (lumières intelligentes ajustables).

### Détails des étages et des pièces :

- **1er étage** : 
   - Contient un **hall d'entrée** (qui accueille les visiteurs et est équipé de plusieurs caméras de sécurité).
   - Trois **bureaux** individuels (Bureau 101, 102 et 103).
   - Chaque bureau dispose de capteurs de température et de lumière intelligente pour ajuster automatiquement la luminosité en fonction de la présence des occupants.
   
- **2e étage** :
   - Un espace de **réunion** (Salle Réunion 202), équipé de capteurs de mouvement pour détecter la présence des personnes et ajuster l'éclairage.
   - Deux **bureaux** (Bureau 201 et Bureau 202) avec des capteurs de température et de sécurité.
   - Un **couloir** équipé de détecteurs de mouvement pour allumer et éteindre les lumières.

- **3e étage** :
   - Un **laboratoire** technologique (Laboratoire 301) contenant des capteurs environnementaux (température, humidité) pour assurer le bon fonctionnement des équipements sensibles.
   - Un **espace commun** avec des caméras de sécurité et un système d'éclairage intelligent qui ajuste la luminosité en fonction de la lumière naturelle.
   - Un **bureau 302** avec capteurs de lumière et de sécurité.

### Liste des appareils et capteurs :

Chaque appareil/capteur dans le bâtiment a un rôle précis, et les capteurs peuvent être de différentes catégories (environnement, sécurité, mouvement). Voici quelques exemples :

1. **Capteur Température Bureau 101** : Mesure la température du Bureau 101.  
   - Fabricant : **SmartTech**
   - Fonction : **Température**
   - Catégorie : **Environnement**

2. **Caméra Sécurité Hall Entrée** : Surveillance de la zone d'accueil.  
   - Fabricant : **SensorPro**
   - Fonction : **Caméra**
   - Catégorie : **Sécurité**

3. **Détecteur de Mouvement Salle Réunion 202** : Détecte les mouvements dans la salle pour ajuster l'éclairage.  
   - Fabricant : **SensorPro**
   - Fonction : **Mouvement**
   - Catégorie : **Mouvement**

4. **Lumière Intelligente Bureau 102** : Ajuste la luminosité en fonction de la lumière ambiante et des personnes présentes.  
   - Fabricant : **LumiPro**
   - Fonction : **Éclairage intelligent**
   - Catégorie : **Lumière**

5. **Capteur Humidité Laboratoire 301** : Mesure l'humidité pour assurer que le laboratoire reste dans des conditions optimales.  
   - Fabricant : **EnviroSense**
   - Fonction : **Humidité**
   - Catégorie : **Environnement**

6. **Caméra Sécurité Espace Commun 3e Étage** : Surveillance de l'espace commun pour garantir la sécurité.  
   - Fabricant : **SensorPro**
   - Fonction : **Caméra**
   - Catégorie : **Sécurité**

---

### Relations à modéliser :

Vous devrez identifier les nœuds suivants :
- Les **étages**.
- Les **pièces** dans chaque étage.
- Les **appareils/capteurs** dans chaque pièce avec leurs catégories, fabricants et fonctions.

Vous devrez également modéliser les relations suivantes :
1. Un **appareil/capteur** est **installé dans** une **pièce** (par exemple, **Capteur Température Bureau 101** est installé dans le **Bureau 101**).
2. Une **pièce** est **située à un étage** (par exemple, le **Bureau 101** est situé au **1er étage**).
3. Un **appareil** peut être **lié** à un autre appareil (par exemple, un **détecteur de mouvement** est lié à une **caméra de sécurité** dans la même pièce).

---

## Questions :

### 1. Lister tous les capteurs du bâtiment, triés par catégorie.

### 2. Trouver toutes les relations entre les capteurs et les pièces.

### 3. Identifier les capteurs de température installés dans le bâtiment.

### 4. Trouver tous les appareils de sécurité du bâtiment (catégorie : sécurité) et les pièces où ils sont installés.

### 5. Compter le nombre d'appareils par fonction (température, caméra, lumière, etc.).

### 6. Lister tous les appareils connectés au 2e étage.

### 7. Trouver tous les appareils d'un même fabricant (par exemple, "SmartTech") installés dans le bâtiment.

### 8. Lister tous les capteurs de température et les étages où ils sont installés.

### 9. Trouver la pièce qui contient le plus d'appareils connectés.

### 10. Identifier les pièces qui contiennent à la fois un capteur de mouvement et une caméra de sécurité.
