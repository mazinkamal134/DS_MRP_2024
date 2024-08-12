# Examining the Impact of Listening to Music Online on Mental Health: An Observational Study

## Overview

This repository contains the code used in a research project examining the impact of listening to music on mental health, specifically focusing on stress and anxiety levels. The study employs data from Twitter users, leveraging various pipelines for demographic inference, stress level assessment, and statistical modeling.

## Repository Structure

The repository is organized into the following directories and files:

### 1. **Exploratory Data Analysis**
   - **`Exploratory_Data_Analysis.ipynb`**: This notebook provides an initial exploration of the dataset, including data visualization, summary statistics, and preliminary insights into the relationship between music listening and mental health.

### 2. **Master Dataset Pipeline**
   - **`Master_Dataset_Processing_Pipeline.ipynb`**: This notebook contains the code for curating and preparing the master dataset used in the study. It integrates data from various sources and processes it to create a comprehensive dataset for analysis.

### 3. **Demographics Pipeline**
   - This directory includes notebooks for inferring demographic information (age, gender, education level) from Twitter user data:
     - **`Demographics_Age_Inference`**: Code for inferring the age of Twitter users.
     - **`Demographics_Gender_Inference.ipynb`**: Code for inferring the gender of Twitter users.
     - **`Demographics_Education_Level_Inference.ipynb`**: Code for inferring the education level of Twitter users.

### 4. **TensiStrength Pipeline**
   - This directory contains the code used to calculate the stress score for tweets using the TensiStrength Java API:
     - **`1_TensiSterngth_Data_Preprocessing.ipynb`**: Code for preparing tweets for stress analysis.
     - **`2_TensiStrenght_Stress_Score_Calculator_Instance_x.ipynb`**: Code for calculating stress scores using TensiStrength Java API, a standard notebook to duplicate for parallel runs.
     - **`3_TensiStrength_Combine_Finalize.ipynb`**: Code for finalizing the process and combining the files generated from parallel runs - if any.
     - **`API/`**: Subfolder containing the TensiStrength Java API.

### 5. **GLMM**
   - This directory is divided into two subfolders, focusing on data curation and modeling:
     - **`Data Pipeline/`**: Code for curating the dataset required for Generalized Linear Mixed Model (GLMM) analysis.
     - **`Inference/`**: R scripts for performing GLMM to assess the impact of music listening on stress levels.

## Data

The datasets used in this project are publicly available on [Google Drive]((https://drive.google.com/drive/folders/1Ni3iWq8J8_FUIZQ99uq2eEnPyd8mOdKC?usp=sharing)). Due to their size, they are not included in this repository.

## Usage

1. **Exploratory Data Analysis**: Start with the `Exploratory_Data_Analysis.ipynb` notebook to understand the data structure and gain initial insights.
2. **Master Dataset Preparation**: Use the `Master_Dataset_Processing_Pipeline.ipynb` to generate the main dataset for analysis.
3. **Demographic Inference**: Run the scripts in the `Demographics Pipeline` to infer demographic information from Twitter user data.
4. **Stress Score Calculation**: Utilize the `TensiStrength Pipeline` to calculate stress levels in tweets.
5. **Modeling**: Apply the GLMM models using the code in the `GLMM` folder to analyze the impact of music on mental health.

## Contributing

Feel free to open issues or submit pull requests for any improvements or bug fixes.
