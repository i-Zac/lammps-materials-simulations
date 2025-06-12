@echo off 
atomsk --create fcc 4.046 Al orient [100] [010] [001] ^
-duplicate 20 20 60 ^
-select out cylinder Z 0.5*box 0.5*box 40 ^
-remove-atom select ^
-select random 10%% Al ^
-substitute Al Cu ^
Al_10Cu_alloy.lmp 

rename Al_10Cu_alloy.lmp Al_10Cu_alloy.lmpdat

pause