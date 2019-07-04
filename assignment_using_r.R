library('rvest')
#Specifying the url for desired website to be scraped
url <- 'http://www.imdb.com/search/title?count=250&release_date=2016,2016&title_type=feature'
url2<-'https://www.imdb.com/search/title/?title_type=feature&release_date=2016-01-01,2016-12-31&count=250&start=251&ref_=adv_nxt'
url3<-'https://www.imdb.com/search/title/?title_type=feature&release_date=2016-01-01,2016-12-31&count=250&start=501&ref_=adv_nxt'
url4<-'https://www.imdb.com/search/title/?title_type=feature&release_date=2016-01-01,2016-12-31&count=250&start=751&ref_=adv_nxt'
#Reading the HTML code from the website
webpage <- read_html(url)
webpage2 <- read_html(url2)
webpage3<- read_html(url3)
webpage4<- read_html(url4)
#Using CSS selectors to scrape the rankings section
rank_data_html <- html_nodes(webpage,'.text-primary')
rank_data_html2<- html_nodes(webpage2,'.text-primary')
rank_data_html3<- html_nodes(webpage3,'.text-primary')
rank_data_html4<- html_nodes(webpage4,'.text-primary')
#Converting the ranking data to text
rank_data <- html_text(rank_data_html)
rank_data2<- html_text(rank_data_html2)
rank_data3<- html_text(rank_data_html3)
rank_data4<- html_text(rank_data_html4)
#Let's have a look at the rankings
head(rank_data)
rank_data
length(rank_data4)

title_data_html <- html_nodes(webpage,'.lister-item-header a')
title_data_html2<- html_nodes(webpage2,'.lister-item-header a')
title_data_html3<- html_nodes(webpage3,'.lister-item-header a')
title_data_html4<- html_nodes(webpage4,'.lister-item-header a')

#Converting the title data to text
title_data <- html_text(title_data_html)
title_data2<- html_text(title_data_html2)
title_data3<- html_text(title_data_html3)
title_data4<- html_text(title_data_html4)
#Let's have a look at the title
head(title_data)
length(title_data4)


actors_data_html <- html_nodes(webpage,'.lister-item-content .ghost+ a')
actors_data_html2<- html_nodes(webpage2,'.lister-item-content .ghost+ a')
actors_data_html3 <- html_nodes(webpage3,'.lister-item-content .ghost+ a')
actors_data_html4 <- html_nodes(webpage4,'.lister-item-content .ghost+ a')

#Converting the gross actors data to text
actors_data <- html_text(actors_data_html)
actors_data2<- html_text(actors_data_html2)
actors_data3<- html_text(actors_data_html3)
actors_data4<- html_text(actors_data_html4)
length(actors_data4)

#Let's have a look at the actors data
head(actors_data)
actors_data<-as.factor(actors_data)
actors_data2<-as.factor(actors_data2)
actors_data3<-as.factor(actors_data3)
actors_data4<-as.factor(actors_data4)

#Using CSS selectors to scrape the IMDB rating section
rating_data_html <- html_nodes(webpage,'.ratings-imdb-rating strong')
rating_data_html2<- html_nodes(webpage2,'.ratings-imdb-rating strong')
rating_data_html3<- html_nodes(webpage3,'.ratings-imdb-rating strong')
rating_data_html4<- html_nodes(webpage4,'.ratings-imdb-rating strong')

#Converting the ratings data to text
rating_data <- html_text(rating_data_html)
rating_data2 <- html_text(rating_data_html2)
rating_data3<- html_text(rating_data_html3)
rating_data4<- html_text(rating_data_html4)
length(rating_data_html4)
#Let's have a look at the ratings
rating_data4
#Data-Preprocessing: converting ratings to numerical
rating_data<-as.numeric(rating_data)
rating_data2<-as.numeric(rating_data2)
rating_data3<-as.numeric(rating_data3)
rating_data4<-as.numeric(rating_data4)
rating_data4[250]<-0
length(rating_data4)
#Let's have another look at the ratings data
head(rating_data)
is.na(rating_data)
is.na(rating_data2)
is.na(rating_data3)
is.na(rating_data4)


#Combining all the lists to form a data frame
movies_df<-data.frame(Rank = rank_data, Title = title_data,Rating = rating_data,Actor = actors_data)
movies_df2<-data.frame(Rank = rank_data2, Title = title_data2,Rating = rating_data2,Actor = actors_data2)
movies_df3<-data.frame(Rank = rank_data3, Title = title_data3,Rating = rating_data3,Actor = actors_data3)
movies_df4<-data.frame(Rank = rank_data4, Title = title_data4,Rating = rating_data4,Actor = actors_data4)
#Structure of the data frame

str(movies_df3)
imdb<-rbind(movies_df,movies_df2,movies_df3,movies_df4)
imdb
