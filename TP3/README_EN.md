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

## 📋 System Description

### CNC Machines

The factory has 5 CNC machines:

1. **CNC Mill Alpha-5000**
   - Type: 5-axis milling machine
   - Purchase date: 2020-01-15
   - Capabilities: Aluminum, Steel, Titanium
   - Status: **Down** (since 2025-01-10)

2. **CNC Lathe Beta-3000**
   - Type: CNC lathe
   - Purchase date: 2019-05-20
   - Capabilities: Steel, Brass
   - Status: Operational

3. **CNC Mill Gamma-4000**
   - Type: 3-axis milling machine
   - Purchase date: 2021-03-10
   - Capabilities: Aluminum, Plastic
   - Status: Operational

4. **CNC Router Delta-2000**
   - Type: CNC router
   - Purchase date: 2022-08-01
   - Capabilities: Plastic, Wood
   - Status: Operational

5. **CNC Plasma Epsilon-1000**
   - Type: Plasma cutter
   - Purchase date: 2021-11-15
   - Capabilities: Steel, Stainless Steel
   - Status: Operational

### Parts Produced

The machines produce different parts for complex assemblies:

1. **Turbine Housing**
   - Material: Aluminum 7075
   - Produced by: CNC Mill Alpha-5000, CNC Mill Gamma-4000
   - Machining time: 4 hours
   - Contains: 2x Bearing Mount, 4x Threaded Insert

2. **Drive Shaft**
   - Material: Steel 4340
   - Produced by: CNC Lathe Beta-3000
   - Machining time: 3 hours
   - Contains: 2x O-Ring Seal

3. **Bearing Mount**
   - Material: Aluminum 6061
   - Produced by: CNC Mill Alpha-5000, CNC Mill Gamma-4000
   - Machining time: 2 hours

4. **Connection Flange**
   - Material: Stainless Steel 316
   - Produced by: CNC Plasma Epsilon-1000
   - Machining time: 1.5 hours
   - Contains: 8x Bolt Hole

5. **Threaded Insert**
   - Material: Brass
   - Produced by: CNC Lathe Beta-3000
   - Machining time: 0.5 hours

6. **O-Ring Seal**
   - Material: NBR Plastic
   - Produced by: CNC Router Delta-2000
   - Machining time: 0.3 hours

### Suppliers and Relationships

The system relies on a multi-tier supply chain:

**Tier 3 Suppliers (Raw materials)**
- **AluminumCorp GmbH** (Germany)
  - Supplies: Aluminum 7075 (quantity: 1000 kg, lead time: 7 days, cost: 15€/kg)
  - Supplies: Aluminum 6061 (quantity: 1500 kg, lead time: 7 days, cost: 12€/kg)

- **SteelWorld Industries** (France)
  - Supplies: Steel 4340 (quantity: 2000 kg, lead time: 5 days, cost: 8€/kg)
  - Supplies: Stainless Steel 316 (quantity: 1000 kg, lead time: 6 days, cost: 18€/kg)

**Tier 2 Suppliers (Tools and consumables)**
- **ToolMasters SA** (France)
  - Supplies: Cutting tools for CNC Mill Alpha-5000
  - Supplies: Cutting tools for CNC Mill Gamma-4000
  - **MAINTAINS** CNC Mill Alpha-5000 (contract valid from 2024-01-01 to 2025-12-31, response time: 4 hours, cost: 25000€)

- **PrecisionTools Ltd** (UK)
  - Supplies: Turning tools for CNC Lathe Beta-3000
  - **MAINTAINS** CNC Lathe Beta-3000 (contract valid from 2025-01-01 to 2025-12-31, response time: 8 hours, cost: 18000€)

- **IndustrialSupplies Co** (Belgium)
  - Supplies: Tools for CNC Router Delta-2000
  - Supplies: Tools for CNC Plasma Epsilon-1000
  - **MAINTAINS** CNC Plasma Epsilon-1000 (contract valid from 2024-06-01 to 2025-06-01, response time: 6 hours, cost: 15000€)

**Tier 1 Suppliers (Assembly)**
- **AssemblyPro International** (France)
  - Assembles final parts for customers
  - Receives parts from CNC Manufacturing Solutions
  - Assembly lead time: 2 days

### Customer Orders

Currently, three urgent orders are in progress:

1. **Order #A001** - AeroSpace Industries
   - Final product: Complete turbine
   - Requires: 5x Turbine Housing, 2x Drive Shaft
   - Deadline: 2025-02-15
   - Priority: HIGH

2. **Order #A002** - Aviation Components Inc
   - Final product: Connection module
   - Requires: 10x Connection Flange, 8x Bearing Mount
   - Deadline: 2025-02-20
   - Priority: MEDIUM

3. **Order #A003** - Defense Contractor Ltd
   - Final product: Shaft assembly
   - Requires: 15x Drive Shaft, 30x O-Ring Seal
   - Deadline: 2025-02-10
   - Priority: CRITICAL

