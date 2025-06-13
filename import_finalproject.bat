@echo off
echo Starting import to MySQL...

REM Replace with your MySQL username and password
SET MYSQL_USER=root
SET MYSQL_PASS=your_mysql_password
SET DB_NAME=sql_finalproject

REM Folder path to your CSV files
SET CSV_PATH=C:/Users/kanti/Downloads/SQL final project datasets

mysql --local-infile=1 -u %MYSQL_USER% -p%MYSQL_PASS% %DB_NAME% -e "LOAD DATA LOCAL INFILE '%CSV_PATH%/milk_production.csv' INTO TABLE milk_production FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;"

mysql --local-infile=1 -u %MYSQL_USER% -p%MYSQL_PASS% %DB_NAME% -e "LOAD DATA LOCAL INFILE '%CSV_PATH%/cheese_production.csv' INTO TABLE cheese_production FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;"

mysql --local-infile=1 -u %MYSQL_USER% -p%MYSQL_PASS% %DB_NAME% -e "LOAD DATA LOCAL INFILE '%CSV_PATH%/coffee_production.csv' INTO TABLE coffee_production FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;"

mysql --local-infile=1 -u %MYSQL_USER% -p%MYSQL_PASS% %DB_NAME% -e "LOAD DATA LOCAL INFILE '%CSV_PATH%/egg_production.csv' INTO TABLE egg_production FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;"

mysql --local-infile=1 -u %MYSQL_USER% -p%MYSQL_PASS% %DB_NAME% -e "LOAD DATA LOCAL INFILE '%CSV_PATH%/honey_production.csv' INTO TABLE honey_production FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;"

mysql --local-infile=1 -u %MYSQL_USER% -p%MYSQL_PASS% %DB_NAME% -e "LOAD DATA LOCAL INFILE '%CSV_PATH%/state_lookup.csv' INTO TABLE state_lookup FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;"

mysql --local-infile=1 -u %MYSQL_USER% -p%MYSQL_PASS% %DB_NAME% -e "LOAD DATA LOCAL INFILE '%CSV_PATH%/yogurt_production.csv' INTO TABLE yogurt_production FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;"

echo Done importing!
pause
