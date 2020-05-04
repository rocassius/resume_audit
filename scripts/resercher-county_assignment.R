library(gtools)

# counties to be assigned
counties <- c('Alameda', 'Napa', 'Santa Clara', 'Contra Costa',
              'San Francisc', 'Solano', 'Marin', 'San Mateo', 'Sonoma')

# researchers
reseacher <- c(rep('Rowan',3),rep('Silvia',3),rep('Reese',3))

# set seed for reproducibility
set.seed(565)

# final acounty assignment
d <- data.frame(reseacher,permute(counties))









