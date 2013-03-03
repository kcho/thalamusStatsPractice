SCRIPT introduction 
===================

what this script makes in to the workspace
------------------------------------------

1. Mean connectivity
--------------------
   total connectivity to one cortex region / total connectivity to all cortex
   long format :
  * totalMeanConnectivity
   wide format with different thresholds: totalMeanConnectivityWide10 etc.
   graph :
  *         bar graph :: barMeanConnectivity10 etc.
  *         for thresholding effect in each modality :: LPFCmcg etc.

2. Cortical thickness
--------------------
   mean cortical thickness data in mm^3
   wide format : 
  * totalThickness
   graph :
  *         bar graph :: barThickness

3. Cortical volume   
--------------------
   cortical volume data in mm^3
   wide format : 
  * totalCorticalVolume


  -------------------------------------------------------------------------
  * Levene test result :: for variance homogeniety
         eg. varMeanConnectivity... varThickness... varCorticalVolume...
         if significant --> non homogeneous variance among two groups
        
  * Shapiro-Wilk test :: for normality
         eg. norMeanConnectivity... norThickness... norCorticalVolume...
         if significant --> non-normal distribution



