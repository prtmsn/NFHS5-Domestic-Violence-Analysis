/**********************************************************************
 NFHS-5 Domestic Violence Analysis
 Author: Pratim Sen
 Description:
   - Reconstruct physical violence variable
   - Create combined domestic violence indicator
   - Apply survey weights
   - Run weighted tabulations and chi-square tests
**********************************************************************/


* 1) Keep only women eligible for the Domestic Violence module
keep if v044 != 0   // DV module respondents only

* 2) Rebuild physical partner violence variable 
gen byte phy_violence = 0
replace phy_violence = 1 if d105a==1 | d105a==2 | d105a == 3
replace phy_violence = 1 if d105b==1 | d105b==2 | d105b == 3
replace phy_violence = 1 if d105c==1 | d105c==2 | d105c == 3
replace phy_violence = 1 if d105d==1 | d105d==2 | d105d == 3
replace phy_violence = 1 if d105e==1 | d105e==2 | d105e == 3
replace phy_violence = 1 if d105f==1 | d105f==2 | d105f == 3
label define phy 0 "No" 1 "Yes", replace
label values phy_violence phy



* 3) Create combined domestic violence indicator
*     - Includes emotional, sexual, and physical violence

gen violence = .
replace violence = 1 if d108 == 1 | d104 == 1 | phy_violence == 1
replace violence = 0 if d108 == 0 & d104 == 0 & phy_violence == 0
label define viol 0 "no" 1 "yes", replace
label values violence viol


* --------------------------------------------------------------------
* 4) Generate weight and clean husband drinking variable
* --------------------------------------------------------------------

gen double w = d005/1000000
recode d113 (0=0) (1=1) (else=.), gen(drink)
label define drink 0 "No" 1 "Yes", replace
label values drink drink


* --------------------------------------------------------------------
* 6) Weighted cross-tabulations and chi-square tests
* --------------------------------------------------------------------

* check
ta violence

* Husband drinks vs violence
tab drink violence, row chi2

* Age group 
tab v013 violence [aw = d005], row nof


* Education (respondent)
tab v106 violence [aw = d005], row nof


* Husband's education
tab v701 violence [aw = d005], row nof


* Employment status
tab v714 violence, row chi2

* Wealth index
tab v190 violence [aw = d005], row nof

* Place of residence (Urban/Rural)
tab v025 violence [aw = d005], row nof

* Religion
tab v130 violence [aw = d005], row nof



* Marital status
tab v501 violence [aw = d005], row nof


* State
tab v024 violence [aw = d005], row nof


