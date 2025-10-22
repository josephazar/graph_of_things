# TP 3 : Modélisation et Analyse d'un Système de Production Automatisé

## 🏭 Histoire : CNC Manufacturing Solutions

**CNC Manufacturing Solutions** est une entreprise spécialisée dans la production de pièces mécaniques de haute précision pour l'industrie aéronautique. L'entreprise possède plusieurs machines CNC (Computer Numerical Control), chaque machine étant capable de produire différentes pièces. Ces machines dépendent d'un réseau complexe de **fournisseurs** pour les matériaux bruts, les outils de coupe, et les contrats de maintenance.

### 🚨 Le Défi

Suite à une panne majeure d'une de leurs machines CNC principales, l'entreprise doit :
1. Identifier rapidement **quelles commandes clients sont affectées**
2. Trouver des **machines alternatives** capables de produire les mêmes pièces
3. Calculer le **chemin le plus court** pour obtenir les matériaux nécessaires
4. Évaluer l'**impact en cascade** si un fournisseur critique fait défaillance
5. Identifier les **goulots d'étranglement** dans le processus de production

Vous allez modéliser ce système en utilisant des **patterns avancés** et des **algorithmes de graphes** pour aider l'entreprise à prendre des décisions rapides et éclairées.

---

## 📋 Description du Système

### Machines CNC

L'usine possède 5 machines CNC :

1. **CNC Mill Alpha-5000**
   - Type : Fraiseuse 5 axes
   - Acheté le : 2020-01-15
   - Capacités : Aluminium, Acier, Titane
   - Statut : **En panne** (depuis 2025-01-10)

2. **CNC Lathe Beta-3000**
   - Type : Tour CNC
   - Acheté le : 2019-05-20
   - Capacités : Acier, Laiton
   - Statut : Opérationnel

3. **CNC Mill Gamma-4000**
   - Type : Fraiseuse 3 axes
   - Acheté le : 2021-03-10
   - Capacités : Aluminium, Plastique
   - Statut : Opérationnel

4. **CNC Router Delta-2000**
   - Type : Défonceuse CNC
   - Acheté le : 2022-08-01
   - Capacités : Plastique, Bois
   - Statut : Opérationnel

5. **CNC Plasma Epsilon-1000**
   - Type : Découpe plasma
   - Acheté le : 2021-11-15
   - Capacités : Acier, Inox
   - Statut : Opérationnel

### Pièces Produites

Les machines produisent différentes pièces pour des assemblages complexes :

1. **Carter de Turbine** (Turbine Housing)
   - Matériau : Aluminium 7075
   - Produit par : CNC Mill Alpha-5000, CNC Mill Gamma-4000
   - Temps d'usinage : 4 heures
   - Contient : 2x Support de Roulement, 4x Insert Fileté

2. **Arbre de Transmission** (Drive Shaft)
   - Matériau : Acier 4340
   - Produit par : CNC Lathe Beta-3000
   - Temps d'usinage : 3 heures
   - Contient : 2x Joint Torique

3. **Support de Roulement** (Bearing Mount)
   - Matériau : Aluminium 6061
   - Produit par : CNC Mill Alpha-5000, CNC Mill Gamma-4000
   - Temps d'usinage : 2 heures

4. **Bride de Connexion** (Connection Flange)
   - Matériau : Acier Inox 316
   - Produit par : CNC Plasma Epsilon-1000
   - Temps d'usinage : 1.5 heures
   - Contient : 8x Trou pour Boulon

5. **Insert Fileté** (Threaded Insert)
   - Matériau : Laiton
   - Produit par : CNC Lathe Beta-3000
   - Temps d'usinage : 0.5 heures

6. **Joint Torique** (O-Ring Seal)
   - Matériau : Plastique NBR
   - Produit par : CNC Router Delta-2000
   - Temps d'usinage : 0.3 heures

### Fournisseurs et Relations

Le système repose sur une chaîne d'approvisionnement à plusieurs niveaux :

