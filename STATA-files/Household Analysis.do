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

* create variable for total monthly income baseline
gen total_baseline_income = (iagri_month_bsl + ibusiness_month_bsl + ipaidlabor_month_bsl)

* random assignment check for total monthly income baseline
ttest total_baseline_income, by(treatment)

* random assignment check for total asset index
ttest asset_index_bsl, by(treatment)

* random assignment check for total asset index of the household
ttest asset_hh_index_bsl, by(treatment)

* random assignment check for total monthly spending per capita
ttest ctotal_pcmonth_bsl, by(treatment)

* random assignment check for food security index
ttest index_foodsecurity_bsl, by(treatment)

* create variables for total monthly income: endline-1 and endline-2
gen total_end1_income = (iagri_month_end + ibusiness_month_end + ipaidlabor_month_end)
gen total_end2_income = (iagri_month_fup + ibusiness_month_fup + ipaidlabor_month_fup)

* create regressions for total income
regress total_end1_income treatment total_baseline_income, r
regress total_end2_income treatment total_baseline_income, r

* create regressions for total monthly spending per capita
regress ctotal_pcmonth_end treatment ctotal_pcmonth_bsl, r
regress ctotal_pcmonth_fup treatment ctotal_pcmonth_bsl, r

* create regressions for total asset index
regress asset_index_end treatment asset_index_bsl, r
regress asset_index_fup treatment asset_index_bsl, r

* translating log file to pdf
log close
translate "G:\ECON422 India Poverty Reduction Final Project Household Analysis.log" "G:\ECON422 India Poverty Reduction Final Project Household Analysis.pdf", replace