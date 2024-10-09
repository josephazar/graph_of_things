
# Annonce : Introduction à la modélisation des connaissances en ingénierie mécanique

Bienvenue à ce TP sur la **modélisation des connaissances appliquée à l'ingénierie mécanique** avec Neo4J !

Dans ce TP, vous allez modéliser un **moteur** en utilisant une base de données graphique. Nous allons explorer comment représenter les **composants mécaniques** et leurs **interactions** sous forme de graphe. Vous allez définir des nœuds (pièces) et des relations (connexions entre ces pièces) en partant d'une description que nous vous donnons. Ensuite, vous serez invités à construire un fichier CSV/EXCEL représentant ces composants et relations, que nous utiliserons dans Neo4J pour exécuter des requêtes et explorer les relations entre les éléments.

## Objectif :
D'ici la fin de cette session, vous serez capables de :
- Créer un modèle graphique à partir de données mécaniques.
- Interroger et manipuler ces données pour en extraire des informations utiles.
- Utiliser des concepts de graphes pour comprendre les dépendances entre les composants.

Vous allez modéliser un moteur à partir d'une description textuelle en identifiant les pièces et leurs relations. Le but est de comprendre comment les composants interagissent et de les modéliser dans une base de données graphique.

### Description du moteur :
Le moteur que vous allez modéliser est constitué de plusieurs composants qui interagissent entre eux pour permettre la transformation d'énergie thermique en énergie mécanique.

Le piston, fabriqué en acier, est un composant essentiel du moteur. Il est directement connecté au vilebrequin, qui est responsable de transformer le mouvement linéaire des pistons en mouvement rotatif. Le vilebrequin, quant à lui, est une pièce en fer, située au cœur du moteur.

Le moteur dispose également de deux soupapes, fabriquées en aluminium : une soupape d'admission, qui contrôle l'entrée du mélange air-carburant dans les cylindres, et une soupape d'échappement, qui permet l’évacuation des gaz brûlés hors des cylindres après combustion.

Les cylindres, faits en acier, contiennent le mouvement des pistons et sont directement liés au bloc moteur, qui constitue la structure principale du moteur. Le bloc moteur est fabriqué en fonte et constitue l’élément de support de l'ensemble du moteur.

La bougie d'allumage, une pièce en céramique, est placée à l'intérieur du cylindre pour provoquer l’étincelle nécessaire à l’allumage du mélange air-carburant.

Le moteur comporte aussi un injecteur, fabriqué en acier, qui permet d’introduire le carburant sous pression dans les cylindres. Les mouvements des soupapes sont quant à eux contrôlés par un arbre à cames, fabriqué en acier, qui coordonne l'ouverture et la fermeture des soupapes pour optimiser le flux d'air et l'évacuation des gaz.

### Engine Description:
The engine you will model consists of several components that interact with each other to convert thermal energy into mechanical energy.

The piston, made of steel, is a key component of the engine. It is directly connected to the crankshaft, which is responsible for converting the linear motion of the pistons into rotational motion. The crankshaft, made of iron, is located at the heart of the engine.

The engine also has two valves, made of aluminum: an intake valve, which controls the flow of the air-fuel mixture into the cylinders, and an exhaust valve, which allows the burned gases to exit the cylinders after combustion.

The cylinders, made of steel, contain the motion of the pistons and are directly connected to the engine block, which forms the main structure of the engine. The engine block, made of cast iron, serves as the supporting element for the entire engine.

The spark plug, a ceramic component, is placed inside the cylinder to generate the spark necessary for igniting the air-fuel mixture.

The engine also includes an injector, made of steel, which introduces fuel under pressure into the cylinders. The movements of the valves are controlled by a camshaft, made of steel, which coordinates the opening and closing of the valves to optimize airflow and gas exhaust.

### À partir de cette description, vous devez extraire et modéliser :

- Les pièces du moteur (les nœuds).
- Les relations entre les pièces.

---

## Questions :

1. Lister toutes les pièces du moteur.
2. Trouver les relations entre les pièces du moteur.
3. Identifier les composants qui appartiennent au bloc moteur (sous-systèmes inclus).
4. Trouver tous les composants contrôlés par l'arbre à cames (directement ou indirectement).
5. Compter le nombre de composants par type (Composant, Sous-système, Système).
6. Trouver tous les composants qui ne sont connectés qu'à un seul autre composant.
7. Trouver toutes les connexions bidirectionnelles entre deux pièces.
8. Lister tous les composants qui contrôlent directement ou indirectement le flux d'air dans le cylindre.
9. Identifier les composants critiques avec le plus grand nombre de connexions (centralité de degré).
10. Trouver le chemin le plus court entre le piston et le bloc moteur.
11. Lister tous les composants en fonction de leur matériau.
12. Trouver le chemin le plus long entre deux composants.
13. Lister toutes les pièces connectées au cylindre ou à la culasse.
14. Assurez que la bougie d'allumage est placée dans le cylindre sans créer de doublons.
15. Assurez que l'injecteur alimente en carburant le cylindre sans créer de doublons.

| Nom du mot-clé | Description | Quand l'utiliser | Exemple |
|----------------|-------------|------------------|---------|
| MATCH          | Utilisé pour trouver des motifs dans la base de données. | Lorsque vous souhaitez récupérer des données. | `MATCH (n:Person) RETURN n` |
| CREATE         | Utilisé pour créer des nœuds et des relations. | Lorsque vous souhaitez ajouter de nouvelles données. | `CREATE (n:Person {name: 'Alice'})` |
| MERGE          | Combine MATCH et CREATE. Si le motif n'existe pas, il le crée. | Lorsque vous souhaitez éviter les doublons. | `MERGE (n:Person {name: 'Alice'})` |
| RETURN         | Utilisé pour spécifier ce qui doit être retourné. | Après un MATCH ou un CREATE pour obtenir les résultats. | `MATCH (n:Person) RETURN n.name` |
| DELETE         | Utilisé pour supprimer des nœuds et des relations. | Lorsque vous souhaitez supprimer des données. | `MATCH (n:Person {name: 'Alice'}) DELETE n` |
| SET            | Utilisé pour mettre à jour les propriétés des nœuds et des relations. | Lorsque vous souhaitez modifier des données existantes. | `MATCH (n:Person {name: 'Alice'}) SET n.age = 30` |
| REMOVE         | Utilisé pour supprimer des propriétés ou des étiquettes. | Lorsque vous souhaitez nettoyer des données. | `MATCH (n:Person {name: 'Alice'}) REMOVE n.age` |
| WITH           | Utilisé pour chaîner des requêtes et passer des résultats intermédiaires. | Lorsque vous avez besoin de structurer des requêtes complexes. | `MATCH (n:Person) WITH n.name AS name RETURN name` |
| ORDER BY       | Utilisé pour trier les résultats. | Lorsque vous souhaitez organiser les résultats. | `MATCH (n:Person) RETURN n ORDER BY n.name` |
| LIMIT          | Utilisé pour limiter le nombre de résultats retournés. | Lorsque vous souhaitez restreindre les résultats. | `MATCH (n:Person) RETURN n LIMIT 10` |
