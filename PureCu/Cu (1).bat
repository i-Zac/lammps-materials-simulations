@echo off 
atomsk --create fcc 3.61 Cu orient [100] [010] [001] ^
-duplicate 10 10 10 ^
purecu.lmp 

rename purecu.lmp purecu.lmpdat

pause