@echo off 
atomsk --create fcc 4.046 Al orient [100] [010] [001] ^
-duplicate 10 10 15 ^
-select random 3%% Al ^
-substitute Al Mg ^
-select random 2%% Al ^
-substitute Al C ^
AlMgC.lmp 

rename AlMgC.lmp AlMgC.lmpdat

pause