## load packages
library(tibble)
library(dplyr)

## create tibble
tibble(x = letters,
       y = 1:26,
       z = sample(100, 26))

## never changes input types
tibble(x = letters,
       y = 1:26,
       z = sample(100, 26))

## compare tibble to data.frame which changes input types
data <- data.frame(x = letters, y = 1:26, z = sample(100, 26))
str(data)

## never adjusts variable names
names(data.frame(`order value` = 10))
names(tibble(`order value` = 10))

## never prints all rows
x <- 1:100
y <- letters[1]
z <- sample(c(TRUE, FALSE), 100, replace = TRUE)
tibble(x, y, z)

## never recycles vector of length greater than 1
 x <- 1:100
 y <- letters
 z <- sample(c(TRUE, FALSE), 100, replace = TRUE)
 tibble(x, y, z)


## create tibble from vectors
browsers <- c('chrome', 'safari', 'firefox', 'edge')
enframe(browsers)

## create tibble from vectors
browsers <- c(chrome = 40, firefox = 20, edge = 30, safari = 10)
enframe(browsers)

## create tibble using tribble
tribble(
  ~x, ~y, ~z,
  #--|--|----
  1, TRUE, 'a',
  2, FALSE, 'b'
)

## column names
tibble(
  ` `  = 'space',
  `2`  = 'integer',
  `:)` = 'smiley'
)

## add rows
browsers <- enframe(c(chrome = 40, firefox = 20, edge = 30))
browsers

## add rows
add_row(browsers, name = 'safari', value = 10)

## add rows
add_row(browsers, name = 'safari', value = 10, .before = 2)

## add column
browsers <- enframe(c(chrome = 40, firefox = 20, edge = 30, safari = 10))
add_column(browsers, visits = c(4000, 2000, 3000, 1000))

## remove rownames
remove_rownames(mtcars)

## convert rownames to column
head(rownames_to_column(mtcars))

## convert column to rowname
mtcars_tbl <- rownames_to_column(mtcars)
column_to_rownames(mtcars_tbl)

## get a glimpse of data
glimpse(mtcars)

## check if an object is a tibble
is_tibble(mtcars)
is_tibble(as_tibble(mtcars))

## check if data has rownames
has_rownames(mtcars)

## check if a column is present in a tibble
has_name(mtcars, 'cyl')
has_name(mtcars, 'gears')

