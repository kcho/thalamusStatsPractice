#"OFC","MPFC","LPFC","SMC","PC","MTC","LTC","OCC","Subject.Name","side"
library(ggplot2)
source('~/Downloads/aall_data_files/multiplot.txt') 
print('reading multiplot source is done!')
#---------------------------------------------------------------

conSubthalVol = read.delim('~/11/new/con/logs/subthalVolumeSummary.txt',sep='\t',header=T)
names(conSubthalVol)=c("OFCsubvol","MPFCsubvol","LPFCsubvol","SMCsubvol","PCsubvol","MTCsubvol","LTCsubvol","OCCsubvol","Subject.Name","side")
conThickness = read.delim('~/11/new/con/logs/thicknessSummary.txt',sep='\t',header=T)
names(conThickness) = c("OFCthick","MPFCthick","LPFCthick","SMCthick","PCthick","MTCthick","LTCthick","OCCthick","Subject.Name","side")
conCorticalVolume = read.delim('~/11/new/con/logs/volumeSummary.txt',sep='\t',header=T)
newCONvol=read.delim('~/11/new/con/logs/corticalVolumesNew.txt',sep='\t',header=T)
names(newCONvol)=c("OFCvol","MPFCvol","LPFCvol","SMCvol","PCvol","MTCvol","LTCvol","OCCvol","side","subject","group")
names(conCorticalVolume)=c("OFCvol","MPFCvol","LPFCvol","SMCvol","PCvol","MTCvol","LTCvol","OCCvol","IC","TGV","Subject.Name","side")
conProb = read.delim('~/11/new/con/logs/probabilitySummaryMean.txt',sep='\t',header=T)
names(conProb)=c("OFCprob","MPFCprob","LPFCprob","SMCprob","PCprob","MTCprob","LTCprob","OCCprob","Subject.Name","side")
conTotal = cbind(conSubthalVol[,1:8],conThickness[,1:8],conProb[,1:8],newCONvol[,1:8],conCorticalVolume[,9:12],rep("CON",56))
names(conTotal) = c(names(conTotal)[1:36], "group")
#thrMeanProbCON=read.delim('~/11/new/con/logs/info.txt',sep='\t',header=T)
maxProbabilityCON=read.delim('~/11/new/con/logs/probabilitySummary.txt',sep='\t',header=T)
maxProbabilityCON=cbind(maxProbabilityCON,rep("CON",56))
names(maxProbabilityCON)=c(names(maxProbabilityCON)[1:18],"group")
#Mean connectivity
mcCON=read.delim('~/11/new/con/logs/meanConnectivity.txt',sep='\t',header=T)

print('reading Control tables done!')
#--------------------------------------------------------------

chrSubthalVol = read.delim('~/11/new/chr/logs/subthalVolumeSummary.txt',sep='\t',header=T)
names(chrSubthalVol)=c("OFCsubvol","MPFCsubvol","LPFCsubvol","SMCsubvol","PCsubvol","MTCsubvol","LTCsubvol","OCCsubvol","Subject.Name","side")
chrThickness = read.delim('~/11/new/chr/logs/thicknessSummary.txt',sep='\t',header=T)
names(chrThickness) = c("OFCthick","MPFCthick","LPFCthick","SMCthick","PCthick","MTCthick","LTCthick","OCCthick","Subject.Name","side")
chrCorticalVolume = read.delim('~/11/new/chr/logs/volumeSummary.txt',sep='\t',header=T)
newCHRvol=read.delim('~/11/new/chr/logs/corticalVolumesNew.txt',sep='\t',header=T)
names(newCHRvol)=c("OFCvol","MPFCvol","LPFCvol","SMCvol","PCvol","MTCvol","LTCvol","OCCvol","side","subject","group")
names(chrCorticalVolume)=c("OFCvol","MPFCvol","LPFCvol","SMCvol","PCvol","MTCvol","LTCvol","OCCvol","IC","TGV","Subject.Name","side")
chrProb = read.delim('~/11/new/chr/logs/probabilitySummaryMean.txt',sep='\t',header=T)
names(chrProb)=c("OFCprob","MPFCprob","LPFCprob","SMCprob","PCprob","MTCprob","LTCprob","OCCprob","Subject.Name","side")
chrTotal = cbind(chrSubthalVol[,1:8],chrThickness[,1:8],chrProb[,1:8],newCHRvol[,1:8],chrCorticalVolume[,9:12],rep("CHR",46))
names(chrTotal) = c(names(chrTotal)[1:36], "group")

maxProbabilityCHR=read.delim('~/11/new/chr/logs/probabilitySummary.txt',sep='\t',header=T)
maxProbabilityCHR=cbind(maxProbabilityCHR,rep("CHR",46))
names(maxProbabilityCHR)=c(names(maxProbabilityCHR)[1:18],"group")
#thrMeanProbCHR=read.delim('~/11/new/chr/logs/info.txt',sep='\t',header=T)
#Mean connectivity
mcCHR=read.delim('~/11/new/chr/logs/meanConnectivity.txt',sep='\t',header=T)
print('reading Clinical high risks tables done!')
#--------------------------------------------------------------
totalData = rbind(conTotal,chrTotal)
totalMC=rbind(mcCON,mcCHR)
Age = read.delim('~/Dropbox/CHRvsNOR/stats/2013_01_14/background/age.txt',header=F)
names(Age)="age"

totalData = cbind(totalData,Age)


#Graph

source('cortexThickness.R')
#thickness does not have bilateral version of the graph
#left 
#multiplot(OFCthickGl,MPFCthickGl,LPFCthickGl,SMCthickGl,PCthickGl,MTCthickGl,LTCthickGl,OCCthickGl,OFCthickGr,MPFCthickGr,LPFCthickGr,SMCthickGr,PCthickGr,MTCthickGr,LTCthickGr,OCCthickGr,cols=4)
#right
#multiplot(OFCthickGr,MPFCthickGr,LPFCthickGr,SMCthickGr,PCthickGr,MTCthickGr,LTCthickGr,OCCthickGr,cols=3)

source('cortexVolume.R')
#multiplot(OFCvolGl,MPFCvolGl,LPFCvolGl,SMCvolGl,PCvolGl,MTCvolGl,LTCvolGl,OCCvolGl,OFCvolGr,MPFCvolGr,LPFCvolGr,SMCvolGr,PCvolGr,MTCvolGr,LTCvolGr,OCCvolGr,cols=4)
#multiplot(OFCvolG,MPFCvolG,LPFCvolG,SMCvolG,PCvolG,MTCvolG,LTCvolG,OCCvolG,cols=3)

source('meanProbability.R')
#multiplot(OFCprobG,MPFCprobG,LPFCprobG,SMCprobG,PCprobG,MTCprobG,LTCprobG,OCCprobG,cols=3)
#multiplot(OFCprobGl,MPFCprobGl,LPFCprobGl,SMCprobGl,PCprobGl,MTCprobGl,LTCprobGl,OCCprobGl,cols=3)
#multiplot(OFCprobGr,MPFCprobGr,LPFCprobGr,SMCprobGr,PCprobGr,MTCprobGr,LTCprobGr,OCCprobGr,cols=3)
source('subthalamusVolume.R')





#skewness check
#library(pastecs)
#stat.desc(totalData$OCCsubvol,basic=F,norm=T)
###if skew.2SE or kurt.2SE are greater than 1 (ignoring the plus or minus sign)
###then you have significant skew/kurtosis(at p < .05)


#normality check
#Shapiro-Wilk test
#p value
#shapiro.test(totalData$OCCsubvol)
# if less than 0.05 ==> indicates a deviation from normality
#by(totalData$OFCsubvol,totalData$MPCFsubvol, shapiro.test)

#homogeneity of variance
#Levene's test
#need to stay non significance
library(car)
#leveneTest(totalData$OCCsubvol, totalData$group, center=mean)
#Hartley's Fmax : the variance ratio



#checking whether to use proportional accounting of IC
#or the ANCOVA method
#"OFC","MPFC","LPFC","SMC","PC","MTC","LTC","OCC","Subject.Name","side"

#ggplot(totalData,aes(IC,LPFCsubvol,colour=group)) +geom_point() +geom_smooth(method="lm")


#print(leveneTest(totalData$OFCsubvol,totalData$group))
#    print('OFCsubvol')
#print(leveneTest(totalData$MPFCsubvol,totalData$group))
#    print('MPFCsubvol')
#print(leveneTest(totalData$LPFCsubvol,totalData$group))
#    print('LPFCsubvol')
#print(leveneTest(totalData$SMCsubvol,totalData$group))
#    print('SMCsubvol')
#print(leveneTest(totalData$PCsubvol,totalData$group))
#    print('PCsubvol')
#print(leveneTest(totalData$MTCsubvol,totalData$group))
#    print('MTCsubvol')
#print(leveneTest(totalData$LTCsubvol,totalData$group))
#    print('LTCsubvol')
#print(leveneTest(totalData$OCCsubvol,totalData$group))
#    print('OCCsubvol')
#print(leveneTest(totalData$OFCthick,totalData$group))
#    print('OFCthick')
#print(leveneTest(totalData$MPFCthick,totalData$group))
#    print('MPFCthick')
#print(leveneTest(totalData$LPFCthick,totalData$group))
#    print('LPFCthick')
#print(leveneTest(totalData$SMCthick,totalData$group))
#    print('SMCthick')
#print(leveneTest(totalData$PCthick,totalData$group))
#    print('PCthick')
#print(leveneTest(totalData$MTCthick,totalData$group))
#    print('MTCthick')
#print(leveneTest(totalData$LTCthick,totalData$group))
#    print('LTCthick')
#print(leveneTest(totalData$OCCthick,totalData$group))
#    print('OCCthick')
#    print('OFCprob')
#print(leveneTest(totalData$OFCprob,totalData$group))
#    print('MPFCprob')
#print(leveneTest(totalData$MPFCprob,totalData$group))
#    print('LPFCprob')
#print(leveneTest(totalData$LPFCprob,totalData$group))
#    print('SMCprob')
#print(leveneTest(totalData$SMCprob,totalData$group))
#    print('PCprob')
#print(leveneTest(totalData$PCprob,totalData$group))
#    print('MTCprob')
#print(leveneTest(totalData$MTCprob,totalData$group))
#    print('LTCprob')
#print(leveneTest(totalData$LTCprob,totalData$group))
#    print('OCCprob')
#print(leveneTest(totalData$OCCprob,totalData$group))
#    print('OFCvol')
#print(leveneTest(totalData$OFCvol,totalData$group))
#    print('MPFCvol')
#print(leveneTest(totalData$MPFCvol,totalData$group))
#    print('LPFCvol')
#print(leveneTest(totalData$LPFCvol,totalData$group))
#    print('SMCvol')
#print(leveneTest(totalData$SMCvol,totalData$group))
#    print('PCvol')
#print(leveneTest(totalData$PCvol,totalData$group))
#    print('MTCvol')
#print(leveneTest(totalData$MTCvol,totalData$group))
#    print('LTCvol')
#print(leveneTest(totalData$LTCvol,totalData$group))
#    print('OCCvol')
#print(leveneTest(totalData$OCCvol,totalData$group))
#    
#IC
#TGV
#Subject.Name
#side
#group
#age





