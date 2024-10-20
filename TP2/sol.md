
# Solutions : TP 2 - Bâtiment intelligent

## Création des nœuds

```cypher
CREATE (etage1:Etage {identifiant: "1er étage"}),
       (etage2:Etage {identifiant: "2e étage"}),
       (etage3:Etage {identifiant: "3e étage"}),

       (hall:Piece {nom: "Hall d'entrée", etage: "1er étage"}),
       (bureau101:Piece {nom: "Bureau 101", etage: "1er étage"}),
       (bureau102:Piece {nom: "Bureau 102", etage: "1er étage"}),
       (bureau103:Piece {nom: "Bureau 103", etage: "1er étage"}),
       (salle_reunion:Piece {nom: "Salle Réunion 202", etage: "2e étage"}),
       (bureau201:Piece {nom: "Bureau 201", etage: "2e étage"}),
       (bureau202:Piece {nom: "Bureau 202", etage: "2e étage"}),
       (couloir:Piece {nom: "Couloir", etage: "2e étage"}),
       (laboratoire301:Piece {nom: "Laboratoire 301", etage: "3e étage"}),
       (espace_commun:Piece {nom: "Espace Commun", etage: "3e étage"}),
       (bureau302:Piece {nom: "Bureau 302", etage: "3e étage"}),

       (capteur_temperature_101:Capteur {nom: "Capteur Température Bureau 101", fabricant: "SmartTech", fonction: "Température", categorie: "Environnement"}),
       (camera_securite_hall:Capteur {nom: "Caméra Sécurité Hall Entrée", fabricant: "SensorPro", fonction: "Caméra", categorie: "Sécurité"}),
       (detecteur_mouvement_salle:Capteur {nom: "Détecteur de Mouvement Salle Réunion 202", fabricant: "SensorPro", fonction: "Mouvement", categorie: "Mouvement"}),
       (lumiere_intelligente_102:Capteur {nom: "Lumière Intelligente Bureau 102", fabricant: "LumiPro", fonction: "Éclairage intelligent", categorie: "Lumière"}),
       (capteur_humidite_301:Capteur {nom: "Capteur Humidité Laboratoire 301", fabricant: "EnviroSense", fonction: "Humidité", categorie: "Environnement"}),
       (camera_securite_espace_commun:Capteur {nom: "Caméra Sécurité Espace Commun 3e Étage", fabricant: "SensorPro", fonction: "Caméra", categorie: "Sécurité"});
```

## Création des relations

```cypher
MATCH (bureau101:Piece {nom: "Bureau 101"}),
      (bureau102:Piece {nom: "Bureau 102"}),
      (bureau103:Piece {nom: "Bureau 103"}),
      (hall:Piece {nom: "Hall d'entrée"}),
      (salle_reunion:Piece {nom: "Salle Réunion 202"}),
      (bureau201:Piece {nom: "Bureau 201"}),
      (bureau202:Piece {nom: "Bureau 202"}),
      (couloir:Piece {nom: "Couloir"}),
      (laboratoire301:Piece {nom: "Laboratoire 301"}),
      (espace_commun:Piece {nom: "Espace Commun"}),
      (bureau302:Piece {nom: "Bureau 302"}),
      (etage1:Etage {identifiant: "1er étage"}),
      (etage2:Etage {identifiant: "2e étage"}),
      (etage3:Etage {identifiant: "3e étage"})
CREATE (bureau101)-[:SITUE_A]->(etage1),
       (bureau102)-[:SITUE_A]->(etage1),
       (bureau103)-[:SITUE_A]->(etage1),
       (hall)-[:SITUE_A]->(etage1),
       (salle_reunion)-[:SITUE_A]->(etage2),
       (bureau201)-[:SITUE_A]->(etage2),
       (bureau202)-[:SITUE_A]->(etage2),
       (couloir)-[:SITUE_A]->(etage2),
       (laboratoire301)-[:SITUE_A]->(etage3),
       (espace_commun)-[:SITUE_A]->(etage3),
       (bureau302)-[:SITUE_A]->(etage3);
```

```cypher
MATCH (capteur_temperature_101:Capteur {nom: "Capteur Température Bureau 101"}),
      (camera_securite_hall:Capteur {nom: "Caméra Sécurité Hall Entrée"}),
      (detecteur_mouvement_salle:Capteur {nom: "Détecteur de Mouvement Salle Réunion 202"}),
      (lumiere_intelligente_102:Capteur {nom: "Lumière Intelligente Bureau 102"}),
      (capteur_humidite_301:Capteur {nom: "Capteur Humidité Laboratoire 301"}),
      (camera_securite_espace_commun:Capteur {nom: "Caméra Sécurité Espace Commun 3e Étage"}),
      (bureau101:Piece {nom: "Bureau 101"}),
      (hall:Piece {nom: "Hall d'entrée"}),
      (salle_reunion:Piece {nom: "Salle Réunion 202"}),
      (bureau102:Piece {nom: "Bureau 102"}),
      (laboratoire301:Piece {nom: "Laboratoire 301"}),
      (espace_commun:Piece {nom: "Espace Commun"})
CREATE (capteur_temperature_101)-[:INSTALLE_DANS]->(bureau101),
       (camera_securite_hall)-[:INSTALLE_DANS]->(hall),
       (detecteur_mouvement_salle)-[:INSTALLE_DANS]->(salle_reunion),
       (lumiere_intelligente_102)-[:INSTALLE_DANS]->(bureau102),
       (capteur_humidite_301)-[:INSTALLE_DANS]->(laboratoire301),
       (camera_securite_espace_commun)-[:INSTALLE_DANS]->(espace_commun);
```

```cypher
MATCH (detecteur_mouvement_salle:Capteur {nom: "Détecteur de Mouvement Salle Réunion 202"}),
      (camera_securite_hall:Capteur {nom: "Caméra Sécurité Hall Entrée"}),
      (camera_securite_espace_commun:Capteur {nom: "Caméra Sécurité Espace Commun 3e Étage"}),
      (lumiere_intelligente_102:Capteur {nom: "Lumière Intelligente Bureau 102"})
CREATE (detecteur_mouvement_salle)-[:LIE_A]->(camera_securite_hall),
       (camera_securite_espace_commun)-[:LIE_A]->(lumiere_intelligente_102);
```
