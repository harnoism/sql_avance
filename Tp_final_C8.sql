-- 8. (2 pts) Dans le simulateur ACID, reproduisez un Non-Repeatable Read sous 
-- READ COMMITTED, puis montrez comment REPEATABLE READ le résout.  
-- Expliquez le rôle du WAL lors d'une coupure serveur en plein virement.

-- Lors de la seconde lecture, la Session A voit toujours 15000.00. PostgreSQL fige un cliché (snapshot) de la base au début de la transaction A 
-- et ignore les modifications validées entre-temps par B.


-- Le WAL est comme un journal de bord dans lequel PostgreSQL écrit chaque modification
-- avant de toucher aux vraies tables sur le disque.

-- En cas de coupure de serveur en plein virement :

-- Si le COMMIT n'est pas encore écrit dans le WAL : Au redémarrage, PostgreSQL voit que le virement était inachevé et annule tout (Rollback).
-- L'argent débité est rendu (Atomicité).

-- Si le COMMIT était déjà écrit dans le WAL : Au redémarrage, PostgreSQL relit le journal et
-- rejoue le virement (Redo) pour mettre à jour les tables (Durabilité).