#print(shapiro.test(totalData$OFCsubvol))
#    print('OFCsubvol')
#print(shapiro.test(totalData$MPFCsubvol))
#    print('MPFCsubvol')
#print(shapiro.test(totalData$LPFCsubvol))
#    print('LPFCsubvol')
#print(shapiro.test(totalData$SMCsubvol))
#    print('SMCsubvol')
#print(shapiro.test(totalData$PCsubvol))
#    print('PCsubvol')
#print(shapiro.test(totalData$MTCsubvol))
#    print('MTCsubvol')
#print(shapiro.test(totalData$LTCsubvol))
#    print('LTCsubvol')
#print(shapiro.test(totalData$OCCsubvol))
#    print('OCCsubvol')
#print(shapiro.test(totalData$OFCthick))
#    print('OFCthick')
#print(shapiro.test(totalData$MPFCthick))
#    print('MPFCthick')
#print(shapiro.test(totalData$LPFCthick))
#    print('LPFCthick')
#print(shapiro.test(totalData$SMCthick))
#    print('SMCthick')
#print(shapiro.test(totalData$PCthick))
#    print('PCthick')
#print(shapiro.test(totalData$MTCthick))
#    print('MTCthick')
#print(shapiro.test(totalData$LTCthick))
#    print('LTCthick')
#print(shapiro.test(totalData$OCCthick))
#    print('OCCthick')

#    print('OFCprob')
#print(shapiro.test(totalData$OFCprob))
#    print('MPFCprob')
#print(shapiro.test(totalData$MPFCprob))
#    print('LPFCprob')
#print(shapiro.test(totalData$LPFCprob))
#    print('SMCprob')
#print(shapiro.test(totalData$SMCprob))
#    print('PCprob')
#print(shapiro.test(totalData$PCprob))
#    print('MTCprob')
#print(shapiro.test(totalData$MTCprob))
#    print('LTCprob')
#print(shapiro.test(totalData$LTCprob))
#    print('OCCprob')
#print(shapiro.test(totalData$OCCprob))
#    print('OFCvol')
#print(shapiro.test(totalData$OFCvol))
#    print('MPFCvol')
#print(shapiro.test(totalData$MPFCvol))
#    print('LPFCvol')
#print(shapiro.test(totalData$LPFCvol))
#    print('SMCvol')
#print(shapiro.test(totalData$SMCvol))
#    print('PCvol')
#print(shapiro.test(totalData$PCvol))
#    print('MTCvol')
#print(shapiro.test(totalData$MTCvol))
#    print('LTCvol')
#print(shapiro.test(totalData$LTCvol))
#    print('OCCvol')
#print(shapiro.test(totalData$OCCvol))
    



#robust test comparing means
#change here
#yuen : trimmed mean
#conofc = subset(totalData$OFCprob, totalData$group=="CON")
#chrofc = subset(totalData$OFCprob, totalData$group=="CHR")
#conlpfc = subset(totalData$LPFCprob, totalData$group=="CON")
#chrlpfc = subset(totalData$LPFCprob, totalData$group=="CHR")
#conmpfc = subset(totalData$MPFCprob, totalData$group=="CON")
#chrmpfc = subset(totalData$MPFCprob, totalData$group=="CHR")
#consmc = subset(totalData$SMCprob, totalData$group=="CON")
#chrsmc = subset(totalData$SMCprob, totalData$group=="CHR")
#conpc = subset(totalData$PCprob, totalData$group=="CON")
#chrpc = subset(totalData$PCprob, totalData$group=="CHR")
#conmtc = subset(totalData$MTCprob, totalData$group=="CON")
#chrmtc = subset(totalData$MTCprob, totalData$group=="CHR")
#conltc = subset(totalData$LTCprob, totalData$group=="CON")
#chrltc = subset(totalData$LTCprob, totalData$group=="CHR")
#conocc = subset(totalData$OCCprob, totalData$group=="CON")
#chrocc = subset(totalData$OCCprob, totalData$group=="CHR")



#print('OFC thickness')
#ofcthick=yuen(conofc,chrofc,tr=.2,alpha=.05)
#print(ofcthick$p.value)
#print(sqrt(ofcthick$teststat/(ofcthick$teststat^2+ofcthick$df)))
#    cat('\n')
#print('LPFC thickness')
#lpfcthick=yuen(conlpfc,chrlpfc,tr=.2,alpha=.05)
#print(lpfcthick$p.value)
#    print(sqrt(lpfcthick$teststat/(lpfcthick$teststat^2+lpfcthick$df)))
#    cat('\n')
#print('MPFC thickness')
#mpfcthick=yuen(conmpfc,chrmpfc,tr=.2,alpha=.05)
#print(mpfcthick$p.value)
#    print(sqrt(mpfcthick$teststat/(mpfcthick$teststat^2+mpfcthick$df)))
#    cat('\n')
#print('SMC thickness')
#smcthick=yuen(consmc,chrsmc,tr=.2,alpha=.05)
#print(smcthick$p.value)
#    print(sqrt(smcthick$teststat/(smcthick$teststat^2+smcthick$df)))
#    cat('\n')
#print('PC thickness')
#pcthick=yuen(conpc,chrpc,tr=.2,alpha=.05)
#print(pcthick$p.value)
#    print(sqrt(pcthick$teststat/(pcthick$teststat^2+pcthick$df)))
#    cat('\n')
#print('MTC thickness')
#mtcthick=yuen(conmtc,chrmtc,tr=.2,alpha=.05)
#print(mtcthick$p.value)
#    print(sqrt(mtcthick$teststat/(mtcthick$teststat^2+mtcthick$df)))
#    cat('\n')
#print('LTC thickness')
#ltcthick=yuen(conltc,chrltc,tr=.2,alpha=.05)
#print(ltcthick$p.value)
#    print(sqrt(ltcthick$teststat/(ltcthick$teststat^2+ltcthick$df)))
#    cat('\n')
#print('OCC thickness')
#occthick=yuen(conocc,chrocc,tr=.2,alpha=.05)
#print(occthick$p.value)
#    print(sqrt(occthick$teststat/(occthick$teststat^2+occthick$df)))




#"OFC","MPFC","LPFC","SMC","PC","MTC","LTC","OCC","Subject.Name","side"
#robust test
#install.packages("WRS", repos="http://R-Forge.R-project.org")
#source('Rallfun-v20')
#CHR <- subset(totalData, totalData$group=="CHR")
#CON <- subset(totalData, totalData$group=="CON")
#
#covGrp1 <- CHR$TGV
#dvGrp1 <- CHR$LTCprob
#covGrp2 <- CON$TGV
#dvGrp2 <- CON$LTCprob 
#
#print(ancova(covGrp1, dvGrp1, covGrp2, dvGrp2))
#print(ancboot(covGrp1, dvGrp1, covGrp2, dvGrp2,nboot=2000,plotit=T))



#opening patient data
patient = read.delim('background/patients.csv',sep=',',header=T)
#patient info
patientInfo = cbind(subset(totalData, totalData$group=="CHR"),patient)



#######################################################################
####################             ######################################
#################### Correlation ######################################
####################             ######################################
#######################################################################
library(WRS)
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




