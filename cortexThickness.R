#left thickness
OFCthickGl=ggplot(totalData[totalData$side=="left",],aes(OFCthick, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("Left OFC Cortical thickness") +geom_density(alpha=.3)+xlim(1.7,3.6)
MPFCthickGl=ggplot(totalData[totalData$side=="left",],aes(MPFCthick, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("Left MPFC Cortical thickness") +geom_density(alpha=.3)+xlim(1.7,3.6)
LPFCthickGl=ggplot(totalData[totalData$side=="left",],aes(LPFCthick, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("Left LPFC Cortical thickness") +geom_density(alpha=.3)+xlim(1.7,3.6)
SMCthickGl=ggplot(totalData[totalData$side=="left",],aes(SMCthick, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("Left SMC Cortical thickness") +geom_density(alpha=.3)+xlim(1.7,3.6)
PCthickGl=ggplot(totalData[totalData$side=="left",],aes(PCthick, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("Left PC Cortical thickness") +geom_density(alpha=.3)+xlim(1.7,3.6)
MTCthickGl=ggplot(totalData[totalData$side=="left",],aes(MTCthick, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("Left MTC Cortical thickness") +geom_density(alpha=.3)+xlim(1.7,3.6)
LTCthickGl=ggplot(totalData[totalData$side=="left",],aes(LTCthick, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("Left LTC Cortical thickness") +geom_density(alpha=.3)+xlim(1.7,3.6)
OCCthickGl=ggplot(totalData[totalData$side=="left",],aes(OCCthick, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("Left OCC Cortical thickness") +geom_density(alpha=.3)+xlim(1.7,3.6)
#right thickness
OFCthickGr=ggplot(totalData[totalData$side=="right",],aes(OFCthick, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("Right OFC Cortical thickness") +geom_density(alpha=.3)+xlim(1.7,3.6)
MPFCthickGr=ggplot(totalData[totalData$side=="right",],aes(MPFCthick, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("Right MPFC Cortical thickness") +geom_density(alpha=.3)+xlim(1.7,3.6)
LPFCthickGr=ggplot(totalData[totalData$side=="right",],aes(LPFCthick, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("Right LPFC Cortical thickness") +geom_density(alpha=.3)+xlim(1.7,3.6)
SMCthickGr=ggplot(totalData[totalData$side=="right",],aes(SMCthick, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("Right SMC Cortical thickness") +geom_density(alpha=.3)+xlim(1.7,3.6)
PCthickGr=ggplot(totalData[totalData$side=="right",],aes(PCthick, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("Right PC Cortical thickness") +geom_density(alpha=.3)+xlim(1.7,3.6)
MTCthickGr=ggplot(totalData[totalData$side=="right",],aes(MTCthick, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("Right MTC Cortical thickness") +geom_density(alpha=.3)+xlim(1.7,3.6)
LTCthickGr=ggplot(totalData[totalData$side=="right",],aes(LTCthick, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("Right LTC Cortical thickness") +geom_density(alpha=.3)+xlim(1.7,3.6)
OCCthickGr=ggplot(totalData[totalData$side=="right",],aes(OCCthick, fill=group)) + geom_histogram(aes(y=..density..),position="dodge") + ggtitle("Right OCC Cortical thickness") +geom_density(alpha=.3)+xlim(1.7,3.6)



