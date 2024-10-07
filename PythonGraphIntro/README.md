
# Guide GitHub pour l'utilisation de `NetworkX` et `igraph` en Python

Ce guide est conçu pour des débutants en programmation. Nous allons vous montrer comment modéliser des relations et des systèmes mécaniques en utilisant deux bibliothèques de graphes : **NetworkX** et **igraph**. Vous allez travailler dans **Google Colab** et apprendre à visualiser des graphes et à faire des requêtes simples.

### Prérequis
Assurez-vous d’avoir un compte Google pour utiliser **Google Colab**. Les commandes d’installation des bibliothèques sont fournies pour vous aider à démarrer.

---

## Partie 1 : Installer les bibliothèques requises

Avant de commencer à écrire du code, vous devez installer les bibliothèques nécessaires dans Colab.

1. Ouvrez **Google Colab** et créez un nouveau fichier de notebook.
2. Exécutez les commandes suivantes pour installer les bibliothèques :

```bash
%pip install networkx matplotlib igraph cairocffi
```

---

## Partie 2 : Modélisation des relations entre Jeremy et Mark avec `NetworkX`

Nous allons commencer avec un exemple simple de relation entre deux personnes : Jeremy et Mark. Nous allons représenter les **nœuds** comme des personnes et les **arêtes** comme les relations entre elles.

### Étape 1 : Créer et visualiser un graphe avec `NetworkX`

```python
import networkx as nx
import matplotlib.pyplot as plt

# Créer un graphe vide
G = nx.Graph()

# Ajouter des nœuds pour Jeremy et Mark
G.add_node("Jeremy", age=30, ville="Paris")
G.add_node("Mark", age=25, ville="Londres")

# Ajouter une arête (relation) entre Jeremy et Mark
G.add_edge("Jeremy", "Mark", relation="amis")

# Visualiser le graphe
pos = nx.spring_layout(G)  # Positionner les nœuds
nx.draw(G, pos, with_labels=True, node_size=2000, node_color="lightblue", font_size=10, font_weight="bold")

# Ajouter des étiquettes pour les relations (arêtes)
edge_labels = nx.get_edge_attributes(G, 'relation')
nx.draw_networkx_edge_labels(G, pos, edge_labels=edge_labels)

# Afficher le graphe
plt.show()
```

### Explication
- Nous créons deux nœuds : **Jeremy** et **Mark**, et ajoutons des attributs comme l'âge et la ville.
- L'arête entre **Jeremy** et **Mark** représente leur relation d'amitié.

---

## Partie 3 : Modélisation d'un système mécanique simple avec `NetworkX`

Passons maintenant à la modélisation d'un **système mécanique**. Nous allons représenter des composants mécaniques tels que **l'engrenage**, **l'arbre** et **le roulement**.

### Étape 1 : Créer et visualiser un graphe pour le système mécanique

```python
# Créer un graphe vide
M = nx.Graph()

# Ajouter des nœuds (composants mécaniques)
M.add_node("Engrenage", type="composant", fonction="transmission")
M.add_node("Arbre", type="composant", fonction="support")
M.add_node("Roulement", type="composant", fonction="réduction friction")

# Ajouter des arêtes (relations entre composants)
M.add_edge("Engrenage", "Arbre", connection="attaché")
M.add_edge("Arbre", "Roulement", connection="supporté par")

# Visualiser le graphe
pos = nx.spring_layout(M)
nx.draw(M, pos, with_labels=True, node_size=2000, node_color="lightgreen", font_size=10, font_weight="bold")
edge_labels = nx.get_edge_attributes(M, 'connection')
nx.draw_networkx_edge_labels(M, pos, edge_labels=edge_labels)

# Afficher le graphe
plt.show()
```

### Explication
- Nous ajoutons les composants **Engrenage**, **Arbre**, et **Roulement** comme nœuds.
- Les relations entre ces composants, comme "attaché" et "supporté par", sont modélisées sous forme d'arêtes.

---

## Partie 4 : Utilisation de `igraph` pour des requêtes plus complexes

Parfois, nous avons besoin de faire des requêtes plus avancées. Pour cela, nous pouvons utiliser la bibliothèque **igraph**. 

### Étape 1 : Créer le graphe avec `igraph`

```python
import igraph as ig

# Créer une liste des nœuds
noeuds = ["Jeremy", "Mark", "Engrenage", "Arbre", "Roulement"]

# Créer une liste des arêtes (relations)
aretes = [("Jeremy", "Mark"), ("Engrenage", "Arbre"), ("Arbre", "Roulement")]

# Créer le graphe
g = ig.Graph()
g.add_vertices(noeuds)
g.add_edges(aretes)

# Ajouter des attributs aux nœuds
g.vs["type"] = ["personne", "personne", "composant", "composant", "composant"]
g.vs["fonction"] = [None, None, "transmission", "support", "réduction friction"]

# Visualiser le graphe
layout = g.layout("fr")
ig.plot(g, layout=layout, vertex_label=g.vs["name"], vertex_color="lightblue", edge_color="black")
```

### Étape 2 : Effectuer des requêtes sur le graphe

```python
# Requête : Trouver tous les composants mécaniques dans le graphe
composants = g.vs.select(type_eq="composant")
print("Composants mécaniques :", [v["name"] for v in composants])
```

### Explication
- Nous utilisons **igraph** pour créer un graphe et effectuer des requêtes plus complexes, comme la sélection de tous les composants mécaniques.

---

## Conclusion

Dans ce guide, vous avez appris à :
1. Créer et visualiser des graphes simples avec **NetworkX**.
2. Modéliser des relations humaines et des systèmes mécaniques.
3. Utiliser **igraph** pour des requêtes avancées et la visualisation de graphes.

Ce guide vous offre une base pour comprendre comment modéliser des relations complexes et des systèmes avec des graphes dans Python.
