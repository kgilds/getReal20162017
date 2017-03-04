q2\_dm
================

### Set working directory, library, and read raw data (needs updated data)

``` r
library(tidyverse) #load tidy package
```

    ## Loading tidyverse: ggplot2
    ## Loading tidyverse: tibble
    ## Loading tidyverse: tidyr
    ## Loading tidyverse: readr
    ## Loading tidyverse: purrr
    ## Loading tidyverse: dplyr

    ## Conflicts with tidy packages ----------------------------------------------

    ## filter(): dplyr, stats
    ## lag():    dplyr, stats

``` r
library(sqldf)
```

    ## Loading required package: gsubfn

    ## Loading required package: proto

    ## Loading required package: RSQLite

``` r
library(pander)
```

.

``` r
setwd("C:/Users/kevin/Dropbox/GetReal/Data/2016-2017/Feb 2017")

q2_data<- read_csv("q2_grades_03042017.csv", skip=1)
```

    ## Warning: Missing column names filled in: 'X88' [88]

    ## Warning: Duplicated column names deduplicated: 'You are entering data for $
    ## {q://QID1/ChoiceTextEntryValue} who attends, ...' => 'You are entering data
    ## for ${q://QID1/ChoiceTextEntryValue} who attends, ..._1' [45]

    ## Parsed with column specification:
    ## cols(
    ##   .default = col_character(),
    ##   StartDate = col_datetime(format = ""),
    ##   EndDate = col_datetime(format = ""),
    ##   Finished = col_integer(),
    ##   `Reading-sum` = col_integer(),
    ##   `Reading-weightedAvg` = col_integer(),
    ##   `Reading-weightedStdDev` = col_integer(),
    ##   `Language Arts-sum` = col_integer(),
    ##   `Language Arts-weightedAvg` = col_integer(),
    ##   `Language Arts-weightedStdDev` = col_integer(),
    ##   `You are entering academic data for Quarter 2` = col_integer(),
    ##   `You are entering data for Student: ${q://QID1/ChoiceTextEntryValue} who attends: ...` = col_integer(),
    ##   `Absences:-Quarter 2-<span style="font-size:13px;"><strong>Unexcused absences</strong></span>` = col_integer(),
    ##   `Behavior:-Quarter 2-<span style="font-size:13px;"><strong>In-School Suspensions</strong></span>` = col_integer(),
    ##   `Behavior:-Quarter 2-<span style="font-size:13px;"><strong>Out-of-School Suspensions</strong></span>` = col_integer(),
    ##   `Reading and Language Arts Courses from the Florida Course Code Directory have  been listed in the...` = col_integer(),
    ##   `You are entering data for ${q://QID1/ChoiceTextEntryValue} who attends, ...` = col_integer(),
    ##   `You are entering data for ${q://QID1/ChoiceTextEntryValue} who attends, ..._1` = col_integer()
    ## )

    ## See spec(...) for full column specifications.

``` r
names(q2_data)
```

    ##  [1] "ResponseID"                                                                                                                                                                                 
    ##  [2] "ResponseSet"                                                                                                                                                                                
    ##  [3] "StartDate"                                                                                                                                                                                  
    ##  [4] "EndDate"                                                                                                                                                                                    
    ##  [5] "Finished"                                                                                                                                                                                   
    ##  [6] "Reading-sum"                                                                                                                                                                                
    ##  [7] "Reading-weightedAvg"                                                                                                                                                                        
    ##  [8] "Reading-weightedStdDev"                                                                                                                                                                     
    ##  [9] "Language Arts-sum"                                                                                                                                                                          
    ## [10] "Language Arts-weightedAvg"                                                                                                                                                                  
    ## [11] "Language Arts-weightedStdDev"                                                                                                                                                               
    ## [12] "You are entering academic data for Quarter 2"                                                                                                                                               
    ## [13] "Girl Scout Council Entering the Data:"                                                                                                                                                      
    ## [14] "Girl Code:"                                                                                                                                                                                 
    ## [15] "School Name:"                                                                                                                                                                               
    ## [16] "Date Girl Enrolled in the Get REAL! Program:"                                                                                                                                               
    ## [17] "You are entering data for Student: ${q://QID1/ChoiceTextEntryValue} who attends: ..."                                                                                                       
    ## [18] "Absences:-Quarter 2-<span style=\"font-size:13px;\"><strong>Unexcused absences</strong></span>"                                                                                             
    ## [19] "Absences:-Quarter 2-<strong>Excused absences</strong>"                                                                                                                                      
    ## [20] "Behavior:-Quarter 2-<span style=\"font-size:13px;\"><strong>In-School Suspensions</strong></span>"                                                                                          
    ## [21] "Behavior:-Quarter 2-<span style=\"font-size:13px;\"><strong>Out-of-School Suspensions</strong></span>"                                                                                      
    ## [22] "Did the student get expelled during Quarter 2?"                                                                                                                                             
    ## [23] "Reading and Language Arts Courses from the Florida Course Code Directory have  been listed in the..."                                                                                       
    ## [24] "You are entering data for ${q://QID1/ChoiceTextEntryValue} who attends, ..."                                                                                                                
    ## [25] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Quarter Grade-<span style=\"font-size:13px;\"><strong>M/J INTENS READ (MC)</strong></span>"             
    ## [26] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Quarter Grade-<span style=\"font-size:13px;\"><strong>M/J READ 1</strong></span>"                       
    ## [27] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Quarter Grade-<span style=\"font-size:13px;\"><strong>M/J READ 1, ADV</strong></span>"                  
    ## [28] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Quarter Grade-<span style=\"font-size:13px;\"><strong>M/J READ 2</strong></span>"                       
    ## [29] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Quarter Grade-<span style=\"font-size:13px;\"><strong>M/J READ 2, ADV</strong></span>"                  
    ## [30] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Quarter Grade-<strong><span style=\"font-size:13px;\">M/J READ 3</span></strong>"                       
    ## [31] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Quarter Grade-<span style=\"font-size:13px;\"><strong>M/J READ3, ADV</strong></span>"                   
    ## [32] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Quarter Grade-<span style=\"font-size:13px;\"><strong>Enter 1 course, if required</strong></span>"      
    ## [33] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Quarter Grade-<span style=\"font-size:13px;\"><strong>Enter 1 course, if required</strong></span>-TEXT" 
    ## [34] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Quarter Grade-<strong>M/J DE LA ESOL-READ</strong>"                                                     
    ## [35] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<span style=\"font-size:13px;\"><strong>M/J INTENS READ (MC)</strong></span>"            
    ## [36] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<span style=\"font-size:13px;\"><strong>M/J READ 1</strong></span>"                      
    ## [37] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<span style=\"font-size:13px;\"><strong>M/J READ 1, ADV</strong></span>"                 
    ## [38] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<span style=\"font-size:13px;\"><strong>M/J READ 2</strong></span>"                      
    ## [39] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<span style=\"font-size:13px;\"><strong>M/J READ 2, ADV</strong></span>"                 
    ## [40] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<strong><span style=\"font-size:13px;\">M/J READ 3</span></strong>"                      
    ## [41] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<span style=\"font-size:13px;\"><strong>M/J READ3, ADV</strong></span>"                  
    ## [42] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<span style=\"font-size:13px;\"><strong>Enter 1 course, if required</strong></span>"     
    ## [43] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<span style=\"font-size:13px;\"><strong>Enter 1 course, if required</strong></span>-TEXT"
    ## [44] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<strong>M/J DE LA ESOL-READ</strong>"                                                    
    ## [45] "You are entering data for ${q://QID1/ChoiceTextEntryValue} who attends, ..._1"                                                                                                              
    ## [46] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<span style=\"font-size:13px;\"><strong>M/J LANG ARTS 1 ESOL</strong></span>"                  
    ## [47] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<strong><span style=\"font-size:13px;\">M/J LANG ARTS 2 ESOL</span></strong>"                  
    ## [48] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<span style=\"font-size:13px;\"><strong>M/J LANG ARTS 3 ESOL</strong></span>"                  
    ## [49] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<span style=\"font-size:13px;\"><strong>M/J DEVELOPMENTAL  LANG ARTS ESOL</strong></span>"     
    ## [50] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<strong><span style=\"font-size:13px;\">M/J LANG ARTS 1</span></strong>"                       
    ## [51] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<strong><span style=\"font-size:13px;\">M/J LANG ARTS 1, ADV</span></strong>"                  
    ## [52] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<strong><span style=\"font-size:13px;\">M/J LANG ARTS 2</span></strong>"                       
    ## [53] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<span style=\"font-size:13px;\"><strong>M/J LANG ARTS 2, ADV</strong></span>"                  
    ## [54] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<span style=\"font-size:13px;\"><strong>M/J LANG ARTS 3</strong></span>"                       
    ## [55] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<span style=\"font-size:13px;\"><strong>M/J LANG ARTS 3, ADV</strong></span>"                  
    ## [56] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<span style=\"font-size:13px;\"><strong>M/J ENG 2 CAMB SEC 2</strong></span>"                  
    ## [57] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<span style=\"font-size:13px;\"><strong>M/J IB  MYP LANG & LIT 1</strong></span>"              
    ## [58] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<span style=\"font-size:13px;\"><strong>M/J ENG 1 CAMB SEC 1</strong></span>"                  
    ## [59] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<strong>M/J IB MYP LANG & LIT 3</strong>"                                                      
    ## [60] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<strong>M/J IB MYP LANG & LIT 2</strong>"                                                      
    ## [61] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<strong>M/J ENG 3 CAMB SEC 3 </strong>"                                                        
    ## [62] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<span style=\"font-size:13px;\"><strong>M/J INTENS LANG ARTS</strong></span>"                  
    ## [63] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<strong><span style=\"font-size:13px;\">Enter 1 course, if required</span></strong>"           
    ## [64] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<strong><span style=\"font-size:13px;\">Enter 1 course, if required</span></strong>-TEXT"      
    ## [65] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<strong><span style=\"font-size:13px;\">M/J LANG ARTS TRAN</span></strong>"                    
    ## [66] "The following is a list of Middle School Language  Language Arts  Courses.  : Quarter Grades-<strong>M/J DE LANG ARTS ESOL</strong>"                                                        
    ## [67] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J LANG ARTS 1 ESOL</strong></span>"                 
    ## [68] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong><span style=\"font-size:13px;\">M/J LANG ARTS 2 ESOL</span></strong>"                 
    ## [69] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J LANG ARTS 3 ESOL</strong></span>"                 
    ## [70] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J DEVELOPMENTAL  LANG ARTS ESOL</strong></span>"    
    ## [71] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong><span style=\"font-size:13px;\">M/J LANG ARTS 1</span></strong>"                      
    ## [72] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong><span style=\"font-size:13px;\">M/J LANG ARTS 1, ADV</span></strong>"                 
    ## [73] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong><span style=\"font-size:13px;\">M/J LANG ARTS 2</span></strong>"                      
    ## [74] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J LANG ARTS 2, ADV</strong></span>"                 
    ## [75] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J LANG ARTS 3</strong></span>"                      
    ## [76] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J LANG ARTS 3, ADV</strong></span>"                 
    ## [77] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J ENG 2 CAMB SEC 2</strong></span>"                 
    ## [78] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J IB  MYP LANG & LIT 1</strong></span>"             
    ## [79] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J ENG 1 CAMB SEC 1</strong></span>"                 
    ## [80] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong>M/J IB MYP LANG & LIT 3</strong>"                                                     
    ## [81] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong>M/J IB MYP LANG & LIT 2</strong>"                                                     
    ## [82] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong>M/J ENG 3 CAMB SEC 3 </strong>"                                                       
    ## [83] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J INTENS LANG ARTS</strong></span>"                 
    ## [84] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong><span style=\"font-size:13px;\">Enter 1 course, if required</span></strong>"          
    ## [85] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong><span style=\"font-size:13px;\">Enter 1 course, if required</span></strong>-TEXT"     
    ## [86] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong><span style=\"font-size:13px;\">M/J LANG ARTS TRAN</span></strong>"                   
    ## [87] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong>M/J DE LANG ARTS ESOL</strong>"                                                       
    ## [88] "X88"

    ##  [1] "ResponseID"                                                                                                                                                                                 
    ##  [2] "ResponseSet"                                                                                                                                                                                
    ##  [3] "StartDate"                                                                                                                                                                                  
    ##  [4] "EndDate"                                                                                                                                                                                    
    ##  [5] "Finished"                                                                                                                                                                                   
    ##  [6] "Reading-sum"                                                                                                                                                                                
    ##  [7] "reading_avg"                                                                                                                                                                                
    ##  [8] "Reading-weightedStdDev"                                                                                                                                                                     
    ##  [9] "Language Arts-sum"                                                                                                                                                                          
    ## [10] "lang_avg"                                                                                                                                                                                   
    ## [11] "Language Arts-weightedStdDev"                                                                                                                                                               
    ## [12] "You are entering academic data for Quarter 2"                                                                                                                                               
    ## [13] "council"                                                                                                                                                                                    
    ## [14] "girl_code"                                                                                                                                                                                  
    ## [15] "school"                                                                                                                                                                                     
    ## [16] "enrolled"                                                                                                                                                                                   
    ## [17] "You are entering data for Student: ${q://QID1/ChoiceTextEntryValue} who attends: ..."                                                                                                       
    ## [18] "unexcused"                                                                                                                                                                                  
    ## [19] "excused"                                                                                                                                                                                    
    ## [20] "in_school"                                                                                                                                                                                  
    ## [21] "out_school"                                                                                                                                                                                 
    ## [22] "expelled"                                                                                                                                                                                   
    ## [23] "Nothing"                                                                                                                                                                                    
    ## [24] "You are entering data for ${q://QID1/ChoiceTextEntryValue} who attends, ..."                                                                                                                
    ## [25] "M/J INTENS READ"                                                                                                                                                                            
    ## [26] "M/J READ 1"                                                                                                                                                                                 
    ## [27] "M/J READ 1, ADV"                                                                                                                                                                            
    ## [28] "M/J READ 2"                                                                                                                                                                                 
    ## [29] "M/J READ 2, ADV"                                                                                                                                                                            
    ## [30] "M/J READ 3"                                                                                                                                                                                 
    ## [31] "M/J READ3, ADV"                                                                                                                                                                             
    ## [32] "free_reading1"                                                                                                                                                                              
    ## [33] "free_reading2"                                                                                                                                                                              
    ## [34] "M/J DE LA ESOL-READ"                                                                                                                                                                        
    ## [35] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<span style=\"font-size:13px;\"><strong>M/J INTENS READ (MC)</strong></span>"            
    ## [36] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<span style=\"font-size:13px;\"><strong>M/J READ 1</strong></span>"                      
    ## [37] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<span style=\"font-size:13px;\"><strong>M/J READ 1, ADV</strong></span>"                 
    ## [38] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<span style=\"font-size:13px;\"><strong>M/J READ 2</strong></span>"                      
    ## [39] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<span style=\"font-size:13px;\"><strong>M/J READ 2, ADV</strong></span>"                 
    ## [40] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<strong><span style=\"font-size:13px;\">M/J READ 3</span></strong>"                      
    ## [41] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<span style=\"font-size:13px;\"><strong>M/J READ3, ADV</strong></span>"                  
    ## [42] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<span style=\"font-size:13px;\"><strong>Enter 1 course, if required</strong></span>"     
    ## [43] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<span style=\"font-size:13px;\"><strong>Enter 1 course, if required</strong></span>-TEXT"
    ## [44] "The following is a  list of standard Middle School Reading Courses for Grades 6-8 : Semester Grade-<strong>M/J DE LA ESOL-READ</strong>"                                                    
    ## [45] "You are entering data for ${q://QID1/ChoiceTextEntryValue} who attends, ..._1"                                                                                                              
    ## [46] "M/J LANG ARTS 1 ESOL"                                                                                                                                                                       
    ## [47] "M/J LANG ARTS 2 ESOL"                                                                                                                                                                       
    ## [48] "M/J LANG ARTS 3 ESOL"                                                                                                                                                                       
    ## [49] "M/J DEVELOPMENTAL  LANG ARTS ESOL"                                                                                                                                                          
    ## [50] "M/J LANG ARTS 1"                                                                                                                                                                            
    ## [51] "M/J LANG ARTS 1 ADV"                                                                                                                                                                        
    ## [52] "M/J LANG ARTS 2"                                                                                                                                                                            
    ## [53] "M/J LANG ARTS 2 ADV"                                                                                                                                                                        
    ## [54] "M/J LANG ARTS 3"                                                                                                                                                                            
    ## [55] "M/J LANG ARTS 3 ADv"                                                                                                                                                                        
    ## [56] "M/J ENG 2 CAMB SEC 2"                                                                                                                                                                       
    ## [57] "M/J IB MYP LANG LIT 1"                                                                                                                                                                      
    ## [58] "M/J ENG 1 CAMB SEC 1"                                                                                                                                                                       
    ## [59] "M/J IB MYP LANG & LIT 3"                                                                                                                                                                    
    ## [60] "M/J IB MYP LANG & LIT 2"                                                                                                                                                                    
    ## [61] "M/J ENG 3 CAMB SEC 3"                                                                                                                                                                       
    ## [62] "M/J INTENS LANG ARTS"                                                                                                                                                                       
    ## [63] "free_lang1"                                                                                                                                                                                 
    ## [64] "free_lang2"                                                                                                                                                                                 
    ## [65] "M/J LANG ARTS TRAN"                                                                                                                                                                         
    ## [66] "M/J DE LANG ARTS ESOL"                                                                                                                                                                      
    ## [67] "blankspace"                                                                                                                                                                                 
    ## [68] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong><span style=\"font-size:13px;\">M/J LANG ARTS 2 ESOL</span></strong>"                 
    ## [69] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J LANG ARTS 3 ESOL</strong></span>"                 
    ## [70] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J DEVELOPMENTAL  LANG ARTS ESOL</strong></span>"    
    ## [71] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong><span style=\"font-size:13px;\">M/J LANG ARTS 1</span></strong>"                      
    ## [72] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong><span style=\"font-size:13px;\">M/J LANG ARTS 1, ADV</span></strong>"                 
    ## [73] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong><span style=\"font-size:13px;\">M/J LANG ARTS 2</span></strong>"                      
    ## [74] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J LANG ARTS 2, ADV</strong></span>"                 
    ## [75] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J LANG ARTS 3</strong></span>"                      
    ## [76] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J LANG ARTS 3, ADV</strong></span>"                 
    ## [77] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J ENG 2 CAMB SEC 2</strong></span>"                 
    ## [78] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J IB  MYP LANG & LIT 1</strong></span>"             
    ## [79] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J ENG 1 CAMB SEC 1</strong></span>"                 
    ## [80] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong>M/J IB MYP LANG & LIT 3</strong>"                                                     
    ## [81] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong>M/J IB MYP LANG & LIT 2</strong>"                                                     
    ## [82] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong>M/J ENG 3 CAMB SEC 3 </strong>"                                                       
    ## [83] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<span style=\"font-size:13px;\"><strong>M/J INTENS LANG ARTS</strong></span>"                 
    ## [84] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong><span style=\"font-size:13px;\">Enter 1 course, if required</span></strong>"          
    ## [85] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong><span style=\"font-size:13px;\">Enter 1 course, if required</span></strong>-TEXT"     
    ## [86] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong><span style=\"font-size:13px;\">M/J LANG ARTS TRAN</span></strong>"                   
    ## [87] "The following is a list of Middle School Language  Language Arts  Courses.  : Semester Grades-<strong>M/J DE LANG ARTS ESOL</strong>"                                                       
    ## [88] "X88"

