## ----load packages-------------------------------------------------------
library(stringr)
library(dplyr)
library(readr)

## ----read data-----------------------------------------------------------
mockstring <- read_csv('https://raw.githubusercontent.com/rsquaredacademy/datasets/master/mock_strings.csv')
mockstring

## ----sample data---------------------------------------------------------
mock_data <-
  mockstring %>%
  slice(1:10) %>%
  select(email, address, full_name, currency, )

mock_data

## ----detect--------------------------------------------------------------
str_detect(mock_data$email, pattern = "@")

## ----count---------------------------------------------------------------
str_count(mock_data$email, pattern = "@")

## ----concatenate---------------------------------------------------------
str_c("email id:", mock_data$email)

## ----split---------------------------------------------------------------
str_split(mock_data$email, pattern = "@")

## ----sort----------------------------------------------------------------
str_sort(mock_data$email)

## ----sort2---------------------------------------------------------------
str_sort(mock_data$email, descending = TRUE)

## ----case----------------------------------------------------------------
str_to_upper(mock_data$full_name)

## ----replace-------------------------------------------------------------
str_replace(mock_data$address, "Street", "ST")

## ----extract-------------------------------------------------------------
str_extract(mock_data$email, pattern = "com")

## ----match---------------------------------------------------------------
str_match(mock_data$email, pattern = "com")

## ----which---------------------------------------------------------------
str_which(mock_data$email, pattern = "com")

## ----locate--------------------------------------------------------------
str_locate(mock_data$email, pattern = "com")

## ----sub-----------------------------------------------------------------
str_sub(mock_data$currency, start = 1, end = 1)

## ----word----------------------------------------------------------------
word(mock_data$full_name, 1)

