The R-scripts and data in this repository reproduce the genomic index selection analyses in:


R-scripts and files by Gancho Slavov (minor changes for GitHub upload by Chris Davey). 
All scripts are documented internally.

To run the analyses:

(1) Install the libraries "rrBLUP" and "MTM" into R.

(2) Run "varcovar_miscanthus_2TT_138_MTM_blues.r".
This uses the libraries "rrBLUP" and "MTM".
Input data: "G_v2.RData", "pheno_data_v2.csv" and "current_seeds.RData".
The script creates the following which are used by the individual senario scripts:
"out_varcovar_miscanthus_2TT_138_MTM_blues.RData".
Genetic covariance matrix "Gmat".
Residual covariance matrix "Emat".

(3) To repeat senario S1 then run "S1.r".
Input data are the matrices and RData created in step 2.
Ouput is "out_S1.RData".

(4) To repeat senario S1* then run "S1_star.r".
Input data are the matrices and RData created in step 2.
Ouput is "out_S1_star.RData".

(5) To repeat senario S2 then run "S2.r".
Input data are the matrices and RData created in step 2.
Ouput is "out_S2.RData".

(6) To repeat senario S2* then run "S2_star.r".
Input data are the matrices and RData created in step 2.
Ouput is "out_S2_star.RData".