``` r
q2_data$girl_code <- as.character(q2_data$girl_code)

### Make all girCode to upper case for matching
q2_data$girl_code <- toupper(q2_data$girl_code)



q2_data <- q2_data %>%
    filter(Finished ==1)


q2_data <- q2_data %>%
    filter(council !="Girl Scouts of Citrus Council")

head(q2_data)
```

    ## # A tibble: 6 × 88
    ##          ResponseID          ResponseSet           StartDate
    ##               <chr>                <chr>              <dttm>
    ## 1 R_bgu8o1n5PswK9NP Default Response Set 2017-02-09 16:34:39
    ## 2 R_a2z6pfOdCD8EpA9 Default Response Set 2017-02-09 16:37:25
    ## 3 R_8rmJ0Zm1QvJddOJ Default Response Set 2017-02-09 16:40:10
    ## 4 R_bNT8hl5fpQOXJOJ Default Response Set 2017-02-09 16:42:15
    ## 5 R_abcOTBB17fuQPS5 Default Response Set 2017-02-09 16:44:10
    ## 6 R_3WeHVIk0sGy8Q4t Default Response Set 2017-02-09 16:47:02
    ## # ... with 85 more variables: EndDate <dttm>, Finished <int>,
    ## #   `Reading-sum` <int>, reading_avg <int>,
    ## #   `Reading-weightedStdDev` <int>, `Language Arts-sum` <int>,
    ## #   lang_avg <int>, `Language Arts-weightedStdDev` <int>, `You are
    ## #   entering academic data for Quarter 2` <int>, council <chr>,
    ## #   girl_code <chr>, school <chr>, enrolled <chr>, `You are entering data
    ## #   for Student: ${q://QID1/ChoiceTextEntryValue} who attends: ...` <int>,
    ## #   unexcused <int>, excused <chr>, in_school <int>, out_school <int>,
    ## #   expelled <chr>, Nothing <int>, `You are entering data
    ## #   for ${q://QID1/ChoiceTextEntryValue} who attends, ...` <int>, `M/J
    ## #   INTENS READ` <chr>, `M/J READ 1` <chr>, `M/J READ 1, ADV` <chr>, `M/J
    ## #   READ 2` <chr>, `M/J READ 2, ADV` <chr>, `M/J READ 3` <chr>, `M/J
    ## #   READ3, ADV` <chr>, free_reading1 <chr>, free_reading2 <chr>, `M/J DE
    ## #   LA ESOL-READ` <chr>, `The following is a  list of standard Middle
    ## #   School Reading Courses for Grades 6-8 : Semester Grade-<span
    ## #   style="font-size:13px;"><strong>M/J INTENS READ
    ## #   (MC)</strong></span>` <chr>, `The following is a  list of standard
    ## #   Middle School Reading Courses for Grades 6-8 : Semester Grade-<span
    ## #   style="font-size:13px;"><strong>M/J READ 1</strong></span>` <chr>,
    ## #   `The following is a  list of standard Middle School Reading Courses
    ## #   for Grades 6-8 : Semester Grade-<span
    ## #   style="font-size:13px;"><strong>M/J READ 1,
    ## #   ADV</strong></span>` <chr>, `The following is a  list of standard
    ## #   Middle School Reading Courses for Grades 6-8 : Semester Grade-<span
    ## #   style="font-size:13px;"><strong>M/J READ 2</strong></span>` <chr>,
    ## #   `The following is a  list of standard Middle School Reading Courses
    ## #   for Grades 6-8 : Semester Grade-<span
    ## #   style="font-size:13px;"><strong>M/J READ 2,
    ## #   ADV</strong></span>` <chr>, `The following is a  list of standard
    ## #   Middle School Reading Courses for Grades 6-8 : Semester
    ## #   Grade-<strong><span style="font-size:13px;">M/J READ
    ## #   3</span></strong>` <chr>, `The following is a  list of standard Middle
    ## #   School Reading Courses for Grades 6-8 : Semester Grade-<span
    ## #   style="font-size:13px;"><strong>M/J READ3, ADV</strong></span>` <chr>,
    ## #   `The following is a  list of standard Middle School Reading Courses
    ## #   for Grades 6-8 : Semester Grade-<span
    ## #   style="font-size:13px;"><strong>Enter 1 course, if
    ## #   required</strong></span>` <chr>, `The following is a  list of standard
    ## #   Middle School Reading Courses for Grades 6-8 : Semester Grade-<span
    ## #   style="font-size:13px;"><strong>Enter 1 course, if
    ## #   required</strong></span>-TEXT` <chr>, `The following is a  list of
    ## #   standard Middle School Reading Courses for Grades 6-8 : Semester
    ## #   Grade-<strong>M/J DE LA ESOL-READ</strong>` <chr>, `You are entering
    ## #   data for ${q://QID1/ChoiceTextEntryValue} who attends, ..._1` <int>,
    ## #   `M/J LANG ARTS 1 ESOL` <chr>, `M/J LANG ARTS 2 ESOL` <chr>, `M/J LANG
    ## #   ARTS 3 ESOL` <chr>, `M/J DEVELOPMENTAL LANG ARTS ESOL` <chr>, `M/J
    ## #   LANG ARTS 1` <chr>, `M/J LANG ARTS 1 ADV` <chr>, `M/J LANG ARTS
    ## #   2` <chr>, `M/J LANG ARTS 2 ADV` <chr>, `M/J LANG ARTS 3` <chr>, `M/J
    ## #   LANG ARTS 3 ADv` <chr>, `M/J ENG 2 CAMB SEC 2` <chr>, `M/J IB MYP LANG
    ## #   LIT 1` <chr>, `M/J ENG 1 CAMB SEC 1` <chr>, `M/J IB MYP LANG & LIT
    ## #   3` <chr>, `M/J IB MYP LANG & LIT 2` <chr>, `M/J ENG 3 CAMB SEC
    ## #   3` <chr>, `M/J INTENS LANG ARTS` <chr>, free_lang1 <chr>,
    ## #   free_lang2 <chr>, `M/J LANG ARTS TRAN` <chr>, `M/J DE LANG ARTS
    ## #   ESOL` <chr>, blankspace <chr>, `The following is a list of Middle
    ## #   School Language  Language Arts  Courses.  : Semester
    ## #   Grades-<strong><span style="font-size:13px;">M/J LANG ARTS 2
    ## #   ESOL</span></strong>` <chr>, `The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<span
    ## #   style="font-size:13px;"><strong>M/J LANG ARTS 3
    ## #   ESOL</strong></span>` <chr>, `The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<span
    ## #   style="font-size:13px;"><strong>M/J DEVELOPMENTAL LANG ARTS
    ## #   ESOL</strong></span>` <chr>, `The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<strong><span
    ## #   style="font-size:13px;">M/J LANG ARTS 1</span></strong>` <chr>, `The
    ## #   following is a list of Middle School Language  Language Arts
    ## #    Courses.  : Semester Grades-<strong><span style="font-size:13px;">M/J
    ## #   LANG ARTS 1, ADV</span></strong>` <chr>, `The following is a list of
    ## #   Middle School Language  Language Arts  Courses.  : Semester
    ## #   Grades-<strong><span style="font-size:13px;">M/J LANG ARTS
    ## #   2</span></strong>` <chr>, `The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<span
    ## #   style="font-size:13px;"><strong>M/J LANG ARTS 2,
    ## #   ADV</strong></span>` <chr>, `The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<span
    ## #   style="font-size:13px;"><strong>M/J LANG ARTS
    ## #   3</strong></span>` <chr>, `The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<span
    ## #   style="font-size:13px;"><strong>M/J LANG ARTS 3,
    ## #   ADV</strong></span>` <chr>, `The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<span
    ## #   style="font-size:13px;"><strong>M/J ENG 2 CAMB SEC
    ## #   2</strong></span>` <chr>, `The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<span
    ## #   style="font-size:13px;"><strong>M/J IB MYP LANG & LIT
    ## #   1</strong></span>` <chr>, `The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<span
    ## #   style="font-size:13px;"><strong>M/J ENG 1 CAMB SEC
    ## #   1</strong></span>` <chr>, `The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<strong>M/J IB
    ## #   MYP LANG & LIT 3</strong>` <chr>, `The following is a list of Middle
    ## #   School Language  Language Arts  Courses.  : Semester
    ## #   Grades-<strong>M/J IB MYP LANG & LIT 2</strong>` <chr>, `The following
    ## #   is a list of Middle School Language  Language Arts  Courses.  :
    ## #   Semester Grades-<strong>M/J ENG 3 CAMB SEC 3 </strong>` <chr>, `The
    ## #   following is a list of Middle School Language  Language Arts
    ## #    Courses.  : Semester Grades-<span style="font-size:13px;"><strong>M/J
    ## #   INTENS LANG ARTS</strong></span>` <chr>, `The following is a list of
    ## #   Middle School Language  Language Arts  Courses.  : Semester
    ## #   Grades-<strong><span style="font-size:13px;">Enter 1 course, if
    ## #   required</span></strong>` <chr>, `The following is a list of Middle
    ## #   School Language  Language Arts  Courses.  : Semester
    ## #   Grades-<strong><span style="font-size:13px;">Enter 1 course, if
    ## #   required</span></strong>-TEXT` <chr>, `The following is a list of
    ## #   Middle School Language  Language Arts  Courses.  : Semester
    ## #   Grades-<strong><span style="font-size:13px;">M/J LANG ARTS
    ## #   TRAN</span></strong>` <chr>, `The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<strong>M/J DE
    ## #   LANG ARTS ESOL</strong>` <chr>, X88 <chr>