**Fournisseurs Tier 3 (Matières premières)**
- **AluminumCorp GmbH** (Allemagne)
  - Fournit : Aluminium 7075 (quantité : 1000 kg, délai : 7 jours, coût : 15€/kg)
  - Fournit : Aluminium 6061 (quantité : 1500 kg, délai : 7 jours, coût : 12€/kg)

- **SteelWorld Industries** (France)
  - Fournit : Acier 4340 (quantité : 2000 kg, délai : 5 jours, coût : 8€/kg)
  - Fournit : Acier Inox 316 (quantité : 1000 kg, délai : 6 jours, coût : 18€/kg)

**Fournisseurs Tier 2 (Outils et consommables)**
- **ToolMasters SA** (France)
  - Fournit : Outils de coupe pour CNC Mill Alpha-5000
  - Fournit : Outils de coupe pour CNC Mill Gamma-4000
  - **MAINTIENT** CNC Mill Alpha-5000 (contrat valide du 2024-01-01 au 2025-12-31, temps de réponse : 4 heures, coût : 25000€)

- **PrecisionTools Ltd** (UK)
  - Fournit : Outils de tournage pour CNC Lathe Beta-3000
  - **MAINTIENT** CNC Lathe Beta-3000 (contrat valide du 2025-01-01 au 2025-12-31, temps de réponse : 8 heures, coût : 18000€)

- **IndustrialSupplies Co** (Belgique)
  - Fournit : Outils pour CNC Router Delta-2000
  - Fournit : Outils pour CNC Plasma Epsilon-1000
  - **MAINTIENT** CNC Plasma Epsilon-1000 (contrat valide du 2024-06-01 au 2025-06-01, temps de réponse : 6 heures, coût : 15000€)

**Fournisseurs Tier 1 (Assemblage)**
- **AssemblyPro International** (France)
  - Assemble les pièces finales pour les clients
  - Reçoit les pièces de CNC Manufacturing Solutions
  - Délai d'assemblage : 2 jours

### Commandes Clients

Actuellement, trois commandes urgentes sont en cours :

1. **Commande #A001** - AeroSpace Industries
   - Produit final : Turbine complète
   - Nécessite : 5x Carter de Turbine, 2x Arbre de Transmission
   - Date limite : 2025-02-15
   - Priorité : HAUTE

2. **Commande #A002** - Aviation Components Inc
   - Produit final : Module de connexion
   - Nécessite : 10x Bride de Connexion, 8x Support de Roulement
   - Date limite : 2025-02-20
   - Priorité : MOYENNE

3. **Commande #A003** - Defense Contractor Ltd
   - Produit final : Assemblage d'arbre
   - Nécessite : 15x Arbre de Transmission, 30x Joint Torique
   - Date limite : 2025-02-10
   - Priorité : CRITIQUE

### Personnel Technique

- **Marie Dubois** - Ingénieure en chef
  - Spécialité : Systèmes CNC
  - Supervise : Jean Martin, Sophie Bernard
  - Responsable de : CNC Mill Alpha-5000, CNC Mill Gamma-4000

- **Jean Martin** - Technicien CNC
  - Spécialité : Programmation CNC
  - Collabore avec : Sophie Bernard

- **Sophie Bernard** - Opératrice CNC
  - Spécialité : Usinage de précision
  - Collabore avec : Jean Martin

- **Thomas Leroy** - Responsable maintenance
  - Spécialité : Maintenance préventive
  - Supervise : Lucas Petit

- **Lucas Petit** - Technicien maintenance
  - Spécialité : Réparation hydraulique
  - Rapporte à : Thomas Leroy

---

## 🎯 Votre Mission

Vous devez modéliser ce système complexe en utilisant :

