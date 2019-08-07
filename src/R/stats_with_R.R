if (!require(tidyverse))      install.packages("tidyverse", dependencies = TRUE)
if (!require(rpart))          install.packages("rpart", dependencies = TRUE)
if (!require(rpart.plot))     install.packages("rpart.plot", dependencies = TRUE)
if (!require(pdp))            install.packages("pdp", dependencies = TRUE)
if (!require(randomForest))   install.packages("randomForest", dependencies = TRUE)

allbus <- dget(file = "Session 8/data/ALLBUS2016/df_allbus2016.R")
head(allbus)

df_allbus <- transmute(allbus,
                       income           = di01a ,    # Nettoeinkommen Befragter
                       sex              = sex ,      # Geschlecht
                       age              = age ,      # Alter
                       eduyears         = S01,       # Bildungsjahre
                       eastwest         = eastwest , # Ost/West
                       socialclass_self = id02  ,    # Soziale Schicht (Selbsteinschätzung)
                       leftright        = pa01       # Links-Rechts (Selbsteinschätzung)
)

df_allbus <- droplevels(df_allbus)
head(df_allbus)
table(df_allbus$leftright) 
levels(df_allbus$leftright) <- c(1,2,3,4,5,6,7,8,9,10)
nrow(df_allbus)

lm1 = lm(income~1+age+sex+ eastwest+eduyears+as.factor(leftright), data = df_allbus)
summary(lm1)
plot(lm1)

nels88 <- dget(file = "df_allbus2016.R")
write.csv(nels88,"Essay/data/allbus_full.csv", row.names = FALSE)
