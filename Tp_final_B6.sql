-- 6. (2 pts) Rédigez une requête WITH RECURSIVE affichant tout l'organigramme 
-- de employes depuis la CTO (manager_id IS NULL), avec le niveau hiérarchique (niveau) et le chemin complet (chemin).

WITH RECURSIVE org AS (
    SELECT id, nom, poste, manager_id, 1 AS niveau, nom::TEXT AS chemin   
    FROM employes WHERE manager_id IS NULL
    UNION ALL 

    SELECT employes.id, employes.nom, employes.poste, employes.manager_id, org.niveau + 1,
    org.chemin || ' -> ' || employes.nom
    FROM employes JOIN org ON employes.manager_id = org.id
)
SELECT id, nom, poste, niveau, chemin
FROM org
ORDER BY niveau, id;