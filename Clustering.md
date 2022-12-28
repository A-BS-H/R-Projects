# Hierarchical Clustering
## Importing Data
```
data <- read.csv("DATA_SKU.csv",header = TRUE)
# Exploring the dataset to identify different groups of products that shares similarities and
that can be treated in a similar way.
glimpse(data)
summary(data)
```
![image](https://user-images.githubusercontent.com/111043457/209177607-b22b8177-352e-4d8b-b403-067895b6e066.png)

## Visualizing data
```
ggplot(data=data, aes(x=CV,y=ADS)) + 
 geom_point() +
 xlab("Coefficient of Variation") +
 ylab("Average Daily Sales") +
 ggtitle("Stock Keeping Units Example")
 
 ```
 ![image](https://user-images.githubusercontent.com/111043457/209177924-78f6f489-6ff0-4b61-93a3-3cf8c7597d45.png)
 
 ## Ward’s Method
This method involves an agglomerative clustering algorithm(Bottom-Up). Observations are treated separately
as singleton clusters. Then, computed the Euclidean distance of each pair and successively merged the most
similar clusters.

![image](https://user-images.githubusercontent.com/111043457/209178140-373274e8-8afa-44fa-82b7-64d96d2b8bfa.png)

```{merging}

data$groupID <- cutree(p1,k=3)       # assigning each point to one of our k=3 clusters 
data$groupID <- as.factor(data$groupID)      # changing variable as factors

```
## Cluster Plot
![image](https://user-images.githubusercontent.com/111043457/209178418-64e85bc6-3f56-4979-9779-5f77e42861e5.png)

