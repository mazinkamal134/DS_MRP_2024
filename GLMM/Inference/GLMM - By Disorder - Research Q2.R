# Q2: How does the act of listening to music, along with demographic factors such as gender, age, and level of education, influence the levels of stress?

############## Anxiety ###############
# Read & filter
avgScoreDfAnxiety = read_parquet("D:/Ryerson/Master/Final Project/Data/MLM/Anxiety/anxietyTweetsPoolDf_avgScore_demographics.parquet")
avgScoreDfAnxietyT = subset(avgScoreDfAnxiety, group == 1) # treatment only
# Model
modelZigammaAnxietyT <- glmmTMB(stress_score ~ gender + age_group + edu_level + (1 | author_id), 
                             ziformula = ~ gender + age_group + edu_level + (1 | author_id), 
                             data = avgScoreDfAnxietyT, 
                             family = ziGamma(link = "log"))
# Summarize
summary(modelZigammaAnxietyT)
# Model Validity
pearsonResidAnxietyT <- residuals(modelZigammaAnxietyT, type = "pearson")
## Plot residuals vs. fitted values
plot(fitted(modelZigammaAnxietyT), pearsonResidAnxietyT, xlab = "Fitted Values", ylab = "Pearson Residuals", main = "Residuals vs. Fitted Values")
abline(h = 0, lty = 2)  # Add horizontal line at zero
## Q-Q plots
qqnorm(pearsonResidAnxietyT)
qqline(pearsonResidAnxietyT)

############## Depression ###############
# Read & filter
avgScoreDfDepression = read_parquet("D:/Ryerson/Master/Final Project/Data/MLM/Depression/depressionTweetsPoolDf_avgScore_demographics.parquet")
avgScoreDfDepressionT = subset(avgScoreDfDepression, group == 1)
# Model
modelZigammaDepressionT <- glmmTMB(stress_score ~ gender + age_group + edu_level + (1 | author_id), 
                               ziformula = ~ gender + age_group + edu_level + (1 | author_id), 
                               data = avgScoreDfDepressionT, 
                               family = ziGamma(link = "log"))
# Summarize
summary(modelZigammaDepressionT)
# Validate
pearsonResidDepressionT <- residuals(modelZigammaDepressionT, type = "pearson")
## Plot residuals vs. fitted values
plot(fitted(modelZigammaDepressionT), pearsonResidDepressionT, xlab = "Fitted Values", ylab = "Pearson Residuals", main = "Residuals vs. Fitted Values")
abline(h = 0, lty = 2) 
## Q-Q plots
qqnorm(pearsonResidDepressionT)
qqline(pearsonResidDepressionT)

############## PTSD ###############
# Read & filter
avgScoreDfPtsd = read_parquet("D:/Ryerson/Master/Final Project/Data/MLM/PTSD/ptsdTweetsPoolDf_avgScore_demographics.parquet")
avgScoreDfPtsdT = subset(avgScoreDfPtsd, group == 1)
# Model
modelZigammaPtsdT <- glmmTMB(stress_score ~ gender + age_group + edu_level + (1 | author_id), 
                                  ziformula = ~ gender + age_group + edu_level + (1 | author_id), 
                                  data = avgScoreDfPtsdT, 
                                  family = ziGamma(link = "log"))
# Summarize
summary(modelZigammaPtsdT)
# Validate
pearsonResidPtsdT <- residuals(modelZigammaPtsdT, type = "pearson")
## Plot residuals vs. fitted values
plot(fitted(modelZigammaPtsdT), pearsonResidPtsdT, xlab = "Fitted Values", ylab = "Pearson Residuals", main = "Residuals vs. Fitted Values")
abline(h = 0, lty = 2) 
# Assess normality of residuals
qqnorm(pearsonResidPtsdT)
qqline(pearsonResidPtsdT)
