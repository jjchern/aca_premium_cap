# Linearize premium cap
# Source: Explaining Health Care Reform: Questions About Health Insurance Subsidies
# Source Link: http://kff.org/health-reform/issue-brief/explaining-health-care-reform-questions-about-health/

library(dplyr)
library(magrittr)
library(ggplot2)

# premiumCap2014 ----------------------------------------------------------

fpg = 100L:400L
cap = rep(2, 301)

premiumCap2014 = data_frame(fpg, cap)

premiumCap2014 %<>% 
  mutate(cap = ifelse(fpg > 133 & fpg <= 150, 3    + (4    - 3   ) * (fpg - 134) / (150 - 134), cap)) %>% 
  mutate(cap = ifelse(fpg > 150 & fpg <= 200, 4    + (6.3  - 4   ) * (fpg - 151) / (200 - 151), cap)) %>% 
  mutate(cap = ifelse(fpg > 200 & fpg <= 250, 6.3  + (8.05 - 6.3 ) * (fpg - 201) / (250 - 201), cap)) %>% 
  mutate(cap = ifelse(fpg > 250 & fpg <= 300, 8.05 + (9.5  - 8.05) * (fpg - 251) / (300 - 251), cap)) %>% 
  mutate(cap = ifelse(fpg > 300, 9.5, cap)) %>% 
  mutate(cap = round(cap, digits = 2))

ggplot(premiumCap2014, aes(x = fpg, y = cap)) +
  geom_line() +
  labs(x = "Federal Poverty Guidelines (%)",
       y = "Premium Cap (%)",
       title = "Premium Cap, by Income % Poverty in 2014")

premiumCap2014 %>% print.data.frame()


save(premiumCap2014, file = "premiumCap2014.rda")
haven::write_dta(premiumCap2014, "premiumCap2014.dta")


# premiumCap2015 ----------------------------------------------------------

fpg = 100L:400L
cap = rep(2.01, 301)

premiumCap2015 = data_frame(fpg, cap)

premiumCap2015 %<>% 
  mutate(cap = ifelse(fpg > 133 & fpg <= 150, 3.02 + (4.02 - 3.02) * (fpg - 134) / (150 - 134), cap)) %>% 
  mutate(cap = ifelse(fpg > 150 & fpg <= 200, 4.02 + (6.34 - 4.02) * (fpg - 151) / (200 - 151), cap)) %>% 
  mutate(cap = ifelse(fpg > 200 & fpg <= 250, 6.34 + (8.1  - 6.34) * (fpg - 201) / (250 - 201), cap)) %>% 
  mutate(cap = ifelse(fpg > 250 & fpg <= 300, 8.1  + (9.56 - 8.1 ) * (fpg - 251) / (300 - 251), cap)) %>% 
  mutate(cap = ifelse(fpg > 300, 9.56, cap)) %>% 
  mutate(cap = round(cap, digits = 2))

ggplot(premiumCap2015, aes(x = fpg, y = cap)) +
  geom_line() +
  labs(x = "Federal Poverty Guidelines (%)",
       y = "Premium Cap (%)",
       title = "Premium Cap, by Income % Poverty in 2015")

premiumCap2015 %>% print.data.frame()

haven::write_dta(premiumCap2015, "premiumCap2015.dta")
save(premiumCap2015, file = "premiumCap2015.rda")

