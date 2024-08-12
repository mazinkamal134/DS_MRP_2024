# Q1: Does listening to music have a positive effect on individuals with mental health disorders, such as reducing levels of stress?
# Q2: How does the act of listening to music, along with demographic factors such as gender, age, and level of education, influence the levels of stress?

############## Q1 ###############
# Read
avgScoreDf = read_parquet("D:/Ryerson/Master/Final Project/Data/MLM/combinedTweetsPoolDf_avgScore_demographics.parquet")
# Model
modelZigamma <- glmmTMB(stress_score ~ group + (1 | author_id), 
                             ziformula = ~ group + (1 | author_id), 
                             data = avgScoreDf, 
                             family = ziGamma(link = "log"))
# Summarize
summary(modelZigamma)
# Model Validity
pearsonResid <- residuals(modelZigamma, type = "pearson")
## Plot residuals vs. fitted values
plot(fitted(modelZigamma), pearsonResid, xlab = "Fitted Values", ylab = "Pearson Residuals", main = "Residuals vs. Fitted Values")
abline(h = 0, lty = 2)  # Add horizontal line at zero
## Q-Q plots
qqnorm(pearsonResid)
qqline(pearsonResid)

############## Q2 ###############
# Filter
avgScoreDfT = subset(avgScoreDf, group == 1)
# Model
modelZigammaT <- glmmTMB(stress_score ~ gender + age_group + edu_level + (1 | author_id), 
                               ziformula = ~ gender + age_group + edu_level + (1 | author_id), 
                               data = avgScoreDfT, 
                               family = ziGamma(link = "log"))
# Summarize
summary(modelZigammaT)
# Validate
pearsonResidT <- residuals(modelZigammaT, type = "pearson")
## Plot residuals vs. fitted values
plot(fitted(modelZigammaT), pearsonResidT, xlab = "Fitted Values", ylab = "Pearson Residuals", main = "Residuals vs. Fitted Values")
abline(h = 0, lty = 2) 
## Q-Q plots
qqnorm(pearsonResidT)
qqline(pearsonResidT)
