######################################################################
######### SCRIPT introduction ########################################
######################################################################

ttestgo='off'
cat('
# what this script makes in to the workspace
# Mean connectivity
#   total connectivity to one cortex region / total connectivity to all cortex
#   long format : totalMeanConnectivity
#   wide format with different thresholds: totalMeanConnectivityWide10 etc.
#   graph :
#           bar graph :: barMeanConnectivity10 etc.
#           for thresholding effect in each modality :: LPFCmcg etc.

# Cortical thickness
#   mean cortical thickness data in mm^3
#   wide format : totalThickness
#   graph :
#           bar graph :: barThickness

# Cortical volume   
#   cortical volume data in mm^3
#   wide format : totalCorticalVolume

        # Levene test result :: for variance homogeniety
        # eg. varMeanConnectivity... varThickness... varCorticalVolume...
        # if significant --> non homogeneous variance among two groups
        
        # Shapiro-Wilk test :: for normality
        # eg. norMeanConnectivity... norThickness... norCorticalVolume...
        # if significant --> non-normal distribution




')


######################################################################
######### Sourcing libraries #########################################
######################################################################
library(ggplot2)#ggplot
source('multiplot.txt') #multiplot
library(pastecs)
library(car)
library(WRS)


######################################################################
######### Demographic check  #########################################
######################################################################
# loading

age = read.delim('background/age.txt',header=F)
names(age)="age"
patient = read.delim('background/patients.csv',sep=',',header=T)



######################################################################
######### Cortical thickness #########################################
######################################################################
# loading
#conThickness = read.delim('~/11/new/con/logs/thicknessSummary.txt',sep='\t',header=T)
#chrThickness = read.delim('~/11/new/chr/logs/thicknessSummary.txt',sep='\t',header=T)
#conThickness=cbind(conThickness,factor('CON'))
#chrThickness=cbind(chrThickness,factor('CHR'))
#names(conThickness) = c("OFC","MPFC","LPFC","SMC","PC","MTC","LTC","OCC","Subject.Name","side","group")
#names(chrThickness) = c("OFC","MPFC","LPFC","SMC","PC","MTC","LTC","OCC","Subject.Name","side","group")
#totalThickness=rbind(conThickness,chrThickness)
totalThickness=read.csv('totalThickness.R')

totalThicknessStack=cbind(stack(totalThickness, select=c("LPFC","LTC","MPFC","MTC","OCC","OFC","PC","SMC")),totalThickness$group,totalThickness$side)
names(totalThicknessStack)=c("thickness","modality","group","side")

    barCorticalThickness=ggplot(totalThicknessStack,aes(modality,thickness,fill=group))+stat_summary(fun.y=mean,geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9),width=0.2)+ ggtitle("Mean Cortical Thickness")+labs(x="Region in cortex",y="Mean Cortical thickness (mm^3)")+facet_wrap(~side)+theme(title = element_text(face="bold", size=14))
#ttest

