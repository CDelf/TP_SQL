-- a. Listez toutes les données concernant les articles
SELECT * FROM Article;

-- b. Listez uniquement les références et désignations des articles de plus de 2 euros
SELECT Ref, Designation FROM Article WHERE Prix > 2;

-- c. En utilisant les opérateurs de comparaison, listez tous les articles dont le prix est compris entre 2 et 6.25 euros
SELECT * FROM Article WHERE Prix >= 2 AND Prix <= 6.25;

-- d. En utilisant l'opérateur BETWEEN, listez tous les articles dont le prix est compris entre 2 et 6.25 euros
SELECT * FROM Article WHERE Prix BETWEEN 2 AND 6.25;

-- e. Listez tous les articles, dans l'ordre des prix descendants, et dont le prix n'est pas compris entre 2 et 6.25 euros et dont le fournisseur est Française d'Imports.
SELECT * FROM Article WHERE NOT(Prix BETWEEN 2 AND 6.25) AND Id_Fou = 1 ORDER BY Prix DESC;

-- f. En utilisant un opérateur logique, listez tous les articles dont les fournisseurs sont la Française d'imports ou Dubois et Fils
SELECT * FROM Article WHERE Id_Fou = 1 OR Id_FOU = 3;

-- g. En utilisant l'opérateur IN, réalisez la même requête que précédemment
SELECT * FROM Article WHERE Id_Fou IN (1,3);

-- h. En utilisant les opérateurs NOT et IN, listez tous les articles dont les fournisseurs ne sont ni Française d'Imports, ni Dubois et Fils.
SELECT * FROM Article WHERE Id_Fou NOT IN (1,3);

-- i. Listez tous les bons de commande dont la date de commande est entre le 01/02/2019 et le 30/04/2019.
SELECT * FROM Bon WHERE Date_cmd BETWEEN '2019-02-01' AND '2019-04-30';