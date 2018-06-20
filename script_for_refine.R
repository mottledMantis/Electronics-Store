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

#concatenate address columns to full_address, separate with commas
refine_mod$full_address <- paste(refine_mod$address, ", ", refine_mod$city, ", ", refine_mod$country)


#Add four binary (1 or 0) columns for company:
#company_philips, company_akzo, company_van_houten and company_unilever.
for (i in 1:nrow(refine_mod)) {
  if (refine_mod[i, "company"] == "philips") {
    refine_mod[i, "company_philips"] = 1
  }
  else {
    refine_mod[i, "company_philips"] = 0
  }
  if (refine_mod[i, "company"] == "akzo") {
    refine_mod[i, "company_akzo"] = 1
  }
  else {
    refine_mod[i, "company_akzo"] = 0
  }
  if (refine_mod[i, "company"] == "van houten") {
    refine_mod[i, "company_van_houten"] = 1
  }
  else {
    refine_mod[i, "company_van_houten"] = 0
  }
  if (refine_mod[i, "company"] == "unilever") {
    refine_mod[i, "company_unilever"] = 1
  }
  else {
    refine_mod[i, "company_unilever"] = 0
  }
}


#Add four binary (1 or 0) columns for product category:
#product_smartphone, product_tv, product_laptop and product_tablet.
for (i in 1:nrow(refine_mod)) {
  if (refine_mod[i, "product_category"] == "Smartphone") {
    refine_mod[i, "product_smartphone"] = 1
  }
  else {
    refine_mod[i, "product_smartphone"] = 0
  }
  if (refine_mod[i, "product_category"] == "TV") {
    refine_mod[i, "product_tv"] = 1
  }
  else {
    refine_mod[i, "product_tv"] = 0
  }
  if (refine_mod[i, "product_category"] == "Laptop") {
    refine_mod[i, "product_laptop"] = 1
  }
  else {
    refine_mod[i, "product_laptop"] = 0
  }
  if (refine_mod[i, "product_category"] == "Tablet") {
    refine_mod[i, "product_tablet"] = 1
  }
  else {
    refine_mod[i, "product_tablet"] = 0
  }
}
