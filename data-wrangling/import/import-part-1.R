## load readr
library(readr)

## read csv data
read_csv('mtcars.csv')

## specify delim
read_delim('mtcars.csv', delim = ",")

## data without column names
read_csv('mtcars1.csv')

## specify column names are absent
read_csv('mtcars1.csv', col_names = FALSE)

## data with comments/text
read_csv('mtcars2.csv')

## skip comments/text 
read_csv('mtcars2.csv', skip = 19)

## specify maximum number of rows to read
read_csv('mtcars.csv', n_max = 20)

## detect column types
spec_csv('mtcars5.csv')

## specify column names
read_csv('mtcars5.csv', 
         col_types = list(col_double(), col_factor(levels = c(4, 6, 8)),
                          col_double(), col_integer()))

## skip particular column
read_csv('mtcars5.csv', 
         col_types = list(col_double(), col_factor(levels = c(4, 6, 8)),
                          col_skip(), col_integer()))

## read specific columns
read_csv('mtcars5.csv', 
         col_types = cols_only(mpg = col_double(), 
                               cyl = col_factor(levels = c(4, 6, 8))))

