# Solutions: TP 2 - Smart Building

## Node Creation

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

## Relationship Creation

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

## Answers to Questions:

### 1. List all sensors in the building, sorted by category.

```cypher
MATCH (c:Capteur)
RETURN c.categorie, c.nom
ORDER BY c.categorie;
```

*Explanation: This query matches all nodes with the label `Capteur` (Sensor), returns their category and name properties, and orders the results alphabetically by category. This is a simple pattern matching query that retrieves all sensors and organizes them by their categorical classification.*

### 2. Find all relationships between sensors and rooms.

```cypher
MATCH (c:Capteur)-[r:INSTALLE_DANS]->(p:Piece)
RETURN c.nom, TYPE(r), p.nom;
```

```cypher
MATCH (c:Capteur)-[r:INSTALLE_DANS]->(p:Piece)
RETURN c, r, p;
```

*Explanation: This query matches a pattern where sensors (Capteur) are connected to rooms (Piece) through the `INSTALLE_DANS` (installed in) relationship. The first version returns the sensor name, relationship type, and room name as text. The second version returns the complete nodes and relationship, which can be visualized graphically in Neo4j Browser.*

### 3. Identify temperature sensors installed in the building.

```cypher
MATCH (c:Capteur {fonction: "Température"})
RETURN c.nom, c.fonction;
```

*Explanation: This query uses property matching to find all sensor nodes where the `fonction` (function) property equals "Température" (Temperature). It returns the name and function of these sensors. This demonstrates filtering nodes based on specific property values.*

### 4. Find all security devices in the building (category: security) and the rooms where they are installed.

```cypher
MATCH (c:Capteur {categorie: "Sécurité"})-[:INSTALLE_DANS]->(p:Piece)
RETURN c.nom, p.nom;
```

*Explanation: This query combines property filtering with relationship traversal. It matches sensors with category "Sécurité" (Security) and follows the `INSTALLE_DANS` relationship to find the rooms where they are installed. This is useful for security audits or inventory management of security equipment.*

### 5. Count the number of devices by function (temperature, camera, light, etc.).

```cypher
MATCH (c:Capteur)
RETURN c.fonction, COUNT(c) AS nombre;
```

*Explanation: This query uses the aggregation function `COUNT()` to count sensors grouped by their function. The `AS nombre` clause creates an alias for the count result. This query demonstrates how to perform basic statistical analysis on graph data to understand device distribution by type.*

### 6. List all devices connected to the 2nd floor.

```cypher
MATCH (c:Capteur)-[:INSTALLE_DANS]->(p:Piece)-[:SITUE_A]->(e:Etage {identifiant: "2e étage"})
RETURN c.nom, p.nom;
```

```cypher
MATCH (c:Capteur)-[:INSTALLE_DANS]->(p:Piece)-[:SITUE_A]->(e:Etage {identifiant: "2e étage"})
RETURN c, p;
```

*Explanation: This query demonstrates multi-hop pattern matching. It traverses two relationships: first from sensors to rooms (`INSTALLE_DANS`), then from rooms to floors (`SITUE_A`), filtering for the 2nd floor specifically. This shows how graph databases efficiently handle hierarchical queries across multiple levels.*

### 7. Find all devices from the same manufacturer (for example, "SmartTech") installed in the building.

```cypher
MATCH (c:Capteur {fabricant: "SmartTech"})
RETURN c.nom, c.fonction;
```

*Explanation: This query filters sensors by the `fabricant` (manufacturer) property. It's useful for inventory management, warranty tracking, or identifying all devices from a specific vendor. You can replace "SmartTech" with any manufacturer name to find their devices.*

### 8. List all temperature sensors and the floors where they are installed.

```cypher
MATCH (temp:Capteur {fonction: "Température"})-[:INSTALLE_DANS]->(p:Piece)-[:SITUE_A]->(etage:Etage)
RETURN temp.nom, etage.identifiant;
```

*Explanation: This query combines property filtering (temperature sensors) with multi-hop traversal (through rooms to floors). It demonstrates how to find specific device types and their locations at different hierarchical levels. The variable names (`temp`, `etage`) make the query more readable.*

### 9. Find the room that contains the most connected devices.

```cypher
MATCH (p:Piece)<-[:INSTALLE_DANS]-(c:Capteur)
RETURN p.nom, COUNT(c) AS nombre_appareils
ORDER BY nombre_appareils DESC
LIMIT 1;
```

*Explanation: This query counts sensors per room, sorts the results in descending order by count, and limits the output to the top result using `LIMIT 1`. Note the reversed arrow `<-` which matches sensors pointing to rooms. This query is useful for identifying rooms with the highest device density, which might need additional network capacity or power.*

### 10. Identify rooms that contain both a motion sensor and a security camera.

```cypher
MATCH (p:Piece)<-[:INSTALLE_DANS]-(capteur_mouvement:Capteur {fonction: "Mouvement"}),
      (p)<-[:INSTALLE_DANS]-(camera:Capteur {fonction: "Caméra"})
RETURN p.nom, capteur_mouvement.nom, camera.nom;
```

*Explanation: This query uses multiple patterns with a common variable `p` (the room) to find rooms that match both conditions simultaneously. The comma separates the two pattern clauses, and both must be satisfied for a result to be returned. This demonstrates how to find nodes that satisfy multiple relationship criteria, useful for security compliance checks or finding redundantly monitored areas.*
