refine_mod = refine_original
library(dplyr)
library(tidyr)

#fix company names
refine_mod$company <- gsub(".*s$", "philips", refine_mod$company, ignore.case = TRUE)
refine_mod$company <- gsub("ak.*", "akzo", refine_mod$company, ignore.case = TRUE)
refine_mod$company <- gsub("van h.*", "van houten", refine_mod$company, ignore.case = TRUE)
refine_mod$company <- gsub("^u.*", "unilever", refine_mod$company, ignore.case = TRUE)

#separate product code and number into two columns

refine_mod <- separate(refine_mod, "Product code / number", c("product_code", "product_number"), sep = "-")
