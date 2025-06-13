-- Create table for Cheese Production
DROP TABLE IF EXISTS cheese_production;
CREATE TABLE cheese_production (
    year INT,
    period VARCHAR(10),
    geo_level VARCHAR(50),
    state_ansi INT,
    commodity_id INT,
    domain VARCHAR(50),
    value VARCHAR(50),
    clean_value BIGINT
);

-- Create table for Yogurt Production
DROP TABLE IF EXISTS yogurt_production;
CREATE TABLE yogurt_production (
    year INT,
    period VARCHAR(10),
    geo_level VARCHAR(50),
    state_ansi INT,
    commodity_id INT,
    domain VARCHAR(50),
    value VARCHAR(50),
    clean_value BIGINT
);

-- Create table for Milk Production
DROP TABLE IF EXISTS milk_production;
CREATE TABLE milk_production (
    year INT,
    period VARCHAR(10),
    geo_level VARCHAR(50),
    state_ansi INT,
    commodity_id INT,
    domain VARCHAR(50),
    value VARCHAR(50),
    clean_value BIGINT
);

-- Create table for Coffee Production
DROP TABLE IF EXISTS coffee_production;
CREATE TABLE coffee_production (
    year INT,
    period VARCHAR(10),
    geo_level VARCHAR(50),
    state_ansi INT,
    commodity_id INT,
    domain VARCHAR(50),
    value VARCHAR(50),
    clean_value BIGINT
);

-- Create table for Egg Production
DROP TABLE IF EXISTS egg_production;
CREATE TABLE egg_production (
    year INT,
    period VARCHAR(10),
    geo_level VARCHAR(50),
    state_ansi INT,
    commodity_id INT,
    domain VARCHAR(50),
    value VARCHAR(50),
    clean_value BIGINT
);

-- Create table for Honey Production
DROP TABLE IF EXISTS honey_production;
CREATE TABLE honey_production (
    year INT,
    period VARCHAR(10),
    geo_level VARCHAR(50),
    state_ansi INT,
    commodity_id INT,
    domain VARCHAR(50),
    value VARCHAR(50),
    clean_value BIGINT
);

-- =============================
-- DATA CLEANING SCRIPT
-- =============================
-- Clean cheese_production
UPDATE cheese_production
SET clean_value = CAST(REPLACE(value, ',', '') AS UNSIGNED)
WHERE value REGEXP '^[0-9,]+$';

-- Clean yogurt_production
UPDATE yogurt_production
SET clean_value = CAST(REPLACE(value, ',', '') AS UNSIGNED)
WHERE value REGEXP '^[0-9,]+$';

-- Clean milk_production
UPDATE milk_production
SET clean_value = CAST(REPLACE(value, ',', '') AS UNSIGNED)
WHERE value REGEXP '^[0-9,]+$';

-- Clean coffee_production
UPDATE coffee_production
SET clean_value = CAST(REPLACE(value, ',', '') AS UNSIGNED)
WHERE value REGEXP '^[0-9,]+$';

-- Clean egg_production
UPDATE egg_production
SET clean_value = CAST(REPLACE(value, ',', '') AS UNSIGNED)
WHERE value REGEXP '^[0-9,]+$';

-- Clean honey_production
UPDATE honey_production
SET clean_value = CAST(REPLACE(value, ',', '') AS UNSIGNED)
WHERE value REGEXP '^[0-9,]+$';



-- SQL Final Project: Questions and Answers Script

-- Question 1:
-- Find the total milk production for the year 2023.
SELECT SUM(clean_value) AS total_milk_production_2023
FROM milk_production
WHERE year = 2023;


-- Question 2:
-- Show coffee production data for the year 2015.
SELECT * FROM coffee_production
WHERE year = 2015;

-- What is the total value?
SELECT SUM(clean_value) AS total_coffee_production_2015
FROM coffee_production
WHERE year = 2015;


-- Question 3:
-- Find the average honey production for the year 2022.
SELECT AVG(clean_value) AS average_honey_production_2022
FROM honey_production
WHERE year = 2022;


-- Question 4:
-- Get the state names with their corresponding ANSI codes from the state_lookup table.
SELECT state_ansi, state_name FROM state_lookup;

-- What number is Iowa?
SELECT state_ansi FROM state_lookup
WHERE state_name = 'Iowa';


-- Question 5:
-- Find the highest yogurt production value for the year 2022.
SELECT MAX(clean_value) AS max_yogurt_production_2022
FROM yogurt_production
WHERE year = 2022;

-- Question 6:
-- Find states where both honey and milk were produced in 2022.
SELECT DISTINCT honey.state_ansi
FROM honey_production honey
JOIN milk_production milk
ON honey.state_ansi = milk.state_ansi
WHERE honey.year = 2022 AND milk.year = 2022;

-- Did State_ANSI "35" produce both honey and milk in 2022?
-- Run this to check:
SELECT CASE 
    WHEN EXISTS (
        SELECT 1
        FROM honey_production h
        JOIN milk_production m
        ON h.state_ansi = m.state_ansi
        WHERE h.year = 2022 AND m.year = 2022 AND h.state_ansi = 35
    )
    THEN 'Yes'
    ELSE 'No'
END AS state_35_produced_both;


-- Question 7:
-- Find the total yogurt production for states that also produced cheese in 2022.
SELECT SUM(y.clean_value) AS total_yogurt_2022_for_cheese_states
FROM yogurt_production y
WHERE y.year = 2022 AND y.state_ansi IN (
    SELECT DISTINCT state_ansi
    FROM cheese_production
    WHERE year = 2022
);

