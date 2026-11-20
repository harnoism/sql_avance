-- 9. (3 pts) Une startup lance une application de covoiturage temps réel 
-- nécessitant : (a) le suivi GPS toutes les 3 secondes de 30 000 véhicules, (b) la 
-- facturation bancaire des trajets, (c) la suggestion d'itinéraires/amis communs 
-- à 3 degrés de séparation.  
-- Proposez une architecture polyglotte justifiée via CAP/PACELC et les 4 
-- critères de choix.

-- 1. Modèle de données (Structure) :
-- Données tabulaires/financières structurées -> SQL (PostgreSQL).
-- Flux massif de capteurs/séries temporelles -> Colonnes (Cassandra).
-- Réseau fortement connecté (nœuds et arcs) -> Graphe (Neo4j).

-- 2. Volume et charge en lecture/écriture (Scalabilité) :
-- Besoin (a) : Écriture massive et scalabilité horizontale (sharding) indispensable -> Cassandra.
-- Besoin (b) : Volume modéré mais criticité maximale -> PostgreSQL.

-- 3. Cohérence vs Disponibilité (CAP / PACELC) :
-- Cohérence forte (CP / EC) exigée pour l'argent (PostgreSQL).
-- Disponibilité et faible latence (AP / EL) exigées pour la télémétrie GPS (Cassandra).

-- 4. Complexité des requêtes :
-- Requêtes de traversée multi-sauts (3 degrés) impossibles à optimiser proprement en SQL -> Neo4j.
