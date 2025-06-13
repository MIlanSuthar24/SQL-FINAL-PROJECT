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
