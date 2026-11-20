-- Partie C - Transactions ACID, audit et choix NoSQL (7 points - 1h30) 
-- 7. (2 pts) Expliquez le piège de la requête SELECT id, nom FROM employes 
-- WHERE id NOT IN (SELECT manager_id FROM employes); et proposez une 
-- correction fiable face aux valeurs NULL. 

-- Le piège est que la présence de NULL fait échouer tout le NOT IN et renvoie 0 ligne

SELECT id, nom FROM employes 
WHERE NOT EXISTS (SELECT 1 FROM employes sub WHERE sub.manager_id = employes.id);