###################################################################
###################################################################
# probability stack data ##########################################
###################################################################
###################################################################
#stackData = cbind(stack(totalData,select=c(OFCprob,MPFCprob,LPFCprob,SMCprob,PCprob,MTCprob,LTCprob,OCCprob)),totalData$Subject.Name,totalData$side,totalData$group)
#
##names(stackData)=c("Mean probability of connection","From thalamus","side","group")
#
#names(stackData)=c("values","ind","subj","side","group")
##left
#stackDataLeft = subset(stackData, side=='left')
#stackDataLeftCHR = subset(stackDataLeft, group=='CHR')
#stackDataLeftCON = subset(stackDataLeft, group=='CON')
##right
#stackDataRight = subset(stackData, side=='right')
#stackDataRightCHR = subset(stackDataRight, group=='CHR')
#stackDataRightCON = subset(stackDataRight, group=='CON')
#
#
#
#
#chrRightProbGraph=ggplot(stackDataRightCHR,aes(ind,values))+geom_boxplot()+ggtitle("CHR right probability distribution")+labs(x="From Thalamus",y="Mean probability of connection of thalamus voxels")+ylim(0,1)
#chrLeftProbGraph=ggplot(stackDataLeftCHR,aes(ind,values))+geom_boxplot()+ggtitle("CHR left probability distribution")+labs(x="From Thalamus",y="Mean probability of connection of thalamus voxels")+ylim(0,1)
#
#conRightProbGraph=ggplot(stackDataRightCON,aes(ind,values))+geom_boxplot()+ggtitle("CON right probability distribution")+labs(x="From Thalamus",y="Mean probability of connection of thalamus voxels")+ylim(0,1)
#
#conLeftProbGraph=ggplot(stackDataLeftCON,aes(ind,values))+geom_boxplot()+ggtitle("CON left probability distribution")+labs(x="From Thalamus",y="Mean probability of connection of thalamus voxels")+ylim(0,1)
#
#
##multiplot(chrRightProbGraph,chrLeftProbGraph,conRightProbGraph,conLeftProbGraph,cols=2)
#
#
##ggplot(stackData,aes(ind,values,fill=group))+stat_summary(fun.y=mean, geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9), width=0.2)+ggtitle("Connectivity summary in each group")+labs(x="From thalamus",y="Mean probability of connectivity of thalamus voxels(connectivity/number of thalamus voxels)")
##ggplot(stackData,aes(ind,values,fill=group))+stat_summary(fun.y=mean, geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9), width=0.2)+ggtitle("Probability of connection")+labs(x="From thalamus to Cortex",y="Mean connectivity")+facet_wrap(~ side)
#
##printing CHR each subject variation in mean connectivity####
#maxLchr=ggplot(stackDataRightCHR,aes(subj,values))+geom_boxplot()+geom_point(position="dodge",aes(colour=ind,size=4))+ggtitle("Summary of mean connectivities in CHR right")+labs(x="subjects",y="mean connectivity to a target")+ylim(0,1)
#maxRchr=ggplot(stackDataLeftCHR,aes(subj,values))+geom_boxplot()+geom_point(position="dodge",aes(colour=ind,size=4))+ggtitle("Summary of mean connectivities in CHR left")+labs(x="subjects",y="mean connectivity to a target")+ylim(0,1)
#maxLcon=ggplot(stackDataRightCON,aes(subj,values))+geom_boxplot()+geom_point(position="dodge",aes(colour=ind,size=4))+ggtitle("Summary of mean connectivities in CON right")+labs(x="subjects",y="mean connectivity to a target")+ylim(0,1)
#maxRcon=ggplot(stackDataLeftCON,aes(subj,values))+geom_boxplot()+geom_point(position="dodge",aes(colour=ind,size=4))+ggtitle("Summary of mean connectivities in CON left")+labs(x="subjects",y="mean connectivity to a target")+ylim(0,1)
#
#
#multiplot(maxLchr,maxRchr,maxLcon,maxRcon,cols=2)




###################################################################
###################################################################
# cortical volume stack data ########################################
###################################################################
###################################################################
#ttest : both side
#print(t.test(totalData$OFCvol[totalData$group=='CHR'],totalData$OFCvol[totalData$group=='CON']))
#print(t.test(totalData$MPFCvol[totalData$group=='CHR'],totalData$MPFCvol[totalData$group=='CON']))
#print(t.test(totalData$LPFCvol[totalData$group=='CHR'],totalData$LPFCvol[totalData$group=='CON']))
#print(t.test(totalData$SMCvol[totalData$group=='CHR'],totalData$SMCvol[totalData$group=='CON']))
#print(t.test(totalData$PCvol[totalData$group=='CHR'],totalData$PCvol[totalData$group=='CON']))
#print(t.test(totalData$MTCvol[totalData$group=='CHR'],totalData$MTCvol[totalData$group=='CON']))
#print(t.test(totalData$LTCvol[totalData$group=='CHR'],totalData$LTCvol[totalData$group=='CON']))
#print(t.test(totalData$OCCvol[totalData$group=='CHR'],totalData$OCCvol[totalData$group=='CON']))
#
##ttest : left side
#print(t.test(totalData$OFCvol[totalData$group=='CHR'&totalData$side=='left'],totalData$OFCvol[totalData$group=='CON'&totalData$side=='left']))
#print(t.test(totalData$MPFCvol[totalData$group=='CHR'&totalData$side=='left'],totalData$MPFCvol[totalData$group=='CON'&totalData$side=='left']))
#print(t.test(totalData$LPFCvol[totalData$group=='CHR'&totalData$side=='left'],totalData$LPFCvol[totalData$group=='CON'&totalData$side=='left']))
#print(t.test(totalData$SMCvol[totalData$group=='CHR'&totalData$side=='left'],totalData$SMCvol[totalData$group=='CON'&totalData$side=='left']))
#print(t.test(totalData$PCvol[totalData$group=='CHR'&totalData$side=='left'],totalData$PCvol[totalData$group=='CON'&totalData$side=='left']))
#print(t.test(totalData$MTCvol[totalData$group=='CHR'&totalData$side=='left'],totalData$MTCvol[totalData$group=='CON'&totalData$side=='left']))
#print(t.test(totalData$LTCvol[totalData$group=='CHR'&totalData$side=='left'],totalData$LTCvol[totalData$group=='CON'&totalData$side=='left']))
#print(t.test(totalData$OCCvol[totalData$group=='CHR'&totalData$side=='left'],totalData$OCCvol[totalData$group=='CON'&totalData$side=='left']))
#
#
##ttest : right side
#print(t.test(totalData$OFCvol[totalData$group=='CHR'&totalData$side=='right'],totalData$OFCvol[totalData$group=='CON'&totalData$side=='right']))
#print(t.test(totalData$MPFCvol[totalData$group=='CHR'&totalData$side=='right'],totalData$MPFCvol[totalData$group=='CON'&totalData$side=='right']))
#print(t.test(totalData$LPFCvol[totalData$group=='CHR'&totalData$side=='right'],totalData$LPFCvol[totalData$group=='CON'&totalData$side=='right']))
#print(t.test(totalData$SMCvol[totalData$group=='CHR'&totalData$side=='right'],totalData$SMCvol[totalData$group=='CON'&totalData$side=='right']))
#print(t.test(totalData$PCvol[totalData$group=='CHR'&totalData$side=='right'],totalData$PCvol[totalData$group=='CON'&totalData$side=='right']))
#print(t.test(totalData$MTCvol[totalData$group=='CHR'&totalData$side=='right'],totalData$MTCvol[totalData$group=='CON'&totalData$side=='right']))
#print(t.test(totalData$LTCvol[totalData$group=='CHR'&totalData$side=='right'],totalData$LTCvol[totalData$group=='CON'&totalData$side=='right']))
#print(t.test(totalData$OCCvol[totalData$group=='CHR'&totalData$side=='right'],totalData$OCCvol[totalData$group=='CON'&totalData$side=='right']))









###################################################################
#stackData = cbind(stack(totalData,select=c(OFCvol,MPFCvol,LPFCvol,SMCvol,PCvol,MTCvol,LTCvol,OCCvol)),totalData$side,totalData$group)
#
##names(stackData)=c("Mean probability of connection","From thalamus","side","group")
#
#names(stackData)=c("values","ind","side","group")
##left
#stackDataLeft = subset(stackData, side=='left')
#stackDataLeftCHR = subset(stackDataLeft, group=='CHR')
#stackDataLeftCON = subset(stackDataLeft, group=='CON')
##right
#stackDataRight = subset(stackData, side=='right')
#stackDataRightCHR = subset(stackDataRight, group=='CHR')
#stackDataRightCON = subset(stackDataRight, group=='CON')
#
#
#
#
#chrRightProbGraph=ggplot(stackDataRightCHR,aes(ind,values))+geom_boxplot()+ggtitle("CHR right cortex volume distribution")+labs(x="Cortex Volume",y="Volume")
#chrLeftProbGraph=ggplot(stackDataLeftCHR,aes(ind,values))+geom_boxplot()+ggtitle("CHR left cortex volume distribution")+labs(x="Cortex Volume",y="Volume")
#conRightProbGraph=ggplot(stackDataRightCON,aes(ind,values))+geom_boxplot()+ggtitle("CON right cortex volume distribution")+labs(x="Cortex Volume",y="Volume")
#conLeftProbGraph=ggplot(stackDataLeftCON,aes(ind,values))+geom_boxplot()+ggtitle("CON left cortex volume distribution")+labs(x="Cortex Volume",y="Volume")
#
#
#
#multiplot(chrRightProbGraph,chrLeftProbGraph,conRightProbGraph,conLeftProbGraph,cols=2)
#ggplot(stackData,aes(ind,values,fill=group))+stat_summary(fun.y=mean, geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9), width=0.2)+ggtitle("Cortex Volume Summary in each group")+labs(x="Cortex",y="Volumes")+facet_wrap(~ side)




###################################################################
###################################################################
# cortical thickness stack data ############################################
###################################################################
###################################################################
#stackData = cbind(stack(totalData,select=c(OFCthick,MPFCthick,LPFCthick,SMCthick,PCthick,MTCthick,LTCthick,OCCthick)),totalData$side,totalData$group)
#
##names(stackData)=c("Mean probability of connection","From thalamus","side","group")
#
#names(stackData)=c("values","ind","side","group")
##left
#stackDataLeft = subset(stackData, side=='left')
#stackDataLeftCHR = subset(stackDataLeft, group=='CHR')
#stackDataLeftCON = subset(stackDataLeft, group=='CON')
##right
#stackDataRight = subset(stackData, side=='right')
#stackDataRightCHR = subset(stackDataRight, group=='CHR')
#stackDataRightCON = subset(stackDataRight, group=='CON')
#
#
#
#
#chrRightProbGraph=ggplot(stackDataRightCHR,aes(ind,values))+geom_boxplot()+ggtitle("CHR right cortical thickness")+labs(x="Cortex",y="Volume")
#chrLeftProbGraph=ggplot(stackDataLeftCHR,aes(ind,values))+geom_boxplot()+ggtitle("CHR left cortical thickness")+labs(x="Cortex",y="Volume")
#
#conRightProbGraph=ggplot(stackDataRightCON,aes(ind,values))+geom_boxplot()+ggtitle("CON right cortical thickness")+labs(x="Cortex",y="Volume")
#
#conLeftProbGraph=ggplot(stackDataLeftCON,aes(ind,values))+geom_boxplot()+ggtitle("CON left cortical thickness")+labs(x="Cortex",y="Volume")
#
#
##multiplot(chrRightProbGraph,chrLeftProbGraph,conRightProbGraph,conLeftProbGraph,cols=2)
##
##
#ggplot(stackData,aes(ind,values,fill=group))+stat_summary(fun.y=mean, geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9), width=0.2)+ggtitle("Cortex thickness summary in each group")+labs(x="Cortex",y="Mean thickness")
#ggplot(stackData,aes(ind,values,fill=group))+stat_summary(fun.y=mean, geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9), width=0.2)+ggtitle("Probability of connection")+labs(x="From thalamus to Cortex",y="Mean connectivity")+facet_wrap(~ side)


