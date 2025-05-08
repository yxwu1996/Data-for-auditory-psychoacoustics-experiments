The main content of this work: landscape and flux, are calculated by Comsol 6.0 Mathematical module. 
Due to the file size limit here, we cannot offer the original Comsol apllication file. Instead, we provide a Matlab model file named "Landscape_Flux_aveJss_EPR_COMSOL_model_file" here. 
One can employ LiveLink™ for MATLAB® to open the model for calculation.

Example code for calculating the dominant path is provided. 
We should stress that, for a path, it may take 50 to 100 iterations (even more) to obtain stable results. Please pay attention to identifying the results after each calculation and eliminate obvious unreasonable results introduced by random sampling.
Setting up a straight line as initial preset path is the simplest.
But combining the directions of the landscape gradient and Jss will result in a faster convergence speed.

Average Jss/Pss and EPR are also calculated by Comsol, derivative module (surface integral). 
*Manually calculating one by one is tedious. So, please use Matlab to call COMSOL for programming calculations. We provide example code that can be directly used for calculations.

The difference between forward and backward cross-correlations (Δcorr) are calculated by Matlab. We provide the program here. Users can directly use it.

The Matlab data named "AuditoryStreamTesting_Int_for_Transitional.m" is for the Experiment I, and "AuditoryStreamTesting_LowAttention.m" is for Experiment II.
Before you use these data for a psychoacoustics test, you need to install a Psychtoolbox Expansion Package of Matlab. Check http://psychtoolbox.org/ for this package, where the Installation Tutorial is also offered.

For more supporting, please contact the corresponding authors.
