
# Meta --------------------------------------------------------------------
## Title:  Combine ACS and Medicaid Expansion Data
## Author: Lisbeth Vargas
## Date Created: 4/16/2025
## Date Edited:  4/16/2025


# Preliminaries -----------------------------------------------------------
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, ggplot2, dplyr, lubridate, readr, readxl, scales, acs, tidyr)

source('/Users/lisbethvargas/Desktop/GitHub/Homework-5/5-1/data-code/ACS.R')
source('/Users/lisbethvargas/Desktop/GitHub/Homework-5/5-1/data-code/Medicaid.R')

# Tidy --------------------------------------------------------------------
final.data <- final.insurance %>%
  left_join(kff.final, by="State") %>%
  mutate(expand_year = year(date_adopted),
       expand = (year>=expand_year & !is.na(expand_year))) %>%
  rename(expand_ever=expanded)

write_tsv(final.data,'/Users/lisbethvargas/Desktop/GitHub/Homework-5/5-1/data/output/acs_medicaid.txt')