###################################################################
###################################################################
# total brain volume ############################################
###################################################################
###################################################################



######################################################################
##### Medial temporal cortex ########################################### 
######################################################################
#stackMedial=cbind(stack(totalData,select=MTCthick),totalData$side,totalData$group)
#names(stackMedial)=c("values","ind","side","group")
#
#ggplot(stackMedial,aes(ind,values))+geom_histogram()+ggtitle("Medial cortex thickness")+labs(x="Medial cortex",y="Volume")




###################################################################
###################################################################
# Maximum probability voxel #######################################
###################################################################
###################################################################
totalMaxProb=rbind(maxProbabilityCON,maxProbabilityCHR)
#Normality check
#    print('OFC maximum probability')
#print(shapiro.test(totalMaxProb$OFCc))
#    print('MPFC maximum probability')
#print(shapiro.test(totalMaxProb$MPFCc))
#    print('LPFC maximum probability')
#print(shapiro.test(totalMaxProb$LPFCc))
#    print('SMC maximum probability')
#print(shapiro.test(totalMaxProb$SMCc))
#    print('PC maximum probability')
#print(shapiro.test(totalMaxProb$PCc))
#    print('MTC maximum probability')
#print(shapiro.test(totalMaxProb$MTCc))
#    print('LTC maximum probability')
#print(shapiro.test(totalMaxProb$LTCc))
#    print('OCC maximum probability')
#print(shapiro.test(totalMaxProb$OCCc))

#Variance check
#    print('OFC maximum probability of connection')
#print(leveneTest(totalMaxProb$OFCc,totalMaxProb$group))
#    print('MPFC maximum probability of connection')
#print(leveneTest(totalMaxProb$MPFCc,totalMaxProb$group))
#    print('LPFC maximum probability of connection')
#print(leveneTest(totalMaxProb$LPFCc,totalMaxProb$group))
#    print('SMC maximum probability of connection')
#print(leveneTest(totalMaxProb$SMCc,totalMaxProb$group))
#    print('PC maximum probability of connection')
#print(leveneTest(totalMaxProb$PCc,totalMaxProb$group))
#    print('MTC maximum probability of connection')
#print(leveneTest(totalMaxProb$MTCc,totalMaxProb$group))
#    print('LTC maximum probability of connection')
#print(leveneTest(totalMaxProb$LTCc,totalMaxProb$group))
#    print('OCC maximum probability of connection')
#print(leveneTest(totalMaxProb$OCCc,totalMaxProb$group))

#robust test comparing means
#change here
#yuen : trimmed mean
#conofc = subset(totalMaxProb$OFCc, totalMaxProb$group=="CON")
#chrofc = subset(totalMaxProb$OFCc, totalMaxProb$group=="CHR")
#conlpfc = subset(totalMaxProb$LPFCc, totalMaxProb$group=="CON")
#chrlpfc = subset(totalMaxProb$LPFCc, totalMaxProb$group=="CHR")
#conmpfc = subset(totalMaxProb$MPFCc, totalMaxProb$group=="CON")
#chrmpfc = subset(totalMaxProb$MPFCc, totalMaxProb$group=="CHR")
#consmc = subset(totalMaxProb$SMCc, totalMaxProb$group=="CON")
#chrsmc = subset(totalMaxProb$SMCc, totalMaxProb$group=="CHR")
#conpc = subset(totalMaxProb$PCc, totalMaxProb$group=="CON")
#chrpc = subset(totalMaxProb$PCc, totalMaxProb$group=="CHR")
#conmtc = subset(totalMaxProb$MTCc, totalMaxProb$group=="CON")
#chrmtc = subset(totalMaxProb$MTCc, totalMaxProb$group=="CHR")
#conltc = subset(totalMaxProb$LTCc, totalMaxProb$group=="CON")
#chrltc = subset(totalMaxProb$LTCc, totalMaxProb$group=="CHR")
#conocc = subset(totalMaxProb$OCCc, totalMaxProb$group=="CON")
#chrocc = subset(totalMaxProb$OCCc, totalMaxProb$group=="CHR")
#
##actualy robust test
#print('OFC maximum probability of connection')
#ofcmaxProb=yuen(conofc,chrofc,tr=.2,alpha=.05)
#print(paste('p value : ',format(ofcmaxProb$p.value,nsmall=3)))
#print(paste('effect size : ',format(sqrt(ofcmaxProb$teststat/(ofcmaxProb$teststat^2+ofcmaxProb$df)),nsmall=3)))
#    cat('\n')
#
#print('LPFC maximum probability of connection')
#lpfcmaxProb=yuen(conlpfc,chrlpfc,tr=.2,alpha=.05)
#print(paste('p value : ',format(lpfcmaxProb$p.value,nsmall=3)))
#print(paste('effect size : ',format(sqrt(lpfcmaxProb$teststat/(lpfcmaxProb$teststat^2+lpfcmaxProb$df)),nsmall=3)))
#    cat('\n')
#
#print('MPFC maximum probability of connection')
#mpfcmaxProb=yuen(conmpfc,chrmpfc,tr=.2,alpha=.05)
#print(paste('p value : ',format(mpfcmaxProb$p.value,nsmall=3)))
#print(paste('effect size : ',format(sqrt(mpfcmaxProb$teststat/(mpfcmaxProb$teststat^2+mpfcmaxProb$df)),nsmall=3)))
#    cat('\n')
#
#print('SMC maximum probability of connection')
#smcmaxProb=yuen(consmc,chrsmc,tr=.2,alpha=.05)
#print(paste('p value : ',format(smcmaxProb$p.value,nsmall=3)))
#print(paste('effect size : ',format(sqrt(smcmaxProb$teststat/(smcmaxProb$teststat^2+smcmaxProb$df)),nsmall=3)))
#    cat('\n')
#
#print('PC maximum probability of connection')
#pcmaxProb=yuen(conpc,chrpc,tr=.2,alpha=.05)
#print(paste('p value : ',format(pcmaxProb$p.value,nsmall=3)))
#print(paste('effect size : ',format(sqrt(pcmaxProb$teststat/(pcmaxProb$teststat^2+pcmaxProb$df)),nsmall=3)))
#    cat('\n')
#
#print('MTC maximum probability of connection')
#mtcmaxProb=yuen(conmtc,chrmtc,tr=.2,alpha=.05)
#print(paste('p value : ',format(mtcmaxProb$p.value,nsmall=3)))
#print(paste('effect size : ',format(sqrt(mtcmaxProb$teststat/(mtcmaxProb$teststat^2+mtcmaxProb$df)),nsmall=3)))
#    cat('\n')
#
#print('LTC maximum probability of connection')
#ltcmaxProb=yuen(conltc,chrltc,tr=.2,alpha=.05)
#print(paste('p value : ',format(ltcmaxProb$p.value,nsmall=3)))
#print(paste('effect size : ',format(sqrt(ltcmaxProb$teststat/(ltcmaxProb$teststat^2+ltcmaxProb$df)),nsmall=3)))
#    cat('\n')
#
#print('OCC maximum probability of connection')
#occmaxProb=yuen(conocc,chrocc,tr=.2,alpha=.05)
#print(paste('p value : ',format(occmaxProb$p.value,nsmall=3)))
#print(paste('effect size : ',format(sqrt(occmaxProb$teststat/(occmaxProb$teststat^2+occmaxProb$df)),nsmall=3)))
#
#
#maxProbStackData = cbind(stack(totalMaxProb,select=c(OFCc,MPFCc,LPFCc,SMCc,PCc,MTCc,LTCc,OCCc)),totalMaxProb$Subject.Name,totalMaxProb$side,totalMaxProb$group)
#
#names(maxProbStackData)=c("values","ind","subj","side","group")
##left
#maxProbStackDataLeft = subset(maxProbStackData, side=='left')
#maxProbStackDataLeftCHR = subset(maxProbStackDataLeft, group=='CHR')
#maxProbStackDataLeftCON = subset(maxProbStackDataLeft, group=='CON')
##right
#maxProbStackDataRight = subset(maxProbStackData, side=='right')
#maxProbStackDataRightCHR = subset(maxProbStackDataRight, group=='CHR')
#maxProbStackDataRightCON = subset(maxProbStackDataRight, group=='CON')
#
#
#
##Graphs for seeing subject variability
#ggplot(maxProbStackData,aes(ind,values,fill=group))+stat_summary(fun.y=mean, geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9), width=0.2)+ggtitle("Maximum connectivity for each target cortex from thalamus")+labs(x="Tractography target",y="Maximum connectivity")
##ggplot(maxProbStackData,aes(ind,values,fill=group))+stat_summary(fun.y=mean, geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9), width=0.2)+ggtitle("Maximum probability of connection\nfor each cortex target")+labs(x="From thalamus to Cortex",y="Maximum connectivity")+facet_wrap(~ side)
#
##Graphs for seeing cortex variability
#chrRightMaxProbGraph=ggplot(maxProbStackDataRightCHR,aes(ind,values))+geom_boxplot()+ggtitle("CHR right maximum probability")+labs(x="Cortex",y="Maximum probability")
#chrLeftMaxProbGraph=ggplot(maxProbStackDataLeftCHR,aes(ind,values))+geom_boxplot()+ggtitle("CHR left maximum probability")+labs(x="Cortex",y="Maximum probability")
#
#conRightMaxProbGraph=ggplot(maxProbStackDataRightCON,aes(ind,values))+geom_boxplot()+ggtitle("CON right maximum probability")+labs(x="Cortex",y="Maximum probability")
#conLeftMaxProbGraph=ggplot(maxProbStackDataLeftCON,aes(ind,values))+geom_boxplot()+ggtitle("CON left maximum probability")+labs(x="Cortex",y="Maximum probability")
#multiplot(chrRightMaxProbGraph,chrLeftMaxProbGraph,conRightMaxProbGraph,conLeftMaxProbGraph,cols=2)



