# Big Bang Theory Episodes
## Importing Data
```
episodes <-read.csv("big_bang_theory_episodes.csv",header = TRUE)
imdb.data <- read.csv("big_bang_theory_imdb.csv",header = TRUE) 
```
## Visualizing Data Structure
```
glimpse(imdb.data)
```
![image](https://user-images.githubusercontent.com/111043457/209979103-21864ca8-3477-4598-882f-737c34711851.png)

```
glimpse(episodes)
```
![image](https://user-images.githubusercontent.com/111043457/209979324-f1936021-6035-4abd-88c4-2abe02cecb4c.png)
# cleaning data
```
episodes$original_air_date <- as.Date(episodes$original_air_date,format="%d-%m-%Y")
plot_intro(imdb.data)
plot_intro(episodes)
plot_missing(imdb.data)
plot_missing(episodes)
imdb.data <- imdb.data[-1,]
```

![image](https://user-images.githubusercontent.com/111043457/209982485-59cb3a4e-fde8-4cbb-95ff-27847e5f3588.png)
![image](https://user-images.githubusercontent.com/111043457/209982517-f4e327c6-0a79-4e45-984e-875a56ea0430.png)
![image](https://user-images.githubusercontent.com/111043457/209982554-5c80a6c8-b26c-4f6c-b107-824cce996c58.png)
![image](https://user-images.githubusercontent.com/111043457/209982590-f70684b2-4a18-4ae0-9ae3-8cb79d0681c1.png)

## Merging to create new datatable
```
imdb.data1 <- select(imdb.data,-c('original_air_date','desc','episode_num'))
imdb.data1 <- imdb.data1 %>%group_by(season) %>% mutate(episode_num_in_season = row_number())  
episodes1 <- select(episodes,-c('episode_num_overall','prod_code'))

df = merge(x = episodes1, y = imdb.data1,by.x=c("season","episode_num_in_season","title"), 
      by.y=c("season","episode_num_in_season","title"),all=TRUE)
summary(df)
```
![image](https://user-images.githubusercontent.com/111043457/209981718-e85b3a04-0c22-49e0-a443-5cd39651f224.png)

## Analysing Data Structure
```
df1<- df %>% group_by(season) %>% summarise(total_votes = mean(total_votes))
barplot(df1$total_votes, main = "Total Votes", names.arg = df1$season , 
                          xlab = "Season", ylab = "Votes", 
                          col = rainbow(12))

average_viewership <- aggregate(episodes$us_viewers, by=list(episodes$season),FUN=mean)
plot(average_viewership,type="o",xlab = "seasons", ylab = "Rating in Millions",main="Average season viewership of Big Bang Theory")

df$year <-as.numeric(format(df$original_air_date,"%Y"))
df3<- df %>% group_by(year,season) %>% summarise(total_views = mean(us_viewers))
df3 %>% ggplot(aes(x = year, y = total_views, colour = season)) + 
geom_point(aes(size=total_views),show.legend = T)+ scale_y_continuous(labels = label_number(suffix = "M", scale = 1e-6))+labs(title = "Average viewership Of Seasons over Years ",
x = "Year",y = "Views")+scale_size_continuous(labels = scales::unit_format(unit = "M",scale = 1e-6))

average_ratings <- aggregate(imdb.data$imdb_rating, by=list(imdb.data$season),FUN=mean)
plot(average_ratings,type="o",xlab = "seasons", ylab = "IMDB Rating",main="Average season imdb rating of Big Bang Theory")

 ```
![image](https://user-images.githubusercontent.com/111043457/209981828-734a92b6-9dd4-4701-89c5-8a3395167a0a.png)
![image](https://user-images.githubusercontent.com/111043457/209982292-3643e28e-d677-4809-aa38-af9f3c3b8fd7.png)
![image](https://user-images.githubusercontent.com/111043457/209982348-0822696e-3ded-4dad-a406-1c188e0c7b31.png)
![image](https://user-images.githubusercontent.com/111043457/209982383-f5f00468-88bb-41c5-912a-4a15c872ee04.png)






 
