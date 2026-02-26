library(tidyverse)    # for almost all data handling tasks
library(readxl)       # to import Excel data
library(ggplot2)      # to produce nice graphiscs
library(stargazer)    # to produce nice results tables

CKdata<- read_xlsx("data/CK_public.xlsx",na = ".")

str(CKdata)  # prints some basic info on variables

CKdata$STATEf <- as.factor(CKdata$STATE)  
levels(CKdata$STATEf) <- c("Pennsylvania","New Jersey") 

CKdata$CHAINf <- as.factor(CKdata$CHAIN)  
levels(CKdata$CHAINf) <- c("Burger King","KFC", "Roy Rogers", "Wendy's") 

summary(CKdata[c("WAGE_ST","EMPFT")])

Tab1 <- CKdata %>% group_by(STATEf) %>% 
  summarise(n = n()) %>% 
  print()

p1 <- ggplot(CKdata,aes(WAGE_ST,EMPFT)) +
  geom_point(size=0.5) +    # this produces the scatter plot
  geom_smooth(method = "lm", se = FALSE)  # adds the line 
p1