for (i in 1:ncol(totalThickness[1:8]))
{
    # going through homogeniety :: Levene test
    #left or right
    for (side in c('left','right'))
    {
        # To call leveneTest :: eg. varOFCmc90left
        assign(paste("varThickness", names(totalThickness[i]), side,sep=""),
                    leveneTest(totalThickness[,i][totalThickness$side==side],totalThickness$group[totalThickness$side=='left']))

# To call shapiroTest :: eg. norOFCmc90left
        assign(paste("norThickness",names(totalThickness[i]),side,sep=""),
                shapiro.test(totalThickness[,i][totalThickness$side==side]))

        #if they are not normally distributed or non-homogeneous::robust t-test
        if (get(paste("varThickness",names(totalThickness[i]),side,sep=""))$'Pr(>F)'<0.05[1]||get(paste("norThickness",names(totalThickness[i]),side,sep=""))$'p.value'<0.05){
            assign(paste("ttestThickness",names(totalThickness[i]),side,sep=""),
                    yuen(subset(totalThickness[,i],totalThickness$group=="CON"&totalThickness$side==side),
                    subset(totalThickness[,i],totalThickness$group=="CHR"&totalThickness$side==side)))
            assign("TTEST",get(paste("ttestThickness",names(totalThickness[i]),side,sep="")))
#if it is significant
            if (TTEST$p.value < 0.05 & ttestgo=='on')
            {
    cat(names(totalThickness[i]),"\n",sep="")
            print(side)
            print(paste('p value : ',format(TTEST$p.value,nsmall=3)))
            print(paste('effect size : ',
            format(sqrt(TTEST$teststat/(TTEST$teststat^2+TTEST$df)),nsmall=3)))
cat("\n\n")
            }
#if it is not significant :: don't print
        }
        #if they are normal and have homogeneous variance :: two sided t-test
        else
        {
            assign(paste("ttestThickness",names(totalThickness[i]),side,sep=""),
                    t.test(subset(totalThickness[,i],totalThickness$group=="CON"&totalThickness$side==side),
                    subset(totalThickness[,i],totalThickness$group=="CHR"&totalThickness$side==side)))   
            assign("TTEST",get(paste("ttestThickness",names(totalThickness[i]),side,sep="")))

            if (TTEST$p.value < 0.05 & ttestgo=='on')
            {
    cat(names(totalThickness[i]),"\n",sep="")
            print(side)
            print(paste('p value : ',format(TTEST$p.value,nsmall=3)))
            print(paste('confident internal : ',
            format(TTEST$conf.int),nsmall=3))
cat("\n\n")
            }
        }
    }
}




######################################################################
######### Cortical Volume    #########################################
######################################################################
#loading
#newCONvol=read.delim('~/11/new/con/logs/corticalVolumesNew.txt',sep='\t',header=T)
#newCHRvol=read.delim('~/11/new/chr/logs/corticalVolumesNew.txt',sep='\t',header=T)
#names(newCONvol)=c("OFC","MPFC","LPFC","SMC","PC","MTC","LTC","OCC","side","subject","group")
#names(newCHRvol)=c("OFC","MPFC","LPFC","SMC","PC","MTC","LTC","OCC","side","subject","group")
#totalCortexVolume=rbind(newCONvol,newCHRvol)
totalCortexVolume=read.csv('totalCortexVolume.R')



totalCortexVolumeStack=cbind(stack(totalCortexVolume, select=c("LPFC","LTC","MPFC","MTC","OCC","OFC","PC","SMC")),totalCortexVolume$group,totalCortexVolume$side)
names(totalCortexVolumeStack)=c("thickness","modality","group","side")

barCorticalVolume=ggplot(totalCortexVolumeStack,aes(modality,thickness,fill=group))+stat_summary(fun.y=mean,geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9),width=0.2)+ ggtitle("Mean Cortical Volume")+labs(x="Region in cortex",y="Cortical Volume (mm^3)")+facet_wrap(~side)+theme(title = element_text(face="bold", size=14))

#ttest

for (i in 1:ncol(totalCortexVolume[1:8]))
{
    # going through homogeniety :: Levene test
    #left or right
    for (side in c('left','right'))
    {
        # To call leveneTest :: eg. varOFCmc90left
        assign(paste("varCortexVolume", names(totalCortexVolume[i]), side,sep=""),
                    leveneTest(totalCortexVolume[,i][totalCortexVolume$side==side],totalCortexVolume$group[totalCortexVolume$side==side]))

# To call shapiroTest :: eg. norOFCmc90left
        assign(paste("norCortexVolume",names(totalCortexVolume[i]),side,sep=""),
                shapiro.test(totalCortexVolume[,i][totalCortexVolume$side==side]))

        #if they are not normally distributed or non-homogeneous::robust t-test
        if (get(paste("varCortexVolume",names(totalCortexVolume[i]),side,sep=""))$'Pr(>F)'<0.05[1]||get(paste("norCortexVolume",names(totalCortexVolume[i]),side,sep=""))$'p.value'<0.05){
            assign(paste("ttestCortexVolume",names(totalCortexVolume[i]),side,sep=""),
                    yuen(subset(totalCortexVolume[,i],totalCortexVolume$group=="CON"&totalCortexVolume$side==side),
                    subset(totalCortexVolume[,i],totalCortexVolume$group=="CHR"&totalCortexVolume$side==side)))
            assign("TTEST",get(paste("ttestCortexVolume",names(totalCortexVolume[i]),side,sep="")))
#if it is significant
            if (TTEST$p.value < 0.05 & ttestgo=='on')
            {
    cat(names(totalCortexVolume[i]),"\n",sep="")
            print(side)
            print(paste('p value : ',format(TTEST$p.value,nsmall=3)))
            print(paste('effect size : ',
            format(sqrt(TTEST$teststat/(TTEST$teststat^2+TTEST$df)),nsmall=3)))
cat("\n\n")
            }
#if it is not significant :: don't print
        }
        #if they are normal and have homogeneous variance :: two sided t-test
        else
        {
            assign(paste("ttestCortexVolume",names(totalCortexVolume[i]),side,sep=""),
                    t.test(subset(totalCortexVolume[,i],totalCortexVolume$group=="CON"&totalCortexVolume$side==side),
                    subset(totalCortexVolume[,i],totalCortexVolume$group=="CHR"&totalCortexVolume$side==side)))   
            assign("TTEST",get(paste("ttestCortexVolume",names(totalCortexVolume[i]),side,sep="")))

            if (TTEST$p.value < 0.05 & ttestgo=='on')
            {
    cat(names(totalCortexVolume[i]),"\n",sep="")
            print(side)
            print(paste('p value : ',format(TTEST$p.value,nsmall=3)))
            print(paste('confident internal : ',
            format(TTEST$conf.int),nsmall=3))
cat("\n\n")
            }
        }
    }
}

