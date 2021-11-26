## Conor Ratigan Exercise 10

library(ggplot2)
setwd("~/Desktop/R Biocomputing/Biocomp-Exercise10")

##Find some data on two variables that you would expect to be related to each other. 
##These data can come from your own research, your daily life, or the internet. 
##Enter those data into a text file or Excel and then save a text file, 
##and write a script that loads this text file and produces a scatter plot of those two variables
##that includes a trend line.

###Using Tom Brady partial career stats from 2011-2021
## https://www.pro-football-reference.com/players/B/BradTo00.htm

##Tom Brady throwing attempts vs. yards (per year)

tombrady = read.table("tombrady.txt", sep = "\t", header = TRUE)
ggplot(tombrady, aes(x= Att, y= Yds)) + 
  geom_point() +
  stat_smooth(method="lm") +
  xlab("Throwing Attempts Per Season") +
  ylab("Total Yards Per Season") +
  labs(title = "Tom Brady Throwing Stats 2011-2021")


##Given the data in “data.txt”. Write a script that generates two figures 
##that sumamrize the data. First, show
##a barplot of the means of the four populations. 
##Second, show a scatter plot of all of the observations

data = read.table("data.txt", sep="," , header = T)

#Barplot
ggplot(data = data, aes(region, observations, fill = region)) +
  geom_bar(position = "dodge", stat = "summary", fun = "mean")

#Scatter
ggplot(data = data, aes(region, observations)) +
  geom_jitter(aes(colour = region))


###Do they tell different stories?
#Yes. 
#The bar plot shows the average observations are pretty similar
#therefore making it seem that the data for each of the regions is the same. 
#But, the scatter plot shows the data much differently. The data is much 
#different within each region, even though they average out to the same number. 
#The bar plot only shows the average number of observations per region, 
#the scatter plot shows the actual data points and their range. 

