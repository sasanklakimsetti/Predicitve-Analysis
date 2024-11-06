# clustering: unsupervised learning

# The task of grouping data points based on their similarity with each other is called Clustering or Cluster Analysis. This method is defined under the branch of Unsupervised Learning, which aims at gaining insights from unlabelled data points, that is, unlike supervised learning we don’t have a target variable. 

# Clustering aims at forming groups of homogeneous data points from a heterogeneous dataset. It evaluates the similarity based on a metric like Euclidean distance, Cosine similarity, Manhattan distance, etc. and then group the points with highest similarity score together.

# loading the packages
library(arules)
library(cluster)

# removing the initial label of the dataset i.e. name of species since this is unsupervised learning
data<-iris[,-5]
# fitting k-means clusering model to the training dataset
set.seed(240) #setting seed
kmeans.re<-kmeans(data,centers=3,nstart = 20)
# centers = 3: This specifies that you want 3 clusters, so the algorithm will aim to divide your data into 3 groups.
# nstart = 20: This indicates that K-means should run 20 different initializations and select the one with the best clustering result (i.e., the one with the lowest sum of squared distances within clusters). Running multiple initializations is a good practice to avoid poor clustering results that can occur from random initialization of centroids.
kmeans.re

# cluster identification for each observation
kmeans.re$cluster
kmeans.re$centers
# confusion matrix
cm<-table(iris$Species,kmeans.re$cluster)
cm
print(paste("Accuracy: ",sum(diag(cm))/sum(cm)*100,"%"))

# model evaluation and visualization
plot(data[c("Sepal.Length","Sepal.Width")],
     col=kmeans.re$cluster,
     main="K-means clustering with 3 clusters")
# plotting cluster centers
kmeans.re$centers
kmeans.re$centers[,c("Sepal.Length","Sepal.Width")]
# cex is font size and pch is symbol
points(kmeans.re$centers[,c("Sepal.Length","Sepal.Width")],
       col=1:3,pch=8,cex=3)

# visualizing clusters
y_kmeans<-kmeans.re$cluster
clusplot(data[,c("Sepal.Length","Sepal.Width")],
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels=2,
         plotchar = FALSE,
         span = TRUE,
         main = paste("Cluster iris"),
         xlab='Sepal.Length',
         ylab='Sepal.Width')
# lines=0 means no distance lines between the elipses will be there
# shade = TRUE means elipses are shaded in relation to their intensity
# color=TRUE, ellipses are colored wrt density
# labels=TRUE means all points and ellipses are labelled in the plot
# plotchar=TRUE means the plotting symbols differ for points belonging to different clusters
# span=TRUE means each cluster is represented by the the ellipse with smallest area containing all its points.