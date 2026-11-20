-- 5. (2 pts) Rédigez une requête avec CTE + fonction de fenêtrage 
-- (DENSE_RANK) affichant pour chaque catégorie les 2 produits les plus 
-- chers. 

WITH classement AS (
    SELECT categories.nom AS catégorie, p.nom AS produit, produits.prix_unitaire
    DENSE_RANK() OVER(
        PARTITION BY c.id ORDER BY p.prix_unitaire DESC
    ) AS rang
    FROM produits
    JOIN categories ON p.categorie_id = c.id )
SELECT categorie, produit, prix_unitaire, rang FROM classement WHERE rang <= 2
ORDER BY categorie, rang;