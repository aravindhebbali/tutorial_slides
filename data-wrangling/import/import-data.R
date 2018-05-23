## load readxl and haven packages
library(readxl)
library(haven)

## list sheets in sample.xls
excel_sheets('sample.xls')

## read data from sheet 1 from sample.xls
read_excel('sample.xls', sheet = 1)

## read data in cells B1:C4
read_excel('sample.xls', sheet = 1, range = "B1:C4")

## read specific cells
read_excel('sample.xls', sheet = 1, col_names = FALSE,
  range = anchored("A4", dim = c(3, 2)))

## read specific cells
read_excel('sample.xls', sheet = 1,
  range = cell_limits(c(1, 1), c(6, 4)))

## read specific cells
read_excel('sample.xls', sheet = 1,
  range = cell_limits(c(1, 2), c(NA, NA)))

## read specific cells
read_excel('sample.xls', sheet = 1,
  range = cell_limits(c(1, NA), c(NA, 2)))

## read single column
read_excel('sample.xls', sheet = 1, range = cell_cols(2))

## read specific rows
read_excel('sample.xls', sheet = 1, range = cell_rows(1:4))

## read multiple columns
read_excel('sample.xls', sheet = 1, range = cell_cols(2:3))

## read data from stata file
read_stata('airline.dta')  

## read data from spss file
read_spss('employee.sav')  

## read data from sas file
read_sas('airline.sas7bdat')