### **Patterns Avancés **
1. **Relations multiples** : Les fournisseurs peuvent FOURNIR des matériaux ET MAINTENIR des machines
2. **Propriétés sur les relations** : Quantités, coûts, délais, durées de contrat
3. **Relations temporelles** : Contrats de maintenance avec dates de début/fin
4. **Auto-références** : Hiérarchie du personnel (managers et subordonnés)
5. **Bill of Materials (BOM)** : Les pièces contiennent d'autres pièces avec quantités

### **Algorithmes de Graphes **
1. **Shortest Path** : Trouver le chemin d'approvisionnement le plus rapide
2. **Impact Analysis** : Évaluer l'effet de la panne de CNC Mill Alpha-5000
3. **Centrality** : Identifier les machines et fournisseurs critiques
4. **Community Detection** : Trouver les groupes de personnel qui travaillent ensemble

---

## 📝 Questions

### **Partie 1 : Construction du Modèle (Patterns Avancés)**

#### Q1. Créer toutes les machines CNC avec leurs propriétés
*Indices : nom, type, dateAchat, statut, capacités (matériaux)*

#### Q2. Créer toutes les pièces avec leurs propriétés
*Indices : nom, matériau, tempsUsinage*

#### Q3. Créer les relations PEUT_PRODUIRE entre machines et pièces
*Plusieurs machines peuvent produire la même pièce*

#### Q4. Créer les relations CONTIENT pour le Bill of Materials (BOM)
*Exemple : Carter de Turbine CONTIENT {quantity: 2} Support de Roulement*

#### Q5. Créer tous les fournisseurs (Tier 1, 2, 3) avec leurs propriétés
*Indices : nom, tier, localisation*

#### Q6. Créer les relations FOURNIT avec propriétés (quantité, délai, coût)
*Utiliser des propriétés riches sur les relations*

#### Q7. Créer les relations MAINTIENT avec dates de contrat
*Les fournisseurs Tier 2 maintiennent les machines avec des contrats temporels*

#### Q8. Créer le personnel avec la hiérarchie (auto-références)
*Utiliser SUPERVISE et COLLABORE relations*

#### Q9. Créer les commandes clients avec les relations NECESSITE
*Lier les commandes aux pièces requises avec quantités*

---

### **Partie 2 : Requêtes de Base**

#### Q10. Lister toutes les machines opérationnelles
*Filtrer par statut*

#### Q11. Trouver toutes les pièces que CNC Mill Alpha-5000 peut produire
*Utiliser la relation PEUT_PRODUIRE*

#### Q12. Trouver des machines alternatives pour produire le Carter de Turbine
*Important puisque CNC Mill Alpha-5000 est en panne!*

#### Q13. Calculer le nombre total de sous-pièces dans un Carter de Turbine
*Utiliser le BOM avec reduce() pour multiplier les quantités*

#### Q14. Lister tous les fournisseurs qui à la fois FOURNISSENT et MAINTIENNENT
*Relations multiples - pattern critique!*

#### Q15. Trouver tous les contrats de maintenance actifs aujourd'hui
*Utiliser validFrom <= date() AND validTo >= date()*

---

### **Partie 3 : Analyse d'Impact (Algorithmes)**

#### Q16. 🚨 CRITIQUE : Quelles commandes sont affectées par la panne de CNC Mill Alpha-5000?
*Suivre la chaîne : Machine → Pièces → Commandes*

#### Q17. Calculer l'impact en cascade si SteelWorld Industries fait faillite
*Trouver tout ce qui dépend de ce fournisseur (downstream analysis)*

#### Q18. Trouver toutes les dépendances en amont pour produire un Carter de Turbine
*Upstream analysis : Pièce → Matériaux → Fournisseurs*

#### Q19. Quantifier l'impact : Pour chaque fournisseur, compter combien d'entités sont affectées
*Utiliser OPTIONAL MATCH et COUNT(DISTINCT)*

---

### **Partie 4 : Chemins et Optimisation**

#### Q20. Trouver le chemin d'approvisionnement le plus RAPIDE pour obtenir de l'Aluminium 7075
*Depuis AluminumCorp GmbH jusqu'à CNC Mill Alpha-5000*
*Utiliser shortestPath() et reduce() avec la propriété délai*