##printing CHR each subject variation in max connectivity####
#maxLchr=ggplot(maxProbStackDataLeftCHR,aes(subj,values))+geom_boxplot()+geom_point(position="dodge",aes(colour=ind,size=4))+ggtitle("Summary of maximum connectivities in CHR left")+labs(x="subjects",y="maximum connectivity to a target")
#maxRchr=ggplot(maxProbStackDataRightCHR,aes(subj,values))+geom_boxplot()+geom_point(position="dodge",aes(colour=ind,size=4))+ggtitle("Summary of maximum connectivities in CHR right")+labs(x="subjects",y="maximum connectivity to a target")
#maxLcon=ggplot(maxProbStackDataLeftCON,aes(subj,values))+geom_boxplot()+geom_point(position="dodge",aes(colour=ind,size=4))+ggtitle("Summary of maximum connectivities in CON left")+labs(x="subjects",y="maximum connectivity to a target")
#maxRcon=ggplot(maxProbStackDataRightCON,aes(subj,values))+geom_boxplot()+geom_point(position="dodge",aes(colour=ind,size=4))+ggtitle("Summary of maximum connectivities in CON right")+labs(x="subjects",y="maximum connectivity to a target")
##
##
#multiplot(maxLchr,maxRchr,maxLcon,maxRcon,cols=2)




###################################################################
###################################################################
# subvolume divided by thalamus volume plot #######################################
###################################################################
###################################################################
#stackData = cbind(stack(totalData,select=c(OFCsubvol,MPFCsubvol,LPFCsubvol,SMCsubvol,PCsubvol,MTCsubvol,LTCsubvol,OCCsubvol)),totalData$Subject.Name,totalData$side,totalData$group)
#
##names(stackData)=c("Mean probability of connection","From thalamus","side","group")
#
#names(stackData)=c("values","ind","subj","side","group")
##left
#stackDataLeft = subset(stackData, side=='left')
#stackDataLeftCHR = subset(stackDataLeft, group=='CHR')
#stackDataLeftCON = subset(stackDataLeft, group=='CON')
##right
#stackDataRight = subset(stackData, side=='right')
#stackDataRightCHR = subset(stackDataRight, group=='CHR')
#stackDataRightCON = subset(stackDataRight, group=='CON')
#
#
#
#
#chrRightProbGraph=ggplot(stackDataRightCHR,aes(ind,values))+geom_point()+ggtitle("CHR right thalamus subregion volume")+labs(x="Connection cortex",y="volume in % (of thalamus)")
#
#chrLeftProbGraph=ggplot(stackDataLeftCHR,aes(ind,values))+geom_point()+ggtitle("CHR right thalamus subregion volume")+labs(x="Cortex",y="volume in % (of thalamus)")
#
#conRightProbGraph=ggplot(stackDataRightCON,aes(ind,values))+geom_point()+ggtitle("CON right thalamus subregion volume")+labs(x="Cortex",y="volume in % (of thalamus)")
#
#conLeftProbGraph=ggplot(stackDataLeftCON,aes(ind,values))+geom_point()+ggtitle("CON right thalamus subregion volume")+labs(x="Cortex",y="volume in % (of thalamus)")


#multiplot(chrRightProbGraph,chrLeftProbGraph,conRightProbGraph,conLeftProbGraph,cols=2)
#
#
#ggplot(stackData,aes(ind,values,fill=group))+stat_summary(fun.y=mean, geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9), width=0.2)+ggtitle("Thalamus segmentation summary in each group")+labs(x="volume",y="volume in % (of thalamus)")
#ggplot(stackData,aes(ind,values,fill=group))+stat_summary(fun.y=mean, geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9), width=0.2)+ggtitle("Thalamus segmentation summary in each group")+labs(x="volume",y="volume in % (of thalamus)")+facet_wrap(~side)





############################################################################
## Thresholded probability of connection####################################
############################################################################
#totalThrMeanConnectivity=rbind(thrMeanProbCON,thrMeanProbCHR)
#ttest : both side
#print(t.test(totalThrMeanConnectivity$OFC[totalThrMeanConnectivity$group=='CHR'],totalThrMeanConnectivity$OFC[totalThrMeanConnectivity$group=='CON']))
#print(t.test(totalThrMeanConnectivity$MPFC[totalThrMeanConnectivity$group=='CHR'],totalThrMeanConnectivity$MPFC[totalThrMeanConnectivity$group=='CON']))
#print(t.test(totalThrMeanConnectivity$LPFC[totalThrMeanConnectivity$group=='CHR'],totalThrMeanConnectivity$LPFC[totalThrMeanConnectivity$group=='CON']))
#print(t.test(totalThrMeanConnectivity$SMC[totalThrMeanConnectivity$group=='CHR'],totalThrMeanConnectivity$SMC[totalThrMeanConnectivity$group=='CON']))
#print(t.test(totalThrMeanConnectivity$PC[totalThrMeanConnectivity$group=='CHR'],totalThrMeanConnectivity$PC[totalThrMeanConnectivity$group=='CON']))
#print(t.test(totalThrMeanConnectivity$MTC[totalThrMeanConnectivity$group=='CHR'],totalThrMeanConnectivity$MTC[totalThrMeanConnectivity$group=='CON']))
#print(t.test(totalThrMeanConnectivity$LTC[totalThrMeanConnectivity$group=='CHR'],totalThrMeanConnectivity$LTC[totalThrMeanConnectivity$group=='CON']))
#print(t.test(totalThrMeanConnectivity$OCC[totalThrMeanConnectivity$group=='CHR'],totalThrMeanConnectivity$OCC[totalThrMeanConnectivity$group=='CON']))
#
##ttest : left side
#print(t.test(totalThrMeanConnectivity$OFC[totalThrMeanConnectivity$group=='CHR'&totalThrMeanConnectivity$side=='left'],totalThrMeanConnectivity$OFC[totalThrMeanConnectivity$group=='CON'&totalThrMeanConnectivity$side=='left']))
#print(t.test(totalThrMeanConnectivity$MPFC[totalThrMeanConnectivity$group=='CHR'&totalThrMeanConnectivity$side=='left'],totalThrMeanConnectivity$MPFC[totalThrMeanConnectivity$group=='CON'&totalThrMeanConnectivity$side=='left']))
#print(t.test(totalThrMeanConnectivity$LPFC[totalThrMeanConnectivity$group=='CHR'&totalThrMeanConnectivity$side=='left'],totalThrMeanConnectivity$LPFC[totalThrMeanConnectivity$group=='CON'&totalThrMeanConnectivity$side=='left']))
#print(t.test(totalThrMeanConnectivity$SMC[totalThrMeanConnectivity$group=='CHR'&totalThrMeanConnectivity$side=='left'],totalThrMeanConnectivity$SMC[totalThrMeanConnectivity$group=='CON'&totalThrMeanConnectivity$side=='left']))
#print(t.test(totalThrMeanConnectivity$PC[totalThrMeanConnectivity$group=='CHR'&totalThrMeanConnectivity$side=='left'],totalThrMeanConnectivity$PC[totalThrMeanConnectivity$group=='CON'&totalThrMeanConnectivity$side=='left']))
#print(t.test(totalThrMeanConnectivity$MTC[totalThrMeanConnectivity$group=='CHR'&totalThrMeanConnectivity$side=='left'],totalThrMeanConnectivity$MTC[totalThrMeanConnectivity$group=='CON'&totalThrMeanConnectivity$side=='left']))
#print(t.test(totalThrMeanConnectivity$LTC[totalThrMeanConnectivity$group=='CHR'&totalThrMeanConnectivity$side=='left'],totalThrMeanConnectivity$LTC[totalThrMeanConnectivity$group=='CON'&totalThrMeanConnectivity$side=='left']))
#print(t.test(totalThrMeanConnectivity$OCC[totalThrMeanConnectivity$group=='CHR'&totalThrMeanConnectivity$side=='left'],totalThrMeanConnectivity$OCC[totalThrMeanConnectivity$group=='CON'&totalThrMeanConnectivity$side=='left']))
#
#
##ttest : right side
#print(t.test(totalThrMeanConnectivity$OFC[totalThrMeanConnectivity$group=='CHR'&totalThrMeanConnectivity$side=='right'],totalThrMeanConnectivity$OFC[totalThrMeanConnectivity$group=='CON'&totalThrMeanConnectivity$side=='right']))
#print(t.test(totalThrMeanConnectivity$MPFC[totalThrMeanConnectivity$group=='CHR'&totalThrMeanConnectivity$side=='right'],totalThrMeanConnectivity$MPFC[totalThrMeanConnectivity$group=='CON'&totalThrMeanConnectivity$side=='right']))
#print(t.test(totalThrMeanConnectivity$LPFC[totalThrMeanConnectivity$group=='CHR'&totalThrMeanConnectivity$side=='right'],totalThrMeanConnectivity$LPFC[totalThrMeanConnectivity$group=='CON'&totalThrMeanConnectivity$side=='right']))
#print(t.test(totalThrMeanConnectivity$SMC[totalThrMeanConnectivity$group=='CHR'&totalThrMeanConnectivity$side=='right'],totalThrMeanConnectivity$SMC[totalThrMeanConnectivity$group=='CON'&totalThrMeanConnectivity$side=='right']))
#print(t.test(totalThrMeanConnectivity$PC[totalThrMeanConnectivity$group=='CHR'&totalThrMeanConnectivity$side=='right'],totalThrMeanConnectivity$PC[totalThrMeanConnectivity$group=='CON'&totalThrMeanConnectivity$side=='right']))
#print(t.test(totalThrMeanConnectivity$MTC[totalThrMeanConnectivity$group=='CHR'&totalThrMeanConnectivity$side=='right'],totalThrMeanConnectivity$MTC[totalThrMeanConnectivity$group=='CON'&totalThrMeanConnectivity$side=='right']))
#print(t.test(totalThrMeanConnectivity$LTC[totalThrMeanConnectivity$group=='CHR'&totalThrMeanConnectivity$side=='right'],totalThrMeanConnectivity$LTC[totalThrMeanConnectivity$group=='CON'&totalThrMeanConnectivity$side=='right']))
#print(t.test(totalThrMeanConnectivity$OCC[totalThrMeanConnectivity$group=='CHR'&totalThrMeanConnectivity$side=='right'],totalThrMeanConnectivity$OCC[totalThrMeanConnectivity$group=='CON'&totalThrMeanConnectivity$side=='right']))
#
#
#
#
#
#
#
#
#
####################################################################
##10 % thresholding
#stackData10 = cbind(stack(totalThrMeanConnectivity,select=c(thr10_OFC,thr10_MPFC,thr10_LPFC,thr10_SMC,thr10_PC,thr10_MTC,thr10_LTC,thr10_OCC)),totalThrMeanConnectivity$side,totalThrMeanConnectivity$group)
#names(stackData10)=c("values","ind","side","group")
####################################################################
##15
#stackData15 = cbind(stack(totalThrMeanConnectivity,select=c(thr15_OFC,thr15_MPFC,thr15_LPFC,thr15_SMC,thr15_PC,thr15_MTC,thr15_LTC,thr15_OCC)),totalThrMeanConnectivity$side,totalThrMeanConnectivity$group)
#names(stackData15)=c("values","ind","side","group")
####################################################################
##20
#stackData20 = cbind(stack(totalThrMeanConnectivity,select=c(thr20_OFC,thr20_MPFC,thr20_LPFC,thr20_SMC,thr20_PC,thr20_MTC,thr20_LTC,thr20_OCC)),totalThrMeanConnectivity$side,totalThrMeanConnectivity$group)
#names(stackData20)=c("values","ind","side","group")
####################################################################
##40
#stackData40 = cbind(stack(totalThrMeanConnectivity,select=c(thr40_OFC,thr40_MPFC,thr40_LPFC,thr40_SMC,thr40_PC,thr40_MTC,thr40_LTC,thr40_OCC)),totalThrMeanConnectivity$side,totalThrMeanConnectivity$group)
#names(stackData40)=c("values","ind","side","group")
####################################################################
##80
#stackData80 = cbind(stack(totalThrMeanConnectivity,select=c(thr80_OFC,thr80_MPFC,thr80_LPFC,thr80_SMC,thr80_PC,thr80_MTC,thr80_LTC,thr80_OCC)),totalThrMeanConnectivity$side,totalThrMeanConnectivity$group)
#names(stackData80)=c("values","ind","side","group")
###################################################################
#no thresholding
#stackData0 = cbind(stack(totalThrMeanConnectivity,select=c(OFC,MPFC,LPFC,SMC,PC,MTC,LTC,OCC)),totalThrMeanConnectivity$side,totalThrMeanConnectivity$group)
#names(stackData0)=c("values","ind","side","group")
####################################################################
#
##names(stackData)=c("Mean probability of connection","From thalamus","side","group")
#
##left
#stackDataLeft0 = subset(stackData0, side=='left')
#stackDataLeft10 = subset(stackData10, side=='left')
#stackDataLeft15 = subset(stackData15, side=='left')
#stackDataLeft20 = subset(stackData20, side=='left')
#stackDataLeft40 = subset(stackData40, side=='left')
#stackDataLeft80 = subset(stackData80, side=='left')
#stackDataLeftCHR0 = subset(stackDataLeft0, group=='CHR')
#stackDataLeftCHR10= subset(stackDataLeft10, group=='CHR')
#stackDataLeftCHR15= subset(stackDataLeft15, group=='CHR')
#stackDataLeftCHR20= subset(stackDataLeft20, group=='CHR')
#stackDataLeftCHR40= subset(stackDataLeft40, group=='CHR')
#stackDataLeftCHR80= subset(stackDataLeft80, group=='CHR')
#stackDataLeftCON0  = subset(stackDataLeft0, group=='CON')
#stackDataLeftCON10 = subset(stackDataLeft10, group=='CON')
#stackDataLeftCON15 = subset(stackDataLeft15, group=='CON')
#stackDataLeftCON20 = subset(stackDataLeft20, group=='CON')
#stackDataLeftCON40 = subset(stackDataLeft40, group=='CON')
#stackDataLeftCON80 = subset(stackDataLeft80, group=='CON')
##right
#stackDataRight0 = subset(stackData0, side=='right')
#stackDataRight10 = subset(stackData10, side=='right')
#stackDataRight15 = subset(stackData15, side=='right')
#stackDataRight20 = subset(stackData20, side=='right')
#stackDataRight40 = subset(stackData40, side=='right')
#stackDataRight80 = subset(stackData80, side=='right')
#stackDataRightCHR0 = subset(stackDataRight0, group=='CHR')
#stackDataRightCHR10= subset(stackDataRight10, group=='CHR')
#stackDataRightCHR15= subset(stackDataRight15, group=='CHR')
#stackDataRightCHR20= subset(stackDataRight20, group=='CHR')
#stackDataRightCHR40= subset(stackDataRight40, group=='CHR')
#stackDataRightCHR80= subset(stackDataRight80, group=='CHR')
#stackDataRightCON0  = subset(stackDataRight0, group=='CON')
#stackDataRightCON10 = subset(stackDataRight10, group=='CON')
#stackDataRightCON15 = subset(stackDataRight15, group=='CON')
#stackDataRightCON20 = subset(stackDataRight20, group=='CON')
#stackDataRightCON40 = subset(stackDataRight40, group=='CON')
#stackDataRightCON80 = subset(stackDataRight80, group=='CON')

