# getReal20162017

Get-REAL-
=========

# Purpose 
The purpose of this repository is to house R Scripts and documentation for the Get REAL! program. The intent is not share the data nor the results but the how the program was evaluated. A motivation for using Github and Rmarkdown is to increase the quality of the evaluation and reproducability. 

Data sources include girl surveys, parent surveys, teacher surveys and quarterly academic data. Data from surveys and school reports are entered into Qualtrics. The data needs to be manually downloaded from Qualtrics with proper log in credenitals. The data is downloaded to a csv file that sits locally on this writer's machine. Request for API access to Qualtrics has not been requested at this time. 


The data_load.Rmd file reads the csv file and subsequenly creates RDS files and triggers the data management scripts and stats reports to render. The attempt will be to create and utilize a makefile to implement this automation. 

R markdown files have been utilzied to process the downloaded data from Qualtrics, the processed data is sent to a sqllite database that sits locally on this writer's machine. Rmarkdown files read the data from the database and generate reports that evaluate the progress of the students in the program. 