#### Q21. Trouver le chemin d'approvisionnement le moins CHER
*Même chose mais optimiser par coût*

#### Q22. Trouver TOUS les chemins possibles (max 5 niveaux) du fournisseur Tier 3 au produit final
*Utiliser [:RELATION*1..5] pour obtenir plusieurs routes*

#### Q23. Comparer tous les chemins par coût ET délai
*Créer un tableau de comparaison*

#### Q24. Trouver des routes alternatives qui évitent ToolMasters SA
*Utiliser WHERE NONE() pour exclure un fournisseur*

---

### **Partie 5 : Analyse de Centralité (Nœuds Critiques)**

#### Q25. Trouver les machines avec le plus de connexions (degree centrality)
*Compter combien de pièces chaque machine peut produire*

#### Q26. Identifier les fournisseurs critiques (ceux avec le plus d'impact downstream)
*Trier par nombre d'entités affectées*

#### Q27. Trouver les goulots d'étranglement (bottlenecks)
*Trouver les nœuds par lesquels passent le plus de chemins*

#### Q28. Identifier les pièces les plus demandées
*Compter combien de commandes nécessitent chaque pièce*

---

### **Partie 6 : Analyse du Personnel (Community Detection)**

#### Q29. Trouver tous les subordonnés de Marie Dubois (direct + indirect)
*Utiliser [:SUPERVISE*] pour trouver toute la hiérarchie*

#### Q30. Trouver le supérieur hiérarchique à 2 niveaux au-dessus de Lucas Petit
*Utiliser [:SUPERVISE*2] en sens inverse*

#### Q31. Identifier les groupes de collaboration
*Qui collabore avec qui? Utiliser [:COLLABORE*1..2]*

#### Q32. Trouver les "ponts" entre départements
*Personnel qui relie différentes équipes*

---

### **Partie 7 : Scénarios de Crise**

#### Q33. 🚨 SIMULATION : Si CNC Mill Alpha-5000 reste en panne, peut-on honorer la Commande #A001?
*Vérifier si les machines alternatives ont la capacité*

#### Q34. Calculer le délai total pour livrer la Commande #A003
*Additionner : délai matériaux + temps usinage + délai assemblage*

#### Q35. Priorisation : Quelle commande peut être livrée le plus rapidement?
*Comparer les trois commandes*

#### Q36. Plan de mitigation : Proposer un plan alternatif si ToolMasters SA devient indisponible
*Trouver quelles machines sont affectées et solutions*

---

### **Partie 8 : Requêtes Avancées Combinées**

#### Q37. Coût total de production pour la Commande #A001
*Calculer : (quantités × coût matériaux) + coût outils + coût maintenance*

#### Q38. Trouver le chemin complet de la matière première au client final
*Fournisseur Tier 3 → Matériau → Machine → Pièce → Assembleur → Client*

#### Q39. Analyse de fiabilité : Identifier tous les single points of failure
*Nœuds où il n'existe qu'un seul chemin*

#### Q40. Optimisation : Proposer un plan de production optimal pour minimiser le délai total
*Considérer les machines disponibles et les chemins d'approvisionnement*

---

## 🎓 Concepts Clés à Maîtriser

### De la Session 3 (Advanced Modeling Patterns) :
- ✅ Relations multiples entre deux nœuds (FOURNIT + MAINTIENT)
- ✅ Propriétés riches sur les relations (quantité, coût, délai)
- ✅ Relations temporelles (validFrom, validTo)
- ✅ Auto-références (hiérarchie du personnel)
- ✅ Bill of Materials avec quantités
- ✅ Utilisation de reduce() pour calculs

