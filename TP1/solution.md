# Solutions : Modélisation des connaissances en ingénierie mécanique (Neo4J)

### Liste des pièces à modéliser :
1. **Piston**  
2. **Vilebrequin**  
3. **Soupape d'admission**  
4. **Soupape d'échappement**  
5. **Cylindre**  
6. **Bougie d'allumage**  
7. **Culasse**  
8. **Arbre à cames**  
9. **Bloc moteur**  
10. **Injecteur**  

### Relations à modéliser :
1. **Piston** est connecté à **Vilebrequin**.
2. **Soupape d'admission** contrôle le flux d'air vers le **Cylindre**.
3. **Soupape d'échappement** contrôle la sortie des gaz du **Cylindre**.
4. **Cylindre** fait partie du **Bloc Moteur**.
5. **Vilebrequin** fait partie du **Bloc Moteur**.
6. **Arbre à cames** contrôle les mouvements des **Soupapes**.
7. **Bougie d'allumage** est placée dans le **Cylindre**.
8. **Injecteur** alimente le **Cylindre** en carburant.
9. **Culasse** couvre le **Bloc Moteur**.
10. **Culasse** fait partie du **Bloc Moteur**.
11. **Culasse** contient la  **Soupape d'admission**.
12. **Culasse** contient la **Soupape d'échappement**.

Effacer la base de données
```cypher
MATCH (n)
DETACH DELETE n
```

## Création des nœuds (Pièces)

```cypher
CREATE (piston:Composant {identifiant: "Piston", materiau: "Acier"}),
       (vilebrequin:Composant {identifiant: "Vilebrequin", materiau: "Fer"}),
       (soupape_admission:Composant {identifiant: "Soupape d'admission", materiau: "Aluminium"}),
       (soupape_echappement:Composant {identifiant: "Soupape d'échappement", materiau: "Aluminium"}),
       (cylindre:Sous_systeme {identifiant: "Cylindre", materiau: "Acier"}),
       (bougie_allumage:Composant {identifiant: "Bougie d'allumage", materiau: "Céramique"}),
       (culasse:Sous_systeme {identifiant: "Culasse", materiau: "Aluminium"}),
       (arbre_cames:Composant {identifiant: "Arbre à cames", materiau: "Acier"}),
       (bloc_moteur:Systeme {identifiant: "Bloc moteur", materiau: "Fonte"}),
       (injecteur:Composant {identifiant: "Injecteur", materiau: "Acier"});
```

## Création des relations

```cypher
MATCH (piston:Composant {identifiant: "Piston"}), 
      (vilebrequin:Composant {identifiant: "Vilebrequin"}),
      (soupape_admission:Composant {identifiant: "Soupape d'admission"}),
      (soupape_echappement:Composant {identifiant: "Soupape d'échappement"}),
      (cylindre:Sous_systeme {identifiant: "Cylindre"}),
      (bloc_moteur:Systeme {identifiant: "Bloc moteur"}),
      (arbre_cames:Composant {identifiant: "Arbre à cames"}),
      (bougie_allumage:Composant {identifiant: "Bougie d'allumage"}),
      (injecteur:Composant {identifiant: "Injecteur"}),
      (culasse:Sous_systeme {identifiant: "Culasse"})
CREATE (piston)-[:CONNECTÉ_À]->(vilebrequin),
       (soupape_admission)-[:CONTRÔLE_FLUX]->(cylindre),
       (soupape_echappement)-[:CONTRÔLE_FLUX]->(cylindre),
       (cylindre)-[:FAIT_PARTIE_DE]->(bloc_moteur),
       (vilebrequin)-[:FAIT_PARTIE_DE]->(bloc_moteur),
       (arbre_cames)-[:CONTRÔLE_MOUVEMENT]->(soupape_admission),
       (arbre_cames)-[:CONTRÔLE_MOUVEMENT]->(soupape_echappement),
       (bougie_allumage)-[:PLACÉE_DANS]->(cylindre),
       (injecteur)-[:ALIMENTE_EN_CARBURANT]->(cylindre),
       (culasse)-[:COUVRE]->(cylindre),
       (culasse)-[:FAIT_PARTIE_DE]->(bloc_moteur),
       (culasse)-[:CONTIENT]->(soupape_admission),
       (culasse)-[:CONTIENT]->(soupape_echappement);
```

---

## Solutions aux questions :

### 1. Lister toutes les pièces du moteur

```cypher
MATCH (p:Composant)
RETURN p.identifiant;
```

```cypher
MATCH (p)
RETURN p.identifiant;
```

### 2. Trouver les relations entre les pièces du moteur

```cypher
MATCH (a:Composant)-[r]->(b:Composant)
RETURN a.identifiant, TYPE(r), b.identifiant;
```

```cypher
MATCH (a)-[r]->(b)
RETURN a.identifiant, TYPE(r), b.identifiant;
```

### 3. Identifier les composants qui appartiennent au bloc moteur (sous-systèmes inclus)

