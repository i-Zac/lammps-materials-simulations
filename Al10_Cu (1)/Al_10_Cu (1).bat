@echo off 
atomsk --create fcc 3.00 Al orient [100] [010] [001] ^
-duplicate 15 15 20 ^
-select random 10%% Al ^
-substitute Al Cu ^
Al_10_Cu.lmp 

rename Al_10_Cu.lmp  Al_10_Cu.lmpdat

pause