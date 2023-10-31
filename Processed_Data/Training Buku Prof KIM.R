libpaths()
install.packages(c("car", "plyr"))
library(car)
library(carData)
?car
intsallr()
library(here)
data <- read.csv(here('raw_data', 'DatasetExploreR', 'cholest.csv'))
View(data)
dim(data)
names(data)
str(data)
write.csv(data, 'data.csv')

?chickwt

data_num <- c(1,2,3,4,5); str(data_num)
data_cat <- factor(c('M','F','M','F','M')); str(data_cat)
?type
data.frame(data_num, data_cat)
data_frame <- data.frame(data_num, data_cat); str(data_frame)
list(data_num, data_cat)
data_list <- list(data_num, data_cat); str(data_list)
matrix(data = c(data_num, data_cat), nrow = 5, ncol = 2)
data_matrix <- matrix(data = c(data_num, data_cat), nrow = 5, ncol = 2)
str(data.matrix)      
?array                      