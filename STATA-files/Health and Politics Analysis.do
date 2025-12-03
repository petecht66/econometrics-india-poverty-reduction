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

* summary statistics for treatment for just India
summarize treatment if control_dcountry4 == 1

* keep just data points from India
keep if country == 4

* translating log file to pdf
log close
translate "G:\ECON422 India Poverty Reduction Final Project Health and Politics Analysis.log" "G:\ECON422 India Poverty Reduction Final Project Health and Politics.pdf", replace