######################################################################
######### Maximum probability ########################################
######################################################################
# loading
maxProbabilityCON=read.delim('~/11/new/con/logs/probabilitySummary.txt',sep='\t',header=T)
maxProbabilityCON=cbind(maxProbabilityCON,rep("CON",56))
names(maxProbabilityCON)=c(names(maxProbabilityCON)[1:18],"group")
maxProbabilityCHR=read.delim('~/11/new/chr/logs/probabilitySummary.txt',sep='\t',header=T)
maxProbabilityCHR=cbind(maxProbabilityCHR,rep("CHR",46))
names(maxProbabilityCHR)=c(names(maxProbabilityCHR)[1:18],"group")



##########################################################################
########### thresholded mean connectivities voxel approach ###############
##########################################################################
# loading data
meanConnectivityCON=read.delim('/Users/mav88/11/new/setMC/totalConnectionProbabilityValuesCON.txt',sep='\t',header=F)
meanConnectivityCHR=read.delim('/Users/mav88/11/new/setMC/totalConnectionProbabilityValuesCHR.txt',sep='\t',header=F)
meanConnectivityCON=cbind(meanConnectivityCON,factor('CON'))
meanConnectivityCHR=cbind(meanConnectivityCHR,factor('CHR'))
names(meanConnectivityCON)=c("Subject.names","side","groupD","modality","thr","MeanConnectivity","group")
names(meanConnectivityCHR)=c("Subject.names","side","groupD","modality","thr","MeanConnectivity","group")
totalMeanConnectivity=rbind(meanConnectivityCON,meanConnectivityCHR)
names(totalMeanConnectivity)=c("Subject.names","side","groupD","modality","thr","MeanConnectivity","group")
#totalMeanConnectivity=read.csv('totalMeanConnectivity.R')

for (thrd in seq(10,90,10)){
# making variables into wide format in each thresholds
    assign(paste("totalMeanConnectivityWide",thrd,sep=""),reshape(subset(totalMeanConnectivity,thr==thrd),v.names="MeanConnectivity",idvar=c("Subject.names","side"),timevar="modality",direction="wide"))

    assign("dataFrame",get(paste("totalMeanConnectivityWide",thrd,sep="")))
    names(dataFrame)=c("Subject.names","side","groupD","thr","group","LPFC","LTC","MPFC","MTC","OCC","OFC","PC","SMC")

#graph
    assign(paste("bar","MeanConnectivity",thrd,sep=""),ggplot(subset(totalMeanConnectivity,thr==thrd),aes(modality,MeanConnectivity,fill=group))+stat_summary(fun.y=mean,geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9),width=0.2)+ ggtitle(paste("Mean Connectivity after thresholding at ",thrd,"%",sep=""))+labs(x="Region of cortex in connection to thalamus",y="Connectivity to one region divided by \nsum of connectivity to each cortex")+facet_wrap(~side)+theme(title = element_text(face="bold", size=14)))

