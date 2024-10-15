#loading in dataset
setwd('C:/Users/elans/OneDrive/Desktop/Data Science')
survey <- read.csv('Homework1_Bonds.csv')

#Question 1
#How many of these bonds were approved by voters, and how many were defeated? 
table(survey$Result)

#Are there any differences in the rates of approved bonds across the four different government types? 
prop.table(table(survey$Type, survey$Result), margin = 3)



#Question 2

#Combining both the Votes for and Votes against values
survey$Votes_Total <- survey$VotesFor + survey$VotesAgainst

#Finding and printing the row with most votes
max_votes_row <- survey[which.max(survey$Votes_Total),]
print(max_votes_row)
#In Harris County, For Road Utilities

#Question 3

#Subset of data that only includes approved votes with voter turnout over 100
approved <- survey[survey$Votes_Total> 100 & survey$Result=='Carried',]

#Calculates margin percentage of approved votes
approved$PercentTotal <- (approved$VotesFor / approved$Votes_Total)*100

#Calculating appropriate descriptive statistics for a Skewed distribution
IQR(approved$PercentTotal)
median(approved$PercentTotal)

#Graphs a histogram of approval margins
hist(approved$PercentTotal, main='Approval Margin in Percent', xlab='Percentage of Voter Approval', ylab='Occurences', col=c('#2feed750'))


#Question 4

#Scales down the Amount values
approved$simpleamount <- approved$Amount / 1000000

#Creates a scatter plot comparing voter approval percentage to cost of bond
plot(approved$PercentTotal, approved$simpleamount, xlab='Approval Percentage', ylab='Cost (in Millions)', pch=16, ylim=c(0,1500))

#Calculates Pearson Correlation Coefficient
cor(approved$PercentTotal, approved$simpleamount)


