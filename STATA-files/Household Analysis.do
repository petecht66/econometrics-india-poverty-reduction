* Peter Chapman, Joshua Koppel, Jackson Bay
* ECON422: Econometric Methods for Causal Analysis
* India Poverty Reduction Final Project

* setting up log file
set logtype text
capture log close
log using "G:\ECON422 India Poverty Reduction Final Project Household Analysis", replace

* refreshing STATA
clear all
set more off

* Google Drive connection to data
use "G:\pooled_hh.dta"

* summarize data set
describe

* summarizing treatment and country variables
summarize treatment
summarize country

* identify proportion of India that received intervention
summarize treatment if country == 4

* subset data set to just India
keep if country == 4

* random assignment check for asset value index of households
summarize asset_hh_index_bsl if treatment == 1
summarize asset_hh_index_bsl if treatment == 0

* random assignment check for total monthly spending
summarize ctotal_pcmonth_bsl if treatment == 1
summarize ctotal_pcmonth_bsl if treatment == 0
ttest ctotal_pcmonth_bsl, by(treatment)

* regression for asset value index of households
regress asset_hh_index_end treatment asset_hh_index_bsl, r
regress asset_hh_index_fup treatment asset_hh_index_bsl, r

* regression for total monthly spending
regress ctotal_pcmonth_end treatment ctotal_pcmonth_bsl, r
regress ctotal_pcmonth_fup treatment ctotal_pcmonth_bsl, r

* translating log file to pdf
log close
translate "G:\ECON422 India Poverty Reduction Final Project Household Analysis.log" "G:\ECON422 India Poverty Reduction Final Project Household Analysis.pdf", replace