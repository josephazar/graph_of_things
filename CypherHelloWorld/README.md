
# Exemples de Requêtes Cypher de Base

Voici cinq requêtes **Cypher** simples pour interagir avec une base de données Neo4j en utilisant l'exemple de l'univers de **Matrix**.

https://console.neo4j.org/ 

---

## 1. Afficher tous les nœuds dans la base de données

Cette requête permet de récupérer tous les nœuds présents dans la base de données.

```cypher
MATCH (n) 
RETURN n
```

### Explication :
- `MATCH (n)` recherche tous les nœuds dans la base.
- `RETURN n` renvoie les nœuds trouvés.

---

## 2. Afficher les noms de tous les personnages de l'univers Matrix

Cette requête retourne les noms de tous les personnages, peu importe leur appartenance à l'équipage ou à la matrice.

```cypher
MATCH (n) 
RETURN n.name
```

### Explication :
- `MATCH (n)` sélectionne tous les nœuds.
- `RETURN n.name` renvoie la propriété `name` de chaque nœud.

---

## 3. Trouver qui connaît Neo

Cette requête retourne tous les personnages qui ont une relation **KNOWS** avec Neo.

```cypher
MATCH (n)-[:KNOWS]->(Neo {name: 'Neo'})
RETURN n.name
```

### Explication :
- `MATCH (n)-[:KNOWS]->(Morpheus {name: 'Morpheus'})` trouve tous les nœuds qui connaissent Neo via la relation **KNOWS**.
- `RETURN n.name` renvoie les noms des personnages qui connaissent Neo.

---

## 4. Lister toutes les relations amoureuses de la base

Cette requête renvoie les relations amoureuses représentées par **LOVES** dans la base de données.

```cypher
MATCH (a)-[:LOVES]->(b)
RETURN a.name, b.name
```

### Explication :
- `MATCH (a)-[:LOVES]->(b)` trouve toutes les relations **LOVES** entre deux nœuds.
- `RETURN a.name, b.name` renvoie les noms des nœuds dans ces relations.

---

## 5. Afficher qui a été codé par The Architect

Cette requête retourne les nœuds qui ont une relation **CODED_BY** avec **The Architect**.

```cypher
MATCH (n)-[:CODED_BY]->(Architect {name: 'The Architect'})
RETURN n.name
```

### Explication :
- `MATCH (n)-[:CODED_BY]->(Architect {name: 'The Architect'})` recherche tous les nœuds liés à **The Architect** via la relation **CODED_BY**.
- `RETURN n.name` renvoie le nom des nœuds trouvés.

---

Ces requêtes montrent des cas simples mais fondamentaux pour comprendre comment interagir avec une base de données Neo4j en utilisant le langage **Cypher**.