#non-zero mean graphs without threshold
#chrRightProbGraph0=ggplot(stackDataRightCHR0,aes(ind,values))+geom_point()+ggtitle("CHR right connectivity mean for non-zero voxels without threshold")+labs(x="Cortex",y="Mean connectivity")
#chrLeftProbGraph0=ggplot(stackDataLeftCHR0,aes(ind,values))+geom_point()+ggtitle("CHR left connectivity mean for non-zero voxels without threshold")+labs(x="Cortex",y="Mean connectivity")
#conRightProbGraph0=ggplot(stackDataRightCON0,aes(ind,values))+geom_point()+ggtitle("CON right connectivity mean for non-zero voxels without threshold")+labs(x="Cortex",y="Mean connectivity")
#conLeftProbGraph0=ggplot(stackDataLeftCON0,aes(ind,values))+geom_point()+ggtitle("CON left connectivity mean for non-zero voxels without threshold")+labs(x="Cortex",y="Mean connectivity")
#multiplot(chrRightProbGraph0,chrLeftProbGraph0,conRightProbGraph0,conLeftProbGraph0,cols=2)
#
#mean probability graphs with threshold of 10%
#chrRightProbGraph10=ggplot(stackDataRightCHR10,aes(ind,values))+geom_point()+ggtitle("CHR right connectivity mean for non-zero voxels without threshold")+labs(x="Cortex",y="Mean connectivity")
#chrLeftProbGraph10=ggplot(stackDataLeftCHR10,aes(ind,values))+geom_point()+ggtitle("CHR left connectivity mean for non-zero voxels without threshold")+labs(x="Cortex",y="Mean connectivity")
#conRightProbGraph10=ggplot(stackDataRightCON10,aes(ind,values))+geom_point()+ggtitle("CON right connectivity mean for non-zero voxels without threshold")+labs(x="Cortex",y="Mean connectivity")
#conLeftProbGraph10=ggplot(stackDataLeftCON10,aes(ind,values))+geom_point()+ggtitle("CON left connectivity mean for non-zero voxels without threshold")+labs(x="Cortex",y="Mean connectivity")
#multiplot(chrRightProbGraph10,chrLeftProbGraph10,conRightProbGraph10,conLeftProbGraph10,cols=2)


#stats
#normality
#    print('OFCprob')
#print(shapiro.test(totalThrMeanConnectivity$OFC))
#    print('MPFCprob')
#print(shapiro.test(totalThrMeanConnectivity$MPFC))
#    print('LPFCprob')
#print(shapiro.test(totalThrMeanConnectivity$LPFC))
#    print('SMCprob')
#print(shapiro.test(totalThrMeanConnectivity$SMC))
#    print('PCprob')
#print(shapiro.test(totalThrMeanConnectivity$PC))
#    print('MTCprob')
#print(shapiro.test(totalThrMeanConnectivity$MTC))
#    print('LTCprob')
#print(shapiro.test(totalThrMeanConnectivity$LTC))
#    print('OCCprob')
#print(shapiro.test(totalThrMeanConnectivity$OCC))

#robust test comparing means
#change here
#yuen : trimmed mean
#conofc = subset(totalThrMeanConnectivity$OFC, totalThrMeanConnectivity$group=="CON")
#chrofc = subset(totalThrMeanConnectivity$OFC, totalThrMeanConnectivity$group=="CHR")
#conlpfc = subset(totalThrMeanConnectivity$LPFC, totalThrMeanConnectivity$group=="CON")
#chrlpfc = subset(totalThrMeanConnectivity$LPFC, totalThrMeanConnectivity$group=="CHR")
#conmpfc = subset(totalThrMeanConnectivity$MPFC, totalThrMeanConnectivity$group=="CON")
#chrmpfc = subset(totalThrMeanConnectivity$MPFC, totalThrMeanConnectivity$group=="CHR")
#consmc = subset(totalThrMeanConnectivity$SMC, totalThrMeanConnectivity$group=="CON")
#chrsmc = subset(totalThrMeanConnectivity$SMC, totalThrMeanConnectivity$group=="CHR")
#conpc = subset(totalThrMeanConnectivity$PC, totalThrMeanConnectivity$group=="CON")
#chrpc = subset(totalThrMeanConnectivity$PC, totalThrMeanConnectivity$group=="CHR")
#conmtc = subset(totalThrMeanConnectivity$MTC, totalThrMeanConnectivity$group=="CON")
#chrmtc = subset(totalThrMeanConnectivity$MTC, totalThrMeanConnectivity$group=="CHR")
#conltc = subset(totalThrMeanConnectivity$LTC, totalThrMeanConnectivity$group=="CON")
#chrltc = subset(totalThrMeanConnectivity$LTC, totalThrMeanConnectivity$group=="CHR")
#conocc = subset(totalThrMeanConnectivity$OCC, totalThrMeanConnectivity$group=="CON")
#chrocc = subset(totalThrMeanConnectivity$OCC, totalMaxProb$group=="CHR")

