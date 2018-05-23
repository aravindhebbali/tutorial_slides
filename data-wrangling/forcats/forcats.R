## ----load packages-------------------------------------------------------
library(forcats)
library(magrittr)
library(dplyr)
library(readr)

## ----read data-----------------------------------------------------------
traffic <- read_csv('https://raw.githubusercontent.com/rsquaredacademy/datasets/master/web_traffic.csv',
  col_types = list(col_factor(levels = c("google", "facebook", "affiliates", 
    "bing", "yahoo", "twitter", "instagram", "unknown", "direct"))))

traffic

## ----read data-----------------------------------------------------------
traffics <- 
  traffic %>%
  use_series(traffics)

traffics

## ----count---------------------------------------------------------------
fct_count(traffics)

## ----levels--------------------------------------------------------------
levels(traffics)

## ----order levels by frequency-------------------------------------------
traffics %>%
  fct_infreq() %>%
  levels()

## ----order levels by appearance------------------------------------------
traffics %>%
  fct_inorder() %>%
  levels()

## ----reverse levels------------------------------------------------------
traffics %>%
  fct_rev() %>%
  levels()

## ----tabulate------------------------------------------------------------
fct_count(traffics)

## ----collapse levels-----------------------------------------------------
traffics %>% 
  fct_collapse(
  social = c("facebook", "twitter", "instagram"),
  search = c("google", "bing", "yahoo")) %>% 
  fct_count() 

## ----lump levels---------------------------------------------------------
traffics %>% 
  fct_lump() %>% 
  table()

## ----retain top 3 referrers----------------------------------------------
traffics %>% 
  fct_lump(n = 3) %>% 
  table()


## ----retain referrers driving >10% traffic-------------------------------
traffics %>% 
  fct_lump(prop = 0.1) %>% 
  table()


## ----retain referrers driving >10% traffic-------------------------------
traffics %>% 
  fct_lump(prop = 0.15) %>% 
  table()

## ----retain 3 referrers with lowest traffic------------------------------
traffics %>% 
  fct_lump(n = -3) %>% 
  table()

## ----retain 3 referrers with < 10% traffic-------------------------------
traffics %>% 
  fct_lump(prop = -0.1) %>% 
  table()

## ----replace levels with other-------------------------------------------
fct_other(traffics, keep = c("google", "yahoo")) %>%
  levels()

## ----replace levels with other-------------------------------------------
fct_other(traffics, drop = c("instagram", "twitter")) %>%
  levels()

## ----recode levels-------------------------------------------------------
fct_recode(traffics, search = "bing", search = "yahoo", search = "google",
  social = "facebook", social = "twitter", social = "instagram") %>%
  levels()

## ----relevel-------------------------------------------------------------
fct_relevel(traffics, "twitter") %>%
  levels()

## ----relevel-------------------------------------------------------------
fct_relevel(traffics, "google", after = 2) %>%
  levels()

## ----relevel-------------------------------------------------------------
fct_relevel(traffics, "facebook", after = Inf) %>%
  levels()

## ----read data-----------------------------------------------------------
response <- read_csv('https://raw.githubusercontent.com/rsquaredacademy/datasets/master/response.csv',
  col_types = list(col_factor(levels = c("like", "like somewhat", "neutral", 
    "dislike somewhat", "dislike"), ordered = TRUE)))

response

## ----read data-----------------------------------------------------------
responses <- 
  response %>%
  use_series(response)

responses

## ----shift levels--------------------------------------------------------
fct_shift(responses, 2) %>%
  levels()

## ----shift levels--------------------------------------------------------
fct_shift(responses, -2) %>%
  levels()

