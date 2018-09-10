
***************Author: William Duncan*********************
**************Last Edited: 9/9/2018***********************
*****Data Visualization with scorecard_elite_merged*******


clear all
set more off
cd "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Working Data"

use "2_merged_data"

***************************************Run the Mann-Whitney-Wilcoxon Test**********************************
****************Rank test to check for clustering in distribution of two combined random variables*********

ranksum rank, by(elite_dummy)

*************************************Visualization*****************************
clear all
use "2_merged_data"
replace satvr75 = "0" if satvr75 == "NULL"
destring satvr75, replace ignore(" ")
graph bar (mean) satvr75, over(elite_dummy)
graph save Graph "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Plots\75 percentile SAT by elite_dummy.gph", replace

clear all
use "2_merged_data"
replace satvr25 = "0" if satvr25 == "NULL"
destring satvr25, replace ignore(" ")
graph bar (mean) satvr25, over(elite_dummy)
graph save Graph "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Plots\25 percentile SAT by elite_dummy.gph", replace

clear all
use "2_merged_data"
replace ugds_white = "0" if ugds_white == "NULL"
destring ugds_white, replace ignore(" ")
graph bar (mean) ugds_white, over(elite_dummy)
graph save Graph "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Plots\White student percentage by elite_dummy.gph", replace


clear all
use "2_merged_data"
replace ugds_black = "0" if ugds_black == "NULL"
destring ugds_black, replace ignore(" ")
graph bar (mean) ugds_black, over(elite_dummy)
graph save Graph "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Plots\Black student percentage by elite_dummy.gph", replace

clear all
use "2_merged_data"
replace ugds_hisp = "0" if ugds_hisp == "NULL"
destring ugds_hisp, replace ignore(" ")
graph bar (mean) ugds_hisp, over(elite_dummy)
graph save Graph "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Plots\Hispanic student percentage by elite_dummy.gph", replace

clear all
use "2_merged_data"
replace ugds_asian = "0" if ugds_asian == "NULL"
destring ugds_asian, replace ignore(" ")
graph bar (mean) ugds_asian, over(elite_dummy)
graph save Graph "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Plots\Asian student percentage by elite_dummy.gph", replace