#ttest

for (i in 6:ncol(dataFrame))
{

    # going through homogeniety :: Levene test
    #left or right
    for (side in c('left','right'))
    {
        # To call leveneTest :: eg. varOFCmc90left
            dataFrame[i]
        assign(paste("varMeanConnectivity", names(dataFrame[i]), side,sep=""),
                    leveneTest(dataFrame[,i][dataFrame$side==side],
                dataFrame$group[dataFrame$side==side]))

# To call shapiroTest :: eg. norOFCmc90left
        assign(paste("norMeanConnectivity",names(dataFrame[i]),side,sep=""),
                shapiro.test(dataFrame[,i][dataFrame$side==side]))

        #if they are not normally distributed or non-homogeneous::robust t-test
        if (get(paste("varMeanConnectivity",names(dataFrame[i]),side,sep=""))$'Pr(>F)'<0.05[1]||get(paste("norMeanConnectivity",names(dataFrame[i]),side,sep=""))$'p.value'<0.05){
            assign(paste("ttestMeanConnectivity",names(dataFrame[i]),thrd,side,sep=""),
                    yuen(subset(dataFrame[,i],dataFrame$group=="CON"&dataFrame$side==side),
                    subset(dataFrame[,i],dataFrame$group=="CHR"&dataFrame$side==side)))
            assign("TTEST",get(paste("ttestMeanConnectivity",names(dataFrame[i]),thrd,side,sep="")))
#if it is significant
            if (TTEST$p.value < 0.05 & ttestgo=='on')
            {
    cat(names(dataFrame)[i],"\n",thrd,"% threshold\n",sep="")
            print(side)
            print(paste('p value : ',format(TTEST$p.value,nsmall=3)))
            print(paste('effect size : ',
            format(sqrt(TTEST$teststat/(TTEST$teststat^2+TTEST$df)),nsmall=3)))
cat("\n\n")
            }
#if it is not significant :: don't print
        }
        #if they are normal and have homogeneous variance :: two sided t-test
        else
        {
            assign(paste("ttestMeanConnectivity",names(dataFrame[i]),thrd,side,sep=""),
                    t.test(subset(dataFrame[,i],dataFrame$group=="CON"&dataFrame$side==side),
                    subset(dataFrame[,i],dataFrame$group=="CHR"&dataFrame$side==side)))   
            assign("TTEST",get(paste("ttestMeanConnectivity",names(dataFrame[i]),thrd,side,sep="")))

            if (TTEST$p.value < 0.05 & ttestgo=='on')
            {
    cat(names(dataFrame)[i],"\n",thrd,"% threshold\n",sep="")
            print(side)
            print(paste('p value : ',format(TTEST$p.value,nsmall=3)))
            print(paste('confident internal : ',
            format(TTEST$conf.int),nsmall=3))
cat("\n\n")
            }
        }
    }
}}







###########################################################################
#### img approach                                              ############ 
#### Subthalamic volume,                                       ############
#### average connection probability in the subthalamic volume, ############
#### average connectivity probability in thalamus              ############
###########################################################################
# informations
# loading data
#
#mcCON=read.delim('~/11/new/con/logs/meanConnectivity.txt',sep='\t',header=T)
#mcCHR=read.delim('~/11/new/chr/logs/meanConnectivity.txt',sep='\t',header=T)
#totalMC=rbind(mcCON,mcCHR)
#
#
#subthalamicVolumesThrCHR=read.delim('~/11/new/chr/logs/subthalamicVolumesThr.txt',sep='\t',header=T)
#subthalamicVolumesThrCON=read.delim('~/11/new/con/logs/subthalamicVolumesThr.txt',sep='\t',header=T)
#totalSubthalamicVolumesThr=rbind(subthalamicVolumesThrCON,subthalamicVolumesThrCHR)
#totalSubthalamicVolumesThr=cbind(totalSubthalamicVolumesThr,totalMC[,4:ncol(totalMC)])
totalSubthalamicVolumesThr=read.csv('totalSubthalamicVolumesThr.R')

