## Random Sampling
sample(1:40,5)
sample(1:40,5)
## Probability calculations and combinatorics
x buat haha
## Densities
# normal distribution
x <- seq(-4, 4, 0.1)
curve(dnorm(x), from=-4, to=4)
# discrete distribution
x <- 0:50
plot(x,dbinom(x, size=50, prob=0.5), type="h")

### Descriptive Statistics
## summary stats for a single group
x<- rnorm(50)
mean(x)
sd(x)
var(x)
median(x)
quantile(x)
## Graphical display of distributions
#histograms 
hist(x)
#cumulative distributions
n <- length(x)
plot(sort(x), (1:n)/n, type="s", ylim=c (0,1))
# qqplot
qqnorm(x)
# boxplot
par(mfrow=c(1,2))
boxplot(IgM)
boxplot(log(IgM))
par(mfrow=c(1,1))
# x jadiii