#Mean connection probability

OFCprobG=ggplot(totalData,aes(OFCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("OFC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
MPFCprobG=ggplot(totalData,aes(MPFCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("MPFC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
LPFCprobG=ggplot(totalData,aes(LPFCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LPFC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
SMCprobG=ggplot(totalData,aes(SMCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("SMC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
PCprobG=ggplot(totalData,aes(PCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("PC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
MTCprobG=ggplot(totalData,aes(MTCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("MTC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
LTCprobG=ggplot(totalData,aes(LTCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LTC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
OCCprobG=ggplot(totalData,aes(OCCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("OCC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)

#Left
OFCprobGl=ggplot(totalData[totalData$side=="left",],aes(OFCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LEFT OFC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
MPFCprobGl=ggplot(totalData[totalData$side=="left",],aes(MPFCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LEFT MPFC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
LPFCprobGl=ggplot(totalData[totalData$side=="left",],aes(LPFCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LEFT LPFC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
SMCprobGl=ggplot(totalData[totalData$side=="left",],aes(SMCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LEFT SMC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
PCprobGl=ggplot(totalData[totalData$side=="left",],aes(PCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LEFT PC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
MTCprobGl=ggplot(totalData[totalData$side=="left",],aes(MTCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LEFT MTC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
LTCprobGl=ggplot(totalData[totalData$side=="left",],aes(LTCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LEFT LTC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
OCCprobGl=ggplot(totalData[totalData$side=="left",],aes(OCCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LEFT OCC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)


#Right
OFCprobGr=ggplot(totalData[totalData$side=="right",],aes(OFCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("right OFC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
MPFCprobGr=ggplot(totalData[totalData$side=="right",],aes(MPFCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("right MPFC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
LPFCprobGr=ggplot(totalData[totalData$side=="right",],aes(LPFCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("right LPFC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
SMCprobGr=ggplot(totalData[totalData$side=="right",],aes(SMCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("right SMC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
PCprobGr=ggplot(totalData[totalData$side=="right",],aes(PCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("right PC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
MTCprobGr=ggplot(totalData[totalData$side=="right",],aes(MTCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("right MTC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
LTCprobGr=ggplot(totalData[totalData$side=="right",],aes(LTCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("right LTC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
OCCprobGr=ggplot(totalData[totalData$side=="right",],aes(OCCprob, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("right OCC Connection probability divided by Thalamus Volume") +geom_density(alpha=.3) + xlim(0,1)


