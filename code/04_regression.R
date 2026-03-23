here::i_am(
  path = "code/04_regression.R"
)

# Load in clean data
clean_data <- readRDS(
  file = here::here("output/clean_data.rds")
)

library(gtsummary)
library(labelled)

# Create labels for variables
var_label(clean_data) <- list(
  uprevis_cat = "Prenatal care visit attendance",
  ptb = "Preterm birth",
  cig_rec_cat = "Smoked cigarettes during pregnancy",
  mager_cat = "Maternal age",
  mracerec_cat = "Maternal race"
)

# Fit log binomial regression model
mod <- glm(
  ptb ~ uprevis_cat + cig_rec_cat + mager_cat + mracerec_cat,
  data = clean_data,
  family = binomial (link = 'log')
)

# Create table
regression_table <- 
  tbl_regression(mod,
                 exponentiate = TRUE,
                 include = uprevis_cat) |> # only display the exposure variable
  modify_column_hide(columns = p.value) |>
  modify_caption(
    "**Table 2. Effect of prenatal care visit attendance on preterm birth incidence**") |> 
  modify_table_styling(
    columns = everything(),
    footnote = "Adjusted for maternal race, age, and smoking status."
  )

regression_table


# Save regression table
saveRDS(
  regression_table,
  file = here::here("output/regression_table.rds")
)
