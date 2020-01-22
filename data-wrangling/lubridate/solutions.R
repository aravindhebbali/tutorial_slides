# load libraries
library(lubridate)

# Section 1: Introduction

# current date
Sys.Date()
today()

# current time
Sys.time()
now()

# check whether the time occurs in am or pm?
am(now())
pm(now())

# check whether the following years were leap years
leap_year(2018)
leap_year(2016)

# Section 3: Date & Time Classes

# R 1.0.0 was released on `2000-02-29 08:55:23 UTC`. Save it as 

# `Date` using character 
as.Date("2000-02-29")

# `Date` using origin and number
as.Date(11016, origin = "1970-01-01")

# `POSIXct`
as.POSIXct("2000-02-29 08:55:23", tz = "UTC")

# `POSIXlt` 
r_1 <- as.POSIXlt("2000-02-29 08:55:23", tz = "UTC")

# and extract the following
# month day
r_1$mday

# day of year
r_1$yday

# month
r_1$mon

# zone
attr(r_1, "tzone")

# ISODate
ISOdate(year  = 2000,
        month = 02,
        day   = 29,
        hour  = 08,
        min   = 55,
        sec   = 23, 
        tz    = "UTC")

# Section 4: Date Arithmetic

# compute the length of a vacation which begins on `2020-04-19` and ends on 
# `2020-04-25`
vacation_start <- as.Date("2020-04-19")
vacation_end   <- as.Date("2020-04-25")
vacation_end - vacation_start

# recompute the length of the vacation after shifting the vacation start and 
# end date by `10` days and `2` weeks
vacation_start <- vacation_start + days(10)
vacation_end   <- vacation_end + weeks(2)
vacation_end - vacation_start

# compute the days to settle invoice and days overdue from the `receivables.csv` 
# data set
library(readr)
library(dplyr)

receivables <- 
  read_csv("https://raw.githubusercontent.com/rsquaredacademy-education/datasets/master/receivables.csv",
          col_types = list(
            col_double(), col_character(), col_double(), col_date("%m/%d/%Y"),
            col_date("%m/%d/%Y"), col_double(), col_date("%m/%d/%Y"), 
            col_character()
          ))

# method 1
receivables$settled_date - receivables$invoice_date

# method 2
dplyr::mutate(receivables, days_to_pay = settled_date - invoice_date)

# compute the length of employment (only for those employees who have been 
# terminated) from the `hr-data.csv` data set (use date of hire and termination) 
hr_data <- read_csv("https://raw.githubusercontent.com/rsquaredacademy-education/datasets/master/hr-data.csv",
                    col_types = cols_only(
                      Employee_Name = col_character(), 
                      Termd = col_factor(levels = c(0, 1)),
                      DateofHire = col_date("%m/%d/%Y"),
                      DateofTermination = col_character()
                    ))

# filter using Termd (termination) column
hr_data <- filter(hr_data, Termd == 1)
hr_data$DateofTermination <- as.Date(hr_data$DateofTermination, 
                                     format = "%m/%d/%y")

# length of employment
# method 1
hr_data$DateofTermination - hr_data$DateofHire

# method 2
mutate(hr_data, employment_duration = DateofTermination - DateofHire)

# Section 5: Timezones & Daylight Savings

# check the timezone you live in
Sys.timezone()

# check if daylight savings in on
dst(Sys.Date())

# check the current time in **UTC** or a different time zone 
lubridate::with_tz(Sys.time(), "UTC")

# Section 6: Date & Time Formats

# Below, we have specified `July 5th, 2019` in different ways. Specify the 
# correct format for each of them.

# `July-05-19`
as.Date("July-05-19", format = "%B-%d-%y")

# `JUL-05-19`
as.Date("JUL-05-19", format = "%b-%d-%y")

# `05.07.19`
as.Date("05.07.19", format = "%d.%m.%y")

# `5-July 2019`
as.Date("5-July 2019", format = "%d-%B %Y")

# `July 5th, 2019`
as.Date("July 5th, 2019", format = "%B %dth, %Y")

# `July 05, 2019`
as.Date("July 05, 2019", format = "%B %d, %Y")

# `2019-July-05`
as.Date("2019-July-05", format = "%Y-%B-%d")

