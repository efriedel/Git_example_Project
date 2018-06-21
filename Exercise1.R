# Create a directory where you can create a lot of files
# e.g. AdvancedR\Session1
setwd("C:/Users/efriedel/Desktop/R_Intermediate_Course")
# create several files for later read in
for (i in 1:100)
write.csv(file=paste("file_",i,".csv",sep=""),data.frame(y=rnorm(20,0,3)))
#Exercise 1
#write a function to load and retrieve the mean and max of each file
#plot a boxplot
my.fun<- function(e){
  test.data<- read.csv(paste("file_",e,".csv", sep=""))
  print(mean(test.data$y))
  print(max (test.data$y))
  boxplot(test.data$y)
  
  }

#plot the first 10 datasets
par(mfrow=c(2,5)) #allows plotting 2 by 5 plots at once
for (i in 1:10)
  my.fun(i)

#now plot only extreme datasets
#where the mean is more than 1 away from 0
#give the number of the data set
#write a separate function for this




#let's hope it's not more than 16:)
dev.off() #deletes the currently active plot
par(mfrow=c(4,4)) 


#identify all data files with the pattern="file*"
#and delete them



# if you are finished early read the chapter on style guide
# https://swcarpentry.github.io/r-novice-inflammation/06-best-practices-R/
# or
# http://adv-r.had.co.nz/Style.html
# or
# https://google.github.io/styleguide/Rguide.xml
# report this to other participants later

