-- a. Mettez en minuscules la désignation de l'article dont l'identifiant est 2
UPDATE Article SET Designation = LOWER(Designation)
WHERE id = 2;

-- b. Mettez en majuscules les désignations de tous les articles
-- dont le prix est strictement supérieur à 10€
UPDATE Article SET Designation = UPPER(Designation)
WHERE prix > 10;

-- c. Baissez de 10% le prix de tous les articles qui n'ont pas fait l'objet d'une commande.UPDATE Article
UPDATE Article SET Prix = Prix * 0.9 WHERE Id NOT IN (SELECT Id_Art FROM Compo);

-- d. Une erreur s'est glissée dans les commandes concernant Française d'imports. Les chiffres en base ne sont pas bons.
--  Il faut doubler les quantités de tous les articles commandés à cette société.
UPDATE Compo c JOIN Article a ON c.Id_Art = a.Id
SET c.Qte = c.Qte * 2 WHERE a.Id_Fou = 1;

-- e. Mettez au point une requête update qui permette de supprimer les éléments
-- entre parenthèses dans les désignations. Il vous faudra utiliser des fonctions
-- comme substring et position.
UPDATE Article
SET Designation = SUBSTRING(Designation, 1, LOCATE('(', Designation) - 1)
WHERE Designation LIKE '%(%';
