## load libraries
library(lubridate)
library(dplyr)
library(magrittr)
library(readr)

## origin
lubridate::origin

## today
now()
today()
am(now())  
pm(now())

## read case study data
transact <- read_csv('https://raw.githubusercontent.com/rsquaredacademy/datasets/master/transact.csv')
transact

## day, month and year
this_day <- as_date('2017-03-23')
day(this_day)
month(this_day)
year(this_day)

## extract day, month and year from due data
transact %>%
  mutate(
    due_day   = day(Due),
    due_month = month(Due),
    due_year  = year(Due)
  )

## course duration
course_start    <- as_date('2017-04-12')
course_end      <- as_date('2017-04-21')
course_duration <- course_end - course_start
course_duration

## compute days to settle invoice
transact %>%
  mutate(
    days_to_pay = Payment - Invoice
  )

## compute days over due
transact %>%
  mutate(
    delay = Payment - Due
  )

## leap year
transact %>%
  mutate(
    due_year = year(Due),
    is_leap  = leap_year(due_year)
  )

## if due day is February 29, is it a leap year?
transact %>%
  mutate(
    due_day   = day(Due),
    due_month = month(Due),
    due_year  = year(Due),
    is_leap   = leap_year(due_year)
  ) %>%
  select(-(Invoice), -(Payment)) %>%
  filter(due_month == 2 & due_day == 29)

## shift dates
course_start + days(2)
course_start + weeks(1)
course_start + years(1)

## interval
interval(course_start, course_end)

## shift interval
course_interval <- interval(course_start, course_end)
course_interval %>%
  int_shift(by = days(1))
course_interval %>%
  int_shift(by = weeks(1))
course_interval %>%
  int_shift(by = years(1))

## overlapping intervals
vacation_start    <- as_date('2017-04-19')
vacation_end      <- as_date('2017-04-25')
vacation_interval <- interval(vacation_start, vacation_end)
int_overlaps(course_interval, vacation_interval)

## how many invoices were settled within due date?
transact %>%
  mutate(
    inv_due_interval = interval(Invoice, Due),
    due_next         = Due + days(1),
    due_pay_interval = interval(due_next, Payment),
    overlaps         = int_overlaps(inv_due_interval, due_pay_interval)
  ) %>%
  select(Invoice, Due, Payment, overlaps)

## how many invoices were settled within due date?
## using int_shift
transact %>%
  mutate(
    inv_due_interval = interval(Invoice, Due),
    due_pay_interval = interval(Due, Payment),  
    due_pay_next     = int_shift(due_pay_interval, by = days(1)),
    overlaps         = int_overlaps(inv_due_interval, due_pay_next)
  ) %>%
  select(Invoice, Due, Payment, overlaps)

## within
conference <- as_date('2017-04-15')
conference %within% interval(course_start, course_end)

## within
transact %>%
  mutate(
    inv_due_interval = interval(Invoice, Due),
    overlaps = Payment %within% inv_due_interval
  ) %>%
  select(Due, Payment, overlaps)

## quarter
course_start
course_start %>%
  quarter()
course_start %>%
  quarter(with_year = TRUE)

## extract quarter from due date
transact %>%
  mutate(
    Quarter = quarter(Due)
  )

## extract quarter with year from due date
transact %>%
  mutate(
    Quarter = quarter(Due, with_year = TRUE)
  )

## duration
course_duration %>%
  as.numeric() %>%
  duration(units = 'days')

## convert unite
interval(course_start, course_end) / dseconds()
interval(course_start, course_end) / dminutes()
interval(course_start, course_end) / dhours()
interval(course_start, course_end) / dweeks()
interval(course_start, course_end) / dyears()

## convert units
interval(course_start, course_end) %>%
  time_length(unit = "seconds")
interval(course_start, course_end) %>%
  time_length(unit = "minutes")
interval(course_start, course_end) %>%
  time_length(unit = "hours")

## convert units
interval(course_start, course_end) %>%
  as.period(unit = "seconds")
interval(course_start, course_end) %>%
  as.period(unit = "minutes")
interval(course_start, course_end) %>%
  as.period(unit = "hours")