# `05/07/2019`
as.Date("05/07/2019", format = "%d/%m/%Y")

# `07/05/2019`
as.Date("07/05/2019", format = "%m/%d/%Y")

# `7/5/2019`
as.Date("7/5/2019", format = "%m/%d/%Y")

# `07/5/19`
as.Date("07/5/2019", format = "%m/%d/%Y")

# `2019-07-05`
as.Date("2019-07-05", format = "%Y-%m-%d")

# Section 7: Parse Date & Time

# Below, we have specified `July 5th, 2019` in different ways. Parse the dates 
# using `strptime()` or `parse_date_()` or any other helper function.

# `July-05-19`
mdy("July-05-19")
strptime("July-05-19", format = "%B-%d-%y")
parse_date("July-05-19", format = "%B-%d-%y")

# `JUL-05-19`
mdy("JUL-05-19")
strptime("JUL-05-19", format = "%b-%d-%y")
parse_date("JUL-05-19", format = "%b-%d-%y")

# `05.07.19`
dmy("05.07.19")
strptime("05.07.19", format = "%d.%m.%y")
parse_date("05.07.19", format = "%d.%m.%y")

# `5-July 2019`
dmy("5-July 2019")
strptime("5-July 2019", format = "%d-%B %Y")
parse_date("5-July 2019", format = "%d-%B %Y")

# `July 5th, 2019`
mdy("July 5th, 2019")
strptime("July 5th, 2019", format = "%B %dth, %Y")
parse_date("July 5th, 2019", format = "%B %dth, %Y")

# `July 05, 2019`
mdy("July 05, 2019")
strptime("July 05, 2019", format = "%B %d, %Y")
parse_date("July 05, 2019", format = "%B %d, %Y")

# `2019-July- 05`
ymd("2019-July- 05")
strptime("2019-July-05", format = "%Y-%B-%d")
parse_date("2019-July-05", format = "%Y-%B-%d")

# `05/07/2019`
dmy("05/07/2019")
strptime("05/07/2019", format = "%d/%m/%Y")
parse_date("05/07/2019", format = "%d/%m/%Y")

# `07/05/2019`
mdy("07/05/2019")
strptime("07/05/2019", format = "%m/%d/%Y")
parse_date("07/05/2019", format = "%m/%d/%Y")

# `7/5/2019`
mdy("7/5/2019")
strptime("7/5/2019", format = "%m/%d/%Y")
parse_date("7/5/2019", format = "%m/%d/%Y")

# `07/5/19`
mdy("07/5/19")
strptime("07/5/2019", format = "%m/%d/%Y")
parse_date("07/5/2019", format = "%m/%d/%Y")

# `2019-07-05`
ymd("2019-07-05")
strptime("2019-07-05", format = "%Y-%m-%d")
parse_date("2019-07-05", format = "%Y-%m-%d")

# Section 8: Date & Time Components

# Get the R release dates using `r_versions()` from the **rversions** package 
# and tabulate the following
rr <- rversions::r_versions()

# year 
table(year(rr$date))

# month with label
table(month(rr$date, label = TRUE))

# weekday with label
table(wday(rr$date, label = TRUE))

# hour
table(hour(rr$date))

# and quarter
table(quarter(rr$date))

# Section 9: Create, Update & Verify

# R 2.0.0 was released on `2004-10-04 14:24:38`. Create this date using both
# `make_date()` and `make_datetime()`
r2_date <- make_date(year  = 2004,
                     month = 10,
                     day   = 04)

r2_date_time <- make_datetime(year  = 2004,
                              month = 10,
                              day   = 04,
                              hour  = 14,
                              min   = 24,
                              sec   = 38)

# R 3.0.0 was released on `2013-04-03 07:12:36`. Update the date created in the
# previous step to the above using `update()`.
update(r2_date, 
       year  = 2013, 
       month = 04, 
       day   = 03)

update(r2_date_time,
       year  = 2013,
       month = 04,
       day   = 03,
       hour  = 07,
       min   = 12,
       sec   = 36)

# round up R release dates to hours
ceiling_date(rr$date, "hour")

# round down R release dates to minutes
floor_date(rr$date, "minutes")

# rollback R release dates to the beginning of the month
rollback(rr$date, roll_to_first = TRUE)