# t-test
for (i in 5:ncol(totalSubthalamicVolumesThr))
{
    # going through homogeniety :: Levene test
    #left or right
    for (side in c('left','right'))
    {
# To call leveneTest :: eg. varOFCmc90left
        assign(paste("var",names(totalSubthalamicVolumesThr[i]),side,sep=""),
                leveneTest(totalSubthalamicVolumesThr[,i][totalSubthalamicVolumesThr$side==side],totalSubthalamicVolumesThr$group[totalSubthalamicVolumesThr$side==side]))
# To call shapiroTest :: eg. norOFCmc90left
        assign(paste("nor",names(totalSubthalamicVolumesThr[i]),side,sep=""),
                shapiro.test(totalSubthalamicVolumesThr[,i][totalSubthalamicVolumesThr$side==side]))

        #if they are not normally distributed or non-homogeneous::robust t-test
        if (get(paste("var",names(totalSubthalamicVolumesThr[i]),side,sep=""))$'Pr(>F)'<0.05 &
                get(paste("nor",names(totalSubthalamicVolumesThr[i]),side,sep=""))$'p.value'<0.05)
        {
#print(paste('variance is not homogeneous or non-normalily distributed on the',side,sep=' '))
            assign(paste("ttest",names(totalSubthalamicVolumesThr[i]),side,sep=""),
                    yuen(subset(totalSubthalamicVolumesThr[,i],totalSubthalamicVolumesThr$group=="CON"&totalSubthalamicVolumesThr$side==side),
                    subset(totalSubthalamicVolumesThr[,i],totalSubthalamicVolumesThr$group=="CHR"&totalSubthalamicVolumesThr$side==side)))
            assign("TTEST",get(paste("ttest",names(totalSubthalamicVolumesThr[i]),side,sep="")))
#if it is significant
            if (TTEST$p.value < 0.05 & ttestgo=='on')
            {
cat("\t\t",names(totalSubthalamicVolumesThr)[i],"\n")
            print(side)
            print(paste('p value : ',format(TTEST$p.value,nsmall=3)))
            print(paste('effect size : ',
            format(sqrt(TTEST$teststat/(TTEST$teststat^2+TTEST$df)),nsmall=3)))
cat("\n\n")
            }
#if it is not significant :: don't print
            
        }
            #if they are normal and have homogeneous variance :: two sided t-test
        else
        {
            assign(paste("ttest",names(totalSubthalamicVolumesThr[i]),side,sep=""),
                    t.test(subset(totalSubthalamicVolumesThr[,i],totalSubthalamicVolumesThr$group=="CON"&totalSubthalamicVolumesThr$side==side),
                    subset(totalSubthalamicVolumesThr[,i],totalSubthalamicVolumesThr$group=="CHR"&totalSubthalamicVolumesThr$side==side)))   
            assign("TTEST",get(paste("ttest",names(totalSubthalamicVolumesThr[i]),side,sep="")))

            if (TTEST$p.value < 0.05 & ttestgo=='on')
            {
cat("\t\t",names(totalSubthalamicVolumesThr)[i],"\n")
            print(side)
            print(paste('p value : ',format(TTEST$p.value,nsmall=3)))
            print(paste('confident internal : ',
            format(TTEST$conf.int),nsmall=3))
cat("\n\n")
            }
        }
    }
}


## making stack data frames on each threshold
for (thr in seq(10,90,10)){
    for (colName in c("volthr","probVolthr","mc")){
    values=stack(totalSubthalamicVolumesThr, select=c(paste("LPFC",colName,thr,sep=""),paste("LTC",colName,thr,sep=""),paste("MPFC",colName,thr,sep=""),paste("MTC",colName,thr,sep=""),paste("OCC",colName,thr,sep=""),paste("OFC",colName,thr,sep=""),paste("PC",colName,thr,sep=""),paste("SMC",colName,thr,sep="")))
        
    subj=totalSubthalamicVolumesThr$Subject.Name
    side=totalSubthalamicVolumesThr$side
    group=totalSubthalamicVolumesThr$group
    assign(paste("stackSub",colName,thr,sep=""),cbind(values,subj,side,group))
    plotdata = cbind(values,subj,side,group)

    assign(paste("bar",colName,thr,sep=""),ggplot(plotdata,aes(ind,values,fill=group))+stat_summary(fun.y=mean,geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9),width=0.2)+ ggtitle(paste(colName," in each group after thresholding at ",thr,sep=""))+labs(x="Subthalamic nuclei with highest connection to each cortex",y=colName)+facet_wrap(~side)+theme(title = element_text(face="bold", size=14)))
    }

}



