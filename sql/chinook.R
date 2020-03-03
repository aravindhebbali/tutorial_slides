library(DBI)

# https://github.com/KAPrueved/Chinook-SQL-Exercise
# https://github.com/Olamiotan/PythonStarter
# https://tapoueh.org/blog/2017/06/exploring-a-data-set-in-sql/

con <- DBI::dbConnect(RSQLite::SQLite(), 
  dbname = "J:/R/courses/tutorial_slides/sql/Chinook_Sqlite.sqlite")

