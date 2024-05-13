# IoT Data Modelling using Neo4j Graph Database



Here, we have ten(10) types of **nodes**. They are:

| Node | Description | Values | Properties |
| -----| ----------- | ------ | -----------|
| Thing | Thing is the actual IoT Device for which we are creating this data model | 11 Things configured. Thing01..Thing11 | {id,name,lat,lon} |
| Power | Power source for the Thing. | Battery and Solar | {id, name} |
| Thing Type | What type of Thing is it. | Soil Moisture, Water Quality, Light Control (NEMA 7-Pin) |{id, name} |
| Module | Any extra module attached to it? | GPS |{id, name} |
| Vendor | Vendor or Integrator for this Thing (ie in case of support and maintenance) | Vendor-1, Vendor-2 and Vendor-3 |{id, name} |
| Manufacturer | Who manufactured this Thing | Libellium, SenRa |{id, name} |
| Network | Which communication network this Thing is using | LoRaWAN, Sigfox, NB-IoT, GPRS |{id, name} |
| Sensor | A Thing can be composed of multiple sensors | Temperature, Heat, Infra Red |{id, name} |
| Application | These are the application which are using the Thing | Application-01, Dashboard-02, Mobile App-03, Mobile App-04, Application-05, Dashboard-06|{id, name} |
| Department | Departments of the organization which are using/interacting with the Thing through Applications | Information Technology, Field Services, Water Management |{id, name} |


Also we have ten(10) edges (ie. Relationships). They are:

| Edge | Description | Properties |
| -----| -----------| ------------|
|-[IS_POWERED_BY]-> (Power) | Represents how the Thing is powered by. Thing can be powered by Battery or Solar in our case | Battery: {lifestarts,lifefinish,installeddate}; If Solar then {dateinstalled,expectedinspectiondate} |
|[IS_USING]->|Which network the Thing is using. Relation can point to LoRaWAN, SigFox, NB-IoT or GPRS node|{appid,devid} if it is using LoRaWAN|
|[IS_COMPOSED_OF]->	| This Thing is composed of multiple sensors may be. For each sensor there will be a relationship. Like for example,  _(Thing)-[:IS_COMPOSED_OF]->(Heat Sensor)_ and _(Thing)-[:IS_COMPOSED_OF]->(Motion Sensor)_ And property for this relationship will hold the range for that sensor.|{low,high} ie the range|
|All other edges| | No properties defined |

## Steps to create Things Neo4j Database

1. The CSV files for **nodes** and **edges** are already created. You can just copy the Cypher queries and execute in order which will then create our IoT Graph Data Model in Neo4j Sandbox.
2. **Things**
```sh
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/josephazar/graph_of_things/main/Neo4jThings/things.csv" AS csvLine
CREATE (`csvLine.id`:Thing {id: csvLine.id, name: csvLine.name, lat: csvLine.lat, lon: csvLine.lon })
```
3. **Applications**
```sh
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/josephazar/graph_of_things/main/Neo4jThings/applications.csv" AS csvLine
CREATE (`csvLine.id`:Application{id: csvLine.id, name: csvLine.name})
```
4. **Manufacturers**
```sh
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/josephazar/graph_of_things/main/Neo4jThings/manufacturers.csv" AS csvLine
CREATE (`csvLine.id`:Manufacturer {id: csvLine.id, name: csvLine.name})
```
5. **Modules**
```sh
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/josephazar/graph_of_things/main/Neo4jThings/module.csv" AS csvLine
CREATE (`csvLine.id`:Module {id: csvLine.id, name: csvLine.name})
```
6. **Networks**
```sh
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/josephazar/graph_of_things/main/Neo4jThings/network.csv" AS csvLine
CREATE (`csvLine.id`:Network {id: csvLine.id, name: csvLine.name})
```
7. **Power Sources**
```sh
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/josephazar/graph_of_things/main/Neo4jThings/power.csv" AS csvLine
CREATE (`csvLine.id`:Power {id: csvLine.id, name: csvLine.name})
```
8. **Sensors**
```sh
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/josephazar/graph_of_things/main/Neo4jThings/sensors.csv" AS csvLine
CREATE (`csvLine.id`:Sensor {id: csvLine.id, name: csvLine.name})
```
9. **Thing Types**
```sh
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/josephazar/graph_of_things/main/Neo4jThings/thingtype.csv" AS csvLine
CREATE (`csvLine.id`:Thingtype {id: csvLine.id, name: csvLine.name})
```
10. **Vendors**
```sh
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/josephazar/graph_of_things/main/Neo4jThings/vendors.csv" AS csvLine
CREATE (`csvLine.id`:Vendor {id: csvLine.id, name: csvLine.name})
```
11. **Departments**
```sh
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/josephazar/graph_of_things/main/Neo4jThings/departments.csv" AS csvLine
CREATE (`csvLine.id`:Department {id: csvLine.id, name: csvLine.name})
```
12. **Create Edges**
```sh
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/josephazar/graph_of_things/main/Neo4jThings/relation.csv" AS rels
match (from {id:rels.thingId}), (to {id: rels.entityid})
CALL apoc.create.relationship(from, rels.relationshipname,apoc.convert.fromJsonMap(rels.prop), to) YIELD rel 
RETURN count(*)
```
13. **See how it looks**

Execute
```sh
MATCH (n) RETURN n
```
If all the steps are completed properly then the Graph should look like:
![IoT Graph DB](https://emergingtechs.net/wp-content/uploads/2019/05/everything-1.png)

