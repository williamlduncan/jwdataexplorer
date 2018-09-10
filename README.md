# jwdataexplorer
Data Science: First Project

Industry: Higher Education 

Note: All data, code, and plots are in the Power Elite in the US Main folder. This folder has four subcomponents: Data, Working Data, Plots, Do Files. 

The first dataset comes from data.gov curated by the Federal Government (the university scorecard). 
The second dataset comes from the Power Elite Database curated by G. William Domhoff (university elites). 
The third dataset comes from the US News and World Reports to provide rankings for the top 220 universities (university rankings). 

These data are merged using the name of the university which matches at the 65 percent level across the three datasets. The three original datasets are marked with OD at the beginning of their name for (Original Data) and the three cleaned datasets are marked 'cleaned_' at the beginning of their name. These datasets are all stored in the file called "Data". The merged datasets sit in the file called "Working Data". 

The university elites data has information on those individuals who are politically connected and the universities where they sit on a board. The measure of political power for these individuals is constructed by G. William Domhoff using a network analysis approach to see how much influence these individuals have on shaping the content of policy. The idea is that there may be some mechanism by which these elites can influence or shape access to resources and thereby effect the scoreboard ranking.

In order to formulate an idea about how the datasets could be combined for additional value, I use the Mann-Whitney-Wilcoxon Test to see whether universities with elites tend to cluster towards higher ranked institutions. The results are shared in another window. 

I also plot some differences in ethnicity in the student population by universities that have elites (elite_dummy=1) and those universities that do not have elites (elite_dummy=0) on their board. Some of these differences seem statistically significant, but I did not run any tests. Likely, the difference is explained by the fact that the board members in the elites database tend to be at higher ranked universities (per the MWW test). It is well known that the highly ranked universities are committing money to promote access to minority groups, so the difference is to be expected. 
