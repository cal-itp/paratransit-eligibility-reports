# paratransit-eligibility-reports
worked related to the paratransit eligibility reports. 

Currently, this repo is used to generate a centralized list of paratransit agencies as part of the requirements of [AB 1351](https://leginfo.legislature.ca.gov/faces/billTextClient.xhtml?bill_id=201920200AB1351)

## Data Sources 
The current data sources are 

1) Blackcat 
1) [State Controller's Audit Report Raw Data](https://bythenumbers.sco.ca.gov/Raw-Data/Transit-Operators-Raw-Data-for-Fiscal-Years-2017-2/6dj3-r4jw)
1) CTSA List
1) Trillium Maintained List of Transit Agencies in CA


## Methodology 
To determine which paratransit agencies are getting Mills-Alquish-Deddeh Act (aka TDA) funding, they should be in the State Controller dataset. We then filter that dataset to only agencies that are claiming  and/or is claiming paratransit vehicles. This is both the starting point for the list and the produce of the `is_mills` variable in the final dataset. 

To filter the Trillium list to Paratransit, we have a gsheet that uses the `=import` & `=query` list to give us a catalog entry of Trillium master transit in CA list that is only paratransit. 

CTSA list should all be Paratransit operators or coordinators of operators. 

Theoretically, the BlackCat entries for 5310 funding should all have corresponding TDA funding based on spot checking, so we remove from the dataset for now. 

Once that is done, we manually created a [set of crosswalks](https://docs.google.com/spreadsheets/d/1inAKMhCkd4mtRcY1urM36IfLDzkyPRM1D3OJ_ftSXaw/edit#gid=0) between the  controller filtered list and both the Trillium and CTSA list. The datasets are merged, joined and deduped in `dedupe.ipynb` and we write out the final dataset in `final/final_combined_paratransit.csv`

## Running the script 
To run all the scripts to combine the data, run `make data`