``` r
#pander(table(q2_data$girl_code)) #test for duplicate girl codes
```

``` r
q2_data$council <-sub("Girl Scouts of the Gateway Council", "Gateway Council", fixed=TRUE, q2_data$council)

q2_data$council <-sub("Girl Scouts of Citrus Council", "Citrus Council", fixed=TRUE, q2_data$council)

q2_data$council <-sub("Girl Scouts of Southeast Florida", "Southeast Council", fixed=TRUE, q2_data$council)

q2_data$council <-sub("Girl Scout Council of Tropical Florida", "Tropical Council", fixed = TRUE, q2_data$council)

q2_data$council <-sub("Girl Scouts of West Central Florida", "West Central Council", fixed = TRUE, q2_data$council)

q2_data$council <-sub("Girl Scout Council of the Panhandle", "Panhandle Council", fixed = TRUE, q2_data$council)
```

``` r
q2_data <- q2_data[!(duplicated(q2_data$girl_code) | duplicated(q2_data$girl_code, fromLast = TRUE)), ]  #find and extract unique cases

dim(q2_data)
```

    ## [1] 277  88

``` r
#pander(table(q2_data$girl_code)) #test for duplicate girl codes

#preUnique<- pre [!(duplicated(pre$girlCode) | duplicated(pre$girlCode, fromLast = TRUE)), ]

#dim(preUnique)
```

``` r
q2Dupes <- duplicated(q2_data$girl_code) | duplicated(q2_data$girl_code, fromLast=TRUE)


#preDupes <-duplicated(pre$girlCode) | duplicated(pre$girlCode, fromLast=TRUE)

#preDupes <-pre[preDupes, ]

#dim(preDupes)



### Subset the duplicates
q2Dupes <-q2_data[q2Dupes, ]


q2Dupes
```

    ## # A tibble: 0 × 88
    ## # ... with 88 variables: ResponseID <chr>, ResponseSet <chr>,
    ## #   StartDate <dttm>, EndDate <dttm>, Finished <int>, Reading-sum <int>,
    ## #   reading_avg <int>, Reading-weightedStdDev <int>, Language
    ## #   Arts-sum <int>, lang_avg <int>, Language Arts-weightedStdDev <int>,
    ## #   You are entering academic data for Quarter 2 <int>, council <chr>,
    ## #   girl_code <chr>, school <chr>, enrolled <chr>, You are entering data
    ## #   for Student: ${q://QID1/ChoiceTextEntryValue} who attends: ... <int>,
    ## #   unexcused <int>, excused <chr>, in_school <int>, out_school <int>,
    ## #   expelled <chr>, Nothing <int>, You are entering data
    ## #   for ${q://QID1/ChoiceTextEntryValue} who attends, ... <int>, M/J
    ## #   INTENS READ <chr>, M/J READ 1 <chr>, M/J READ 1, ADV <chr>, M/J READ
    ## #   2 <chr>, M/J READ 2, ADV <chr>, M/J READ 3 <chr>, M/J READ3,
    ## #   ADV <chr>, free_reading1 <chr>, free_reading2 <chr>, M/J DE LA
    ## #   ESOL-READ <chr>, The following is a  list of standard Middle School
    ## #   Reading Courses for Grades 6-8 : Semester Grade-<span
    ## #   style="font-size:13px;"><strong>M/J INTENS READ
    ## #   (MC)</strong></span> <chr>, The following is a  list of standard
    ## #   Middle School Reading Courses for Grades 6-8 : Semester Grade-<span
    ## #   style="font-size:13px;"><strong>M/J READ 1</strong></span> <chr>, The
    ## #   following is a  list of standard Middle School Reading Courses for
    ## #   Grades 6-8 : Semester Grade-<span style="font-size:13px;"><strong>M/J
    ## #   READ 1, ADV</strong></span> <chr>, The following is a  list of
    ## #   standard Middle School Reading Courses for Grades 6-8 : Semester
    ## #   Grade-<span style="font-size:13px;"><strong>M/J READ
    ## #   2</strong></span> <chr>, The following is a  list of standard Middle
    ## #   School Reading Courses for Grades 6-8 : Semester Grade-<span
    ## #   style="font-size:13px;"><strong>M/J READ 2, ADV</strong></span> <chr>,
    ## #   The following is a  list of standard Middle School Reading Courses for
    ## #   Grades 6-8 : Semester Grade-<strong><span style="font-size:13px;">M/J
    ## #   READ 3</span></strong> <chr>, The following is a  list of standard
    ## #   Middle School Reading Courses for Grades 6-8 : Semester Grade-<span
    ## #   style="font-size:13px;"><strong>M/J READ3, ADV</strong></span> <chr>,
    ## #   The following is a  list of standard Middle School Reading Courses for
    ## #   Grades 6-8 : Semester Grade-<span
    ## #   style="font-size:13px;"><strong>Enter 1 course, if
    ## #   required</strong></span> <chr>, The following is a  list of standard
    ## #   Middle School Reading Courses for Grades 6-8 : Semester Grade-<span
    ## #   style="font-size:13px;"><strong>Enter 1 course, if
    ## #   required</strong></span>-TEXT <chr>, The following is a  list of
    ## #   standard Middle School Reading Courses for Grades 6-8 : Semester
    ## #   Grade-<strong>M/J DE LA ESOL-READ</strong> <chr>, You are entering
    ## #   data for ${q://QID1/ChoiceTextEntryValue} who attends, ..._1 <int>,
    ## #   M/J LANG ARTS 1 ESOL <chr>, M/J LANG ARTS 2 ESOL <chr>, M/J LANG ARTS
    ## #   3 ESOL <chr>, M/J DEVELOPMENTAL LANG ARTS ESOL <chr>, M/J LANG ARTS
    ## #   1 <chr>, M/J LANG ARTS 1 ADV <chr>, M/J LANG ARTS 2 <chr>, M/J LANG
    ## #   ARTS 2 ADV <chr>, M/J LANG ARTS 3 <chr>, M/J LANG ARTS 3 ADv <chr>,
    ## #   M/J ENG 2 CAMB SEC 2 <chr>, M/J IB MYP LANG LIT 1 <chr>, M/J ENG 1
    ## #   CAMB SEC 1 <chr>, M/J IB MYP LANG & LIT 3 <chr>, M/J IB MYP LANG & LIT
    ## #   2 <chr>, M/J ENG 3 CAMB SEC 3 <chr>, M/J INTENS LANG ARTS <chr>,
    ## #   free_lang1 <chr>, free_lang2 <chr>, M/J LANG ARTS TRAN <chr>, M/J DE
    ## #   LANG ARTS ESOL <chr>, blankspace <chr>, The following is a list of
    ## #   Middle School Language  Language Arts  Courses.  : Semester
    ## #   Grades-<strong><span style="font-size:13px;">M/J LANG ARTS 2
    ## #   ESOL</span></strong> <chr>, The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<span
    ## #   style="font-size:13px;"><strong>M/J LANG ARTS 3
    ## #   ESOL</strong></span> <chr>, The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<span
    ## #   style="font-size:13px;"><strong>M/J DEVELOPMENTAL LANG ARTS
    ## #   ESOL</strong></span> <chr>, The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<strong><span
    ## #   style="font-size:13px;">M/J LANG ARTS 1</span></strong> <chr>, The
    ## #   following is a list of Middle School Language  Language Arts
    ## #    Courses.  : Semester Grades-<strong><span style="font-size:13px;">M/J
    ## #   LANG ARTS 1, ADV</span></strong> <chr>, The following is a list of
    ## #   Middle School Language  Language Arts  Courses.  : Semester
    ## #   Grades-<strong><span style="font-size:13px;">M/J LANG ARTS
    ## #   2</span></strong> <chr>, The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<span
    ## #   style="font-size:13px;"><strong>M/J LANG ARTS 2,
    ## #   ADV</strong></span> <chr>, The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<span
    ## #   style="font-size:13px;"><strong>M/J LANG ARTS 3</strong></span> <chr>,
    ## #   The following is a list of Middle School Language  Language Arts
    ## #    Courses.  : Semester Grades-<span style="font-size:13px;"><strong>M/J
    ## #   LANG ARTS 3, ADV</strong></span> <chr>, The following is a list of
    ## #   Middle School Language  Language Arts  Courses.  : Semester
    ## #   Grades-<span style="font-size:13px;"><strong>M/J ENG 2 CAMB SEC
    ## #   2</strong></span> <chr>, The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<span
    ## #   style="font-size:13px;"><strong>M/J IB MYP LANG & LIT
    ## #   1</strong></span> <chr>, The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<span
    ## #   style="font-size:13px;"><strong>M/J ENG 1 CAMB SEC
    ## #   1</strong></span> <chr>, The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<strong>M/J IB
    ## #   MYP LANG & LIT 3</strong> <chr>, The following is a list of Middle
    ## #   School Language  Language Arts  Courses.  : Semester
    ## #   Grades-<strong>M/J IB MYP LANG & LIT 2</strong> <chr>, The following
    ## #   is a list of Middle School Language  Language Arts  Courses.  :
    ## #   Semester Grades-<strong>M/J ENG 3 CAMB SEC 3 </strong> <chr>, The
    ## #   following is a list of Middle School Language  Language Arts
    ## #    Courses.  : Semester Grades-<span style="font-size:13px;"><strong>M/J
    ## #   INTENS LANG ARTS</strong></span> <chr>, The following is a list of
    ## #   Middle School Language  Language Arts  Courses.  : Semester
    ## #   Grades-<strong><span style="font-size:13px;">Enter 1 course, if
    ## #   required</span></strong> <chr>, The following is a list of Middle
    ## #   School Language  Language Arts  Courses.  : Semester
    ## #   Grades-<strong><span style="font-size:13px;">Enter 1 course, if
    ## #   required</span></strong>-TEXT <chr>, The following is a list of Middle
    ## #   School Language  Language Arts  Courses.  : Semester
    ## #   Grades-<strong><span style="font-size:13px;">M/J LANG ARTS
    ## #   TRAN</span></strong> <chr>, The following is a list of Middle School
    ## #   Language  Language Arts  Courses.  : Semester Grades-<strong>M/J DE
    ## #   LANG ARTS ESOL</strong> <chr>, X88 <chr>

Attendance:
===========

``` r
q2_attendance <- q2_data %>%
    select(13:16,18:19)  #take columns of interest



q2_attendance$unexcused[which(is.na(q2_attendance$unexcused))] <- 0
q2_attendance$excused[which(is.na(q2_attendance$excused))] <-0

q2_attendance$excused <- as.numeric(q2_attendance$excused)

str(q2_attendance)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    277 obs. of  6 variables:
    ##  $ council  : chr  "Panhandle Council" "Panhandle Council" "Panhandle Council" "Panhandle Council" ...
    ##  $ girl_code: chr  "322MR071804" "322CM080803" "322EL080503" "322LN080204" ...
    ##  $ school   : chr  "Jinks" "Jinks" "Jinks" "Jinks" ...
    ##  $ enrolled : chr  "02/08/2017" "02/08/2017" "02/08/2017" "02/08/2017" ...
    ##  $ unexcused: num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ excused  : num  0 0 0 0 0 0 0 0 0 0 ...

``` r
q2_attendance <- q2_attendance %>%
        mutate("total" = unexcused + excused)


which(is.na(q2_attendance$total))
```

    ## integer(0)

``` r
mean(q2_attendance$total)
```

    ## [1] 1.765343

Behavior
========

``` r
q2_behavior <- q2_data %>%
    select(13:16, 20:21)  #take columns of interest
    
    
q2_behavior$in_school[which(is.na(q2_behavior$in_school))] <- 0  #find na and replace with 0
q2_behavior$out_school[which(is.na(q2_behavior$out_school))] <-0  #find na values and replace with 0

q2_behavior <- q2_behavior %>%   
    mutate("total"= in_school + out_school) #calculate total 
    
head(q2_behavior) #check work
```

    ## # A tibble: 6 × 7
    ##             council   girl_code school   enrolled in_school out_school
    ##               <chr>       <chr>  <chr>      <chr>     <dbl>      <dbl>
    ## 1 Panhandle Council 322MR071804  Jinks 02/08/2017         0          0
    ## 2 Panhandle Council 322CM080803  Jinks 02/08/2017         0          0
    ## 3 Panhandle Council 322EL080503  Jinks 02/08/2017         0          0
    ## 4 Panhandle Council 322LN080204  Jinks 02/08/2017         0          0
    ## 5 Panhandle Council 322TH052216  Jinks 02/08/2017         0          0
    ## 6 Panhandle Council 322CT072705  Jinks 02/08/2017         0          0
    ## # ... with 1 more variables: total <dbl>

``` r
which(is.na(q2_behavior$total))
```

    ## integer(0)

``` r
mean(q2_behavior$total)
```

    ## [1] 1.480144

Expelled
========

``` r
q2_expelled <- q2_data %>%
    select(13:16, 22) #take columns of interest

head(q2_expelled)
```

    ## # A tibble: 6 × 5
    ##             council   girl_code school   enrolled expelled
    ##               <chr>       <chr>  <chr>      <chr>    <chr>
    ## 1 Panhandle Council 322MR071804  Jinks 02/08/2017       No
    ## 2 Panhandle Council 322CM080803  Jinks 02/08/2017       No
    ## 3 Panhandle Council 322EL080503  Jinks 02/08/2017       No
    ## 4 Panhandle Council 322LN080204  Jinks 02/08/2017       No
    ## 5 Panhandle Council 322TH052216  Jinks 02/08/2017       No
    ## 6 Panhandle Council 322CT072705  Jinks 02/08/2017       No

Reading
=======

``` r
q2_reading <- q2_data %>%
    gather("reading_course", "Grade",25:31, 34) %>% #gather reading columns and put them in row
    select(7,13:16, 81:82) #select reading columns
    

