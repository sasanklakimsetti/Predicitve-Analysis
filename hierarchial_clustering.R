# hierarchial clustering: unsupervised learning

# bottom-up approach : arrange the data and start grouping from bottom to top for every data like huffman

iris
iris1<-iris
iris1
iris1$Species=NULL
d=dist(iris1,method="euclidean")
hfit=hclust(d)
plot(hfit)
grps=cutree(hfit,k=4)
grps
rect.hclust(hfit,k=4,border = "red")