### Technical Personnel

- **Marie Dubois** - Chief Engineer
  - Specialty: CNC Systems
  - Supervises: Jean Martin, Sophie Bernard
  - Responsible for: CNC Mill Alpha-5000, CNC Mill Gamma-4000

- **Jean Martin** - CNC Technician
  - Specialty: CNC Programming
  - Collaborates with: Sophie Bernard

- **Sophie Bernard** - CNC Operator
  - Specialty: Precision machining
  - Collaborates with: Jean Martin

- **Thomas Leroy** - Maintenance Manager
  - Specialty: Preventive maintenance
  - Supervises: Lucas Petit

- **Lucas Petit** - Maintenance Technician
  - Specialty: Hydraulic repair
  - Reports to: Thomas Leroy

---

## 🎯 Your Mission

You must model this complex system using:

### **Advanced Patterns (Session 3)**
1. **Multiple relationships**: Suppliers can both SUPPLY materials AND MAINTAIN machines
2. **Properties on relationships**: Quantities, costs, lead times, contract durations
3. **Time-based relationships**: Maintenance contracts with start/end dates
4. **Self-references**: Personnel hierarchy (managers and subordinates)
5. **Bill of Materials (BOM)**: Parts contain other parts with quantities

### **Graph Algorithms (Session 4)**
1. **Shortest Path**: Find the fastest supply path
2. **Impact Analysis**: Assess the effect of CNC Mill Alpha-5000 breakdown
3. **Centrality**: Identify critical machines and suppliers
4. **Community Detection**: Find groups of personnel working together

---

## 📝 Questions

### **Part 1: Building the Model (Advanced Patterns)**

#### Q1. Create all CNC machines with their properties
*Hints: name, type, purchaseDate, status, capabilities (materials)*

#### Q2. Create all parts with their properties
*Hints: name, material, machiningTime*

#### Q3. Create CAN_PRODUCE relationships between machines and parts
*Multiple machines can produce the same part*

#### Q4. Create CONTAINS relationships for Bill of Materials (BOM)
*Example: Turbine Housing CONTAINS {quantity: 2} Bearing Mount*

#### Q5. Create all suppliers (Tier 1, 2, 3) with their properties
*Hints: name, tier, location*

#### Q6. Create SUPPLIES relationships with properties (quantity, leadTime, cost)
*Use rich properties on relationships*

#### Q7. Create MAINTAINS relationships with contract dates
*Tier 2 suppliers maintain machines with time-based contracts*

#### Q8. Create personnel with hierarchy (self-references)
*Use SUPERVISES and COLLABORATES relationships*

#### Q9. Create customer orders with REQUIRES relationships
*Link orders to required parts with quantities*

---

### **Part 2: Basic Queries**

#### Q10. List all operational machines
*Filter by status*

#### Q11. Find all parts that CNC Mill Alpha-5000 can produce
*Use the CAN_PRODUCE relationship*

#### Q12. Find alternative machines to produce Turbine Housing
*Important since CNC Mill Alpha-5000 is down!*

#### Q13. Calculate the total number of sub-parts in a Turbine Housing
*Use BOM with reduce() to multiply quantities*

#### Q14. List all suppliers that both SUPPLY and MAINTAIN
*Multiple relationships - critical pattern!*

#### Q15. Find all active maintenance contracts today
*Use validFrom <= date() AND validTo >= date()*

---

### **Part 3: Impact Analysis (Algorithms)**

#### Q16. 🚨 CRITICAL: Which orders are affected by CNC Mill Alpha-5000 breakdown?
*Follow the chain: Machine → Parts → Orders*

#### Q17. Calculate the cascading impact if SteelWorld Industries goes bankrupt
*Find everything that depends on this supplier (downstream analysis)*

#### Q18. Find all upstream dependencies to produce a Turbine Housing
*Upstream analysis: Part → Materials → Suppliers*

#### Q19. Quantify impact: For each supplier, count how many entities are affected
*Use OPTIONAL MATCH and COUNT(DISTINCT)*

---

### **Part 4: Paths and Optimization**

#### Q20. Find the FASTEST supply path to get Aluminum 7075
*From AluminumCorp GmbH to CNC Mill Alpha-5000*
*Use shortestPath() and reduce() with leadTime property*

#### Q21. Find the CHEAPEST supply path
*Same but optimize by cost*

#### Q22. Find ALL possible paths (max 5 levels) from Tier 3 supplier to final product
*Use [:RELATION*1..5] to get multiple routes*

#### Q23. Compare all paths by cost AND lead time
*Create a comparison table*

#### Q24. Find alternative routes that avoid ToolMasters SA
*Use WHERE NONE() to exclude a supplier*

---

### **Part 5: Centrality Analysis (Critical Nodes)**

#### Q25. Find machines with the most connections (degree centrality)
*Count how many parts each machine can produce*

