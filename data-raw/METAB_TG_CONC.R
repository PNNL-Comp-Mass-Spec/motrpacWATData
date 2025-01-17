library(MotrpacRatTraining6moWATData)
library(tidyverse)
library(Biobase)

## See landscape paper methods "Non-targeted LC-MS/MS lipidomics"

# Triacylglyceride concentrations (normalized to internal standard)
conc_data <- file.path("data-raw", "WAT_TAG_concentration.csv") %>%
  read.csv(check.names = FALSE) %>%
  dplyr::rename(bid = vialLabel) %>%
  dplyr::select(bid, any_of(featureNames(METAB_EXP))) %>%
  column_to_rownames("bid") %>%
  t() %>%
  .[, as.character(METAB_EXP$bid)] %>%
  `colnames<-`(sampleNames(METAB_EXP))

# Create ExpressionSet
METAB_TG_CONC <- METAB_EXP[rownames(conc_data), ]

exprs(METAB_TG_CONC) <- conc_data

pData(METAB_TG_CONC) <- pData(METAB_TG_CONC) %>%
  mutate(total_TG = colSums(conc_data)) %>%
  group_by(sex, timepoint, exp_group) %>%
  transmute(median_total_TG = median(total_TG)) %>%
  ungroup() %>%
  as.data.frame() %>%
  `rownames<-`(sampleNames(METAB_EXP))

METAB_TG_CONC <- METAB_TG_CONC[, order(METAB_TG_CONC$exp_group)]

# Median concentration by metabolite (used to select features for heatmap later)
fData(METAB_TG_CONC) <- fData(METAB_TG_CONC) %>%
  mutate(median_conc = apply(exprs(METAB_TG_CONC), 1, median),
         rank = rank(-median_conc))

# Extract median values and standardize for heatmap
METAB_TG_CONC <- METAB_TG_CONC %>%
  as.MSnSet.ExpressionSet() %>%
  t() %>%
  combineFeatures(groupBy = METAB_TG_CONC$exp_group,
                  method = median,
                  cv = FALSE) %>%
  scale() %>%
  t() %>%
  .[, levels(METAB_EXP$exp_group)] %>%
  as.ExpressionSet.MSnSet()

# Convert characters back to factors
pData(METAB_TG_CONC) <- pData(METAB_TG_CONC) %>%
  mutate(across(.cols = where(is.character),
                .fns = ~ factor(.x, levels = unique(.x))))

# Save
usethis::use_data(METAB_TG_CONC, internal = FALSE, overwrite = TRUE,
                  version = 3, compress = "bzip2")


