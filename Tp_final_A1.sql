-- Partie A - Audit, optimisation et indexation SQL (7 points - 1h15) 
-- 1. (2 pts) Exécutez avec EXPLAIN ANALYZE une requête listant les 10 plus 
-- grosses commandes LIVREE passées en 2026 en utilisant 
-- YEAR(date_commande) = 2026.  
-- Identifiez les 2 défauts du plan obtenu. 

EXPLAIN ANALYZE
SELECT id, client_id, date_commande, montant_total 
FROM commandes WHERE (statut = 'LIVREE') AND
YEAR(date_commande) = 2026
ORDER BY montant_total DESC 
LIMIT 10;

-- Problème n°1 détecter: Prédicat non-SARGable détecter à cause de YEAR(date_commande) = 2026 
-- ce qui fait qu'il fait un SeqScan sur toute la table commandes

-- Problème n°2 détecter: Le sort, la requête doit trier toutes les commandes en mémoire 
-- avant de pouvoir sortir les 10 plus gross commandes