##actualy robust test
#print('OFC mean probability of connection')
#ofcmaxProb=yuen(conofc,chrofc,tr=.2,alpha=.05)
#print(paste('p value : ',format(ofcmaxProb$p.value,nsmall=3)))
#print(paste('effect size : ',format(sqrt(ofcmaxProb$teststat/(ofcmaxProb$teststat^2+ofcmaxProb$df)),nsmall=3)))
#    cat('\n')
#
#print('LPFC mean probability of connection')
#lpfcmaxProb=yuen(conlpfc,chrlpfc,tr=.2,alpha=.05)
#print(paste('p value : ',format(lpfcmaxProb$p.value,nsmall=3)))
#print(paste('effect size : ',format(sqrt(lpfcmaxProb$teststat/(lpfcmaxProb$teststat^2+lpfcmaxProb$df)),nsmall=3)))
#    cat('\n')
#
#print('MPFC mean probability of connection')
#mpfcmaxProb=yuen(conmpfc,chrmpfc,tr=.2,alpha=.05)
#print(paste('p value : ',format(mpfcmaxProb$p.value,nsmall=3)))
#print(paste('effect size : ',format(sqrt(mpfcmaxProb$teststat/(mpfcmaxProb$teststat^2+mpfcmaxProb$df)),nsmall=3)))
#    cat('\n')
#
#print('SMC mean probability of connection')
#smcmaxProb=yuen(consmc,chrsmc,tr=.2,alpha=.05)
#print(paste('p value : ',format(smcmaxProb$p.value,nsmall=3)))
#print(paste('effect size : ',format(sqrt(smcmaxProb$teststat/(smcmaxProb$teststat^2+smcmaxProb$df)),nsmall=3)))
#    cat('\n')
#
#print('PC mean probability of connection')
#pcmaxProb=yuen(conpc,chrpc,tr=.2,alpha=.05)
#print(paste('p value : ',format(pcmaxProb$p.value,nsmall=3)))
#print(paste('effect size : ',format(sqrt(pcmaxProb$teststat/(pcmaxProb$teststat^2+pcmaxProb$df)),nsmall=3)))
#    cat('\n')
#
#print('MTC mean probability of connection')
#mtcmaxProb=yuen(conmtc,chrmtc,tr=.2,alpha=.05)
#print(paste('p value : ',format(mtcmaxProb$p.value,nsmall=3)))
#print(paste('effect size : ',format(sqrt(mtcmaxProb$teststat/(mtcmaxProb$teststat^2+mtcmaxProb$df)),nsmall=3)))
#    cat('\n')
#
#print('LTC mean probability of connection')
#ltcmaxProb=yuen(conltc,chrltc,tr=.2,alpha=.05)
#print(paste('p value : ',format(ltcmaxProb$p.value,nsmall=3)))
#print(paste('effect size : ',format(sqrt(ltcmaxProb$teststat/(ltcmaxProb$teststat^2+ltcmaxProb$df)),nsmall=3)))
#    cat('\n')
#
#print('OCC mean probability of connection')
#occmaxProb=yuen(conocc,chrocc,tr=.2,alpha=.05)
#print(paste('p value : ',format(occmaxProb$p.value,nsmall=3)))
#print(paste('effect size : ',format(sqrt(occmaxProb$teststat/(occmaxProb$teststat^2+occmaxProb$df)),nsmall=3)))




## mean bar graph for each thresholds
#prob0G=ggplot(stackData0,aes(ind,values,fill=group))+stat_summary(fun.y=mean, geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9), width=0.2)+ggtitle("Mean connectivity summary in each group\nwithout thresholding")+labs(x="Cortex",y="Mean connectivity")
#prob10G=ggplot(stackData10,aes(ind,values,fill=group))+stat_summary(fun.y=mean, geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9), width=0.2)+ggtitle("Mean connectivity summary in each group\nafter thresholding at 10%")+labs(x="Cortex",y="Mean connectivity")
#prob15G=ggplot(stackData15,aes(ind,values,fill=group))+stat_summary(fun.y=mean, geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9), width=0.2)+ggtitle("Mean connectivity summary in each group\nafter thresholding at 15%")+labs(x="Cortex",y="Mean connectivity")
#prob20G=ggplot(stackData20,aes(ind,values,fill=group))+stat_summary(fun.y=mean, geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9), width=0.2)+ggtitle("Mean connectivity summary in each group\nafter thresholding at 20%")+labs(x="Cortex",y="Mean connectivity")
#prob40G=ggplot(stackData40,aes(ind,values,fill=group))+stat_summary(fun.y=mean, geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9), width=0.2)+ggtitle("Mean connectivity summary in each group\nafter thresholding at 40%")+labs(x="Cortex",y="Mean connectivity")
#prob80G=ggplot(stackData80,aes(ind,values,fill=group))+stat_summary(fun.y=mean, geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9), width=0.2)+ggtitle("Mean connectivity summary in each group\nafter thresholding at 80%")+labs(x="Cortex",y="Mean connectivity")
#
#multiplot(prob0G,prob10G,prob15G,prob20G,prob40G,prob80G,cols=3)


##########################################################################
########## thresholded volumes and connectivity map volumes ##############
##########################################################################
##########################################################################
################## thresholded mean connectivities #######################
##########################################################################
# informations

# loading data
subthalamicVolumesThrCHR=read.delim('~/11/new/chr/logs/subthalamicVolumesThr.txt',sep='\t',header=T)
subthalamicVolumesThrCON=read.delim('~/11/new/con/logs/subthalamicVolumesThr.txt',sep='\t',header=T)
totalSubthalamicVolumesThr=rbind(subthalamicVolumesThrCON,subthalamicVolumesThrCHR)
totalSubthalamicVolumesThr=cbind(totalSubthalamicVolumesThr,totalMC[,4:ncol(totalMC)])

# t-test
ttestgo='off'
if (ttestgo=='on'){
for (i in 4:ncol(totalSubthalamicVolumesThr))
{
cat("\t\t",names(totalSubthalamicVolumesThr)[i],"\n")
    # going through homogeniety :: Levene test
    #left or right
    for (side in c('left','right'))
    {
# To call leveneTest :: eg. varOFCmc90left
        assign(paste("var",names(totalSubthalamicVolumesThr[i]),side,sep=""),
                leveneTest(totalSubthalamicVolumesThr[,i][totalSubthalamicVolumesThr$side==side],
                totalSubthalamicVolumesThr$group[totalSubthalamicVolumesThr$side==side]))
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
            if (TTEST$p.value < 0.05)
            {
            print(side)
            print(paste('p value : ',format(TTEST$p.value,nsmall=3)))
            print(paste('effect size : ',
            format(sqrt(TTEST$teststat/(TTEST$teststat^2+TTEST$df)),nsmall=3)))
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

            if (TTEST$p.value < 0.05)
            {
            print(side)
            print(paste('p value : ',format(TTEST$p.value,nsmall=3)))
            print(paste('confident internal : ',
            format(TTEST$conf.int),nsmall=3))
            }
        }
    }
cat("\n\n")
}}


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
## subvolume
#
#values=stack(totalSubthalamicVolumesThr,select=c(paste(cortex,"volthr10",sep=""),paste(cortex,"volthr20",sep=""),paste(cortex,"volthr30",sep=""),paste(cortex,"volthr40",sep=""),paste(cortex,"volthr50",sep=""),paste(cortex,"volthr60",sep=""),paste(cortex,"volthr70",sep=""),paste(cortex,"volthr80",sep=""),paste(cortex,"volthr90",sep="")))
#
#
#    subj=totalSubthalamicVolumesThr$Subject.Name
#    side=totalSubthalamicVolumesThr$side
#    group=totalSubthalamicVolumesThr$group
#    assign(paste(cortex,"vol",sep=""),cbind(values,subj,side,group))
#    plotdata = cbind(values,subj,side,group)
#
#assign(paste(cortex,"volg",sep=""),ggplot(plotdata,aes(ind,values,fill=group))+stat_summary(fun.y=mean,geom="bar",position="dodge")+stat_summary(fun.data=mean_cl_normal, geom="errorbar", position=position_dodge(width=0.9),width=0.2) +ggtitle(paste("Volume changes in subthalamic region which has highest connection to ",cortex,sep="")) + labs(x=paste("Different Threshold applied to ",cortex,sep=""),y="Mean Volume")+theme(title = element_text(face="bold", size=14)))
### connectivity within the subvolume
#values=stack(totalSubthalamicVolumesThr,select=c(paste(cortex,"meanc10",sep=""),paste(cortex,"meanc20",sep=""),paste(cortex,"meanc30",sep=""),paste(cortex,"meanc40",sep=""),paste(cortex,"meanc50",sep=""),paste(cortex,"meanc60",sep=""),paste(cortex,"meanc70",sep=""),paste(cortex,"meanc80",sep=""),paste(cortex,"meanc90",sep="")))
#    subj=totalSubthalamicVolumesThr$Subject.Name
#    side=totalSubthalamicVolumesThr$side
#    group=totalSubthalamicVolumesThr$group
#    assign(paste(cortex,"subc",sep=""),cbind(values,subj,side,group))
#    plotdata = cbind(values,subj,side,group)
#assign(paste(cortex,"subcg",sep=""),ggplot(plotdata,aes(ind,values,fill=group))+stat_summary(fun.y=mean,geom="bar",position="dodge")+stat_summary(fun.data=mean_cl_normal, geom="errorbar", position=position_dodge(width=0.9),width=0.2) +ggtitle(paste("Connectivity changes in hard segmented region which has highest connection to ",cortex,sep="")) + labs(x=paste("Different threshold applied to ",cortex,sep=""),y="Mean Connectivity")+theme(title = element_text(face="bold", size=14)))
#
### connectivity map volumes
#values=stack(totalSubthalamicVolumesThr,select=c(paste(cortex,"probVolthr10",sep=""),paste(cortex,"probVolthr20",sep=""),paste(cortex,"probVolthr30",sep=""),paste(cortex,"probVolthr40",sep=""),paste(cortex,"probVolthr50",sep=""),paste(cortex,"probVolthr60",sep=""),paste(cortex,"probVolthr70",sep=""),paste(cortex,"probVolthr80",sep=""),paste(cortex,"probVolthr90",sep="")))
#    subj=totalSubthalamicVolumesThr$Subject.Name
#    side=totalSubthalamicVolumesThr$side
#    group=totalSubthalamicVolumesThr$group
#    assign(paste(cortex,"probvol",sep=""),cbind(values,subj,side,group))
#    plotdata = cbind(values,subj,side,group)
#
#assign(paste(cortex,"probvolg",sep=""),ggplot(plotdata,aes(ind,values,fill=group))+stat_summary(fun.y=mean,geom="bar",position="dodge")+stat_summary(fun.data=mean_cl_normal, geom="errorbar", position=position_dodge(width=0.9),width=0.2) +ggtitle(paste("Volume of connectivity map which shows connection to ",cortex,sep="")) + labs(x=paste("Different threshold applied to ",cortex,sep=""),y="Mean Volume")+theme(title = element_text(face="bold", size=14)))
#
}



