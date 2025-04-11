SET SQL_SAFE_UPDATES = 0;

-- a. Supprimer dans la table compo toutes les lignes concernant les bons de commande d'avril 2019
DELETE FROM Compo
WHERE Id_Bon IN (SELECT Id from Bon WHERE MONTH(Date_cmd) = 4 AND YEAR(Date_cmd) = 2019);

-- b. Supprimer dans la table bon tous les bons de commande d'avril 2019.
DELETE FROM Bon
WHERE MONTH(Date_cmd) = 4 AND YEAR(Date_cmd) = 2019);