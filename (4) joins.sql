CREATE DATABASE joins;
USE joins;
#Tanvi Sannidhiraju(2520030057)
-- CREATE TABLES
DROP TABLE IF EXISTS class_info;
DROP TABLE IF EXISTS class;

CREATE TABLE class (
    id INT,
    name VARCHAR(30)
);

CREATE TABLE class_info (
    id INT,
    address VARCHAR(30)
);

-- INSERT DATA
INSERT INTO class VALUES
(1,'abhi'),(2,'adam'),(3,'alex'),(4,'anu'),(5,'ashish');

INSERT INTO class_info VALUES
(1,'DELHI'),(2,'MUMBAI'),(3,'CHENNAI'),
(7,'NOIDA'),(8,'PANIPAT');

-- 1. CROSS JOIN
SELECT * FROM class
CROSS JOIN class_info;

-- 2. INNER JOIN
SELECT c.name, ci.address
FROM class c
INNER JOIN class_info ci
ON c.id = ci.id;

-- 3. NATURAL JOIN
SELECT * FROM class
NATURAL JOIN class_info;

-- 4. LEFT JOIN
SELECT *
FROM class c
LEFT JOIN class_info ci
ON c.id = ci.id;

-- 5. LEFT JOIN + NULL
SELECT *
FROM class c
LEFT JOIN class_info ci
ON c.id = ci.id
WHERE ci.id IS NULL;

-- 6. RIGHT JOIN
SELECT *
FROM class c
RIGHT JOIN class_info ci
ON c.id = ci.id;

-- 7. RIGHT JOIN + NULL
SELECT *
FROM class c
RIGHT JOIN class_info ci
ON c.id = ci.id
WHERE c.id IS NULL;

-- 8. FULL OUTER JOIN
SELECT *
FROM class c
LEFT JOIN class_info ci ON c.id = ci.id
UNION
SELECT *
FROM class c
RIGHT JOIN class_info ci ON c.id = ci.id;

-- 9. UNION
SELECT id, name FROM class
UNION
SELECT id, address FROM class_info;

-- 10. UNION ALL
SELECT id, name FROM class
UNION ALL
SELECT id, address FROM class_info;

-- 11. INTERSECT
SELECT id, name FROM class
INTERSECT
SELECT id, address FROM class_info;

-- 12. MINUS
SELECT c.id, c.name
FROM class c
WHERE NOT EXISTS (
    SELECT 1
    FROM class_info ci
    WHERE ci.id = c.id
);

-- 13. CASE
SELECT c.id, c.name,
CASE
    WHEN ci.address IS NULL THEN 'Address Missing'
    ELSE 'Address Available'
END AS Status
FROM class c
LEFT JOIN class_info ci
ON c.id = ci.id;