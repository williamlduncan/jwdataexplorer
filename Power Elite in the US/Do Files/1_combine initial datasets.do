
************Author: William Duncan**************************
************Last Edited: 9/9/2018***************************
************Import and Clean University Elite Data**********

clear all
set more off
import excel "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Data\OD_Power Elite.xls", sheet("people") firstrow

drop if University == 0
drop Foundation ThinkTank Corporation PresidentialCommission Forbes400rank Fortune500rank ThinkTankrank CorporatePolicyNetwork lastname name category Universityrank
sort organization

collapse (sum) University, by(organization)
rename University no_elites
replace organization = "Columbia University in the City of New York" in 7
replace organization = "Georgia Institute of Technology-Main Campus" in 14
replace organization = "Indiana University-Bloomington" in 17
replace organization = "Pennsylvania State University-Main Campus" in 23
replace organization = "Tulane University of Louisiana" in 34
replace organization = "University of Illinois at Urbana Champagne" in 36
replace organization = "University of Illinois at Urbana Champaign" in 36
replace organization = "University of Illinois at Urbana-Champaign" in 36
replace organization = "University of Pittsburgh-Pittsburgh Campus" in 39
replace organization = "Washington University in St Louis" in 45

*bysort organization: gen num=sum(University)
*egen no_elites = max(num), by(organization)
*drop num

save "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Data\cleaned_university elites", replace
clear all


**********Import and Clean University Scorecard Data***********

import delimited "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Data\OD_university scorecard data.txt"

rename instnm organization
drop ÿþunitid opeid opeid6 insturl npcurl

save "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Data\cleaned_university scorecard", replace
clear all


***************Import and Clean University Ranking Data*********

import delimited "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Data\OD_National Universities Rankings.csv"
drop description tuitionandfees instate undergradenrollment
rename name organization

replace organization = "University of Illinois-Urbana-Champaign" in 163
replace organization = "University of Pittsburgh-Pittsburgh Campus" in 196
replace organization = "Pennsylvania State University-Main Campus" in 95
replace organization = "Tulane University of Lousiana" in 128
replace organization = "Washington University in St Louis" in 225
replace organization = "Columbia University in the City of New York" in 31
replace organization = "Indiana University-Bloomington" in 56

save "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Data\cleaned_university rankings", replace
clear all

************Merge the elites and ranking datasets**********
use "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Data\cleaned_university elites"

merge 1:m organization using "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Data\cleaned_university rankings"
drop _merge
drop if rank > 100
replace no_elites = 0 if no_elites==.
gen elite_dummy = 0
replace elite_dummy = 1 if no_elites>0

save "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Working Data\1_elites_rankings_merged", replace
clear all

***********Merge the elites_rankings_merged data with university scorecard data***********

use "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Working Data\1_elites_rankings_merged"
merge 1:m organization using "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Data\cleaned_university scorecard"
drop if _merge==2
drop if hcm2==.

save "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Working Data\2_merged_data"
