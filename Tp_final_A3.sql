-- 3. (2.5 pts) Créez une vue matérialisée mv_synthese_segments calculant le 
-- nombre de commandes et le CA total par segment client.  
-- Insérez une nouvelle commande test, constatez que la vue est marquée 
-- obsolète (stale), puis rafraîchissez-la et vérifiez la mise à jour.
 
CREATE MATERIALIZED VIEW mv_synthese_segments AS
SELECT c.segment,
COUNT(*) AS nb_commandes,
ROUND(SUM(cmd.montant_total), 2) AS ca_total
FROM commandes cmd
JOIN clients.c ON cmd.client_id = c.id 
GROUP BY c.segment;

INSERT INTO commandes (client_id, montant_total, statut) VALUES (1, 5000.00, 'LIVREE');

REFRESH MATERIALIZED VIEW mv_synthese_segments;

SELECT * FROM mv_synthese_segments;