names(q2_reading)
```

    ## [1] "reading_avg"    "council"        "girl_code"      "school"        
    ## [5] "enrolled"       "reading_course" "Grade"

``` r
dim(q2_reading)
```

    ## [1] 2216    7

``` r
q2_reading <-na.omit(q2_reading) #get rid of cases with no data




dim(q2_reading)
```

    ## [1] 134   7

``` r
q2_reading
```

    ## # A tibble: 134 × 7
    ##    reading_avg           council   girl_code school   enrolled
    ##          <int>             <chr>       <chr>  <chr>      <chr>
    ## 1            0 Panhandle Council 322MR071804  Jinks 02/08/2017
    ## 2            0 Panhandle Council 322EL080503  Jinks 02/08/2017
    ## 3            0 Panhandle Council 322TH052216  Jinks 02/08/2017
    ## 4            0 Panhandle Council 322CT072705  Jinks 02/08/2017
    ## 5            0 Panhandle Council 322AC113004  Jinks 02/08/2017
    ## 6            0   Gateway Council 322SW121306  Jinks 02/08/2017
    ## 7            0 Panhandle Council 322CR121504  Jinks 02/08/2017
    ## 8            0 Panhandle Council 322MC020204  Jinks 02/08/2017
    ## 9            0 Panhandle Council 322TR072404  Jinks 02/08/2017
    ## 10           0 Panhandle Council 322ZR012404  Jinks 02/08/2017
    ## # ... with 124 more rows, and 2 more variables: reading_course <chr>,
    ## #   Grade <chr>

``` r
q2_freereading <- q2_data %>%
    select(7,13:16, 32:33) #select free enter
    
q2_freereading <- q2_freereading[,c(1,2,3,4,5,7,6)] #re-arrange columns to make them align with q2 readind df

q2_freereading <- q2_freereading %>%
    rename("reading_course" = free_reading2) %>% #rename to match q2_reading
    rename("Grade" = free_reading1) #rename to match q2_reading
    

dim(q2_freereading)
```

    ## [1] 277   7

``` r
q2_freereading <- na.omit(q2_freereading) #clean up to find cases with data



dim(q2_freereading)
```

    ## [1] 7 7

``` r
q2_freereading
```

    ## # A tibble: 7 × 7
    ##   reading_avg              council   girl_code       school   enrolled
    ##         <int>                <chr>       <chr>        <chr>      <chr>
    ## 1           0 West Central Council 320MG041503 Young Middle 10/29/2016
    ## 2           0 West Central Council 320SA080203 Young Middle 10/21/2016
    ## 3           0 West Central Council 320SB050304 Young Middle 10/21/2016
    ## 4           0 West Central Council 320SB122902 Young Middle 10/21/2016
    ## 5           0 West Central Council 320SC072304 Young Middle 10/21/2016
    ## 6           0 West Central Council   320120104 Young Middle 10/21/2016
    ## 7           0 West Central Council 320SD102802 Young Middle 10/21/2016
    ## # ... with 2 more variables: reading_course <chr>, Grade <chr>

``` r
q2_freereading <- q2_freereading[grep("READ", q2_freereading$reading_course, ignore.case=TRUE, fixed=TRUE),]
```

    ## Warning in grep("READ", q2_freereading$reading_course, ignore.case =
    ## TRUE, : argument 'ignore.case = TRUE' will be ignored

``` r
q2_freereading
```

    ## # A tibble: 0 × 7
    ## # ... with 7 variables: reading_avg <int>, council <chr>, girl_code <chr>,
    ## #   school <chr>, enrolled <chr>, reading_course <chr>, Grade <chr>

``` r
q2_reading <- rbind(q2_reading, q2_freereading) #bind main q2_reading and free text

dim(q2_reading)
```

    ## [1] 134   7

``` r
q2_reading
```

    ## # A tibble: 134 × 7
    ##    reading_avg           council   girl_code school   enrolled
    ## *        <int>             <chr>       <chr>  <chr>      <chr>
    ## 1            0 Panhandle Council 322MR071804  Jinks 02/08/2017
    ## 2            0 Panhandle Council 322EL080503  Jinks 02/08/2017
    ## 3            0 Panhandle Council 322TH052216  Jinks 02/08/2017
    ## 4            0 Panhandle Council 322CT072705  Jinks 02/08/2017
    ## 5            0 Panhandle Council 322AC113004  Jinks 02/08/2017
    ## 6            0   Gateway Council 322SW121306  Jinks 02/08/2017
    ## 7            0 Panhandle Council 322CR121504  Jinks 02/08/2017
    ## 8            0 Panhandle Council 322MC020204  Jinks 02/08/2017
    ## 9            0 Panhandle Council 322TR072404  Jinks 02/08/2017
    ## 10           0 Panhandle Council 322ZR012404  Jinks 02/08/2017
    ## # ... with 124 more rows, and 2 more variables: reading_course <chr>,
    ## #   Grade <chr>

``` r
which(is.na(q2_reading$Grade))
```

    ## integer(0)

``` r
q2_reading <- q2_reading %>%
    filter(Grade != "Did not mean to select this course")


q2_reading
```

    ## # A tibble: 126 × 7
    ##    reading_avg           council   girl_code school   enrolled
    ##          <int>             <chr>       <chr>  <chr>      <chr>
    ## 1            0 Panhandle Council 322MR071804  Jinks 02/08/2017
    ## 2            0 Panhandle Council 322EL080503  Jinks 02/08/2017
    ## 3            0 Panhandle Council 322TH052216  Jinks 02/08/2017
    ## 4            0 Panhandle Council 322CT072705  Jinks 02/08/2017
    ## 5            0 Panhandle Council 322AC113004  Jinks 02/08/2017
    ## 6            0   Gateway Council 322SW121306  Jinks 02/08/2017
    ## 7            0 Panhandle Council 322CR121504  Jinks 02/08/2017
    ## 8            0 Panhandle Council 322MC020204  Jinks 02/08/2017
    ## 9            0 Panhandle Council 322TR072404  Jinks 02/08/2017
    ## 10           0 Panhandle Council 322ZR012404  Jinks 02/08/2017
    ## # ... with 116 more rows, and 2 more variables: reading_course <chr>,
    ## #   Grade <chr>

### Reading Points

``` r
reading_pts <- numeric(0)

for(i in q2_reading$Grade){

     reading_pts<- c(reading_pts,switch(i, "A" =4, "B"=3, "C"=2, "D"=1, "F"=0))

     reading_pts
     
}

q2_reading <-cbind(q2_reading, reading_pts)

