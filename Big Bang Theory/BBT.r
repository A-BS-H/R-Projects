# Big Bang Theory Episodes

episodes <-read.csv("big_bang_theory_episodes.csv",header = TRUE)
imdb.data <- read.csv("big_bang_theory_imdb.csv",header = TRUE) 

## Visualizing Data Structure

head(episodes,5)
glimpse(episodes)
head(imdb.data,5) 
glimpse(imdb.data)

## cleaning data

episodes$original_air_date <- as.Date(episodes$original_air_date,format="%d-%m-%Y")
plot_intro(imdb.data)
plot_intro(episodes)
plot_missing(imdb.data)
plot_missing(episodes)
imdb.data <- imdb.data[-1,]

## Merging to create new datatable

imdb.data1 <- select(imdb.data,-c('original_air_date','desc','episode_num'))
imdb.data1 <- imdb.data1 %>%group_by(season) %>% mutate(episode_num_in_season = row_number())  
episodes1 <- select(episodes,-c('episode_num_overall','prod_code'))

df = merge(x = episodes1, y = imdb.data1,by.x=c("season","episode_num_in_season","title"), 
      by.y=c("season","episode_num_in_season","title"),all=TRUE)
summary(df)
   
## Analysing Data Structure

df1<- df %>% group_by(season) %>% summarise(total_votes = mean(total_votes))
barplot(df1$total_votes, main = "Total Votes", names.arg = df1$season , 
                          xlab = "Season", ylab = "Votes", 
                          col = rainbow(12))

aggregate(episodes$episode_num_in_season, by=list(episodes$season),FUN=length)
aggregate(episodes$episode_num_in_season, by=list(episodes$directed_by),FUN=length)
average_viewership <- aggregate(episodes$us_viewers, by=list(episodes$season),FUN=mean)

plot(average_viewership,type="o",xlab = "seasons", ylab = "Rating in Millions",main="Average season viewership of Big Bang Theory")

df$year <-as.numeric(format(df$original_air_date,"%Y"))
df3<- df %>% group_by(year,season) %>% summarise(total_views = mean(us_viewers))
df3
df3 %>% ggplot(aes(x = year, y = total_views, colour = season)) + 
geom_point(aes(size=total_views),show.legend = T)+ scale_y_continuous(labels = label_number(suffix = "M", scale = 1e-6))+labs(title = "Average viewership Of Seasons over Years ",
x = "Year",y = "Views")+scale_size_continuous(labels = scales::unit_format(unit = "M",scale = 1e-6))

average_ratings <- aggregate(imdb.data$imdb_rating, by=list(imdb.data$season),FUN=mean)
plot(average_ratings,type="o",xlab = "seasons", ylab = "IMDB Rating",main="Average season imdb rating of Big Bang Theory")
   
