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

#add product category for each record
#p = Smartphone, v = TV, x = Laptop, q = Tablet
for (i in 1:nrow(refine_mod)) {
  if (refine_mod[i, "product_code"] == "p") {
    refine_mod[i, "product_category"] = "Smartphone"
  }
  else if (refine_mod[i, "product_code"] == "v") {
    refine_mod[i, "product_category"] = "TV"
  }
  else if (refine_mod[i, "product_code"] == "x") {
    refine_mod[i, "product_category"] = "Laptop"
  }
  else if (refine_mod[i, "product_code"] == "q") {
    refine_mod[i, "product_category"] = "Tablet"
  }
    
}