q2_reading
```

    ##     reading_avg              council    girl_code          school
    ## 1             0    Panhandle Council  322MR071804           Jinks
    ## 2             0    Panhandle Council  322EL080503           Jinks
    ## 3             0    Panhandle Council  322TH052216           Jinks
    ## 4             0    Panhandle Council  322CT072705           Jinks
    ## 5             0    Panhandle Council  322AC113004           Jinks
    ## 6             0      Gateway Council  322SW121306           Jinks
    ## 7             0    Panhandle Council  322CR121504           Jinks
    ## 8             0    Panhandle Council  322MC020204           Jinks
    ## 9             0    Panhandle Council  322TR072404           Jinks
    ## 10            0    Panhandle Council  322ZR012404           Jinks
    ## 11            0 West Central Council 3202BD062105 KATHLEEN MIDDLE
    ## 12            0 West Central Council  320NC122104 KATHLEEN MIDDLE
    ## 13            0 West Central Council  320SD031905 KATHLEEN MIDDLE
    ## 14            0 West Central Council  320KE060905 KATHLEEN MIDDLE
    ## 15            0 West Central Council  320AG062003 KATHLEEN MIDDLE
    ## 16            0 West Central Council  320KJ042505 KATHLEEN MIDDLE
    ## 17            0 West Central Council  3202J080502 KATHLEEN MIDDLE
    ## 18            0 West Central Council  320YL070603 KATHLEEN MIDDLE
    ## 19            0 West Central Council  320MM051204 KATHLEEN MIDDLE
    ## 20            0 West Central Council  320KM090403 KATHLEEN MIDDLE
    ## 21            0 West Central Council  320TM070503 KATHLEEN MIDDLE
    ## 22            0 West Central Council  320AM041503 KATHLEEN MIDDLE
    ## 23            0 West Central Council  320JM111104 KATHLEEN MIDDLE
    ## 24            0 West Central Council  320SN033104 KATHLEEN MIDDLE
    ## 25            0 West Central Council  320DP061004 KATHLEEN MIDDLE
    ## 26            0 West Central Council  320DP090403 KATHLEEN MIDDLE
    ## 27            0 West Central Council  320MS121104 KATHLEEN MIDDLE
    ## 28            0 West Central Council  320AT081904 KATHLEEN MIDDLE
    ## 29            0 West Central Council  320KT102004 KATHLEEN MIDDLE
    ## 30            0 West Central Council  320DT060204 KATHLEEN MIDDLE
    ## 31            0 West Central Council  320SV121102 KATHLEEN MIDDLE
    ## 32            0 West Central Council  320SW043004 KATHLEEN MIDDLE
    ## 33            0 West Central Council  320SW041705 KATHLEEN MIDDLE
    ## 34            0    Panhandle Council  322LS071802           Jinks
    ## 35            0    Panhandle Council  322IM020401           Jinks
    ## 36            0    Panhandle Council  322NB061103           Jinks
    ## 37            0    Panhandle Council  322SG333305           Jinks
    ## 38            0    Panhandle Council  322CM041604           Jinks
    ## 39            0    Panhandle Council  322KM030103           Jinks
    ## 40            0    Panhandle Council  322BN030103           Jinks
    ## 41            0    Panhandle Council  322ZR120704           Jinks
    ## 42            0    Panhandle Council  322TS032304           Jinks
    ## 43            0    Panhandle Council  322KS101602         Everitt
    ## 44            0    Panhandle Council  322KT041403         Everitt
    ## 45            0    Panhandle Council  322JW041704         Everitt
    ## 46            0    Panhandle Council  322JC083104         Everitt
    ## 47            0    Panhandle Council  322LD120204         Everitt
    ## 48            0    Panhandle Council  322DB062904         Everitt
    ## 49            0    Panhandle Council  322JB102904         Everitt
    ## 50            0    Panhandle Council  322CB083004         Everitt
    ## 51            0    Panhandle Council  322ZM091203         Everitt
    ## 52            0    Panhandle Council  322DM050605         Everitt
    ## 53            0    Panhandle Council  322TM050405         Everitt
    ## 54            0    Panhandle Council  322RN072805         Everitt
    ## 55            0    Panhandle Council  322JP020504         Everitt
    ## 56            0    Panhandle Council  322BR081304         Everitt
    ## 57            0    Southeast Council  321VA082703              LL
    ## 58            0    Southeast Council  321TD053102              LL
    ## 59            0    Southeast Council    321012405              LL
    ## 60            0    Southeast Council  321SD072204              LL
    ## 61            0    Southeast Council  321JD101502              LL
    ## 62            0    Southeast Council  321RG070304              LL
    ## 63            0    Southeast Council  321TG070305              LL
    ## 64            0    Southeast Council  321KJ012703              LL
    ## 65            0    Southeast Council  321FJ011803              LL
    ## 66            0    Southeast Council  321ZJ092702              LL
    ## 67            0    Southeast Council  321CW071704              LL
    ## 68            0    Southeast Council  321SW012403              LL
    ## 69            0    Southeast Council  321JV021803              LL
    ## 70            0    Southeast Council  321FV022205              LL
    ## 71            0    Southeast Council  321BT100203              LL
    ## 72            0    Southeast Council  321JP061803              LL
    ## 73            0    Southeast Council  321JL041605              LL
    ## 74            0    Southeast Council  321AP011905              LL
    ## 75            0    Southeast Council  321JR070305              LL
    ## 76            0    Southeast Council  321SO020203              LL
    ## 77            0    Southeast Council  321TN073104              LL
    ## 78            0    Southeast Council  321JP080305              LL
    ## 79            0    Southeast Council  321RR031305              LL
    ## 80            0    Southeast Council  321CR101403              LL
    ## 81            0    Southeast Council  321ES020904              LL
    ## 82            0    Southeast Council  321PS042604              LL
    ## 83            0    Southeast Council  321SS042805              LL
    ## 84            0    Southeast Council  321SS081303              LL
    ## 85            0    Southeast Council  321ST100104              LL
    ## 86            0    Southeast Council  321LU072702              LL
    ## 87            0    Southeast Council  321YW081805              LL
    ## 88            0    Southeast Council  321KW062503              LL
    ## 89            0    Southeast Council  321FW062504              LL
    ## 90            0    Southeast Council  321JW083003              LL
    ## 91            0    Southeast Council  321AZ041805              LL
    ## 92            0      Gateway Council  313TB011705      THE BRIDGE
    ## 93            0      Gateway Council  313SH050805      THE BRIDGE
    ## 94            0      Gateway Council  313SH060304      THE BRIDGE
    ## 95            0      Gateway Council  313DJ091703      THE BRIDGE
    ## 96            0      Gateway Council  313KK122904      THE BRIDGE
    ## 97            0      Gateway Council  313AT020105      THE BRIDGE
    ## 98            0      Gateway Council  313CB010204       LAKESHORE
    ## 99            0      Gateway Council  313RB122804       LAKESHORE
    ## 100           0      Gateway Council  313AC070604       LAKESHORE
    ## 101           0      Gateway Council  313AD110204       LAKESHORE
    ## 102           0      Gateway Council  313JF121503       LAKESHORE
    ## 103           0      Gateway Council  313BH010904       LAKESHORE
    ## 104           0      Gateway Council  313AT102804       LAKESHORE
    ## 105           0      Gateway Council  313NA113005 MATTHEW GILBERT
    ## 106           0      Gateway Council  313MG081605          BUTLER
    ## 107           0      Gateway Council  313LM071304          BUTLER
    ## 108           0 West Central Council  320SA090704 KATHLEEN MIDDLE
    ## 109           0 West Central Council  320BM032505 KATHLEEN MIDDLE
    ## 110           0 West Central Council  3202N012805 KATHLEEN MIDDLE
    ## 111           0 West Central Council  320VR031805 KATHLEEN MIDDLE
    ## 112           0    Panhandle Council  322AG102504         Everitt
    ## 113           0      Gateway Council  313SB120603      THE BRIDGE
    ## 114           0      Gateway Council  313MA090303      THE BRIDGE
    ## 115           0      Gateway Council  313CH121603      THE BRIDGE
    ## 116           0      Gateway Council  313EO080204      THE BRIDGE
    ## 117           0      Gateway Council  313DP021104      THE BRIDGE
    ## 118           0      Gateway Council  313YR043004      THE BRIDGE
    ## 119           0      Gateway Council  313KT081504      THE BRIDGE
    ## 120           0      Gateway Council  313YK062304 MATTHEW GILBERT
    ## 121           0      Gateway Council  313RR042804 MATTHEW GILBERT
    ## 122           0      Gateway Council  313MT072302 MATTHEW GILBERT
    ## 123           0      Gateway Council  313LB031704 MATTHEW GILBERT
    ## 124           0 West Central Council  320MC121603 KATHLEEN MIDDLE
    ## 125           0      Gateway Council  313JB110302      THE BRIDGE
    ## 126           0      Gateway Council  313AK041202      THE BRIDGE
    ##       enrolled  reading_course Grade reading_pts
    ## 1   02/08/2017 M/J INTENS READ     B           3
    ## 2   02/08/2017 M/J INTENS READ     B           3
    ## 3   02/08/2017 M/J INTENS READ     B           3
    ## 4   02/08/2017 M/J INTENS READ     B           3
    ## 5   02/08/2017 M/J INTENS READ     A           4
    ## 6   02/08/2017 M/J INTENS READ     B           3
    ## 7   02/08/2017 M/J INTENS READ     C           2
    ## 8   02/08/2017 M/J INTENS READ     D           1
    ## 9   02/08/2017 M/J INTENS READ     B           3
    ## 10  02/08/2017 M/J INTENS READ     B           3
    ## 11  11/01/2016 M/J INTENS READ     B           3
    ## 12  11/01/2016 M/J INTENS READ     C           2
    ## 13  11/01/2017 M/J INTENS READ     B           3
    ## 14  11/01/2016 M/J INTENS READ     C           2
    ## 15  11/01/2016 M/J INTENS READ     A           4
    ## 16  11/01/2016 M/J INTENS READ     C           2
    ## 17  11/01/2016 M/J INTENS READ     A           4
    ## 18  11/01/2016 M/J INTENS READ     C           2
    ## 19  11/01/2016 M/J INTENS READ     C           2
    ## 20  11/01/2016 M/J INTENS READ     C           2
    ## 21  11/01/2016 M/J INTENS READ     B           3
    ## 22  11/01/2016 M/J INTENS READ     A           4
    ## 23  11/01/2016 M/J INTENS READ     C           2
    ## 24  11/01/2016 M/J INTENS READ     A           4
    ## 25  11/01/2016 M/J INTENS READ     A           4
    ## 26  11/01/2016 M/J INTENS READ     B           3
    ## 27  11/01/2016 M/J INTENS READ     C           2
    ## 28  11/01/2016 M/J INTENS READ     B           3
    ## 29  11/01/2016 M/J INTENS READ     C           2
    ## 30  11/01/2016 M/J INTENS READ     B           3
    ## 31  11/01/2016 M/J INTENS READ     B           3
    ## 32  11/01/2016 M/J INTENS READ     C           2
    ## 33  11/01/2016 M/J INTENS READ     A           4
    ## 34  02/08/2017 M/J INTENS READ     C           2
    ## 35  02/08/2017 M/J INTENS READ     C           2
    ## 36  02/08/2017 M/J INTENS READ     C           2
    ## 37  02/08/2017 M/J INTENS READ     A           4
    ## 38  02/08/2017 M/J INTENS READ     B           3
    ## 39  02/08/2017 M/J INTENS READ     D           1
    ## 40  02/08/2017 M/J INTENS READ     C           2
    ## 41  02/08/2017 M/J INTENS READ     C           2
    ## 42  02/08/2017 M/J INTENS READ     B           3
    ## 43  02/08/2017 M/J INTENS READ     D           1
    ## 44  02/08/2017 M/J INTENS READ     B           3
    ## 45  02/08/2017 M/J INTENS READ     C           2
    ## 46  02/08/2017 M/J INTENS READ     C           2
    ## 47  02/08/2017 M/J INTENS READ     D           1
    ## 48  02/08/2017 M/J INTENS READ     C           2
    ## 49  02/08/2017 M/J INTENS READ     A           4
    ## 50  02/08/2017 M/J INTENS READ     A           4
    ## 51  02/08/2017 M/J INTENS READ     C           2
    ## 52  02/08/2017 M/J INTENS READ     B           3
    ## 53  02/08/2017 M/J INTENS READ     B           3
    ## 54  02/08/2017 M/J INTENS READ     C           2
    ## 55  02/08/2017 M/J INTENS READ     B           3
    ## 56  02/08/2017 M/J INTENS READ     C           2
    ## 57  10/20/2016 M/J INTENS READ     B           3
    ## 58  10/20/2016 M/J INTENS READ     C           2
    ## 59  10/20/2016 M/J INTENS READ     B           3
    ## 60  10/20/2016 M/J INTENS READ     B           3
    ## 61  10/20/2016 M/J INTENS READ     B           3
    ## 62  10/20/2016 M/J INTENS READ     B           3
    ## 63  10/20/2016 M/J INTENS READ     A           4
    ## 64  10/20/2016 M/J INTENS READ     A           4
    ## 65  10/20/2016 M/J INTENS READ     A           4
    ## 66  10/20/2016 M/J INTENS READ     A           4
    ## 67  10/20/2016 M/J INTENS READ     B           3
    ## 68  10/20/2016 M/J INTENS READ     C           2
    ## 69  10/20/2016 M/J INTENS READ     B           3
    ## 70  10/20/2016 M/J INTENS READ     B           3
    ## 71  10/20/2016 M/J INTENS READ     D           1
    ## 72  10/20/2016 M/J INTENS READ     B           3
    ## 73  10/20/2016 M/J INTENS READ     C           2
    ## 74  10/20/2016 M/J INTENS READ     C           2
    ## 75  10/20/2016 M/J INTENS READ     C           2
    ## 76  10/20/2016 M/J INTENS READ     C           2
    ## 77  10/20/2016 M/J INTENS READ     B           3
    ## 78  10/20/2016 M/J INTENS READ     C           2
    ## 79  10/20/2016 M/J INTENS READ     D           1
    ## 80  10/20/2016 M/J INTENS READ     B           3
    ## 81  10/20/2016 M/J INTENS READ     C           2
    ## 82  10/20/2016 M/J INTENS READ     A           4
    ## 83  10/20/2016 M/J INTENS READ     A           4
    ## 84  10/20/2016 M/J INTENS READ     D           1
    ## 85  10/20/2016 M/J INTENS READ     B           3
    ## 86  10/20/2016 M/J INTENS READ     C           2
    ## 87  10/20/2016 M/J INTENS READ     C           2
    ## 88  10/20/2016 M/J INTENS READ     B           3
    ## 89  10/20/2016 M/J INTENS READ     C           2
    ## 90  10/20/2016 M/J INTENS READ     A           4
    ## 91  10/20/2016 M/J INTENS READ     A           4
    ## 92  09/06/2016      M/J READ 1     C           2
    ## 93  09/06/2016      M/J READ 1     C           2
    ## 94  09/06/2016      M/J READ 1     C           2
    ## 95  09/06/2016      M/J READ 1     B           3
    ## 96  09/06/2016      M/J READ 1     C           2
    ## 97  09/06/2016      M/J READ 1     C           2
    ## 98  09/06/2016      M/J READ 1     C           2
    ## 99  09/06/2016      M/J READ 1     C           2
    ## 100 09/06/2016      M/J READ 1     C           2
    ## 101 09/06/2016      M/J READ 1     B           3
    ## 102 09/06/2016      M/J READ 1     C           2
    ## 103 09/06/2016      M/J READ 1     D           1
    ## 104 09/06/2016      M/J READ 1     C           2
    ## 105 09/06/2016      M/J READ 1     B           3
    ## 106 09/06/2016      M/J READ 1     C           2
    ## 107 09/06/2016      M/J READ 1     B           3
    ## 108 11/01/2016 M/J READ 1, ADV     A           4
    ## 109 11/01/2016 M/J READ 1, ADV     C           2
    ## 110 11/01/2016 M/J READ 1, ADV     B           3
    ## 111 11/01/2016 M/J READ 1, ADV     B           3
    ## 112 02/08/2017 M/J READ 1, ADV     B           3
    ## 113 09/06/2016      M/J READ 2     C           2
    ## 114 09/06/2016      M/J READ 2     D           1
    ## 115 09/06/2016      M/J READ 2     B           3
    ## 116 09/06/2016      M/J READ 2     D           1
    ## 117 09/06/2016      M/J READ 2     C           2
    ## 118 09/06/2016      M/J READ 2     D           1
    ## 119 09/06/2016      M/J READ 2     B           3
    ## 120 09/06/2016      M/J READ 2     C           2
    ## 121 09/06/2016      M/J READ 2     C           2
    ## 122 09/06/2016      M/J READ 2     C           2
    ## 123 09/06/2016      M/J READ 2     C           2
    ## 124 11/01/2016 M/J READ 2, ADV     A           4
    ## 125 09/06/2016      M/J READ 3     C           2
    ## 126 09/06/2016      M/J READ 3     B           3

Language Arts
=============

``` r
q2_langarts <- q2_data %>% 
    gather("langarts_course", "grade", 46:62,65:66) %>% #put lang arts classes in rows
    select(10, 13:16, 70:71)


names(q2_langarts)
```

    ## [1] "lang_avg"        "council"         "girl_code"       "school"         
    ## [5] "enrolled"        "langarts_course" "grade"

``` r
q2_langarts <- na.omit(q2_langarts) #get rid of cases with no entry

q2_langarts
```

    ## # A tibble: 281 × 7
    ##    lang_avg              council   girl_code          school   enrolled
    ##       <int>                <chr>       <chr>           <chr>      <chr>
    ## 1         4 West Central Council 320NG052903 KATHLEEN MIDDLE 11/01/2016
    ## 2         2    Panhandle Council 322MR071804           Jinks 02/08/2017
    ## 3         3    Panhandle Council 322EL080503           Jinks 02/08/2017
    ## 4         2    Panhandle Council 322LN080204           Jinks 02/08/2017
    ## 5         3    Panhandle Council 322CT072705           Jinks 02/08/2017
    ## 6         3    Panhandle Council 322GG110304           Jinks 02/08/2017
    ## 7         1    Panhandle Council 322KM040604           Jinks 02/08/2017
    ## 8         3      Gateway Council 322SW121306           Jinks 02/08/2017
    ## 9         2    Panhandle Council 322CR121504           Jinks 02/08/2017
    ## 10        2    Panhandle Council 322TR072404           Jinks 02/08/2017
    ## # ... with 271 more rows, and 2 more variables: langarts_course <chr>,
    ## #   grade <chr>

``` r
q2_freelang <- q2_data %>%
    select(10, 13:16,63:64) #find free entry lang cases

names(q2_freelang)
```

    ## [1] "lang_avg"   "council"    "girl_code"  "school"     "enrolled"  
    ## [6] "free_lang1" "free_lang2"

``` r
q2_freelang <- q2_freelang[,c(1,2,3,4,5,7,6)] #rearrange columns to match regular lang courses 



table(q2_freelang$free_lang1, q2_freelang$free_lang2) #check for data
```

    ## < table of extent 0 x 0 >

``` r
q2_freelang <- q2_freelang %>%
    rename("langarts_course" = free_lang2) %>% #rename columns to match reg lang courses
    rename("grade" = free_lang1)



names(q2_freelang)
```

    ## [1] "lang_avg"        "council"         "girl_code"       "school"         
    ## [5] "enrolled"        "langarts_course" "grade"

    ## Warning in grep("ENGLISH", q2_freelang$langarts_course, ignore.case =
    ## TRUE, : argument 'ignore.case = TRUE' will be ignored

    ## # A tibble: 0 × 7
    ## # ... with 7 variables: lang_avg <int>, council <chr>, girl_code <chr>,
    ## #   school <chr>, enrolled <chr>, langarts_course <chr>, grade <chr>

    ## [1] "lang_avg"        "council"         "girl_code"       "school"         
    ## [5] "enrolled"        "langarts_course" "grade"

``` r
q2_langarts <- rbind(q2_langarts, q2_freelang_english)


q2_langarts
```

    ## # A tibble: 281 × 7
    ##    lang_avg              council   girl_code          school   enrolled
    ## *     <int>                <chr>       <chr>           <chr>      <chr>
    ## 1         4 West Central Council 320NG052903 KATHLEEN MIDDLE 11/01/2016
    ## 2         2    Panhandle Council 322MR071804           Jinks 02/08/2017
    ## 3         3    Panhandle Council 322EL080503           Jinks 02/08/2017
    ## 4         2    Panhandle Council 322LN080204           Jinks 02/08/2017
    ## 5         3    Panhandle Council 322CT072705           Jinks 02/08/2017
    ## 6         3    Panhandle Council 322GG110304           Jinks 02/08/2017
    ## 7         1    Panhandle Council 322KM040604           Jinks 02/08/2017
    ## 8         3      Gateway Council 322SW121306           Jinks 02/08/2017
    ## 9         2    Panhandle Council 322CR121504           Jinks 02/08/2017
    ## 10        2    Panhandle Council 322TR072404           Jinks 02/08/2017
    ## # ... with 271 more rows, and 2 more variables: langarts_course <chr>,
    ## #   grade <chr>

``` r
q2_langarts <- q2_langarts %>%
    filter(grade != "Did not mean to select this course")


dim(q2_langarts)
```

    ## [1] 279   7

``` r
which(is.na(q2_langarts$grade))
```

    ## integer(0)

Language Art Points
-------------------

``` r
lang_pts <- numeric(0)

for(i in q2_langarts$grade){

     lang_pts<- c(lang_pts,switch(i, "A" =4, "B"=3, "C"=2, "D"=1, "F"=0))

     lang_pts
}

q2_langarts <-cbind(q2_langarts, lang_pts)

