# getReal20162017

Get-REAL-
=========

# Purpose 
The purpose of this repository is to house R Scripts and documentation for the Get REAL! program. The intent is not share the data nor the results but the how the program was evaluated. A motivation for using Github and Rmarkdown is to increase the quality of the evaluation and reproduce-ability. 

Data sources include girl surveys, parent surveys, teacher surveys and quarterly academic data. Data from surveys and school reports are entered into Qualtrics. The data needs to be manually downloaded from Qualtrics with proper log in credentials. The data is downloaded to a csv file that sits locally on this writer's machine. Request for API access to Qualtrics has not been requested at this time. 


# How the scripts work together

The data_load.Rmd file reads csv files downloaded from Qualtrics. The data_load.Rmd file triggers data management scripts and reports to render data that helps humans evaluate the effectiveness of the Get REAL! program.

The attempt will be to create and utilize a makefile to implement this automation. 

Please see the Workflow.Pdf in the main repository to determine what each script does. 


# Results









