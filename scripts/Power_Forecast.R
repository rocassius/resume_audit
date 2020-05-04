

## Power Forecast for W241 Project ##


# function for calculating the necessary number of job postings to respond to
calc_sample_size <- function(power, tau, p_control, alpha = 0.05) {
  
  var.control <- p_control * (1 - p_control)
  var.treat <-   (p_control + tau) * (1 - (p_control + tau))
  
  z.alpha <- qnorm(1-alpha)
  n <- (z.alpha - qnorm(1 - power)) ^ 2 * (var.control + var.treat) / (tau^2)
    
  return(ceil(n))  
}

# dafault settings (These are grounded in intuition and anecdotes)
pow <- 0.8
p_cont <- 0.05
tau <- 0.15

# Necessary number of postings with the defaults
n_job_postings <- calc_sample_size(power = pow, tau = tau, p_control = p_cont)
paste("Necessary Number of Job Postings: ", round(n_job_postings))

taus <- seq(0.06, 0.20, 0.02)
sample_sizes <- 
  sapply(taus, 
  function(effect) calc_sample_size(power=0.8, tau = effect, p_control = 0.05))

# plot it
plot(sample_sizes ~ taus, xlim = c(0.06, 0.21), xlab = "tau", ylab = "postings",
     main="Number of Postings vs Effect Size")
with(text(sample_sizes ~ taus, labels = sample_sizes, pos = 4))



