library(readxl)
refine_original <- read_excel("refine_original.csv")
View(refine_original)
refine_clean = refine_original
library(dplyr)
library(tidyr)

#fix company names
refine_clean$company <- gsub(".*s$", "philips", refine_clean$company, ignore.case = TRUE)
refine_clean$company <- gsub("ak.*", "akzo", refine_clean$company, ignore.case = TRUE)
refine_clean$company <- gsub("van h.*", "van houten", refine_clean$company, ignore.case = TRUE)
refine_clean$company <- gsub("^u.*", "unilever", refine_clean$company, ignore.case = TRUE)

#separate product code and number into two columns
refine_clean <- separate(refine_clean, "Product code / number", c("product_code", "product_number"), sep = "-")

#add product category for each record
#p = Smartphone, v = TV, x = Laptop, q = Tablet
for (i in 1:nrow(refine_clean)) {
  if (refine_clean[i, "product_code"] == "p") {
    refine_clean[i, "product_category"] = "Smartphone"
  }
  else if (refine_clean[i, "product_code"] == "v") {
    refine_clean[i, "product_category"] = "TV"
  }
  else if (refine_clean[i, "product_code"] == "x") {
    refine_clean[i, "product_category"] = "Laptop"
  }
  else if (refine_clean[i, "product_code"] == "q") {
    refine_clean[i, "product_category"] = "Tablet"
  }
    
}
View(refine_clean)

#concatenate address columns to full_address, separate with commas
refine_clean$full_address <- paste(refine_clean$address, ", ", refine_clean$city, ", ", refine_clean$country)


#Add four binary (1 or 0) columns for company:
#company_philips, company_akzo, company_van_houten and company_unilever.
for (i in 1:nrow(refine_clean)) {
  if (refine_clean[i, "company"] == "philips") {
    refine_clean[i, "company_philips"] = 1
  }
  else {
    refine_clean[i, "company_philips"] = 0
  }
  if (refine_clean[i, "company"] == "akzo") {
    refine_clean[i, "company_akzo"] = 1
  }
  else {
    refine_clean[i, "company_akzo"] = 0
  }
  if (refine_clean[i, "company"] == "van houten") {
    refine_clean[i, "company_van_houten"] = 1
  }
  else {
    refine_clean[i, "company_van_houten"] = 0
  }
  if (refine_clean[i, "company"] == "unilever") {
    refine_clean[i, "company_unilever"] = 1
  }
  else {
    refine_clean[i, "company_unilever"] = 0
  }
}


#Add four binary (1 or 0) columns for product category:
#product_smartphone, product_tv, product_laptop and product_tablet.
for (i in 1:nrow(refine_clean)) {
  if (refine_clean[i, "product_category"] == "Smartphone") {
    refine_clean[i, "product_smartphone"] = 1
  }
  else {
    refine_clean[i, "product_smartphone"] = 0
  }
  if (refine_clean[i, "product_category"] == "TV") {
    refine_clean[i, "product_tv"] = 1
  }
  else {
    refine_clean[i, "product_tv"] = 0
  }
  if (refine_clean[i, "product_category"] == "Laptop") {
    refine_clean[i, "product_laptop"] = 1
  }
  else {
    refine_clean[i, "product_laptop"] = 0
  }
  if (refine_clean[i, "product_category"] == "Tablet") {
    refine_clean[i, "product_tablet"] = 1
  }
  else {
    refine_clean[i, "product_tablet"] = 0
  }
}
