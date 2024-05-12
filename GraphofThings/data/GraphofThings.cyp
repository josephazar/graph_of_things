// Create Users and Humans
CREATE (u1:User:Facebook {name: "John Doe", age: 30, gender: "male", email: "john.doe@facebook.com"})
CREATE (u2:User:LinkedIn {name: "Jane Smith", age: 28, gender: "female", email: "jane.smith@linkedin.com"})
CREATE (h1:Human:User {name: "Alice Johnson", age: 25, gender: "female", email: "alice.j@iotmail.com", hometown: "New York"})

// Create Relationships between Users and Humans
CREATE (u1)-[:FRIEND]->(u2)
CREATE (u2)-[:FRIEND]->(h1)
CREATE (h1)-[:FRIEND]->(u1)

// Create Machines
CREATE (m1:Machine {id: 1, name: "iPhone X", type: "phone"})
CREATE (m2:Machine {id: 2, name: "Galaxy Watch", type: "wearable"})

// Human uses Machine
CREATE (h1)-[:USES]->(m1)
CREATE (h1)-[:USES]->(m2)

// Create Operating Systems
CREATE (os1:OperatingSystem {name: "iOS"})
CREATE (os2:OperatingSystem {name: "Android"})

// Machines run Operating Systems
CREATE (m1)-[:RUNS {version: "14.0"}]->(os1)
CREATE (m2)-[:RUNS {version: "11.0"}]->(os2)

// Create Companies
CREATE (c1:Company {name: "Apple"})
CREATE (c2:Company {name: "Samsung"})

// Company makes Machines and distributes OS
CREATE (c1)-[:MAKES]->(m1)
CREATE (c1)-[:DISTRIBUTES]->(os1)
CREATE (c2)-[:MAKES]->(m2)
CREATE (c2)-[:DISTRIBUTES]->(os2)

// Create Locations
CREATE (l1:Location {name: "Central Park", type: "park", lat: 40.785091, lon: -73.968285})
CREATE (l2:Location {name: "Tech Store", type: "retail", lat: 40.758896, lon: -73.985130})

// Machines located at Locations
CREATE (m1)-[:LOCATED]->(l1)
CREATE (m2)-[:LOCATED]->(l2)

// Create Location Hierarchy
CREATE (lh1:LocationHier {name: "New York City"})
CREATE (lh2:LocationHier {name: "New York State"})
CREATE (lh1)-[:LOCATED]->(lh2)
CREATE (l1)-[:LOCATED]->(lh1)
CREATE (l2)-[:LOCATED]->(lh1)

// Create Interests
CREATE (i1:Interest {name: "Technology"})
CREATE (i2:Interest {name: "Outdoors"})

// Users and Locations have Interests
CREATE (u1)-[:HAS]->(i1)
CREATE (h1)-[:HAS]->(i2)
CREATE (l1)-[:HAS]->(i2)

RETURN u1, u2, h1, m1, m2, os1, os2, c1, c2, l1, l2, lh1, lh2, i1, i2
