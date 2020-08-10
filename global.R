library(shiny)
library(shinydashboard)
library(shinythemes)
library(ggplot2)
library(dplyr)
library(DT)

chocolate = read.csv("chocolate.csv")

chocolate$Rating = as.numeric(chocolate$Rating)
countries = aggregate(.~chocolate[,6], FUN=mean, data.frame(chocolate$Rating))
countries2 = countries[order(data.frame(-countries$chocolate.Rating)),]
countries20 = head(countries2,20)
countriesmid = countries2[21:40, ]
countriestail = tail(countries2,20)

origin_freq = sort(table(chocolate$Broad.Bean.Origin), decreasing = T)
origin_frequency = data.frame(origin_freq)
names(origin_frequency)[1] = "Bean.Origin"
names(origin_frequency)[2] = "Frequency"
origin_frequency = origin_frequency[-6,]
origin_frequency = head(origin_frequency,21)

origin_means = aggregate(.~chocolate[,9], FUN=mean, data.frame(chocolate$Rating))
names(origin_means)[1] = "Bean.Origin"
origin_means = data.frame(origin_means)
origin_means$row_num <- seq.int(nrow(origin_means))
first_group = origin_means[c(20,24,48,57,93),]
first_group = first_group[,-3]

chocolate1 = read.csv("chocolate.csv")
chocolate2 = chocolate1 %>% 
  filter(Broad.Bean.Origin %in% c("Venezuela", "Ecuador", "Peru", "Madagascar", "Dominican Republic"))
chocolate2$Rating = as.numeric(chocolate2$Rating)

chocolate3 = chocolate1 %>% 
  filter(Broad.Bean.Origin %in% c("Nicaragua", "Brazil", "Bolivia", "Belize", "Papua New Guinea",
                                                            "Colombia"))
chocolate3$Rating = as.numeric(chocolate3$Rating)

chocolate4 = chocolate1 %>% 
  filter(Broad.Bean.Origin %in% c("Costa Rica", "Vietnam", "Tanzania", "Ghana", "Trinidad",
                                                            "Mexico", "Guatemala", "Hawaii", "Dominican Republic"))
chocolate4$Rating = as.numeric(chocolate4$Rating)

count_rate1 = chocolate1 %>% 
  filter(Company.Location %in% c("France", "Canada", "Italy", "Ecuador", "U.K."))
count_rate1$Rating = as.numeric(count_rate1$Rating)

count_rate2 = chocolate1 %>% 
  filter(Company.Location %in% c("Australia", "Belgium", "Switzerland", 
                                                            "Germany", "Austria", "Spain"))
count_rate2$Rating = as.numeric(count_rate2$Rating)