SCRIPT introduction 
===================
what this script makes in to the workspace


1.Mean connectivity : for threholds of 10 ~ 90%
-----------------------------------------------
![equation](http://latex.codecogs.com/gif.latex?{total\ connectivity\ to\ one\ cortex\ region}{total\ connectivity\ to\ all\ cortex})   
long format :
**totalMeanConnectivity**
   wide format with different thresholds: 
```
totalMeanConnectivityWide10 
```
   graph :

**bar graph**

```
barMeanConnectivity10
```
**for thresholding effect in each modality**

```
LPFCmcg
```




2. Cortical thickness
--------------------
   mean cortical thickness data in mm^3
**wide format**
```
totalThickness
```
**graph :**
bar graph 
```
barThickness
```

3. Cortical volume   
--------------------
   cortical volume data in mm^3
   wide format : 
```
totalCorticalVolume
```

  -------------------------------------------------------------------------
**Levene test result :: for variance homogeniety**

```
varMeanConnectivity
varThickness
varCorticalVolume
```
if significant --> non homogeneous variance among two groups
        

**Shapiro-Wilk test :: for normality**
```
norMeanConnectivity
norThickness
norCorticalVolume
```
if significant --> non-normal distribution


4. Correlation check
--------------------
In order to see correlation with patient data...
For example...
```
corTestFunction(totalMeanConnectivityWide10)
```
This automatically selects only patients group in the input,
Then loops through each modality with all patient data to see correlation.
** Uses Pearson's correlation
** Optimised for *totalMeanConnectivityWide{thr}* 
:: looping through from 6th column**