q2_langarts
```

    ##     lang_avg              council    girl_code          school   enrolled
    ## 1          4 West Central Council  320NG052903 KATHLEEN MIDDLE 11/01/2016
    ## 2          2    Panhandle Council  322MR071804           Jinks 02/08/2017
    ## 3          3    Panhandle Council  322EL080503           Jinks 02/08/2017
    ## 4          2    Panhandle Council  322LN080204           Jinks 02/08/2017
    ## 5          3    Panhandle Council  322CT072705           Jinks 02/08/2017
    ## 6          3    Panhandle Council  322GG110304           Jinks 02/08/2017
    ## 7          1    Panhandle Council  322KM040604           Jinks 02/08/2017
    ## 8          3      Gateway Council  322SW121306           Jinks 02/08/2017
    ## 9          2    Panhandle Council  322CR121504           Jinks 02/08/2017
    ## 10         2    Panhandle Council  322TR072404           Jinks 02/08/2017
    ## 11         2    Panhandle Council  322ZR012404           Jinks 02/08/2017
    ## 12         3 West Central Council 3202BD062105 KATHLEEN MIDDLE 11/01/2016
    ## 13         4 West Central Council  320NC122104 KATHLEEN MIDDLE 11/01/2016
    ## 14         4 West Central Council  320KE060905 KATHLEEN MIDDLE 11/01/2016
    ## 15         4 West Central Council  320KJ042505 KATHLEEN MIDDLE 11/01/2016
    ## 16         2 West Central Council  320KM090403 KATHLEEN MIDDLE 11/01/2016
    ## 17         4 West Central Council  320JM111104 KATHLEEN MIDDLE 11/01/2016
    ## 18         4 West Central Council  320MS121104 KATHLEEN MIDDLE 11/01/2016
    ## 19         4 West Central Council  320AT081904 KATHLEEN MIDDLE 11/01/2016
    ## 20         4 West Central Council  320KT102004 KATHLEEN MIDDLE 11/01/2016
    ## 21         4 West Central Council  320DT060204 KATHLEEN MIDDLE 11/01/2016
    ## 22         4 West Central Council  320SW041705 KATHLEEN MIDDLE 11/01/2016
    ## 23         2    Panhandle Council  322SG333305           Jinks 02/08/2017
    ## 24         2    Panhandle Council  322KT041403         Everitt 02/08/2017
    ## 25         0    Panhandle Council  322JW041704         Everitt 02/08/2017
    ## 26         2    Panhandle Council  322JC083104         Everitt 02/08/2017
    ## 27         3    Panhandle Council  322LD120204         Everitt 02/08/2017
    ## 28         4    Panhandle Council  322JB102904         Everitt 02/08/2017
    ## 29         2    Panhandle Council  322CB083004         Everitt 02/08/2017
    ## 30         3    Panhandle Council  322AG102504         Everitt 02/08/2017
    ## 31         2    Panhandle Council  322ZM091203         Everitt 02/08/2017
    ## 32         3    Panhandle Council  322DM050605         Everitt 02/08/2017
    ## 33         3    Panhandle Council  322TM050405         Everitt 02/08/2017
    ## 34         2    Panhandle Council  322RN072805         Everitt 02/08/2017
    ## 35         2    Panhandle Council  322BR081304         Everitt 02/08/2017
    ## 36         3    Panhandle Council  322NB010805   merritt Brown 10/01/2016
    ## 37         3    Panhandle Council  322CB010105   Merritt Brown 10/01/2016
    ## 38         1    Panhandle Council  322TG060904   Merritt Brown 10/01/2016
    ## 39         2    Panhandle Council  322LB060105   Merritt Brown 10/01/2016
    ## 40         3    Panhandle Council  322EM020705   Merritt Brown 10/01/2016
    ## 41         2    Panhandle Council  322MM101404   Merritt Brown 10/01/2016
    ## 42         4    Panhandle Council  322KM030405   Merritt Brown 10/01/2016
    ## 43         3    Panhandle Council  322HM032905   Merritt Brown 10/01/2016
    ## 44         1    Panhandle Council  322HO022005   Merritt Brown 10/01/2016
    ## 45         4    Panhandle Council  322ER102304   Merritt Brown 10/01/2016
    ## 46         2    Panhandle Council  322MT120205   Merritt Brown 10/01/2016
    ## 47         3    Panhandle Council  322AW040605   Merritt Brown 10/01/2016
    ## 48         4    Panhandle Council  322AN020604   Merritt Brown 10/01/2016
    ## 49         2    Southeast Council  321SW012403              LL 10/20/2016
    ## 50         2    Southeast Council  321JL041605              LL 10/20/2016
    ## 51         2    Southeast Council  321AP011905              LL 10/20/2016
    ## 52         2    Southeast Council  321JR070305              LL 10/20/2016
    ## 53         1    Southeast Council  321JP080305              LL 10/20/2016
    ## 54         4    Southeast Council  321SS042805              LL 10/20/2016
    ## 55         3    Southeast Council  321ST100104              LL 10/20/2016
    ## 56         1    Southeast Council  321YW081805              LL 10/20/2016
    ## 57         2      Gateway Council  313TB011705      THE BRIDGE 09/06/2016
    ## 58         3      Gateway Council  313TC050304      THE BRIDGE 09/06/2016
    ## 59         3      Gateway Council  313WF101404      THE BRIDGE 09/06/2016
    ## 60         2      Gateway Council  313SH050805      THE BRIDGE 09/06/2016
    ## 61         2      Gateway Council  313SH060304      THE BRIDGE 09/06/2016
    ## 62         3      Gateway Council  313DJ091703      THE BRIDGE 09/06/2016
    ## 63         2      Gateway Council  313HJ090903      THE BRIDGE 09/06/2016
    ## 64         3      Gateway Council  313KK122904      THE BRIDGE 09/06/2016
    ## 65         2      Gateway Council  313DK070605      THE BRIDGE 09/06/2016
    ## 66         1      Gateway Council  313KK110804      THE BRIDGE 09/06/2016
    ## 67         3      Gateway Council  313AT020105      THE BRIDGE 09/06/2016
    ## 68         2      Gateway Council  313CB010204       LAKESHORE 09/06/2016
    ## 69         2      Gateway Council  313RB122804       LAKESHORE 09/06/2016
    ## 70         3      Gateway Council  313KB012305       LAKESHORE 09/06/2016
    ## 71         2      Gateway Council  313PB121703       LAKESHORE 09/06/2016
    ## 72         2      Gateway Council  313AB040805      THE BRIDGE 09/06/2016
    ## 73         2      Gateway Council  313AC072105       LAKESHORE 09/06/2016
    ## 74         3      Gateway Council  313AC070604       LAKESHORE 09/06/2016
    ## 75         3      Gateway Council  313AD110204       LAKESHORE 09/06/2016
    ## 76         2      Gateway Council  313JF121503       LAKESHORE 09/06/2016
    ## 77         2      Gateway Council  313BH010904       LAKESHORE 09/06/2016
    ## 78         2      Gateway Council  313YH121304       LAKESHORE 09/06/2016
    ## 79         4      Gateway Council  313EM041205       LAKESHORE 09/06/2016
    ## 80         2      Gateway Council  313SN101204       LAKESHORE 09/06/2016
    ## 81         3      Gateway Council  313KP101803       LAKESHORE 09/06/2016
    ## 82         2      Gateway Council  313AR021304       LAKESHORE 09/06/2016
    ## 83         2      Gateway Council  313SS050505       LAKESHORE 09/06/2016
    ## 84         2      Gateway Council  313AT102804       LAKESHORE 09/06/2016
    ## 85         2      Gateway Council  313MT010905       LAKESHORE 09/06/2016
    ## 86         2      Gateway Council  313MW060105       LAKESHORE 09/06/2016
    ## 87         3      Gateway Council  313BJ041205 MATTHEW GILBERT 09/06/2016
    ## 88         1      Gateway Council  313TH110904 MATTHEW GILBERT 09/06/2016
    ## 89         2      Gateway Council  313NA113005 MATTHEW GILBERT 09/06/2016
    ## 90         1      Gateway Council  313MG081605          BUTLER 09/06/2016
    ## 91         4      Gateway Council  313LM071304          BUTLER 09/06/2016
    ## 92         3      Gateway Council  313KD010705          BUTLER 09/06/2016
    ## 93         2      Gateway Council  313MH041204          BUTLER 09/06/2016
    ## 94         1      Gateway Council  313SW030404          BUTLER 09/06/2016
    ## 95         3      Gateway Council  313LR081605          BUTLER 09/06/2016
    ## 96         4 West Central Council  320SA090704 KATHLEEN MIDDLE 11/01/2016
    ## 97         4 West Central Council  3202B062705 KATHLEEN MIDDLE 11/01/2017
    ## 98         4 West Central Council  320SD031905 KATHLEEN MIDDLE 11/01/2017
    ## 99         4 West Central Council  320DG092204 KATHLEEN MIDDLE 11/01/2016
    ## 100        4 West Central Council  320MM120704 KATHLEEN MIDDLE 11/01/2016
    ## 101        3 West Central Council  320BM032505 KATHLEEN MIDDLE 11/01/2016
    ## 102        4 West Central Council  3202N012805 KATHLEEN MIDDLE 11/01/2016
    ## 103        4 West Central Council  320VR031805 KATHLEEN MIDDLE 11/01/2016
    ## 104        2    Southeast Council  321JB120304              LL 10/20/2016
    ## 105        2    Southeast Council  321MC022705              LL 10/20/2016
    ## 106        4    Southeast Council    321012405              LL 10/20/2016
    ## 107        4    Southeast Council  321JD082405              LL 10/20/2016
    ## 108        3    Southeast Council  321TG070305              LL 10/20/2016
    ## 109        2    Southeast Council  321TV110604              LL 10/20/2016
    ## 110        1    Southeast Council  321FV022205              LL 10/20/2016
    ## 111        3     Tropical Council  321GN100704              LL 10/20/2016
    ## 112        2    Southeast Council  321JP061904              LL 10/20/2016
    ## 113        3    Southeast Council  321RR031305              LL 10/20/2016
    ## 114        4    Southeast Council  321AR080305              LL 10/20/2016
    ## 115        2    Southeast Council  321MS081705              LL 10/20/2016
    ## 116        3    Southeast Council  321ST081905              LL 10/20/2016
    ## 117        3    Southeast Council  321BT042805              LL 10/20/2016
    ## 118        4    Southeast Council  321AZ041805              LL 10/20/2016
    ## 119        2 West Central Council    320120104    Young Middle 10/21/2016
    ## 120        2    Panhandle Council  322TH052216           Jinks 02/08/2017
    ## 121        0    Panhandle Council  322AC113004           Jinks 02/08/2017
    ## 122        3 West Central Council  320MM051204 KATHLEEN MIDDLE 11/01/2016
    ## 123        2 West Central Council  320DP061004 KATHLEEN MIDDLE 11/01/2016
    ## 124        3 West Central Council  320DP090403 KATHLEEN MIDDLE 11/01/2016
    ## 125        3 West Central Council  320SW043004 KATHLEEN MIDDLE 11/01/2016
    ## 126        2    Panhandle Council  322NB061103           Jinks 02/08/2017
    ## 127        2    Panhandle Council  322CM041604           Jinks 02/08/2017
    ## 128        1    Panhandle Council  322KM030103           Jinks 02/08/2017
    ## 129        2    Panhandle Council  322BN030103           Jinks 02/08/2017
    ## 130        1    Panhandle Council  322ZR120704           Jinks 02/08/2017
    ## 131        0    Panhandle Council  322SS091203           Jinks 02/08/2017
    ## 132        2    Panhandle Council  322TS032304           Jinks 02/08/2017
    ## 133        1    Panhandle Council  322KS101602         Everitt 02/08/2017
    ## 134        2    Panhandle Council  322LD122603         Everitt 02/08/2017
    ## 135        2    Panhandle Council  322DB062904         Everitt 02/08/2017
    ## 136        3    Panhandle Council  322JP020504         Everitt 02/08/2017
    ## 137        3    Panhandle Council  322DS062904         Everitt 02/08/2017
    ## 138        3    Southeast Council  321VA082703              LL 10/20/2016
    ## 139        3    Southeast Council  321KB112204              LL 10/20/2016
    ## 140        3    Southeast Council  321TD053102              LL 10/20/2016
    ## 141        1    Southeast Council  321RG070304              LL 10/20/2016
    ## 142        1    Southeast Council  321ZJ092702              LL 10/20/2016
    ## 143        4    Southeast Council  321CW071704              LL 10/20/2016
    ## 144        2    Southeast Council  321SO020203              LL 10/20/2016
    ## 145        3    Southeast Council  321CR101403              LL 10/20/2016
    ## 146        2    Southeast Council  321ER110803              LL 10/20/2016
    ## 147        1    Southeast Council  321ES020904              LL 10/20/2016
    ## 148        4    Southeast Council  321PS042604              LL 10/20/2016
    ## 149        2    Southeast Council  321SS081303              LL 10/20/2016
    ## 150        3    Southeast Council  321KW062503              LL 10/20/2016
    ## 151        2    Southeast Council  321FW062504              LL 10/20/2016
    ## 152        3    Southeast Council  321JW083003              LL 10/20/2016
    ## 153        4 West Central Council  320SB050304    Young Middle 10/21/2016
    ## 154        3 West Central Council  320SC072304    Young Middle 10/21/2016
    ## 155        2      Gateway Council  313SB120603      THE BRIDGE 09/06/2016
    ## 156        2      Gateway Council  313MA090303      THE BRIDGE 09/06/2016
    ## 157        2      Gateway Council  313AB062704      THE BRIDGE 09/06/2016
    ## 158        3      Gateway Council  313DB011903      THE BRIDGE 09/06/2016
    ## 159        3      Gateway Council  313IC052403      THE BRIDGE 09/06/2016
    ## 160        2      Gateway Council  313AC103103      THE BRIDGE 09/06/2016
    ## 161        2      Gateway Council  313CC100602      THE BRIDGE 09/06/2016
    ## 162        3      Gateway Council  313BC040204      THE BRIDGE 09/06/2016
    ## 163        3      Gateway Council  313KE082704      THE BRIDGE 09/06/2016
    ## 164        3      Gateway Council  313LF022804     THE  BRIDGE 09/06/2016
    ## 165        3      Gateway Council  313KG061204      THE BRIDGE 09/06/2016
    ## 166        2      Gateway Council  313CH121603      THE BRIDGE 09/06/2016
    ## 167        3      Gateway Council  313CH082603      THE BRIDGE 09/06/2016
    ## 168        1      Gateway Council  313AH081503      THE BRIDGE 09/06/2016
    ## 169        1      Gateway Council  313EO080204      THE BRIDGE 09/06/2016
    ## 170        3      Gateway Council  313DJ031804      THE BRIDGE 09/06/2016
    ## 171        2      Gateway Council  313JL110303      THE BRIDGE 09/06/2016
    ## 172        2      Gateway Council  313JM072404      THE BRIDGE 09/06/2016
    ## 173        2      Gateway Council  313JM100903      THE BRIDGE 09/06/2016
    ## 174        1      Gateway Council  313OM101303      THE BRIDGE 09/06/2016
    ## 175        1      Gateway Council  313BM050404      THE BRIDGE 09/06/2016
    ## 176        0      Gateway Council  313AN121503      THE BRIDGE 09/06/2016
    ## 177        1      Gateway Council  313DP021104      THE BRIDGE 09/06/2016
    ## 178        1      Gateway Council  313AP072605      THE BRIDGE 09/06/2016
    ## 179        2      Gateway Council  313ER122203      THE BRIDGE 09/06/2016
    ## 180        1      Gateway Council  313YR043004      THE BRIDGE 09/06/2016
    ## 181        3      Gateway Council  313KT081504      THE BRIDGE 09/06/2016
    ## 182        1      Gateway Council  313MW031804      THE BRIDGE 09/06/2014
    ## 183        2      Gateway Council  313JW030304      THE BRIDGE 09/06/2016
    ## 184        1      Gateway Council  313AW042604      THE BRIDGE 09/06/2016
    ## 185        3      Gateway Council  313NJ060203       LAKESHORE 09/06/2016
    ## 186        3      Gateway Council  313JJ050404       LAKESHORE 09/06/2016
    ## 187        2      Gateway Council  313TR041903       LAKESHORE 09/06/2016
    ## 188        2      Gateway Council  313AA021404 MATTHEW GILBERT 09/06/2016
    ## 189        2      Gateway Council  313JS010204 MATTHEW GILBERT 09/06/2016
    ## 190        2      Gateway Council  313YK062304 MATTHEW GILBERT 09/06/2016
    ## 191        3      Gateway Council  313LG030104 MATTHEW GILBERT 09/06/2016
    ## 192        2      Gateway Council  313AS040404 MATTHEW GILBERT 09/06/2016
    ## 193        2      Gateway Council  313DW080604 MATTHEW GILBERT 09/06/2016
    ## 194        3      Gateway Council  313RR042804 MATTHEW GILBERT 09/06/2016
    ## 195        2      Gateway Council  313AT041103 MATTHEW GILBERT 09/06/2016
    ## 196        2      Gateway Council  313MT072302 MATTHEW GILBERT 09/06/2016
    ## 197        2      Gateway Council  313LB031704 MATTHEW GILBERT 09/06/2016
    ## 198        3      Gateway Council  313KM051404          BUTLER 09/06/2016
    ## 199        4 West Central Council  320MC121603 KATHLEEN MIDDLE 11/01/2016
    ## 200        3 West Central Council  320AG062003 KATHLEEN MIDDLE 11/01/2016
    ## 201        4 West Central Council  320SH112304 KATHLEEN MIDDLE 11/01/2016
    ## 202        4 West Central Council  320SN033104 KATHLEEN MIDDLE 11/01/2016
    ## 203        3 West Central Council  320JR112403 KATHLEEN MIDDLE 11/01/2016
    ## 204        4 West Central Council  320SY060804 KATHLEEN MIDDLE 11/01/2016
    ## 205        2    Southeast Council  321TN073104              LL 10/20/2016
    ## 206        2    Southeast Council  321BP061502              LL 10/20/2016
    ## 207        2    Panhandle Council  322CM080803           Jinks 02/08/2017
    ## 208        1    Panhandle Council  322MC020204           Jinks 02/08/2017
    ## 209        2 West Central Council  320LB052402 KATHLEEN MIDDLE 11/01/2016
    ## 210        4 West Central Council  3202J080502 KATHLEEN MIDDLE 11/01/2016
    ## 211        0 West Central Council  320YL070603 KATHLEEN MIDDLE 11/01/2016
    ## 212        3 West Central Council  320RM110102 KATHLEEN MIDDLE 11/01/2016
    ## 213        3 West Central Council  320MM111601 KATHLEEN MIDDLE 11/01/2016
    ## 214        3 West Central Council  320TM070503 KATHLEEN MIDDLE 11/01/2016
    ## 215        2 West Central Council  320SV121102 KATHLEEN MIDDLE 11/01/2016
    ## 216        1    Panhandle Council  322LS071802           Jinks 02/08/2017
    ## 217        2    Panhandle Council  322IM020401           Jinks 02/08/2017
    ## 218        3    Panhandle Council  322AT111104           Mowat 10/06/2016
    ## 219        3    Southeast Council  321JD101502              LL 10/20/2016
    ## 220        4    Southeast Council  321KJ012703              LL 10/20/2016
    ## 221        4    Southeast Council  321FJ011803              LL 10/20/2016
    ## 222        3    Southeast Council  321JV021803              LL 10/20/2016
    ## 223        2    Southeast Council  321JP061803              LL 10/20/2016
    ## 224        4    Southeast Council  321PP043003              LL 10/20/2016
    ## 225        2    Southeast Council  321LU072702              LL 10/20/2016
    ## 226        2 West Central Council  320SA080203    Young Middle 10/21/2016
    ## 227        3 West Central Council  320SB122902    Young Middle 10/21/2016
    ## 228        2      Gateway Council  313KA072203      THE BRIDGE 09/06/2016
    ## 229        2      Gateway Council  313JB110302      THE BRIDGE 09/06/2016
    ## 230        2      Gateway Council  313JB122202      THE BRIDGE 09/06/2016
    ## 231        2      Gateway Council  313TB110703      THE BRIDGE 09/06/2016
    ## 232        3      Gateway Council  313JC121003      THE BRIDGE 09/06/2016
    ## 233        2      Gateway Council  313BC091702      THE BRIDGE 09/06/2016
    ## 234        1      Gateway Council  313AC082303      THE BRIDGE 09/06/2016
    ## 235        2      Gateway Council  313AE110601      THE BRIDGE 09/06/2016
    ## 236        3      Gateway Council  313AF040403      THE BRIDGE 09/06/2016
    ## 237        2      Gateway Council  313MH042903      THE BRIDGE 09/06/2016
    ## 238        2      Gateway Council  313TH070301      THE BRIDGE 09/06/2016
    ## 239        2      Gateway Council  313AJ092102      THE BRIDGE 09/06/2016
    ## 240        2      Gateway Council  313AK041202      THE BRIDGE 09/06/2016
    ## 241        1      Gateway Council  313DL121201      THE BRIDGE 09/06/2016
    ## 242        3      Gateway Council  313JM040603      THE BRIDGE 09/06/2016
    ## 243        2      Gateway Council  313PM042502      THE BRIDGE 09/06/2016
    ## 244        2      Gateway Council  313PM082503      THE BRIDGE 09/06/2016
    ## 245        2      Gateway Council  313BM090401      THE BRIDGE 09/06/2016
    ## 246        3      Gateway Council  313JP070503      THE BRIDGE 09/06/2016
    ## 247        2      Gateway Council  313TP102402      THE BRIDGE 09/06/2016
    ## 248        3      Gateway Council  313TR030302      THE BRIDGE 09/06/2016
    ## 249        3      Gateway Council  313JR021003      THE BRIDGE 09/06/2016
    ## 250        2      Gateway Council  313SS111303      THE BRIDGE 09/06/2016
    ## 251        3      Gateway Council  313TS010303      THE BRIDGE 09/06/2016
    ## 252        3      Gateway Council  313JT062302      THE BRIDGE 09/06/2016
    ## 253        2      Gateway Council  313TT120602      THE BRIDGE 09/06/2016
    ## 254        2      Gateway Council  313JT111801      THE BRIDGE 09/06/2016
    ## 255        3      Gateway Council  313KT082103      THE BRIDGE 09/06/2016
    ## 256        2      Gateway Council  313AW110303      THE BRIDGE 09/06/2016
    ## 257        1      Gateway Council  313CW122702      THE BRIDGE 09/06/2016
    ## 258        2      Gateway Council  313SW091704      THE BRIDGE 09/06/2016
    ## 259        2      Gateway Council  313DC061403       LAKESHORE 09/06/2016
    ## 260        3      Gateway Council  313AT050703       LAKESHORE 09/06/2016
    ## 261        3      Gateway Council  313RC022402 MATTHEW GILBERT 09/06/2016
    ## 262        4      Gateway Council  313LD062403 MATTHEW GILBERT 09/06/2016
    ## 263        2      Gateway Council  313RA101702 MATTHEW GILBERT 09/06/2016
    ## 264        4      Gateway Council  313MB022803 MATTHEW GILBERT 09/06/2016
    ## 265        3      Gateway Council  313SR030803 MATTHEW GILBERT 09/06/2016
    ## 266        4 West Central Council  320RB082103 KATHLEEN MIDDLE 11/01/2016
    ## 267        4 West Central Council  320CC061503 KATHLEEN MIDDLE 11/01/2016
    ## 268        4 West Central Council  320AM041503 KATHLEEN MIDDLE 11/01/2016
    ## 269        3 West Central Council  320MG041503    Young Middle 10/29/2016
    ## 270        3 West Central Council  320SB020803    Young Middle 10/21/2016
    ## 271        3 West Central Council  320SD102802    Young Middle 10/21/2016
    ## 272        4 West Central Council  320SD031803    Young Middle 10/21/2016
    ## 273        4    Panhandle Council  322CJ222204           Jinks 02/08/2017
    ## 274        2    Panhandle Council  322AA050505   Merritt Brown 10/01/2016
    ## 275        4    Panhandle Council  322HS040405  Merrittt Brown 10/01/2016
    ## 276        3    Southeast Council  321SD072204              LL 10/20/2016
    ## 277        3    Southeast Council  321BT100203              LL 10/20/2016
    ## 278        4 West Central Council  320NG052903 KATHLEEN MIDDLE 11/01/2016
    ## 279        3     Tropical Council  321GN100704              LL 10/20/2016
    ##           langarts_course grade lang_pts
    ## 1    M/J LANG ARTS 1 ESOL     A        4
    ## 2         M/J LANG ARTS 1     C        2
    ## 3         M/J LANG ARTS 1     B        3
    ## 4         M/J LANG ARTS 1     C        2
    ## 5         M/J LANG ARTS 1     B        3
    ## 6         M/J LANG ARTS 1     B        3
    ## 7         M/J LANG ARTS 1     D        1
    ## 8         M/J LANG ARTS 1     B        3
    ## 9         M/J LANG ARTS 1     C        2
    ## 10        M/J LANG ARTS 1     C        2
    ## 11        M/J LANG ARTS 1     C        2
    ## 12        M/J LANG ARTS 1     B        3
    ## 13        M/J LANG ARTS 1     A        4
    ## 14        M/J LANG ARTS 1     A        4
    ## 15        M/J LANG ARTS 1     A        4
    ## 16        M/J LANG ARTS 1     C        2
    ## 17        M/J LANG ARTS 1     A        4
    ## 18        M/J LANG ARTS 1     A        4
    ## 19        M/J LANG ARTS 1     A        4
    ## 20        M/J LANG ARTS 1     A        4
    ## 21        M/J LANG ARTS 1     A        4
    ## 22        M/J LANG ARTS 1     A        4
    ## 23        M/J LANG ARTS 1     C        2
    ## 24        M/J LANG ARTS 1     C        2
    ## 25        M/J LANG ARTS 1     F        0
    ## 26        M/J LANG ARTS 1     C        2
    ## 27        M/J LANG ARTS 1     B        3
    ## 28        M/J LANG ARTS 1     A        4
    ## 29        M/J LANG ARTS 1     C        2
    ## 30        M/J LANG ARTS 1     B        3
    ## 31        M/J LANG ARTS 1     C        2
    ## 32        M/J LANG ARTS 1     B        3
    ## 33        M/J LANG ARTS 1     B        3
    ## 34        M/J LANG ARTS 1     C        2
    ## 35        M/J LANG ARTS 1     C        2
    ## 36        M/J LANG ARTS 1     B        3
    ## 37        M/J LANG ARTS 1     B        3
    ## 38        M/J LANG ARTS 1     D        1
    ## 39        M/J LANG ARTS 1     C        2
    ## 40        M/J LANG ARTS 1     B        3
    ## 41        M/J LANG ARTS 1     C        2
    ## 42        M/J LANG ARTS 1     A        4
    ## 43        M/J LANG ARTS 1     B        3
    ## 44        M/J LANG ARTS 1     D        1
    ## 45        M/J LANG ARTS 1     A        4
    ## 46        M/J LANG ARTS 1     C        2
    ## 47        M/J LANG ARTS 1     B        3
    ## 48        M/J LANG ARTS 1     A        4
    ## 49        M/J LANG ARTS 1     C        2
    ## 50        M/J LANG ARTS 1     C        2
    ## 51        M/J LANG ARTS 1     C        2
    ## 52        M/J LANG ARTS 1     C        2
    ## 53        M/J LANG ARTS 1     D        1
    ## 54        M/J LANG ARTS 1     A        4
    ## 55        M/J LANG ARTS 1     B        3
    ## 56        M/J LANG ARTS 1     D        1
    ## 57        M/J LANG ARTS 1     C        2
    ## 58        M/J LANG ARTS 1     B        3
    ## 59        M/J LANG ARTS 1     B        3
    ## 60        M/J LANG ARTS 1     C        2
    ## 61        M/J LANG ARTS 1     C        2
    ## 62        M/J LANG ARTS 1     B        3
    ## 63        M/J LANG ARTS 1     C        2
    ## 64        M/J LANG ARTS 1     B        3
    ## 65        M/J LANG ARTS 1     C        2
    ## 66        M/J LANG ARTS 1     D        1
    ## 67        M/J LANG ARTS 1     B        3
    ## 68        M/J LANG ARTS 1     C        2
    ## 69        M/J LANG ARTS 1     C        2
    ## 70        M/J LANG ARTS 1     B        3
    ## 71        M/J LANG ARTS 1     C        2
    ## 72        M/J LANG ARTS 1     C        2
    ## 73        M/J LANG ARTS 1     C        2
    ## 74        M/J LANG ARTS 1     B        3
    ## 75        M/J LANG ARTS 1     B        3
    ## 76        M/J LANG ARTS 1     C        2
    ## 77        M/J LANG ARTS 1     C        2
    ## 78        M/J LANG ARTS 1     C        2
    ## 79        M/J LANG ARTS 1     A        4
    ## 80        M/J LANG ARTS 1     C        2
    ## 81        M/J LANG ARTS 1     B        3
    ## 82        M/J LANG ARTS 1     C        2
    ## 83        M/J LANG ARTS 1     C        2
    ## 84        M/J LANG ARTS 1     C        2
    ## 85        M/J LANG ARTS 1     C        2
    ## 86        M/J LANG ARTS 1     C        2
    ## 87        M/J LANG ARTS 1     B        3
    ## 88        M/J LANG ARTS 1     D        1
    ## 89        M/J LANG ARTS 1     C        2
    ## 90        M/J LANG ARTS 1     D        1
    ## 91        M/J LANG ARTS 1     A        4
    ## 92        M/J LANG ARTS 1     B        3
    ## 93        M/J LANG ARTS 1     C        2
    ## 94        M/J LANG ARTS 1     D        1
    ## 95        M/J LANG ARTS 1     B        3
    ## 96    M/J LANG ARTS 1 ADV     A        4
    ## 97    M/J LANG ARTS 1 ADV     A        4
    ## 98    M/J LANG ARTS 1 ADV     A        4
    ## 99    M/J LANG ARTS 1 ADV     A        4
    ## 100   M/J LANG ARTS 1 ADV     A        4
    ## 101   M/J LANG ARTS 1 ADV     B        3
    ## 102   M/J LANG ARTS 1 ADV     A        4
    ## 103   M/J LANG ARTS 1 ADV     A        4
    ## 104   M/J LANG ARTS 1 ADV     C        2
    ## 105   M/J LANG ARTS 1 ADV     C        2
    ## 106   M/J LANG ARTS 1 ADV     A        4
    ## 107   M/J LANG ARTS 1 ADV     A        4
    ## 108   M/J LANG ARTS 1 ADV     B        3
    ## 109   M/J LANG ARTS 1 ADV     C        2
    ## 110   M/J LANG ARTS 1 ADV     D        1
    ## 111   M/J LANG ARTS 1 ADV     B        3
    ## 112   M/J LANG ARTS 1 ADV     C        2
    ## 113   M/J LANG ARTS 1 ADV     B        3
    ## 114   M/J LANG ARTS 1 ADV     A        4
    ## 115   M/J LANG ARTS 1 ADV     C        2
    ## 116   M/J LANG ARTS 1 ADV     B        3
    ## 117   M/J LANG ARTS 1 ADV     B        3
    ## 118   M/J LANG ARTS 1 ADV     A        4
    ## 119   M/J LANG ARTS 1 ADV     C        2
    ## 120       M/J LANG ARTS 2     C        2
    ## 121       M/J LANG ARTS 2     F        0
    ## 122       M/J LANG ARTS 2     B        3
    ## 123       M/J LANG ARTS 2     C        2
    ## 124       M/J LANG ARTS 2     B        3
    ## 125       M/J LANG ARTS 2     B        3
    ## 126       M/J LANG ARTS 2     C        2
    ## 127       M/J LANG ARTS 2     C        2
    ## 128       M/J LANG ARTS 2     D        1
    ## 129       M/J LANG ARTS 2     C        2
    ## 130       M/J LANG ARTS 2     D        1
    ## 131       M/J LANG ARTS 2     F        0
    ## 132       M/J LANG ARTS 2     C        2
    ## 133       M/J LANG ARTS 2     D        1
    ## 134       M/J LANG ARTS 2     C        2
    ## 135       M/J LANG ARTS 2     C        2
    ## 136       M/J LANG ARTS 2     B        3
    ## 137       M/J LANG ARTS 2     B        3
    ## 138       M/J LANG ARTS 2     B        3
    ## 139       M/J LANG ARTS 2     B        3
    ## 140       M/J LANG ARTS 2     B        3
    ## 141       M/J LANG ARTS 2     D        1
    ## 142       M/J LANG ARTS 2     D        1
    ## 143       M/J LANG ARTS 2     A        4
    ## 144       M/J LANG ARTS 2     C        2
    ## 145       M/J LANG ARTS 2     B        3
    ## 146       M/J LANG ARTS 2     C        2
    ## 147       M/J LANG ARTS 2     D        1
    ## 148       M/J LANG ARTS 2     A        4
    ## 149       M/J LANG ARTS 2     C        2
    ## 150       M/J LANG ARTS 2     B        3
    ## 151       M/J LANG ARTS 2     C        2
    ## 152       M/J LANG ARTS 2     B        3
    ## 153       M/J LANG ARTS 2     A        4
    ## 154       M/J LANG ARTS 2     B        3
    ## 155       M/J LANG ARTS 2     C        2
    ## 156       M/J LANG ARTS 2     C        2
    ## 157       M/J LANG ARTS 2     C        2
    ## 158       M/J LANG ARTS 2     B        3
    ## 159       M/J LANG ARTS 2     B        3
    ## 160       M/J LANG ARTS 2     C        2
    ## 161       M/J LANG ARTS 2     C        2
    ## 162       M/J LANG ARTS 2     B        3
    ## 163       M/J LANG ARTS 2     B        3
    ## 164       M/J LANG ARTS 2     B        3
    ## 165       M/J LANG ARTS 2     B        3
    ## 166       M/J LANG ARTS 2     C        2
    ## 167       M/J LANG ARTS 2     B        3
    ## 168       M/J LANG ARTS 2     D        1
    ## 169       M/J LANG ARTS 2     D        1
    ## 170       M/J LANG ARTS 2     B        3
    ## 171       M/J LANG ARTS 2     C        2
    ## 172       M/J LANG ARTS 2     C        2
    ## 173       M/J LANG ARTS 2     C        2
    ## 174       M/J LANG ARTS 2     D        1
    ## 175       M/J LANG ARTS 2     D        1
    ## 176       M/J LANG ARTS 2     F        0
    ## 177       M/J LANG ARTS 2     D        1
    ## 178       M/J LANG ARTS 2     D        1
    ## 179       M/J LANG ARTS 2     C        2
    ## 180       M/J LANG ARTS 2     D        1
    ## 181       M/J LANG ARTS 2     B        3
    ## 182       M/J LANG ARTS 2     D        1
    ## 183       M/J LANG ARTS 2     C        2
    ## 184       M/J LANG ARTS 2     D        1
    ## 185       M/J LANG ARTS 2     B        3
    ## 186       M/J LANG ARTS 2     B        3
    ## 187       M/J LANG ARTS 2     C        2
    ## 188       M/J LANG ARTS 2     C        2
    ## 189       M/J LANG ARTS 2     C        2
    ## 190       M/J LANG ARTS 2     C        2
    ## 191       M/J LANG ARTS 2     B        3
    ## 192       M/J LANG ARTS 2     C        2
    ## 193       M/J LANG ARTS 2     C        2
    ## 194       M/J LANG ARTS 2     B        3
    ## 195       M/J LANG ARTS 2     C        2
    ## 196       M/J LANG ARTS 2     C        2
    ## 197       M/J LANG ARTS 2     C        2
    ## 198       M/J LANG ARTS 2     B        3
    ## 199   M/J LANG ARTS 2 ADV     A        4
    ## 200   M/J LANG ARTS 2 ADV     B        3
    ## 201   M/J LANG ARTS 2 ADV     A        4
    ## 202   M/J LANG ARTS 2 ADV     A        4
    ## 203   M/J LANG ARTS 2 ADV     B        3
    ## 204   M/J LANG ARTS 2 ADV     A        4
    ## 205   M/J LANG ARTS 2 ADV     C        2
    ## 206   M/J LANG ARTS 2 ADV     C        2
    ## 207       M/J LANG ARTS 3     C        2
    ## 208       M/J LANG ARTS 3     D        1
    ## 209       M/J LANG ARTS 3     C        2
    ## 210       M/J LANG ARTS 3     A        4
    ## 211       M/J LANG ARTS 3     F        0
    ## 212       M/J LANG ARTS 3     B        3
    ## 213       M/J LANG ARTS 3     B        3
    ## 214       M/J LANG ARTS 3     B        3
    ## 215       M/J LANG ARTS 3     C        2
    ## 216       M/J LANG ARTS 3     D        1
    ## 217       M/J LANG ARTS 3     C        2
    ## 218       M/J LANG ARTS 3     B        3
    ## 219       M/J LANG ARTS 3     B        3
    ## 220       M/J LANG ARTS 3     A        4
    ## 221       M/J LANG ARTS 3     A        4
    ## 222       M/J LANG ARTS 3     B        3
    ## 223       M/J LANG ARTS 3     C        2
    ## 224       M/J LANG ARTS 3     A        4
    ## 225       M/J LANG ARTS 3     C        2
    ## 226       M/J LANG ARTS 3     C        2
    ## 227       M/J LANG ARTS 3     B        3
    ## 228       M/J LANG ARTS 3     C        2
    ## 229       M/J LANG ARTS 3     C        2
    ## 230       M/J LANG ARTS 3     C        2
    ## 231       M/J LANG ARTS 3     C        2
    ## 232       M/J LANG ARTS 3     B        3
    ## 233       M/J LANG ARTS 3     C        2
    ## 234       M/J LANG ARTS 3     D        1
    ## 235       M/J LANG ARTS 3     C        2
    ## 236       M/J LANG ARTS 3     B        3
    ## 237       M/J LANG ARTS 3     C        2
    ## 238       M/J LANG ARTS 3     C        2
    ## 239       M/J LANG ARTS 3     C        2
    ## 240       M/J LANG ARTS 3     C        2
    ## 241       M/J LANG ARTS 3     D        1
    ## 242       M/J LANG ARTS 3     B        3
    ## 243       M/J LANG ARTS 3     C        2
    ## 244       M/J LANG ARTS 3     C        2
    ## 245       M/J LANG ARTS 3     C        2
    ## 246       M/J LANG ARTS 3     B        3
    ## 247       M/J LANG ARTS 3     C        2
    ## 248       M/J LANG ARTS 3     B        3
    ## 249       M/J LANG ARTS 3     B        3
    ## 250       M/J LANG ARTS 3     C        2
    ## 251       M/J LANG ARTS 3     B        3
    ## 252       M/J LANG ARTS 3     B        3
    ## 253       M/J LANG ARTS 3     C        2
    ## 254       M/J LANG ARTS 3     C        2
    ## 255       M/J LANG ARTS 3     B        3
    ## 256       M/J LANG ARTS 3     C        2
    ## 257       M/J LANG ARTS 3     D        1
    ## 258       M/J LANG ARTS 3     C        2
    ## 259       M/J LANG ARTS 3     C        2
    ## 260       M/J LANG ARTS 3     B        3
    ## 261       M/J LANG ARTS 3     B        3
    ## 262       M/J LANG ARTS 3     A        4
    ## 263       M/J LANG ARTS 3     C        2
    ## 264       M/J LANG ARTS 3     A        4
    ## 265       M/J LANG ARTS 3     B        3
    ## 266   M/J LANG ARTS 3 ADv     A        4
    ## 267   M/J LANG ARTS 3 ADv     A        4
    ## 268   M/J LANG ARTS 3 ADv     A        4
    ## 269   M/J LANG ARTS 3 ADv     B        3
    ## 270   M/J LANG ARTS 3 ADv     B        3
    ## 271   M/J LANG ARTS 3 ADv     B        3
    ## 272   M/J LANG ARTS 3 ADv     A        4
    ## 273  M/J ENG 3 CAMB SEC 3     A        4
    ## 274  M/J INTENS LANG ARTS     C        2
    ## 275  M/J INTENS LANG ARTS     A        4
    ## 276  M/J INTENS LANG ARTS     B        3
    ## 277  M/J INTENS LANG ARTS     B        3
    ## 278 M/J DE LANG ARTS ESOL     A        4
    ## 279 M/J DE LANG ARTS ESOL     D        1

``` r
q2_behavior_data <- full_join(q2_behavior, q2_attendance, by="girl_code")

