################
#plotting
###############
#create a plot with percentage dead patients per gender and per treatment (HEP/ASP yes,no)
#############
####
#create a data frame for plotting
####
library(tidyverse)
setwd(C:/Users/efriedel/Desktop/R_Intermediate_Course)
my_data<-read_csv("IST_corrected.csv")

plot_data <- 
  #based on my_data
  my_data %>% 
  #create a new variable (T/F) whether a patient is dead from DDEAD variable
  #reason for this is: we cannot calculate means across "Y" and "N" values
  mutate(Pat_dead = ifelse(my_data$DDEAD=="Y", TRUE, FALSE)) %>%
  #group the analysis by the variables of interest (SEX, Heparin or Aspirin Treatment)
  group_by(SEX, RXHEP, RXASP)%>%
  #Now summarise the percentage and SEM, calculate for the plot also mean plus/minus sem
  summarize(n=n(), percent_dead= mean(Pat_dead), SEM_dead= sd(Pat_dead)/sqrt(n), SEM_pos=percent_dead+SEM_dead, SEM_neg=percent_dead-SEM_dead )

#now create a barplot with error bars
ggplot(plot_data, aes(x=RXHEP, y=RXASP),colour=SEX)+
  geom_bar(stat="identity")+
  geom_errorbar(aes(ymax=SEM_pos, ymin=SEM_neg))
#how can you create a combined factor from ASP HEP?
plot_dead <- ggplot(both=paste(RXHEP, RXASP), aes())+
#also create two separate facets for male and female
facet_wrap(~SEX)


#######
#often we need to visualize binary variables
#here we use an example
#death of patient after # days after randomisation in dependence of AGE  
#FDEADD vs AGE
#######
my_data$DDEADD_bin<-ifelse(my_data$DDEADD!=9,1,0)
ggplot(aes(y=DDEADD_bin,x=AGE),data=my_data)+geom_point()+geom_smooth()
#this is not a nice representation!
#we need something better!
#see for example here: 
#https://doi.org/10.1890/0012-9623(2004)85[100:ANMOPT]2.0.CO;2
#also as pdf on osf
#first summarise the data in a histogram format
#Summarise data to create histogram counts
#what is the min and max age?
min(my_data$AGE)
max(my_data$AGE)
#looking at this I decide to start at 10 years until 100 years in steps of 1
hist_data = my_data %>% 
  #first add new variable that codes breaks
  
  #then group by dead/alive and the breaks
  
  #count
  
  #if patients are dead, we want them to show on top with histogram on top so you need to 
  #calculate in this case the percentage as 1-percentage
  

####
#now plot this
####
ggplot() + #this just sets an empty frame to build upon
  #first add a histopgram with geom_segment use the help of geom_segment
  geom_segment()+
  #then predict a logistic regression via stat_smooth and the glm method (we will cover the details in the next session)
  stat_smooth()+
  #some cosmetics 
  scale_y_continuous(limits=c(-0.02,1.02)) +
  scale_x_continuous(limits=c(15,101)) +
  theme_bw(base_size=12)+
  ylab("Patient Alive=0/Dead=1")+xlab("Age")

#####
#find here more interesting visualisations
#http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html
#####

