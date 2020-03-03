library(DBI)

# https://www.w3resource.com/sqlite-exercises/
con <- DBI::dbConnect(RSQLite::SQLite(), 
                      dbname = "J:/R/courses/tutorial_slides/sql/hr.sqlite")
