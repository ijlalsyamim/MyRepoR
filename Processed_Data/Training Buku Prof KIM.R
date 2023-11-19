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
library(here)
library(foreign)
data <- read.spss(here('raw_data', 'DatasetExploreR', 'cholest.sav'), to.data.frame = TRUE)
str(data)
head(data)
tail(data)
data$age
data[ , "age"]
data[7, ]
data[73,2]
data[(1:3) , c(1:2, 4)]
data[ , -2]
subset(data, age>45)
subset(data, sex == 'female')
subset(data, select = c(chol,age, sex))
subset(data, select = chol:sex)
subset(data, age>=45, select = c(age, sex))
subset(data, age<=35 | sex == 'female', select = c(age, sex))
levels(data$sex)
library(plyr)
arrange(data, exercise, age)


data.frame <- read.table(header = TRUE, text = '
                         ID Group BMI
                         1 Fat 30
                         2 Fat 31
                         3 Fat 32
                         4 Thin 20
                         5 Thin 19
                         6 Thin 18
                         ')
str(data_frame)
## Descriptive Statistics
chickwts
str(chickwts)
# numerical variables
levels(chickwts$feed)
mean(chickwts$weight)
median(chickwts$weight)
min(chickwts$weight)
max(chickwts$weight)
range(chickwts$weight)
sd(chickwts$weight)
var(chickwts$weight)
quantile(chickwts$weight)
IQR(chickwts$weight)
quantile(chickwts$weight, type = 6)
IQR(chickwts$weight, type = 6)
mad(chickwts$weight)
summary(chickwts$weight)
install.packages('psych')
library(psych)
describe(chickwts$weight)
# categorical variables
summary(chickwts$feed)
table(chickwts$feed)
prop.table(table(chickwts$feed))
prop.table(table(chickwts$feed))*100
# last ni xleh buat plak. jengggg cbind(n = table(chickwts$feed))
# 2 variables and more
# numerical
datasets::women
head(women)
str(women)
summary(women)
library(psych)
describe(women)
# categorical
head(infert)
str(infert)
infert$induced <- factor(infert$induced, levels = 0:2,
                         labels = c('0', '1', '2 or more' ))
infert$induced <- factor(infert$case, levels = 0:1,
                         labels = c('control', 'case' ))
infert$induced <- factor(infert$spontaneous, levels = 0:2,
                         labels = c('0', '1', '2 or more' ))
str(infert)
summary(infert[c('education', 'induced', 'case', 'spontaneous')])
lapply(infert[c('education', 'induced', 'case', 'spontaneous')],
       function(x) summary(x)/length(x)*100)
lapply(infert[c('education', 'induced', 'case', 'spontaneous')],
       summary)
lapply(infert[c('education', 'induced', 'case', 'spontaneous')],
       table)
lapply(infert[c('education', 'induced', 'case', 'spontaneous')],
       function(x) prop.table(table(x)))
lapply(infert[c('education', 'induced', 'case', 'spontaneous')],
       function(x) prop.table(table(x))*199)
# group and cross tabulation
# by group
by(infert[c('age', 'parity')], infert$case, summary)
library(psych)
by(infert[c('age', 'parity')], infert$case, describe)
describeBy(infert[c('age', 'parity')], group = infert$case)
by(infert[c('age', 'parity')], infert$case,
   function(x) lapply(x,mean))
by(infert[c('age', 'parity')], infert$case,
   function(x) lapply(x,IQR))
summary(infert)   
by(infert[c('education', 'induced', 'spontaneous')], infert$case,
   summary)
by(infert[c('education', 'induced', 'spontaneous')], infert$case,
   function(x) lapply(x, function(x) summary(x)/length(x)))
by(infert[c('education', 'induced', 'spontaneous')], infert$case,
   function(x) lapply(x, function(x) summary(x)/length(x)*100))
by(infert[c('education', 'induced', 'spontaneous')], infert$case,
   function(x) lapply(x, table))
by(infert[c('education', 'induced', 'spontaneous')], infert$case,
   function(x) lapply(x, function(x) prop.table(table(x))))
by(infert[c('education', 'induced', 'spontaneous')], infert$case,
   function(x) lapply(x, function(x) prop.table(table(x)*100)))
# cross tabulation
table(infert$education, infert$case)
table(education = infert$education, case = infert$case)
lapply(infert[c('education', 'induced', 'spontaneous')],
       function(x) table(x, infert$case))
table(infert$education, infert$case, infert$induced)
by(infert[c('education', 'case')], infert$induced, table)
# costumize text outputs
library(foreign)
library(here)
cholest <- read.spss(here("raw_data", "DatasetExploreR", "cholest.sav", to.data.frame = TRUE))
file_path <- here("raw_data", "DatasetExploreR", "cholest.sav")
cholest <- read.spss(file_path, to.data.frame = TRUE)
str(data)
mean(cholest$age)
sd(cholest$age)
length(cholest$age)
cbind(mean= mean(cholest$age), sd = sd(cholest$age), n = length(cholest$age))
chol_c <- cbind(mean = mean(cholest$age), sd = sd(cholest$age), n = length(cholest$age))
rownames(chol_c) <- "cholesterol"
chol_c
rbind(mean(cholest$age), sd = sd(cholest$age), n = length(cholest$age))
chol_r = rbind(mean(cholest$age), sd = sd(cholest$age), n = length(cholest$age))
colnames(chol_r) <- "Cholesterol"
chol_r

## VISUAL EXPLORATION
library(foreign)
library(here)
cholest <- read.dta(here("raw_data", "DatasetExploreR", "cholest.dta"))
str(cholest)
summary(cholest)
# plotting numerical variable
# Histogram
hist(cholest$chol)
hist(cholest$chol, breaks = 10, col = 'red',
     main = "Cholestrerol (mmol/L) distribution",
     xlab = "Cholesterol (mmol/L)")
# kernel density plot
d.plot <- density(cholest$chol)
plot(d.plot, main = "Kernel Density of Serum Cholesterol")
hist(cholest$chol, breaks = 10, freq = FALSE, col = 'red',
     main = "Cholesterol (mmol/L) distribution", xlab = "Cholesterol (mmol/L)")
lines(density(cholest$chol, adjust = 1.5))
# box and whisker plot
boxplot(cholest$chol, main = "Cholesterol (mmol/L) distribution", 
        ylab = "Cholesterol (mmol/L)")
boxplot(attitude, col = rainbow(7))
# plot relationship between numerical variables
# scatter plot
plot(cholest$age, cholest$chol, main = "scatterplot",
     xlab = "Age", ylab = "Choleterol", pch = 19)
abline(line(cholest$age, cholest$chol))
str(iris)
plot(iris[1:3])
str(attitude)
plot(attitude)
# plot categorical variable
counts <- table(cholest$categ)
counts
barplot(counts, main = "Frequency by intervention group",
        ylab = "Intervention group", xlab = "Frequency",
        col = rainbow (3, alpha = 0.5))
barplot(counts, main="Frequency by intervention group",
        xlab = "Intervention group", ylab = "Frequency",
        col = rainbow(3, alpha = 0.5), ylim = c(0, 40)) -> bplot_setting
text(bplot_setting, counts + 5, paste0("n = ", counts))
cholest$age_cat <- cut(cholest$age,
                       breaks = c(-Inf, 35, 45, Inf),
                       labels = c("<35", "35-45", ">45"))
cross <- table(cholest$sex, cholest$age_cat)
addmargins(cross)
barplot(cross, main = "Frequency by age group",
        xlab = "Age group", ylab = "Frequency",
        col = rainbow(2, alpha = 0.5), ylim = c(0, 60),
        legend = rownames(cross)) -> blot_setting
text(rep(blot_setting, each = 2), c(4,12,39, 4, 9),
     paste0("n = ", cross))
# saving plots in R
png(filee = "hist.png")
hist(cholest$chol)
dev.off()
## using lattice package
# histogram, density and box and whisker plots
library(lattice)
histogram(~ chol, data = cholest, xlab = 'Cholesterol Level')
densityplot(~chol, data = cholest, xlab = 'Cholesterol Level')
bwplot(~chol, data = cholest, xlab = 'Cholesterol Level')
# by group
histogram(~chol | sex, data = cholest, xlab = 'Cholesterol Level')
histogram(~chol | sex, data = cholest, layout = c(1, 2), xlab = 'Cholesterol Level')
densityplot(~chol | sex, data = cholest, xlab = 'Cholesterol Level')
densityplot(~chol | sex, data = cholest, layout = c(1, 2), xlab = 'Cholesterol Level')
bwplot(chol ~ sex, data = cholest, ylab = 'Cholesterol Level')
bwplot(sex ~ chol, data = cholest, xlab = 'Cholesterol Level')
bwplot(~ chol | sex, data = cholest, layout = c(1, 2),  xlab = 'Cholesterol Level')
bwplot(age_cat ~ chol | sex, data = cholest, layout = c(1, 2))
# scatter plot
xyplot(chol ~ age, data = cholest)
xyplot(chol ~ age, data = cholest,
       panel = function(x, y) {
         panel.xyplot(x, y)
         panel.abline(line(x, y))
       })
xyplot(chol ~ age | sex, data = cholest,
       panel = function(x, y) {
         panel.xyplot(x, y)
         panel.abline(line(x, y))
       })
# bar chart
counts <- table(cholest$categ)
counts
barchart(counts, ylab = "Intervention group", xlab = "Frequency",
         col = rainbow(3))
cross <- table(cholest$sex, cholest$age_cat)
barchart(cross, auto.key = T, ylab = "Sex", xlab = "Frequency")
barchart(t(cross), acuto.key = T, ylab = "Age group", xlab = "Frequency")
# histograms and bw plots
cat(names(attitude), sep = "+")
histogram (~rating+complaints+privileges+learning+raises+critical+advance, data = attitude)
densityplot(~ rating+complaints+privileges+learning+raises+critical+advance, data = attitude, auto.key = T)
## using ggplot2 package
# plot numerical
library(ggplot2)
myplot <- ggplot(data = cholest, aes(x = chol))
myplot + geom_histogram(binwidth = 0.5)
ggplot(cholest, aes(x = chol)) + geom_histogram(binwidth =0.5,
                                                colour = "black", fill = "white")
# denstiy curve
ggplot(data = cholest, aes(x = chol )) + geom_density()
# combine
ggplot(data = cholest, aes(x =chol)) +
  geom_histogram(aes(y = ..density..), binwidth = 0.5, colour = "black", fill = "white") +
  geom_density(alpha = .2, fill = "#FF6666")
# plot categorical variables
sex_bar <- ggplot(data = cholest, aes(sex))
sex_bar + geom_bar()
ggplot(data = cholest, mapping = aes(sex, fill = sex)) +
  geom_bar() + xlab('Sex') + ylab('Freq') +
  ggtitle('Freq of male and female')
## plotting numerical and categorical variables
#overlying histo
ggplot(cholest, aes(x = chol, fill = sex)) +
  geom_histogram(binwidth = .5, alpha = .5, position = "identity")
# interleaving histo
ggplot(cholest, aes(x = chol, fill = sex)) +
  geom_histogram(binwidth = .5, position = "dodge")
# overlying density plots
ggplot(cholest, aes(x = chol, colour = sex)) + geom_density()
ggplot(cholest, aes(x = chol, colour = sex, fill = sex)) + geom_density(alpha = .3)
# using facet
ggplot(data = cholest, aes(x = chol)) +
  geom_histogram(binwidth = .5, colour = "black", fill = "white") +
  facet_grid(sex ~ .)
ggplot(data = cholest, aes(x = chol)) +
  geom_histogram(binwidth = .5, colour = "black", fill = "white") +
  facet_grid(. ~ sex)
