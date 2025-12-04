* Peter Chapman, Joshua Koppel, Jackson Bay
* Peter Chapman, Joshua Koppel, Jackson Bay
* ECON422: Econometrics and Causal Analysis
* India Poverty Reduction Final Project

* setting up log file
set logtype text
capture log close
log using "G:\ECON422 India Poverty Reduction Final Project Health and Politics Analysis", replace

* refreshing STATA
clear all
set more off

* Google Drive connection to data
use "G:\pooled_mb.dta"

* summarize data set
describe

* keep just data points from India
keep if country == 4

* random assignment check for baseline index health
ttest index_health_bsl, by(treatment)

* random assignment check for baseline political involvement index
ttest index_political_bsl, by(treatment)

* random assignment check for baseline perceived health status
ttest percep_health_bsl, by(treatment)

* random assignment check for baseline perceived life status
ttest percep_life_bsl, by(treatment)

* translating log file to pdf
log close
translate "G:\ECON422 India Poverty Reduction Final Project Health and Politics Analysis.log" "G:\ECON422 India Poverty Reduction Final Project Health and Politics.pdf", replace