### De la Session 4 (Graph Algorithms) :
- ✅ shortestPath() pour optimisation
- ✅ Impact analysis (downstream et upstream)
- ✅ OPTIONAL MATCH pour analyses inclusives
- ✅ Degree centrality (compter connexions)
- ✅ Bottleneck detection
- ✅ Community detection (groupes)
- ✅ Traversal avec profondeur variable (*)

---

## 💡 Conseils pour Réussir

1. **Commencez simple** : Créez d'abord quelques nœuds de chaque type pour tester
2. **Utilisez CREATE pour tout créer en un seul bloc** : Plus efficace et garde les variables disponibles
3. **Testez vos relations** : Utilisez MATCH simple pour vérifier que les connexions sont correctes
4. **Visualisez** : Neo4j Browser affiche le graphe visuellement - utilisez-le!
5. **reduce() est votre ami** : Pour multiplier quantités, additionner coûts/délais
6. **OPTIONAL MATCH** : Essentiel quand certains nœuds peuvent ne pas avoir le pattern
7. **WHERE NONE()** : Très utile pour exclure certains nœuds des chemins
8. **Pensez business** : Chaque requête résout un problème réel d'ingénierie!

---

## 🏆 Challenge Final

**Mission Impossible** : L'équipe de direction vous demande un rapport complet :

1. **État actuel** : Quelles commandes sont en danger?
2. **Analyse de risque** : Quels sont nos 3 fournisseurs les plus critiques?
3. **Plan B** : Comment réorganiser la production avec CNC Mill Alpha-5000 en panne?
4. **Optimisation** : Quel est le plan le plus rapide ET le moins cher pour la Commande #A001?
5. **Recommandations** : Quelles machines devrions-nous acheter pour réduire les single points of failure?

Utilisez TOUS les patterns et algorithmes appris pour créer ce rapport!

---

## 📚 Référence Rapide Cypher

```cypher
// Patterns avancés
(a)-[:TYPE1]->(b), (a)-[:TYPE2]->(b)              // Relations multiples
(a)-[:REL {prop: value}]->(b)                     // Propriétés sur relation
WHERE r.validFrom <= date() AND r.validTo >= date()  // Temporel
(manager:Employee)-[:SUPERVISE]->(employee:Employee) // Auto-référence

// Algorithmes
shortestPath((a)-[:REL*]->(b))                    // Plus court chemin
(n)-[:REL*]->(affected)                           // Impact downstream
(n)<-[:REL*]-(dependency)                         // Dépendances upstream
OPTIONAL MATCH (n)-[:REL]->(x)                    // Peut ne pas exister
COUNT(DISTINCT x)                                 // Centralité
reduce(total = 0, rel IN rels | total + rel.prop) // Accumulateur

// Utilitaires
WHERE NONE(node IN nodes(path) WHERE ...)         // Exclure nœuds
COLLECT(DISTINCT x)                               // Grouper résultats
SIZE(collection)                                  // Taille collection
```

---

**Bonne chance! Vous avez tous les outils pour devenir des experts en modélisation et analyse de graphes! 🚀**

---

## 📖 Story in English

# TP 3: Modeling and Analysis of an Automated Production System

## 🏭 Story: CNC Manufacturing Solutions

**CNC Manufacturing Solutions** is a company specializing in the production of high-precision mechanical parts for the aerospace industry. The company owns several CNC (Computer Numerical Control) machines, each capable of producing different parts. These machines depend on a complex network of **suppliers** for raw materials, cutting tools, and maintenance contracts.

### 🚨 The Challenge

Following a major breakdown of one of their main CNC machines, the company must:
1. Quickly identify **which customer orders are affected**
2. Find **alternative machines** capable of producing the same parts
3. Calculate the **shortest path** to obtain necessary materials
4. Assess the **cascading impact** if a critical supplier fails
5. Identify **bottlenecks** in the production process

You will model this system using **advanced patterns** and **graph algorithms** to help the company make quick and informed decisions.

---

*[The rest follows the same structure with 40 questions covering advanced modeling patterns and graph algorithms applied to a realistic mechanical engineering scenario]*
