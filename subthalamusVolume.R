#subthalamus volume
OFCsubvolG=ggplot(totalData,aes(OFCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("OFC Subthalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
MPFCsubvolG=ggplot(totalData,aes(MPFCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("MPFC Subthalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
LPFCsubvolG=ggplot(totalData,aes(LPFCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LPFC Subthalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
SMCsubvolG=ggplot(totalData,aes(SMCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("SMC Subthalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
PCsubvolG=ggplot(totalData,aes(PCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("PC Subthalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
MTCsubvolG=ggplot(totalData,aes(MTCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("MTC Subthalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
LTCsubvolG=ggplot(totalData,aes(LTCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LTC Subthalamus Volume") +geom_density(alpha=.3) + xlim(0,1)
OCCsubvolG=ggplot(totalData,aes(OCCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("OCC Subthalamus Volume") +geom_density(alpha=.3) + xlim(0,1)

#left subthalamus volume
OFCsubvolGl=ggplot(totalData[totalData$side=="left",],aes(OFCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("OFC LEFT Cortical Volume") +geom_density(alpha=.3) + xlim(0,1)
MPFCsubvolGl=ggplot(totalData[totalData$side=="left",],aes(MPFCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("MPFC LEFT Cortical Volume") +geom_density(alpha=.3) + xlim(0,1)
LPFCsubvolGl=ggplot(totalData[totalData$side=="left",],aes(LPFCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LPFC LEFT Cortical Volume") +geom_density(alpha=.3) + xlim(0,1)
SMCsubvolGl=ggplot(totalData[totalData$side=="left",],aes(SMCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("SMC LEFT Cortical Volume") +geom_density(alpha=.3) + xlim(0,1)
PCsubvolGl=ggplot(totalData[totalData$side=="left",],aes(PCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("PC LEFT Cortical Volume") +geom_density(alpha=.3) + xlim(0,1)
MTCsubvolGl=ggplot(totalData[totalData$side=="left",],aes(MTCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("MTC LEFT Cortical Volume") +geom_density(alpha=.3) + xlim(0,1)
LTCsubvolGl=ggplot(totalData[totalData$side=="left",],aes(LTCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LTC LEFT Cortical Volume") +geom_density(alpha=.3) + xlim(0,1)
OCCsubvolGl=ggplot(totalData[totalData$side=="left",],aes(OCCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("OCC LEFT Cortical Volume") +geom_density(alpha=.3) + xlim(0,1)
#right subthalamus volume
OFCsubvolGr=ggplot(totalData[totalData$side=="right",],aes(OFCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("OFC Right Cortical Volume") +geom_density(alpha=.3) + xlim(0,1)
MPFCsubvolGr=ggplot(totalData[totalData$side=="right",],aes(MPFCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("MPFC Right Cortical Volume") +geom_density(alpha=.3) + xlim(0,1)
LPFCsubvolGr=ggplot(totalData[totalData$side=="right",],aes(LPFCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LPFC Right Cortical Volume") +geom_density(alpha=.3) + xlim(0,1)
SMCsubvolGr=ggplot(totalData[totalData$side=="right",],aes(SMCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("SMC Right Cortical Volume") +geom_density(alpha=.3) + xlim(0,1)
PCsubvolGr=ggplot(totalData[totalData$side=="right",],aes(PCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("PC Right Cortical Volume") +geom_density(alpha=.3) + xlim(0,1)
MTCsubvolGr=ggplot(totalData[totalData$side=="right",],aes(MTCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("MTC Right Cortical Volume") +geom_density(alpha=.3) + xlim(0,1)
LTCsubvolGr=ggplot(totalData[totalData$side=="right",],aes(LTCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("LTC Right Cortical Volume") +geom_density(alpha=.3) + xlim(0,1)
OCCsubvolGr=ggplot(totalData[totalData$side=="right",],aes(OCCsubvol, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("OCC Right Cortical Volume") +geom_density(alpha=.3) + xlim(0,1)