dim(q2_behavior_data)
head(q2_behavior_data)
names(q2_behavior_data)

q2_behavior_data <- q2_behavior_data %>%
    select(1,2,3,4, 5, 7, 13) %>%
    rename(council = council.x) %>%
    rename(school = school.x) %>%
    rename(enrolled = enrolled.x) %>%
    rename(suspension_total = total.x)%>%
    rename(absences_total = total.y)

head(q2_behavior_data)
```

``` r
q2_behavior_data <- full_join(q2_behavior_data, q2_expelled, by="girl_code")

names(q2_behavior_data)

q2_behavior_data <- q2_behavior_data %>%
    select(1, 2, 3, 4, 6,7,11) %>%
    rename(council = council.x) %>%
    rename(school = school.x)%>%
    rename(enrolled = enrolled.x)
    #rename(expelled = expelled.x)


head(q2_behavior_data)
```

Combine Grades
==============

``` r
q2_grades_c <- full_join(q2_reading, q2_langarts, by="girl_code")

names(q2_grades_c)

q2_grades_c <- q2_grades_c %>%
    select(2,6,7,12,13) %>%
    rename(council = council.x)

head(q2_grades_c)
```

``` r
setwd("C:/Users/kevin/Dropbox/GetReal/Data/sqlite")


getReal_db<- dbConnect(SQLite(), dbname="outcome_history.sqlite") #established connection with database

dbWriteTable(conn =getReal_db, name= "Q2_attendance_1617", value= q2_attendance, row.names=FALSE, overwrite= TRUE)
```

    ## [1] TRUE

``` r
dbWriteTable(conn =getReal_db, name= "Q2_behavior_1617", value= q2_behavior, row.names=FALSE, overwrite=TRUE)
```

    ## [1] TRUE

``` r
dbWriteTable(conn =getReal_db, name= "Q2_expelled_1617", value= q2_expelled, row.names=FALSE, overwrite = TRUE)
```

    ## [1] TRUE

``` r
dbWriteTable(conn =getReal_db, name= "Q2_reading_1617", value= q2_reading, row.names=FALSE,  overwrite= TRUE)
```

    ## [1] TRUE

``` r
dbWriteTable(conn =getReal_db, name= "Q2_langarts_1617", value= q2_langarts, row.names=FALSE, overwrite=TRUE)
```

    ## [1] TRUE
