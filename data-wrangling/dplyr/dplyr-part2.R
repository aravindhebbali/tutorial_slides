## load dplyr package
library(dplyr)
library(readr)

## read order data
order <- read_csv('https://raw.githubusercontent.com/rsquaredacademy/datasets/master/order.csv')
order

## read customer data
customer <- read_csv('https://raw.githubusercontent.com/rsquaredacademy/datasets/master/customer.csv')
customer

## inner join
customer %>%
  inner_join(order)

## left join
customer %>%
  left_join(order)

## right join
customer %>%
  right_join(order)

## semi join
customer %>%
  semi_join(order)

## anti join
customer %>%
  anti_join(order)

## full join
customer %>%
  full_join(order)

