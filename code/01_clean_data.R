here::i_am(
  path = "code/01_clean_data.R"
)

# Load in raw data
load(file = here::here("raw_data/birthsamp.RData"))


library(tidyverse)

# Inspect variables
str(birthsamp$combgest)
str(birthsamp$uprevis)
str(birthsamp$cig_rec)
str(birthsamp$mager)
str(birthsamp$mracerec)

table(birthsamp$combgest, useNA ='always')
table(birthsamp$uprevis, useNA ='always')
table(birthsamp$cig_rec, useNA ='always')
table(birthsamp$mager, useNA ='always')
table(birthsamp$mracerec, useNA ='always')


# Clean variables
birthsamp_clean <- birthsamp |> 
  mutate(
    ptb = case_when(
      combgest %in% c(98,99) ~ NA,
      combgest < 37 ~ 1,
      .default = 0),
    uprevis_cat = case_when(
      uprevis == 99 ~ NA,
      uprevis < 12 ~ 1,
      uprevis < 15 ~ 2,
      .default = 3),
    cig_rec_cat = case_when(
      cig_rec == "N" ~ "No",
      cig_rec == "Y" ~ "Yes",
      .default = NA),
    mager_cat = case_when(
      mager <=19 ~ 1,
      mager < 30 ~ 2,
      mager < 35 ~ 3,
      mager < 40 ~ 4,
      .default = 5)
  )

# Check variable conversions
table(birthsamp_clean$combgest, birthsamp_clean$ptb, useNA ='always')
table(birthsamp_clean$ptb, useNA ='always') |> prop.table()

table(birthsamp_clean$uprevis, birthsamp_clean$uprevis_cat, useNA ='always')
table(birthsamp_clean$uprevis_cat, useNA ='always') |> prop.table()

table(birthsamp_clean$cig_rec, birthsamp_clean$cig_rec_cat, useNA ='always')
table(birthsamp_clean$cig_rec_cat, useNA ='always') |> prop.table()

table(birthsamp_clean$mager, birthsamp_clean$mager_cat, useNA ='always')
table(birthsamp_clean$mager_cat, useNA ='always') |> prop.table()


# Create factor variables - first group listed is the reference group
birthsamp_clean$uprevis_cat <-
  factor(birthsamp_clean$uprevis_cat,
         levels = 1:3,
         labels = c("< 12 visits",
                    "12 to 14 visits",
                    ">= 15 visits"))

birthsamp_clean$cig_rec_cat <-
  factor(birthsamp_clean$cig_rec_cat,
         levels = c("No","Yes"))

birthsamp_clean$mager_cat <-
  factor(birthsamp_clean$mager_cat,
         levels = 1:5,
         labels = c("<= 19",
                    "20-29",
                    "30-34",
                    "35-39",
                    ">= 40"))

birthsamp_clean$mracerec_cat <-
  factor(birthsamp_clean$mracerec,
         levels = 1:4,
         labels = c("White",
                    "Black",
                    "American Indian/Alaskan Native",
                    "Asian/Pacific Islander"))


table(birthsamp_clean$uprevis_cat, useNA ='always') |> prop.table()
table(birthsamp_clean$cig_rec_cat, useNA ='always') |> prop.table()
table(birthsamp_clean$mager_cat, useNA ='always') |> prop.table()
table(birthsamp_clean$mracerec_cat, useNA ='always') |> prop.table()
table(birthsamp_clean$mracerec, birthsamp_clean$mracerec_cat, useNA ='always')


# Remove rows with missing exposure, outcome, covariate info
study_vars <- c("ptb","uprevis_cat","cig_rec_cat","mager_cat","mracerec_cat")

birthsamp_clean <- birthsamp_clean |> 
  # if_all() returns TRUE if all study vars are non-missing
  filter(if_all(all_of(study_vars), ~ !is.na(.)))


# Save clean data as an .rds object
saveRDS(
  birthsamp_clean,
  file = here::here("output/clean_data.rds")
)



