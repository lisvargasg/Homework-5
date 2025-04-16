# Meta --------------------------------------------------------------------
## Title:  Medicaid Expansion
## Author: Lisbeth Vargas
## Date Created: 4/16/2025
## Date Edited:  4/16/2025

# Preliminaries -----------------------------------------------------------
kff.dat <- read_csv('5-1/data/input/data-ZJUAA.csv')

# Clean KFF data -------------------------------------------------------
kff.final <- kff.dat %>%
  mutate(expanded = (`Expansion Status` == 'Adopted and Implemented'),
         Description = str_replace_all(Description,c("\n"='','"'='')))

kff.final$splitvar <- kff.final %>% select(Description) %>% as.data.frame() %>%
  separate(Description, sep=" ", into=c(NA, NA, NA, "date"))

kff.final <- kff.final %>%
  mutate(date_adopted = mdy(splitvar$date)) %>%
  select(State, expanded, date_adopted)

write_tsv(kff.final,'/Users/lisbethvargas/Desktop/GitHub/Homework-5/5-1/data/output/medicaid_expansion.txt')