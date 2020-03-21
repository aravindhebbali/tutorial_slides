library(DBI)

# https://www.w3resource.com/mysql-exercises/
# https://www.geeksengine.com/database/problem-solving/northwind-queries-part-1.php
# https://www.scribd.com/doc/305316705/Exercises-on-Northwind-Database

con <- DBI::dbConnect(RSQLite::SQLite(), 
                      dbname = "J:/R/courses/tutorial_slides/sql/northwind.sqlite")

dbListTables(con)
