* Peter Chapman, Joshua Koppel, Jackson Bay
* ECON422: Econometric Methods for Causal Analysis
* India Poverty Reduction Final Project

* setting up log file
set logtype text
capture log close
log using "G:\ECON422 India Poverty Reduction Final Project", replace

* refreshing STATA
clear all
set more off

* Google Drive connection to data
use "G:\pooled_hh.dta"

* summarize data set
describe

* switch data set
use "G:\pooled_mb.dta", clear

* summarize new data set
describe

* translating log file to pdf
log close
translate "G:\ECON422 India Poverty Reduction Final Project.log" "G:\ECON422 India Poverty Reduction Final Project.pdf", replace