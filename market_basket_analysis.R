# Market Basket Analysis using association rules

library("arules")
data("Groceries")   # this dataset is the part of the library arules
View(Groceries)
summary(Groceries)
str(Groceries)
# Look for first five items
inspect(Groceries[1:5])
#examine the frequency of items
itemFrequency(Groceries[,1:3])
# plot the frequency of items
itemFrequencyPlot(Groceries)
itemFrequencyPlot(Groceries, support=0.1)
itemFrequencyPlot(Groceries, topN=20)
# a visualization of the sparse matrix for the first five transactions
image(Groceries[1:5])
# visualization of a random sample of 100 transactions
image(sample(Groceries,100))

# training the model on data
# set better support and confidence levels to learn more rules
groceryrules<-apriori(Groceries,
                      parameter = list(support=0.006, confidence=0.25,minlen=2))
?apriori
groceryrules

# evaluating the model performance ------- summary of grocery association rules
summary(groceryrules)
# look at the first three rules
inspect(groceryrules[1:3])

# improving the model performance
inspect(groceryrules[1:10],lift=0.5)
# sorting grocery rules by lift
inspect(sort(groceryrules,by="lift")[1:5])
# finding the subsets of rules containing any berry items
berryrules<-subset(groceryrules,items%in%"berries")
inspect(berryrules)

# finding the subsets of rules that precede soda purchases
sodarules<-subset(groceryrules,rhs %in% "soda")
inspect(sodarules)
top.soda.rules<-head(sort(sodarules, by="lift"),5)
inspect(top.soda.rules)

# writing the rules into a csv file
write(groceryrules, file = "C:/lpu/5th sem/INT234/Code/groceryrules.csv", sep=",",
      quote=TRUE, row.names=FALSE)
getwd()

# converting the rule set into a dataframe
groceryrules_df<-as(groceryrules,"data.frame")
str(groceryrules_df)
Groceries
