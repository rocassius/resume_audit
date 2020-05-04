

## Creating random numbers for W241 project ##

# set seed for reproducibility
set.seed(79734)

resumes <- c("Reilly Smith", "Sklyer Morris")

# randomizing functions
randomize.treat <- function(){ sample(0:1, 2) }

#  most of an 1000 row google spreadsheet
N <- 499

res <- rep(resumes, N)
mids <- as.vector(replicate(N, randomize.treat()))
qd <- as.vector(replicate(N, randomize.treat()))

df <- data.frame(res, mids, qd)

# save  
setwd("/Users/rowancassius/Desktop/W241")
write.csv(df,"resume_randomization.csv", row.names = F)


df_read <- read.csv("resume_randomization.csv")
