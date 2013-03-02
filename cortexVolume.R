#left cortex volume
OFCvolGl=ggplot(totalData[totalData$side=="left",],aes(OFCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("OFC LEFT Cortical Volume") +geom_density(alpha=.3) 
MPFCvolGl=ggplot(totalData[totalData$side=="left",],aes(MPFCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("MPFC LEFT Cortical Volume") +geom_density(alpha=.3)
LPFCvolGl=ggplot(totalData[totalData$side=="left",],aes(LPFCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LPFC LEFT Cortical Volume") +geom_density(alpha=.3)
SMCvolGl=ggplot(totalData[totalData$side=="left",],aes(SMCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("SMC LEFT Cortical Volume") +geom_density(alpha=.3)
PCvolGl=ggplot(totalData[totalData$side=="left",],aes(PCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("PC LEFT Cortical Volume") +geom_density(alpha=.3)
MTCvolGl=ggplot(totalData[totalData$side=="left",],aes(MTCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("MTC LEFT Cortical Volume") +geom_density(alpha=.3)
LTCvolGl=ggplot(totalData[totalData$side=="left",],aes(LTCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LTC LEFT Cortical Volume") +geom_density(alpha=.3)
OCCvolGl=ggplot(totalData[totalData$side=="left",],aes(OCCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("OCC LEFT Cortical Volume") +geom_density(alpha=.3)

#right cortex volume
OFCvolGr=ggplot(totalData[totalData$side=="right",],aes(OFCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("OFC RIGHT Cortical Volume") +geom_density(alpha=.3)
MPFCvolGr=ggplot(totalData[totalData$side=="right",],aes(MPFCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("MPFC RIGHT Cortical Volume") +geom_density(alpha=.3)
LPFCvolGr=ggplot(totalData[totalData$side=="right",],aes(LPFCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LPFC RIGHT Cortical Volume") +geom_density(alpha=.3)
SMCvolGr=ggplot(totalData[totalData$side=="right",],aes(SMCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("SMC RIGHT Cortical Volume") +geom_density(alpha=.3)
PCvolGr=ggplot(totalData[totalData$side=="right",],aes(PCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("PC RIGHT Cortical Volume") +geom_density(alpha=.3)
MTCvolGr=ggplot(totalData[totalData$side=="right",],aes(MTCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("MTC RIGHT Cortical Volume") +geom_density(alpha=.3)
LTCvolGr=ggplot(totalData[totalData$side=="right",],aes(LTCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LTC RIGHT Cortical Volume") +geom_density(alpha=.3)
OCCvolGr=ggplot(totalData[totalData$side=="right",],aes(OCCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("OCC RIGHT Cortical Volume") +geom_density(alpha=.3)

#total cortex volume
OFCvolG=ggplot(totalData,aes(OFCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("OFC Cortical Volume") +geom_density(alpha=.3)
MPFCvolG=ggplot(totalData,aes(MPFCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("MPFC Cortical Volume") +geom_density(alpha=.3)
LPFCvolG=ggplot(totalData,aes(LPFCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LPFC Cortical Volume") +geom_density(alpha=.3)
SMCvolG=ggplot(totalData,aes(SMCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("SMC Cortical Volume") +geom_density(alpha=.3)
PCvolG=ggplot(totalData,aes(PCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("PC Cortical Volume") +geom_density(alpha=.3)
MTCvolG=ggplot(totalData,aes(MTCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("MTC Cortical Volume") +geom_density(alpha=.3)
LTCvolG=ggplot(totalData,aes(LTCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LTC Cortical Volume") +geom_density(alpha=.3)
OCCvolG=ggplot(totalData,aes(OCCvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("OCC Cortical Volume") +geom_density(alpha=.3)