# for each subregions...
for (cortex in c('LPFC','LTC','MPFC','MTC','OCC','OFC','PC','SMC')){

    for (colName in c("volthr","probVolthr","mc")){
values=stack(totalSubthalamicVolumesThr,select=c(paste(cortex,colName,"10",sep=""),paste(cortex,colName,"20",sep=""),paste(cortex,colName,"30",sep=""),paste(cortex,colName,"40",sep=""),paste(cortex,colName,"50",sep=""),paste(cortex,colName,"60",sep=""),paste(cortex,colName,"70",sep=""),paste(cortex,colName,"80",sep=""),paste(cortex,colName,"90",sep="")))
    subj=totalSubthalamicVolumesThr$Subject.Name
    side=totalSubthalamicVolumesThr$side
    group=totalSubthalamicVolumesThr$group
    assign(paste(cortex,"vol",sep=""),cbind(values,subj,side,group))
    plotdata = cbind(values,subj,side,group)

assign(paste(cortex,colName,"g",sep=""),ggplot(plotdata,aes(ind,values,fill=group))+stat_summary(fun.y=mean,geom="bar",position="dodge")+stat_summary(fun.data=mean_cl_normal, geom="errorbar", position=position_dodge(width=0.9),width=0.2) +ggtitle(paste(colName," changes in subthalamic region which has highest connection to ",cortex,sep="")) + labs(x=paste("Different Threshold applied to ",cortex,sep=""),y=colName)+theme(title = element_text(face="bold", size=14)))
    }
}

######################################################################
######### Correlation with clinical information ######################
######################################################################

# variableToSeeCorrelation has to have group specified
corTestFunction=function(variableToSeeCorrelation){
    patient=subset(patient,select=-c(YMS_0,SANStot0,SAPStot0,AS1TOT0,AS2TOT0,AS3TOT0,AS4TOT0,AS5TOT0,AS6TOT0,AS7TOT0,CAARMSTOT0,PSDTOT0,PSGTOT0,SIPSTOT0,PSPTOT0,PSNTOT0,CGI_0))
    for (i in 1:ncol(patient)){
        if (is.numeric(patient[,i])==TRUE){
            CT=cor.test(variableToSeeCorrelation,patient[,i])
            cat(names(patient[i]))
            if (CT$'p.value'==TRUE && CT$'p.value'<0.05){
                CT
            }
            else{
                print('no correlation')
            }
        }
    }
}
#correlation check  non-parametric
#Positive PANSS
#-------------------------------------------------------------------
#print(cor.test(patientInfo$OCCprob,patientInfo$P1_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$P2_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$P3_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$P4_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$P5_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$P6_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$P7_0,method="kendall"))
##Negative PANSS
##-------------------------------------------------------------------
#print(cor.test(patientInfo$OCCprob,patientInfo$N1_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$N2_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$N3_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$N4_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$N5_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$N6_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$N7_0,method="kendall"))
##General
##-------------------------------------------------------------------
#print(cor.test(patientInfo$OCCprob,patientInfo$G1_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$G2_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$G3_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$G4_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$G5_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$G6_0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$G7_0,method="kendall"))
#
##GAF
#print(cor.test(patientInfo$OCCprob,patientInfo$GAF_0,method="kendall"))
#
#
##SAPS
#print(cor.test(patientInfo$OCCprob,patientInfo$SAPS___0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$SAPS___0.1,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$SAPS______0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$SAPS______0.1,method="kendall"))
#
#
##SANS
#print(cor.test(patientInfo$OCCprob,patientInfo$SAPS_____0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$SAPS____0,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$SAPS____0.1,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$SAPS____0.2,method="kendall"))
#print(cor.test(patientInfo$OCCprob,patientInfo$SAPS____0.3,method="kendall"))

#cortical thickness
##왼쪽 오른쪽 두개가 있어서 영향을 미치지는 않는지?




