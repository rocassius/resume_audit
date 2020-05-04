## Creating random numbers for W241 project ##

# set seed for reproducibility
set.seed(79734)


library(data.table)
library(dplyr)
library(lmtest)
library(sandwich)
library(ggplot2)

resumes <- c("Reilly Smith", "Sklyer Morris")

# randomizing functions
randomize.treat <- function(){ sample(0:1, 2) }

# load the data that was used
# df.mini <- read.csv("resume_data_outcomes_mini - resume.csv")
# df.mini <- read.csv("../data/resume_data_outcomes_mini.csv")
min_degree := addNA(min_degree)
dt.mini <- data.table(df.mini[1:122,])



placebo_test <- function() {
  #  most of an 1000 row google spreadsheet
  N <- 499
  
  res <- rep(resumes, N)
  mids <- as.vector(replicate(N, randomize.treat()))
  qd <- as.vector(replicate(N, randomize.treat()))
  
  df <- data.frame(res, mids, qd)
  dt.rand <- data.table(df[1:122,])
  
  # transfer columns to rand.dt for placebo check
  dt.rand[ , days_open := dt.mini[ ,days_open]]
  dt.rand[ , min_degree := dt.mini[ ,min_degree]]
  dt.rand[ , role := dt.mini[ ,role]]
  
  # Randomization Check with treatment assignment data 
  lm.placebo <- dt.rand[,lm(qd ~ res + days_open + role + min_degree)]
  summary(lm.placebo)
  test <- coeftest(lm.placebo, vcov. = vcovHC(lm.placebo))
}


# reprouce original randomization (that was used)
og.placebo.result <-placebo_test() 

# generate 1000 other possible randomizations
placebo.data <- replicate(n=1000, placebo_test()[2,])
placebo.df <- data.frame(t(placebo.data))
colnames(placebo.df) <- c("est", "se", "t", "pval")

# visualize the distribution p values
placebo.df %>% 
  ggplot(aes(x= pval)) + 
  geom_histogram(bins = 10) +
  ggtitle("Histogram of P-values")
 
# visualize the distribution of point estimates
placebo.df %>% 
  ggplot(aes(x = est)) + 
  geom_histogram(bins = 10, fill= "dodgerblue3", alpha=0.9) +
  ggtitle("Histogram of Skyler Point Estimates") +
  geom_vline(xintercept = og.placebo.result[2,1],lty = 'dashed')

# Summarize the distribution of point estimates
summary(placebo.df)

# percentile of the original estimate
mean(placebo.df['est'] < og.placebo.result[2,1])

