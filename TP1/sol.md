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