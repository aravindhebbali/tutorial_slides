library(readxl)
library(dplyr)
library(lubridate)
library(forcats)
library(ggplot2)
mba_data <- read_excel("mba/online-retail.xlsx")

View(mba_data)

# when do people purchase
purchase_time <-
  mba_data %>%
  group_by(InvoiceDate) %>%
  slice(1) %>%
  mutate(time_of_day = hour(InvoiceDate)) %>%
  pull(time_of_day) %>%
  as.factor() %>%
  fct_count()

purchase_time %>%
  ggplot() +
  geom_col(aes(x = f, y = n), fill = "blue") +
  xlab("Hour of Day") + ylab("Transactions") +
  ggtitle("Hourly Transaction Distribution")

# how many items are purchase on an average
mba_data %>%
  group_by(InvoiceNo) %>%
  summarize(count = n()) %>%
  pull(count) %>%
  mean()

mba_data %>%
  group_by(InvoiceNo) %>%
  summarize(count = n()) %>%
  pull(count) %>%
  median()  

# most purchased items
mba_data %>%
  group_by(Description) %>%
  summarize(count = n()) %>%
  arrange(desc(count))

# average order value
total_revenue <- 
  mba_data %>%
  group_by(InvoiceNo) %>%
  summarize(order_sum = sum(UnitPrice)) %>%
  pull(order_sum) %>%
  sum()

total_transactions <- 
  mba_data %>%
  group_by(InvoiceNo) %>%
  summarize(n()) %>%
  nrow()

aov <- total_revenue / total_transactions