#### Q26. Identify critical suppliers (those with the most downstream impact)
*Sort by number of affected entities*

#### Q27. Find bottlenecks
*Find nodes through which the most paths pass*

#### Q28. Identify the most demanded parts
*Count how many orders require each part*

---

### **Part 6: Personnel Analysis (Community Detection)**

#### Q29. Find all subordinates of Marie Dubois (direct + indirect)
*Use [:SUPERVISES*] to find the entire hierarchy*

#### Q30. Find the supervisor 2 levels above Lucas Petit
*Use [:SUPERVISES*2] in reverse*

#### Q31. Identify collaboration groups
*Who collaborates with whom? Use [:COLLABORATES*1..2]*

#### Q32. Find "bridges" between departments
*Personnel connecting different teams*

---

### **Part 7: Crisis Scenarios**

#### Q33. 🚨 SIMULATION: If CNC Mill Alpha-5000 stays down, can we fulfill Order #A001?
*Check if alternative machines have capacity*

#### Q34. Calculate total lead time to deliver Order #A003
*Add: material lead time + machining time + assembly lead time*

#### Q35. Prioritization: Which order can be delivered fastest?
*Compare the three orders*

#### Q36. Mitigation plan: Propose an alternative plan if ToolMasters SA becomes unavailable
*Find which machines are affected and solutions*

---

### **Part 8: Advanced Combined Queries**

#### Q37. Total production cost for Order #A001
*Calculate: (quantities × material cost) + tool cost + maintenance cost*

#### Q38. Find the complete path from raw material to final customer
*Tier 3 Supplier → Material → Machine → Part → Assembler → Customer*

#### Q39. Reliability analysis: Identify all single points of failure
*Nodes where only one path exists*

#### Q40. Optimization: Propose an optimal production plan to minimize total lead time
*Consider available machines and supply paths*

---

## 🎓 Key Concepts to Master

### From Session 3 (Advanced Modeling Patterns):
- ✅ Multiple relationships between two nodes (SUPPLIES + MAINTAINS)
- ✅ Rich properties on relationships (quantity, cost, leadTime)
- ✅ Time-based relationships (validFrom, validTo)
- ✅ Self-references (personnel hierarchy)
- ✅ Bill of Materials with quantities
- ✅ Using reduce() for calculations

### From Session 4 (Graph Algorithms):
- ✅ shortestPath() for optimization
- ✅ Impact analysis (downstream and upstream)
- ✅ OPTIONAL MATCH for inclusive analysis
- ✅ Degree centrality (counting connections)
- ✅ Bottleneck detection
- ✅ Community detection (groups)
- ✅ Variable depth traversal (*)

---

## 💡 Tips for Success

1. **Start simple**: Create a few nodes of each type first to test
2. **Use CREATE to build everything in one block**: More efficient and keeps variables available
3. **Test your relationships**: Use simple MATCH to verify connections are correct
4. **Visualize**: Neo4j Browser displays the graph visually - use it!
5. **reduce() is your friend**: For multiplying quantities, adding costs/lead times
6. **OPTIONAL MATCH**: Essential when some nodes may not have the pattern
7. **WHERE NONE()**: Very useful to exclude certain nodes from paths
8. **Think business**: Each query solves a real engineering problem!

---

## 🏆 Final Challenge

**Mission Impossible**: The management team asks you for a complete report:

1. **Current state**: Which orders are in danger?
2. **Risk analysis**: What are our 3 most critical suppliers?
3. **Plan B**: How to reorganize production with CNC Mill Alpha-5000 down?
4. **Optimization**: What is the fastest AND cheapest plan for Order #A001?
5. **Recommendations**: What machines should we buy to reduce single points of failure?

Use ALL the patterns and algorithms learned to create this report!

---

## 📚 Cypher Quick Reference

```cypher
// Advanced patterns
(a)-[:TYPE1]->(b), (a)-[:TYPE2]->(b)              // Multiple relationships
(a)-[:REL {prop: value}]->(b)                     // Properties on relationship
WHERE r.validFrom <= date() AND r.validTo >= date()  // Time-based
(manager:Employee)-[:SUPERVISES]->(employee:Employee) // Self-reference

// Algorithms
shortestPath((a)-[:REL*]->(b))                    // Shortest path
(n)-[:REL*]->(affected)                           // Downstream impact
(n)<-[:REL*]-(dependency)                         // Upstream dependencies
OPTIONAL MATCH (n)-[:REL]->(x)                    // May not exist
COUNT(DISTINCT x)                                 // Centrality
reduce(total = 0, rel IN rels | total + rel.prop) // Accumulator

// Utilities
WHERE NONE(node IN nodes(path) WHERE ...)         // Exclude nodes
COLLECT(DISTINCT x)                               // Group results
SIZE(collection)                                  // Collection size
```

---

**Good luck! You have all the tools to become graph modeling and analysis experts! 🚀**
