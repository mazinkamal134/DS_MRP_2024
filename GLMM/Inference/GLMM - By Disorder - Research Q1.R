# Q1: Does listening to music have a positive impact on individuals with mental health disorders, such as reducing levels of stress?

############## Anxiety ###############
# Read
avgScoreDfAnxiety <- read_parquet("D:/Ryerson/Master/Final Project/Data/MLM/Anxiety/anxietyTweetsPoolDf_avgScore_demographics.parquet")

# Model
modelZigammaAnxiety <- glmmTMB(stress_score ~ group + (1 | author_id), 
                             ziformula = ~group + (1 | author_id), 
                             data = avgScoreDfAnxiety, 
                             family = ziGamma(link = "log"))
# Summarize
summary(modelZigammaAnxiety)
# Model validity
pearsonResidAnxiety <- residuals(modelZigammaAnxiety, type = "pearson")
## Plot residuals vs. fitted values
plot(fitted(modelZigammaAnxiety), pearsonResidAnxiety, xlab = "Fitted Values", ylab = "Pearson Residuals", main = "Residuals vs. Fitted Values")
abline(h = 0, lty = 2)  # Add horizontal line at zero
## Assess normality of residuals
qqnorm(pearsonResidAnxiety)
qqline(pearsonResidAnxiety)

############## Depression ###############
# Read
avgScoreDfDepression <- read_parquet("D:/Ryerson/Master/Final Project/Data/MLM/Depression/depressionTweetsPoolDf_avgScore_demographics.parquet")
# Model
modelZigammaDepression <- glmmTMB(stress_score ~ group + (1 | author_id), 
                               ziformula = ~group + (1 | author_id), 
                               data = avgScoreDfDepression, 
                               family = ziGamma(link = "log"))
# Summarize
summary(modelZigammaDepression)
# Validate
pearsonResidDepression <- residuals(modelZigammaDepression, type = "pearson")
## Pearson residuals vs. fitted values
plot(fitted(modelZigammaDepression), pearsonResidDepression, xlab = "Fitted Values", ylab = "Pearson Residuals", main = "Residuals vs. Fitted Values")
abline(h = 0, lty = 2) 
## Q-Q plot
qqnorm(pearsonResidDepression)
qqline(pearsonResidDepression)

############## PTSD ###############
# Read
avgScoreDfPtsd <- read_parquet("D:/Ryerson/Master/Final Project/Data/MLM/PTSD/ptsdTweetsPoolDf_avgScore_demographics.parquet")
# Model
modelZigammaPtsd <- glmmTMB(stress_score ~ group + (1 | author_id), 
                            ziformula = ~group + (1 | author_id), 
                            data = avgScoreDfPtsd, 
                            family = ziGamma(link = "log"))
# Summarize
summary(modelZigammaPtsd)
# Validate
## Pearson residuals vs. fitted values
pearsonResidPtsd <- residuals(modelZigammaPtsd, type = "pearson")
plot(fitted(modelZigammaPtsd), pearsonResidPtsd, xlab = "Fitted Values", ylab = "Pearson Residuals", main = "Residuals vs. Fitted Values")
abline(h = 0, lty = 2) 
## Q-Q plot
qqnorm(pearsonResidPtsd)
qqline(pearsonResidPtsd)

