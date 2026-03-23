here::i_am(
  path = "code/02_table_one.R"
)

# Load in clean data
clean_data <- readRDS(
  file = here::here("output/clean_data.rds")
)


library(gtsummary)
library(labelled)

# Create variable labels
var_label(clean_data) <- list(
  uprevis_cat = "Prenatal care visit attendance",
  ptb = "Preterm birth",
  cig_rec_cat = "Smoked cigarettes during pregnancy",
  mager_cat = "Maternal age",
  mracerec_cat = "Maternal race"
)

# Create table one
table_one <- clean_data |>
  select("uprevis_cat", "ptb", "cig_rec_cat", "mager_cat", "mracerec_cat") |>
  tbl_summary(by = uprevis_cat) |>
  modify_caption("**Table 1. Birth characteristics stratified by prenatal care visit attendance**") |> 
  add_overall()


table_one

# Save table one object
saveRDS(
  table_one,
  file = here::here("output/table_one.rds")
)

