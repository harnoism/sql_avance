-- Partie B - Normalisation et requêtes analytiques avancées (6 points - 
-- 1h15) 
-- 4. (2 pts) On vous soumet une table brute affectations_brutes(employe_id, 
-- employe_nom, dept_nom, projets_liste, chef_projet, chef_projet_tel).  
-- Passez-la en 3FN en explicitant les dépendances fonctionnelles et les clés 
-- primaires/étrangères. 

-- Dépendance fonctionnelles:
-- employe_id (clés primaires) -> employe_nom, dept_nom = L'dentifiant de l'employe détermine son nom et son département
-- projets_liste = projets au pluriel donc contient plusieurs projets
-- chef_projet -> chef_projet_tel = Le numéro de téléphone du chef de projet dépend du chef de projet

-- Clés Primaire = employe_id, projet_id, chef_projet_id
-- Clés étrangères = chef_projet_id -> chefs_projet

-- Passage en 1FN:
-- (employe_id, projet_id) = On sépare pour avoir un projet par ligne

-- Passage en 2FN: 
-- Dans la table employes on donne les informations une seule fois et
-- les informations du projet une seule fois dans la table projets
-- Puis dans affectation on gardera les numéros (employe_id, projet_id)

-- Passage en 3FN
-- On créer une nouvelle table chefs_projet afin de mettre le numéro d'un chef de projet
-- car le numéro de téléphone ne correspond pas au numéro du projet
-- c'est pour cela que le tableau projets doit pointer vert le tableau chefs_projet avec chef_projet_id (clé étrangère)