-- 2. (2.5 pts) Créez un index pertinent sur commandes, activez le 
-- partitionnement RANGE, et réécrivez la requête de façon SARGable (sans 
-- SELECT *).  

CREATE INDEX idx_grosses_commandes ON commandes (statut, date_commande, montant_total);
SELECT id, client_id, date_commande, montant_total 
FROM commandes WHERE (statut = 'LIVREE') AND
date_commande >= '2026-01-01' AND date_commande < '2027-01-01'
ORDER BY montant_total DESC 
LIMIT 10;