```cypher
MATCH (p:Sous_systeme)-[:FAIT_PARTIE_DE*1..]->(bloc_moteur:Systeme {identifiant: "Bloc moteur"})
RETURN p.identifiant;
```

```cypher
MATCH (bloc_moteur:Systeme {identifiant: "Bloc moteur"})-[*1..2]-(n) 
RETURN bloc_moteur,n
```

Dans Neo4J, la syntaxe `*1..` est utilisée pour effectuer des correspondances de chemin de **longueur variable**. Elle spécifie combien de **relations** (ou "sauts") Neo4J doit traverser lorsqu'il recherche des nœuds connectés.

#### Explication de `[:FAIT_PARTIE_DE*1..]` :
- **`[:FAIT_PARTIE_DE]`** : Représente le type de relation que vous voulez correspondre, ici la relation `FAIT_PARTIE_DE`.
- **`*1..`** : Le `1..` signifie que Neo4J doit traverser un nombre de relations variable, en commençant par **au moins 1 relation** (1 saut) et pouvant aller jusqu’à un **nombre indéterminé de relations** (il n'y a pas de limite supérieure fixée).

En d'autres termes, **`[:FAIT_PARTIE_DE*1..]`** signifie :
- "Traversez au moins une relation `FAIT_PARTIE_DE` et potentiellement davantage de relations pour trouver des nœuds connectés."


### 4. Trouver tous les composants contrôlés par l'arbre à cames (directement ou indirectement)

```cypher
MATCH (arbre_cames:Composant {identifiant: "Arbre à cames"})-[:CONTRÔLE_MOUVEMENT*1..]->(p:Composant)
RETURN p.identifiant;
```

### 5. Compter le nombre de composants par type (Composant, Sous-système, Système)

```cypher
MATCH (p)
RETURN LABELS(p) AS type, COUNT(p) AS nombre_de_composants;
```

### 6. Trouver tous les composants qui ne sont connectés qu'à un seul autre composant

```cypher
MATCH (p)-[r]->(autre)
WITH p, COUNT(r) AS connexions
WHERE connexions = 1
RETURN p.identifiant;
```

### 7. Trouver toutes les connexions bidirectionnelles entre deux pièces

```cypher
MATCH (p1)-[r1]->(p2), (p2)-[r2]->(p1)
RETURN p1.identifiant, p2.identifiant;
```

### 8. Lister tous les composants qui contrôlent directement ou indirectement le flux d'air dans le cylindre

```cypher
MATCH (p)-[:CONTRÔLE_FLUX]->(cylindre:Sous_systeme {identifiant: "Cylindre"})
RETURN p.identifiant;
```

### 9. Identifier les composants critiques avec le plus grand nombre de connexions (centralité de degré)

```cypher
MATCH (p)-[r]->(autre)
RETURN p.identifiant, COUNT(r) AS nombre_connexions
ORDER BY nombre_connexions DESC;
```

### 10. Trouver le chemin le plus court entre le piston et le bloc moteur

```cypher
MATCH p=shortestPath((piston:Composant {identifiant: "Piston"})-[*]-(bloc_moteur:Systeme {identifiant: "Bloc moteur"}))
RETURN p;
```

### 11. Lister tous les composants en fonction de leur matériau

```cypher
MATCH (p)
RETURN p.materiau, collect(p.identifiant) AS composants_par_materiau;
```

### 12. Trouver le chemin le plus long entre deux composants

```cypher
MATCH p=allShortestPaths((piston:Composant {identifiant: "Piston"})-[*]-(culasse:Sous_systeme {identifiant: "Culasse"}))
RETURN p, LENGTH(p) AS longueur
ORDER BY longueur DESC LIMIT 1;
```

```cypher
MATCH p = allShortestPaths((piston:Composant {identifiant: "Piston"})-[*]-(culasse:Sous_systeme {identifiant: "Culasse"}))
RETURN p, LENGTH(p) as longueur
ORDER BY longueur DESC LIMIT 1
```


### 13. Lister toutes les pièces faisant partie de sous-systèmes spécifiques (comme le cylindre ou la culasse)

```cypher
MATCH (p:Composant)-[r]->(sous_systeme:Sous_systeme)
WHERE sous_systeme.identifiant IN ["Cylindre", "Culasse"]
RETURN p.identifiant, sous_systeme.identifiant, TYPE(r) AS relation;
```

### 14. Assurez que la bougie d'allumage est placée dans le cylindre sans créer de doublons

```cypher
MERGE (bougie_allumage:Composant {identifiant: "Bougie d'allumage"})
MERGE (cylindre:Sous_systeme {identifiant: "Cylindre"})
MERGE (bougie_allumage)-[:PLACÉE_DANS]->(cylindre)
RETURN bougie_allumage, cylindre;
```

### 15. Assurez que l'injecteur alimente en carburant le cylindre sans créer de doublons

```cypher
MERGE (injecteur:Composant {identifiant: "Injecteur"})
MERGE (cylindre:Sous_systeme {identifiant: "Cylindre"})
MERGE (injecteur)-[:ALIMENTE_EN_CARBURANT]->(cylindre)
RETURN injecteur, cylindre;
```
