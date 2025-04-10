-- a. Listez les articles dans l'ordre alphabétique des désignations
SELECT * FROM Article ORDER BY Designation;

-- b. Listez les articles dans l'ordre des prix du plus élevé au moins élevé
SELECT * FROM Article ORDER BY Prix DESC;

-- c. Listez tous les articles qui sont des « boulons » et
-- triez les résultats par ordre de prix ascendant
SELECT * FROM Article WHERE Designation LIKE '%boulon%' ORDER BY Prix;

-- d. Listez tous les articles dont la désignation contient le mot « sachet ».
SELECT * FROM Article WHERE Designation LIKE '%sachet%';

-- e. Listez tous les articles dont la désignation contient le mot « sachet »
--indépendamment de la casse !
SELECT * FROM Article WHERE LOWER(Designation) LIKE '%sachet%';

-- f. Listez les articles avec les informations fournisseur correspondantes.
-- Les résultats doivent être triées dans l'ordre alphabétique des fournisseurs
-- et par article du prix le plus élevé au moins élevé.
SELECT Article.*, f.Nom FROM Article
LEFT JOIN Fournisseur AS f ON Article.Id_Fou = f.Id
ORDER BY f.Nom ASC, Article.Prix DESC;

-- g. Listez les articles de la société « Dubois & Fils »
SELECT Article.*, f.Nom FROM Article
LEFT JOIN Fournisseur as f ON Article.Id_Fou = f.Id
WHERE f.Nom LIKE 'Dubois & Fils';

-- h. Calculez la moyenne des prix des articles de la société « Dubois & Fils »
SELECT f.Nom, AVG(Prix) AS 'Moyenne prix articles' FROM Article
LEFT JOIN Fournisseur as f ON Article.Id_Fou = f.Id
WHERE f.Nom LIKE 'Dubois & Fils';

-- i. Calculez la moyenne des prix des articles de chaque fournisseur
SELECT f.nom, AVG(Prix) AS 'Moyenne prix articles' FROM Article
LEFT JOIN Fournisseur AS f ON Article.Id_Fou = f.Id
GROUP BY f.nom;

-- j. Sélectionnez tous les bons de commandes émis entre le 01/03/2019 et le 05/04/2019 à 12h00.
SELECT * FROM Bon WHERE Date_cmd BETWEEN '2019-03-19' AND '2019-04-05 12:00:00';

-- k. Sélectionnez les divers bons de commande qui contiennent des boulons
SELECT DISTINCT Bon.* FROM Bon
LEFT JOIN Compo ON Bon.Id = Compo.Id_Bon
LEFT JOIN Article ON Compo.Id_art = Article.Id
WHERE Article.designation LIKE '%boulon%';

-- l. Sélectionnez les divers bons de commande qui contiennent des boulons avec le nom du fournisseur associé.
SELECT DISTINCT Bon.*, f.Nom FROM Bon
LEFT JOIN Fournisseur AS f ON f.id = bon.id_fou
LEFT JOIN Article ON Article.Id_Fou = f.id
WHERE Article.designation LIKE '%boulon%';

-- m. Calculez le prix total de chaque bon de commande
SELECT DISTINCT Bon.*, sum(prix * qte) AS 'Total' FROM Bon
LEFT JOIN Compo ON Bon.Id = Compo.Id_Bon
LEFT JOIN Article AS a ON Compo.Id_art = a.Id
GROUP BY Bon.Id;

-- n. Comptez le nombre d'articles de chaque bon de commande
SELECT DISTINCT Bon.Id AS 'Id du Bon de commande', sum(Compo.Qte) AS 'Nombre articles associés'
FROM Bon
LEFT JOIN Compo ON Bon.Id = Compo.Id_Bon
GROUP BY Bon.Id;

-- o. Affichez les numéros de bons de commande qui contiennent plus de 25 articles et affichez le nombre d'articles de chacun de ces bons de commande
SELECT DISTINCT Bon.Numero AS 'N°commande', sum(Compo.Qte) AS 'Nombre articles associés'
FROM Bon
JOIN Compo ON Bon.Id = Compo.Id_Bon
GROUP BY Bon.Numero HAVING sum(Compo.Qte) > 25 ;

-- p. Calculez le coût total des commandes effectuées sur le mois d'avril
SELECT DISTINCT Bon.Numero AS 'N°commande', sum(a.Prix * Compo.Qte) AS 'Prix Total', date_cmd AS 'Date commande'
FROM Bon
JOIN Compo ON Bon.Id = Compo.Id_Bon
JOIN Article AS a ON Compo.Id_art = a.Id
WHERE MONTH(Bon.Date_cmd) = 4
GROUP BY Bon.Numero;