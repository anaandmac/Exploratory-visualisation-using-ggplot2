
#Load ggplot2
library(ggplot2)

#Import the dataset winequality-red.csv
#This database contains informations about the wine quality
winequality.red<-read.csv("winequality-red.csv", sep=";")
View(winequality.red)

#Scatter plot pH X fixed acidity with lm model
ggplot(winequality.red, aes(x=pH, y=fixed.acidity)) +
 geom_point(size=2) +
 labs(y="Fixed acidity of the wine", x="pH of the wine") +
 stat_smooth(method="lm",se=TRUE) #statistical layer - linear model with standard error shadow

#Negative correlation
cor(winequality.red$pH,winequality.red$fixed.acidity)

#Scatter plot density X fixed acidity with lm model
ggplot(winequality.red, aes(x=density, y=fixed.acidity)) +
  geom_point(size=2) +
  labs(y="Fixed acidity of the wine", x="Density of the wine") +
  stat_smooth(method="lm",se=FALSE) #statistical layer - linear model without standard error shadow

#Positive correlation
cor(winequality.red$density,winequality.red$fixed.acidity)

#Adding another variable (quality) in the same plot with "color"
#Colour
ggplot(winequality.red, aes(x=density, y=fixed.acidity)) +
  geom_point(size=2,aes(colour = quality)) +
  labs(y="Fixed acidity of the wine", x="Density of the wine",colour="Quality") +
  stat_smooth(method="lm",se=TRUE)

#Scatter plot density X fixed acidity with lm model faceting by wine quality
ggplot(winequality.red, aes(x=density, y=fixed.acidity)) +
  geom_point(size=2) +
  labs(y="Fixed acidity of the wine", x="Density of the wine") +
  stat_smooth(method="lm",se=TRUE) +
  facet_grid(.~quality)

#Histogram of volatile acidity
ggplot(winequality.red,aes(volatile.acidity,y=..density..)) +
  geom_histogram(color="blue", fill="grey",lwd=1) +
  geom_density(aes(y=..density..),lwd=1)+
  labs(y="Count", x="Volatile acidity")

#Faceting by quality again
ggplot(winequality.red,aes(volatile.acidity,y=..density..)) +
  geom_histogram(color="blue", fill="grey",lwd=1) +
  geom_density(aes(y=..density..),lwd=1)+
  labs(y="Count", x="Volatile acidity") +
  theme_bw()+
  facet_grid(.~quality)

#Boxplot of chlorides by quality
ggplot(winequality.red, aes(x=factor(quality), y=chlorides)) + 
  geom_boxplot(outlier.colour="red",outlier.shape=8,outlier.size=3,lwd=0.8,colour="#1F3552",fill="#4271AE")+
  labs(y="Chlorides", x="Quality")+
  ggtitle("Boxplot of chlorides by quality")

