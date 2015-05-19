
library(plyr)
library(reshape)

#Exercise 1: Make this work on your computer**
getwd()

# Exercise 2: Make this work on your computer**
setwd("/media/brad/Data/Documents/softwareCarp/MCBWorkshop2015/R")

# Exercise 3: Try moving into different directories using the setwd() function. List the files in the subdirectory "./datafiles".**
setwd("..")
setwd("./R")
setwd("./datafiles")
setwd("..")
list.files("./data_files")  

# Exercise 4: create a variable, and assign a number to it. Now square the value assigned to that variable. Output the variable.**
aaa=7
aaa=aaa^2

dummyVector=c(4, 12, 1.3, 15, 0.1, 2.5, 7, 55)
# Exercise 5: add numbers to dummyVector. Subtract. Divide. What happens if you add a vector containing 2 numbers to dummyVector? or 3? Finally, perform a mathematical operation on dummyVector to turn all values to 1**
dummyVector+1
dummyVector/3
dummyVector/dummyVector

#Exercise 6: access the 1st, 3rd, and 5th values in dummyVector (hint, you'll need to use a vector inside the square brackets). Add 10 to only those values. What happens if you change the first variable in dummyVector to "G"?**
dummyVector[c(1, 3, 5)]
dummyVector[c(1, 3, 5)] = dummyVector[c(1, 3, 5)]+10
dummyVector[1]="G"

#Exercise 7: Some genius from Lockheed Martin measured the height of our friends' gardenias in inches, not centimeters. Given that an inch is 2.54 cm, convert the "height" column to centimeters. Quick! Before the gardenias crash into Mars and all is lost.**
print(gardenia)
h_cm=gardenia=gardenia[,"height"]*2.54


#Exercise 8: add the new height in centimeters column to the gardenia dataframe using column bind, or cbind(). Change the column names to reflect that one measure of height is in cm, the other in inches using colnames()**
gardenia=data.frame(gardenia, h_cm)
colnames(gardenia)=c("name", "h_in", "leaf_number", "flowering_time", "h_cm")
print(gardenia)


#Exercise 9: Find the order of values in the gardenia "height" column. Use this resulting vector to sort the table. Print the rows containing just the 3 tallest plants**
gardenia=gardenia[order(gardenia[,"height"]),]
gardenia[6:8,]


#Exercise 9: make a csv file we can actually use. Read it in, and call it snark.**
snark=read.csv("./data_files/snark.csv")

#**Exercise 10: Print the rows containing just the people from USC**  
gardenia[which(gardenia[,"uni"]=="usc",]
gardenia[c(gardenia[,"uni"]=="usc"),]


#**Exercise 11: Read in both files of snark data. Stick them together using rbind and call the resulting dataset "snark". Save it as snark.csv, in the data_file folder.**
snark=read.csv("./data_files/snark.csv", sep=",", header=T, strip.white=T, as.is=T)
str(snark)


#**Exercise 12: Can you change the sex coding to something sensible using which()?**
unique(snark[,"sex"])
snark[which(snark[,"sex"]=="f"),2]=0
snark[which(snark[,"sex"]=="female"),2]=0
snark[which(snark[,"sex"]=="m"),2]=1
snark[which(snark[,"sex"]=="male"),2]=1  

#**Exercise 11: the Snarks need individual id numbers. Create an id column (hint, all you need is c() and a range), and add it to the dataset using cbind()**
ind=c(1:nrow(snark))
snark=cbind(snark[,1:3], ind, snark[4:length(snark)])

#**Exercise 12: Use a for-loop, and the c() and paste() functions, to come up with a set of column labels. Change the column names of the dataset**

colVec=c()

for(i in 1:5){
  day=i*3-2
  var1=paste("l_", day, sep="")
  var2=paste("w_", day, sep="")
  var3=paste("a_", day, sep="")
  var4=paste("bod_", day, sep="")
  colVec=c(colVec, var1, var2, var3, var4)
}

colVec
colVec=c("pop", "sex", "family", "id", colVec)

colnames(snark)
colnames(snark)=colVec

#write.csv(snark, "./data_files/snark.csv", quote=F, row.names=F)

#**Exercise 13: Use a for-loop to make max, min and mean summaries of each of the columns. Store it as a dataframe, with the columns corresponding to the columns of snark.**
summary=c()
for(i in 5:length(snark)){
  maxVal=max(snark[,i], na.rm=T)
  minVal=min(snark[,i], na.rm=T)
  meanVal=mean(snark[,i], na.rm=T)
  sumVec=c(maxVal, minVal, meanVal)
  summary=cbind(summary, sumVec)
}

#**Exercise 14: do a boxplot of day 13 body size and cephalocalypsis area grouped by sex and  population. Try to plot the ratio of body size and cephalocalypsis area by sex and population.****
boxplot(bod_13~sex +pop, data=snark)
boxplot((a_13/bod_13)~sex+ pop, data=snark)

#Exercise 15: Reshape the data 
snarkLong=reshape(snark, varying=c(5:length(snark)), idvar="id", direction="long", timevar="day", sep="_")


#**Exercise 16 write linear models to test whether there is variation in growth rate of body and cephalocalypse by sex, population and family**

bodGrow=lm(bod~day+ sex +pop+family, data=snarkLong)
cephGrow=lm(a~day+ sex +pop+family, data=snarkLong)


write.csv(snarkLong, "./data_files/snarkLong.csv", row.names=F, quote=F)

# **Exercise 17: summarise n, mean, min, max, sd, area, and cephalocalypse:body ratio by sex, population and day**
sexSum=ddply(snarkLong, .(sex, pop, day), summarise, 
             N= length(bod),
             aMean=mean(a, na.rm=T),
             aMax=max(a, na.rm=T),
             aMin=min(a, na.rm=T),
             aRat=mean(a, na.rm=T)/mean(bod, na.rm=T))


1A=56


