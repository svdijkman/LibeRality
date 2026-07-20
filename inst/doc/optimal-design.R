## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(LibeRality)


## ----example------------------------------------------------------------------
example <- lity_example()
design <- example$design
design
lity_validate(design)


## ----information--------------------------------------------------------------
information <- lity_information(design)
information
head(data.frame(
  parameter = names(information$se),
  se = information$se,
  rse = information$rse
))


## ----criteria-----------------------------------------------------------------
evaluation <- lity_evaluate(design, list(
  local_D = lity_criterion_D(),
  robust_D = lity_criterion_robust(lity_criterion_D()),
  max_rse = lity_criterion_rse(summary = "max"),
  cost = lity_criterion_cost(),
  burden = lity_criterion_burden()
))
evaluation


## ----optimise, eval=FALSE-----------------------------------------------------
# criterion <- lity_criterion_compound(
#   list(information = lity_criterion_D(), cost = lity_criterion_cost()),
#   weights = c(0.8, 0.2),
#   reference = c(1, 100000)
# )
# result <- lity_optimise(
#   design, criterion, method = "hybrid",
#   control = list(maxit = 60, particles = 30)
# )
# 
# verification <- lity_simulate_trials(result$design, n = 250)
# lity_report(result, "optimal-design-report.html")