##########################################################################
################## thresholded mean connectivities #######################
##########################################################################
## loading data : totalMC
#
## t-test
#for (i in 4:ncol(totalMC))
#{
#cat("\t\t",names(totalMC)[i],"\n")
#    # going through homogeniety :: Levene test
#    #left or right
#    for (side in c('left','right'))
#    {
## To call leveneTest :: eg. varOFCmc90left
#        assign(paste("var",names(totalMC[i]),side,sep=""),
#                leveneTest(totalMC[,i][totalMC$side==side],
#                totalMC$group[totalMC$side==side]))
## To call shapiroTest :: eg. norOFCmc90left
#        assign(paste("nor",names(totalMC[i]),side,sep=""),
#                shapiro.test(totalMC[,i][totalMC$side==side]))
#
#        #if they are not normally distributed or non-homogeneous::robust t-test
#        if (get(paste("var",names(totalMC[i]),side,sep=""))$'Pr(>F)'<0.05 &
#                get(paste("nor",names(totalMC[i]),side,sep=""))$'p.value'<0.05)
#        {
##print(paste('variance is not homogeneous or non-normalily distributed on the',side,sep=' '))
#            assign(paste("ttest",names(totalMC[i]),side,sep=""),
#                    yuen(subset(totalMC[,i],totalMC$group=="CON"&totalMC$side==side),
#                    subset(totalMC[,i],totalMC$group=="CHR"&totalMC$side==side)))
#            assign("TTEST",get(paste("ttest",names(totalMC[i]),side,sep="")))
##if it is significant
#            if (TTEST$p.value < 0.05)
#            {
#            print(side)
#            print(paste('p value : ',format(TTEST$p.value,nsmall=3)))
#            print(paste('effect size : ',
#            format(sqrt(TTEST$teststat/(TTEST$teststat^2+TTEST$df)),nsmall=3)))
#            }
##if it is not significant :: don't print
#            
#        }
#            #if they are normal and have homogeneous variance :: two sided t-test
#        else
#        {
#            assign(paste("ttest",names(totalMC[i]),side,sep=""),
#                    t.test(subset(totalMC[,i],totalMC$group=="CON"&totalMC$side==side),
#                    subset(totalMC[,i],totalMC$group=="CHR"&totalMC$side==side)))   
#            assign("TTEST",get(paste("ttest",names(totalMC[i]),side,sep="")))
#
#            if (TTEST$p.value < 0.05)
#            {
#            print(side)
#            print(paste('p value : ',format(TTEST$p.value,nsmall=3)))
#            print(paste('confident internal : ',
#            format(TTEST$conf.int),nsmall=3))
#            }
#        }
#    }
#cat("\n\n")
#}
#
## making stack data frames on each threshold
#for (thr in seq(10,90,10))
#{
#    values=stack(totalMC, select=c(paste("LPFCmc",thr,sep=""),paste("LTCmc",thr,sep=""),
#        paste("MPFCmc",thr,sep=""),paste("MTCmc",thr,sep=""),paste("OCCmc",thr,sep=""),
#        paste("OFCmc",thr,sep=""),paste("PCmc",thr,sep=""),paste("SMCmc",thr,sep="")))
#    subj=totalMC$Subject.Name
#    side=totalMC$side
#    group=totalMC$group
#    assign(paste("stackSubmc",thr,sep=""),cbind(values,subj,side,group))
#    plotdata = cbind(values,subj,side,group)
#
#    assign(paste("barSubMC",thr,sep=""),
#            ggplot(plotdata,aes(ind,values,fill=group))
#            +stat_summary(fun.y=mean,geom="bar",position="dodge")
#            +stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9),width=0.2)
#            +ggtitle(paste("Mean connection probability divided by total thalamus volume in each group after thresholding at ",thr,sep=""))
#            +theme(title = element_text(face="bold", size=14))
#            +labs(x="Connection to each cortex between thalamus",y="Mean Connectivity")
#            +facet_wrap(~side))
#}




##########################################################################
########### thresholded mean connectivities voxel approach ###############
##########################################################################
# making variables into wide format in each thresholds
meanConnectivityCON=read.delim('/Users/mav88/11/new/setMC/totalConnectionProbabilityValuesCON.txt',sep='\t',header=F)
meanConnectivityCHR=read.delim('/Users/mav88/11/new/setMC/totalConnectionProbabilityValuesCHR.txt',sep='\t',header=F)
meanConnectivityCON=cbind(meanConnectivityCON,factor('CON'))
meanConnectivityCHR=cbind(meanConnectivityCHR,factor('CHR'))
names(meanConnectivityCON)=c("Subject.names","side","groupD","modality","thr","MeanConnectivity","group")
names(meanConnectivityCHR)=c("Subject.names","side","groupD","modality","thr","MeanConnectivity","group")

totalMeanConnectivity=rbind(meanConnectivityCON,meanConnectivityCHR)

names(totalMeanConnectivity)=c("Subject.names","side","groupD","modality","thr","MeanConnectivity","group")


for (thrd in seq(10,90,10)){

assign(paste("totalMeanConnectivityWide",thrd,sep=""),reshape(subset(totalMeanConnectivity,thr==thrd),v.names="MeanConnectivity",idvar=c("Subject.names","side"),timevar="modality",direction="wide"))

#graph
    assign(paste("bar","MeanConnectivity",thrd,sep=""),ggplot(subset(totalMeanConnectivity,thr==thrd),aes(modality,MeanConnectivity,fill=group))+stat_summary(fun.y=mean,geom="bar",position="dodge")+stat_summary(fun.data = mean_cl_normal, geom="errorbar",position=position_dodge(width=0.9),width=0.2)+ ggtitle(paste("Mean Connectivity after thresholding at ",thrd,"%",sep=""))+labs(x="Region of cortex in connection to thalamus",y="Connectivity to one region divided by \nsum of connectivity to each cortex")+facet_wrap(~side)+theme(title = element_text(face="bold", size=14)))

#ttest
ttestgohere='on'
if (ttestgohere=='on'){
    assign("dataFrame",get(paste("totalMeanConnectivityWide",thrd,sep="")))
for (i in 6:ncol(dataFrame))
{
    cat("\t\t", names(dataFrame)[i], "\n\t\t",thrd,"\n")

    # going through homogeniety :: Levene test
    #left or right
    for (side in c('left','right'))
    {
        # To call leveneTest :: eg. varOFCmc90left
            dataFrame[i]
        assign(paste("var", names(dataFrame[i]), side,sep=""),
                    leveneTest(dataFrame[,i][dataFrame$side==side],
                dataFrame$group[dataFrame$side==side]))

# To call shapiroTest :: eg. norOFCmc90left
        assign(paste("nor",names(dataFrame[i]),side,sep=""),
                shapiro.test(dataFrame[,i][dataFrame$side==side]))

        #if they are not normally distributed or non-homogeneous::robust t-test
        if (get(paste("var",names(dataFrame[i]),side,sep=""))$'Pr(>F)'<0.05 &
                get(paste("nor",names(dataFrame[i]),side,sep=""))$'p.value'<0.05)
        {
#print(paste('variance is not homogeneous or non-normalily distributed on the',side,sep=' '))
            assign(paste(thrd,"ttest",names(dataFrame[i]),side,sep=""),
                    yuen(subset(dataFrame[,i],dataFrame$group=="CON"&dataFrame$side==side),
                    subset(dataFrame[,i],dataFrame$group=="CHR"&dataFrame$side==side)))
            assign("TTEST",get(paste("ttest",names(dataFrame[i]),side,sep="")))
#if it is significant
            if (TTEST$p.value < 0.05)
            {
            print(side)
            print(paste('p value : ',format(TTEST$p.value,nsmall=3)))
            print(paste('effect size : ',
            format(sqrt(TTEST$teststat/(TTEST$teststat^2+TTEST$df)),nsmall=3)))
            }
#if it is not significant :: don't print
            
        }
            #if they are normal and have homogeneous variance :: two sided t-test
        else
        {
            assign(paste(thrd,"ttest",names(dataFrame[i]),side,sep=""),
                    t.test(subset(dataFrame[,i],dataFrame$group=="CON"&dataFrame$side==side),
                    subset(dataFrame[,i],dataFrame$group=="CHR"&dataFrame$side==side)))   
            assign("TTEST",get(paste("ttest",names(dataFrame[i]),side,sep="")))

            if (TTEST$p.value < 0.05)
            {
            print(side)
            print(paste('p value : ',format(TTEST$p.value,nsmall=3)))
            print(paste('confident internal : ',
            format(TTEST$conf.int),nsmall=3))
            }
        }
    }
cat("\n\n")
}}

}

