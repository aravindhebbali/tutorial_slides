## load packages
library(magrittr)
library(readr)
library(purrr)

## read data
ecom <- read_csv('https://raw.githubusercontent.com/rsquaredacademy/datasets/master/web.csv')
ecom

## head
head(ecom, 10)

## head - using pipe
ecom %>% head(10)

## compute square root
y <- ecom$n_pages
y <- sqrt(y)
head(y)

## compute square root - using pipe
# select n_pages variable and assign it to y
y <- ecom %$% n_pages
head(y)

# compute square root of y and assign it to y 
y %<>% sqrt()
head(y)

## compute square root - using pipe
y <- 
  ecom %$% 
  n_pages %>% 
  sqrt() %>%
  head()
y

## correlation
ecom1 <- subset(ecom, purchase == 'true')
cor(ecom1$n_pages, ecom1$duration)

# correlation with pipe
ecom %>%
  subset(purchase == 'true') %$% 
  cor(n_pages, duration)

## bar plot
barplot(table(subset(ecom, purchase == 'true')$referrer))

## bar plot - using pipe
ecom %>%
  subset(purchase == 'true') %>%
  extract('referrer') %>%
  table() %>%
  barplot()

## regression
summary(lm(duration ~ n_pages, data = ecom))

## regression - using pipe
ecom %$%
  lm(duration ~ n_pages) %>%
  summary()

## string manipulation
email <- 'jovialcann@anymail.com'

# without pipe
toupper(strtrim(strsplit(email, '@')[[1]][1], 6))

# with pipe
email %>%
  strsplit(split = '@') %>%
  extract2(1) %>%
  extract(1) %>%
  strtrim(width = 6) %>%
  toupper()

## with pipe
email %>%
  strsplit(split = '@') %>%
  map_chr(1) %>%
  strtrim(width = 6) %>%
  toupper()

## extract column by name
head(ecom['n_pages'], 3)

ecom %>%
  extract('n_pages') %>%
  head(3)

## extract column by position
head(ecom[6], 3)

ecom %>%
  extract(6) %>%
  head(3)

## extract column as vector
head(ecom$n_pages)

ecom %>%
  use_series('n_pages') %>%
  head()

## extract list element by name
mt <- as.list(mtcars)

mt[['mpg']]

mt %>%
  extract2('mpg')

## extract list element by position
mt <- as.list(mtcars)

mt[[1]]

mt %>%
  extract2(1)

## extract list element as vector
mt <- as.list(mtcars)

mt$mpg

mt %>%
  use_series(mpg)

## addition
1:10 %>%
  `+`(1)

1:10 %>%
  add(1)

## multiplication
1:10 %>%
  `*`(3)

1:10 %>%
  multiply_by(3)

## division
1:10 %>%
  `/`(2)

1:10 %>%
  divide_by(2)

## power
1:10 %>%
  `^`(2)

1:10 %>%
  raise_to_power(2)

## greater than
1:10 %>%
  `>`(5)

1:10 %>%
  is_greater_than(5)

## weakly greater than
1:10 %>%
  `>=`(5)

1:10 %>%
  is_weakly_greater_than(5)

