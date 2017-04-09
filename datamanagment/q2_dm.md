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
q2_data <- readRDS("q2_data.Rds")


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

    ## [1] "X88"

``` r
q2_data$girl_code <- as.character(q2_data$girl_code)

### Make all girCode to upper case for matching
q2_data$girl_code <- toupper(q2_data$girl_code)



q2_data <- q2_data %>%
    filter(Finished ==1)



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
    ## #   for ${q://QID1/ChoiceTextEntryValue} who attends, ...` <int>,
    ## #   Q_INTENS_READ <chr>, Q_READ_1 <chr>, Q_READ_1_ADV <chr>,
    ## #   Q_READ_2 <chr>, Q_READ_2_ADV <chr>, Q_READ_3 <chr>,
    ## #   Q_READ_3_ADV <chr>, Q_free_reading1 <chr>, Q_free_reading2 <chr>,
    ## #   Q_DELAESOL_READ <chr>, S_INTENS_READ <chr>, S_Read_1 <chr>,
    ## #   S_READ_1_ADV <chr>, S_READ_2 <chr>, ` S_READ_2_ADV` <chr>,
    ## #   S_Read_3 <chr>, S_READ_3_ADV <chr>, S_free_reading1 <chr>,
    ## #   S_free_reading2 <chr>, `The following is a  list of standard Middle
    ## #   School Reading Courses for Grades 6-8 : Semester Grade-<strong>M/J DE
    ## #   LA ESOL-READ</strong>` <chr>, `You are entering data
    ## #   for ${q://QID1/ChoiceTextEntryValue} who attends, ..._1` <int>,
    ## #   `Q_LANGARTS-1_ESOL` <chr>, Q_LANGARTS_2_ESOL <chr>,
    ## #   Q_LANGARTS_3_ESOL <chr>, Q_DEVELOPMENTAL_LANGARTS_ESOL <chr>,
    ## #   Q_LANG_ARTS_1 <chr>, Q_LANG_ARTS_1_ADV <chr>, Q_LANGARTS_2 <chr>,
    ## #   Q_LANG_ARTS_2_ADV <chr>, Q_LANG_ARTS_3 <chr>, Q_LANG_ARTS_3_ADv <chr>,
    ## #   Q_ENG_2_CAMB_SEC_2 <chr>, `Q_IB MYP LANG LIT 1` <chr>, `Q_ENG 1 CAMB
    ## #   SEC 1` <chr>, `Q_IB MYP LANG & LIT 3` <chr>, `Q_IB MYP LANG & LIT
    ## #   2` <chr>, `Q_ENG 3 CAMB SEC 3` <chr>, Q_INTENS_LANGARTS <chr>,
    ## #   Q_free_lang1 <chr>, Q_free_lang2 <chr>, `Q_LANG ARTS TRAN` <chr>,
    ## #   `Q_DE LANG ARTS ESOL` <chr>, blankspace <chr>,
    ## #   `S_LANGARTS-1_ESOL` <chr>, S_LANGARTS_2_ESOL <chr>,
    ## #   S_LANGARTS_3_ESOL <chr>, S_DEVELOPMENTAL_LANGARTS_ESOL <chr>,
    ## #   S_LANG_ARTS_1 <chr>, S_LANG_ARTS_1_ADV <chr>, S_LANG_ARTS_2_ADV <chr>,
    ## #   S_LANG_ARTS_3 <chr>, S_LANG_ARTS_3_ADv <chr>,
    ## #   S_ENG_2_CAMB_SEC_2 <chr>, `S_IB MYP LANG LIT 1` <chr>, `S_ENG 1 CAMB
    ## #   SEC 1` <chr>, `S_IB MYP LANG & LIT 3` <chr>, `S_IB MYP LANG & LIT
    ## #   2` <chr>, `S_ENG 3 CAMB SEC 3` <chr>, S_INTENS_LANGARTS <chr>,
    ## #   S_free_lang1 <chr>, S_free_lang2 <chr>, `S_LANG ARTS TRAN` <chr>,
    ## #   `S_DE LANG ARTS ESOL` <chr>, X88 <chr>

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

    ## [1] 489  88

``` r
pander(table(q2_data$girl_code)) #test for duplicate girl codes
```

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313AA021404</th>
<th align="center">313AA032704</th>
<th align="center">313AB021104</th>
<th align="center">313AB040805</th>
<th align="center">313AB062704</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313AC070604</th>
<th align="center">313AC072105</th>
<th align="center">313AC082303</th>
<th align="center">313AC082403</th>
<th align="center">313AC103103</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313AC110203</th>
<th align="center">313AD110204</th>
<th align="center">313AE110601</th>
<th align="center">313AF040403</th>
<th align="center">313AG030404</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313AH081503</th>
<th align="center">313AH092102</th>
<th align="center">313AJ041002</th>
<th align="center">313AJ092102</th>
<th align="center">313AK021702</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313AK041202</th>
<th align="center">313AM041503</th>
<th align="center">313AN031402</th>
<th align="center">313AN050505</th>
<th align="center">313AN121503</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313AO080104</th>
<th align="center">313AO122203</th>
<th align="center">313AP072605</th>
<th align="center">313AR021304</th>
<th align="center">313AS022503</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313AS040404</th>
<th align="center">313AT020105</th>
<th align="center">313AT041103</th>
<th align="center">313AT050703</th>
<th align="center">313AT102804</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313AW030804</th>
<th align="center">313AW042604</th>
<th align="center">313AW110303</th>
<th align="center">313BB060903</th>
<th align="center">313BC040204</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313BC091702</th>
<th align="center">313BH010904</th>
<th align="center">313BH072703</th>
<th align="center">313BJ041205</th>
<th align="center">313BM050404</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313BM090401</th>
<th align="center">313BW033004</th>
<th align="center">313BW122602</th>
<th align="center">313CB010204</th>
<th align="center">313CC013004</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313CC100602</th>
<th align="center">313CH082603</th>
<th align="center">313CH121603</th>
<th align="center">313CJ082905</th>
<th align="center">313CJ091804</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313CL071703</th>
<th align="center">313CM120704</th>
<th align="center">313CT061203</th>
<th align="center">313CW111804</th>
<th align="center">313CW122702</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313DB011903</th>
<th align="center">313DB040203</th>
<th align="center">313DB051704</th>
<th align="center">313DB060804</th>
<th align="center">313DC061403</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313DD031903</th>
<th align="center">313DD122004</th>
<th align="center">313DE080804</th>
<th align="center">313DF021003</th>
<th align="center">313DH102103</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313DH122500</th>
<th align="center">313DJ031804</th>
<th align="center">313DJ091703</th>
<th align="center">313DK070605</th>
<th align="center">313DL121201</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313DM121103</th>
<th align="center">313DP021104</th>
<th align="center">313DS083103</th>
<th align="center">313DW052505</th>
<th align="center">313DW080604</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313DW122104</th>
<th align="center">313EC083004</th>
<th align="center">313EF080305</th>
<th align="center">313EM041205</th>
<th align="center">313EO080204</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313ER122203</th>
<th align="center">313ES120603</th>
<th align="center">313ET062404</th>
<th align="center">313FF111603</th>
<th align="center">313GG010305</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313GG091004</th>
<th align="center">313GL041504</th>
<th align="center">313GS111903</th>
<th align="center">313HC040605</th>
<th align="center">313HF112202</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313HJ090903</th>
<th align="center">313HS090603</th>
<th align="center">313HW021803</th>
<th align="center">313HW060205</th>
<th align="center">313IC052403</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313IL080503</th>
<th align="center">313IS050500</th>
<th align="center">313IW110204</th>
<th align="center">313JA070105</th>
<th align="center">313JB040304</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313JB110302</th>
<th align="center">313JB122202</th>
<th align="center">313JC022004</th>
<th align="center">313JC090403</th>
<th align="center">313JC111703</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313JC112403</th>
<th align="center">313JC121003</th>
<th align="center">313JD052404</th>
<th align="center">313JE010703</th>
<th align="center">313JF121503</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313JJ050404</th>
<th align="center">313JJ110103</th>
<th align="center">313JL110303</th>
<th align="center">313JM022304</th>
<th align="center">313JM040603</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313JM072404</th>
<th align="center">313JM100903</th>
<th align="center">313JN101801</th>
<th align="center">313JP070503</th>
<th align="center">313JR021003</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313JR042804</th>
<th align="center">313JS010204</th>
<th align="center">313JS043004</th>
<th align="center">313JS093004</th>
<th align="center">313JT051502</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313JT060205</th>
<th align="center">313JT062302</th>
<th align="center">313JT111801</th>
<th align="center">313JU052004</th>
<th align="center">313JW030304</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313JW081004</th>
<th align="center">313JW111402</th>
<th align="center">313KA072203</th>
<th align="center">313KB012305</th>
<th align="center">313KB052502</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313KB070103</th>
<th align="center">313KB121203</th>
<th align="center">313KD010705</th>
<th align="center">313KD031602</th>
<th align="center">313KE082704</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313KF050404</th>
<th align="center">313KG061204</th>
<th align="center">313KH061102</th>
<th align="center">313KH120302</th>
<th align="center">313KJ060502</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313KK110804</th>
<th align="center">313KK122904</th>
<th align="center">313KM051404</th>
<th align="center">313KM110503</th>
<th align="center">313KO040704</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313KP101803</th>
<th align="center">313KR112103</th>
<th align="center">313KT042704</th>
<th align="center">313KT081504</th>
<th align="center">313KT082103</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313KW061403</th>
<th align="center">313LB031003</th>
<th align="center">313LB031704</th>
<th align="center">313LD062403</th>
<th align="center">313LF022804</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313LG030104</th>
<th align="center">313LM071304</th>
<th align="center">313LR081605</th>
<th align="center">313LS010404</th>
<th align="center">313LS033104</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313LW060204</th>
<th align="center">313MA090303</th>
<th align="center">313MB022803</th>
<th align="center">313MB080504</th>
<th align="center">313MC113003</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313MD030503</th>
<th align="center">313ME110803</th>
<th align="center">313MG081605</th>
<th align="center">313MH041204</th>
<th align="center">313MH042903</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313MH122904</th>
<th align="center">313MM120502</th>
<th align="center">313MR022004</th>
<th align="center">313MS022702</th>
<th align="center">313MS030606</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313MS091502</th>
<th align="center">313MS113004</th>
<th align="center">313MT010905</th>
<th align="center">313MT072302</th>
<th align="center">313MW031804</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313MW040605</th>
<th align="center">313MW060105</th>
<th align="center">313NA113005</th>
<th align="center">313NJ060203</th>
<th align="center">313NL121902</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313OM101303</th>
<th align="center">313PB032604</th>
<th align="center">313PB121703</th>
<th align="center">313PM021605</th>
<th align="center">313PM041804</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313PM042502</th>
<th align="center">313PM082503</th>
<th align="center">313PS042205</th>
<th align="center">313PS082702</th>
<th align="center">313PW100903</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313QT082604</th>
<th align="center">313RA101702</th>
<th align="center">313RB122804</th>
<th align="center">313RC022402</th>
<th align="center">313RG012904</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313RG060502</th>
<th align="center">313RJ070404</th>
<th align="center">313RM032403</th>
<th align="center">313RM061404</th>
<th align="center">313RR042804</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313RR053001</th>
<th align="center">313SB082404</th>
<th align="center">313SB112203</th>
<th align="center">313SB120603</th>
<th align="center">313SH050805</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313SH060304</th>
<th align="center">313SL020605</th>
<th align="center">313SL072203</th>
<th align="center">313SN101204</th>
<th align="center">313SR030803</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313SS010203</th>
<th align="center">313SS050505</th>
<th align="center">313SS052202</th>
<th align="center">313SS111303</th>
<th align="center">313SW030404</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313SW091704</th>
<th align="center">313TB011705</th>
<th align="center">313TB091302</th>
<th align="center">313TB110703</th>
<th align="center">313TB121603</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313TC050304</th>
<th align="center">313TD082503</th>
<th align="center">313TH011603</th>
<th align="center">313TH070301</th>
<th align="center">313TH110904</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313TK052204</th>
<th align="center">313TL030304</th>
<th align="center">313TL052902</th>
<th align="center">313TP102402</th>
<th align="center">313TR030302</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313TR041903</th>
<th align="center">313TS010303</th>
<th align="center">313TS120902</th>
<th align="center">313TT080603</th>
<th align="center">313TT120602</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313TW081103</th>
<th align="center">313TW112603</th>
<th align="center">313VM051001</th>
<th align="center">313VP021302</th>
<th align="center">313VZ100902</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313WF101404</th>
<th align="center">313YG081804</th>
<th align="center">313YH121304</th>
<th align="center">313YK062304</th>
<th align="center">313YR043004</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:94%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="16%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">313ZC040702</th>
<th align="center">313ZG041304</th>
<th align="center">320120104</th>
<th align="center">3202B062705</th>
<th align="center">3202BD062105</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">3202J080502</th>
<th align="center">3202N012805</th>
<th align="center">320AB061103</th>
<th align="center">320AC012304</th>
<th align="center">320AC020704</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320AC100104</th>
<th align="center">320AD123003</th>
<th align="center">320AG022403</th>
<th align="center">320AG062003</th>
<th align="center">320AH061004</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320AH063004</th>
<th align="center">320AH071505</th>
<th align="center">320AM031505</th>
<th align="center">320AM041503</th>
<th align="center">320AM072903</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320AT081904</th>
<th align="center">320AT101602</th>
<th align="center">320AV040205</th>
<th align="center">320AW071205</th>
<th align="center">320AW072404</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320BC091802</th>
<th align="center">320BM032505</th>
<th align="center">320BR072103</th>
<th align="center">320CC011404</th>
<th align="center">320CC050705</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320CC061503</th>
<th align="center">320CD010605</th>
<th align="center">320CG072705</th>
<th align="center">320CI061405</th>
<th align="center">320CM120402</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320CP041705</th>
<th align="center">320CR022204</th>
<th align="center">320DB041404</th>
<th align="center">320DE122803</th>
<th align="center">320DG092204</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320DJ040604</th>
<th align="center">320DM041603</th>
<th align="center">320DP061004</th>
<th align="center">320DP090403</th>
<th align="center">320DT060204</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320EC112202</th>
<th align="center">320EF042903</th>
<th align="center">320EF111204</th>
<th align="center">320EH082104</th>
<th align="center">320FB032204</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320GC121002</th>
<th align="center">320IR061103</th>
<th align="center">320IW012403</th>
<th align="center">320JA020205</th>
<th align="center">320JA101203</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320JG022305</th>
<th align="center">320JG062702</th>
<th align="center">320JJ061804</th>
<th align="center">320JJ120102</th>
<th align="center">320JM111104</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320JR112403</th>
<th align="center">320KB061005</th>
<th align="center">320KE060905</th>
<th align="center">320KG040505</th>
<th align="center">320KJ042505</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320KM090403</th>
<th align="center">320KT102004</th>
<th align="center">320LA021505</th>
<th align="center">320LB052402</th>
<th align="center">320LB062204</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320LC111102</th>
<th align="center">320LP101802</th>
<th align="center">320MC111104</th>
<th align="center">320MC121603</th>
<th align="center">320MD082804</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320MG030803</th>
<th align="center">320MG041503</th>
<th align="center">320MH043004</th>
<th align="center">320MJ093003</th>
<th align="center">320MM051204</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320MM111601</th>
<th align="center">320MM120704</th>
<th align="center">320MS121104</th>
<th align="center">320MW120302</th>
<th align="center">320NC041704</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320NC122104</th>
<th align="center">320NG052903</th>
<th align="center">320NH120404</th>
<th align="center">320NR060503</th>
<th align="center">320PB062204</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320RB082103</th>
<th align="center">320RF032305</th>
<th align="center">320RG071003</th>
<th align="center">320RH100404</th>
<th align="center">320RM110102</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320SA080203</th>
<th align="center">320SA090704</th>
<th align="center">320SB020803</th>
<th align="center">320SB050304</th>
<th align="center">320SB122902</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320SC072304</th>
<th align="center">320SD031803</th>
<th align="center">320SD031905</th>
<th align="center">320SD102802</th>
<th align="center">320SF041404</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320SG022305</th>
<th align="center">320SH112304</th>
<th align="center">320SN033104</th>
<th align="center">320SV121102</th>
<th align="center">320SW041705</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320SW043004</th>
<th align="center">320SY060804</th>
<th align="center">320TG100703</th>
<th align="center">320TH032403</th>
<th align="center">320TJ071403</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320TM070503</th>
<th align="center">320VC032105</th>
<th align="center">320VR031805</th>
<th align="center">320VS052505</th>
<th align="center">320YL070603</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:94%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="16%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">320ZG030304</th>
<th align="center">321012405</th>
<th align="center">321AP011905</th>
<th align="center">321AR080305</th>
<th align="center">321AZ041805</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">321BP061502</th>
<th align="center">321BT042805</th>
<th align="center">321BT100203</th>
<th align="center">321CR101403</th>
<th align="center">321CW071704</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">321ER110803</th>
<th align="center">321ES020904</th>
<th align="center">321FJ011803</th>
<th align="center">321FV022205</th>
<th align="center">321FW062504</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">321GN100704</th>
<th align="center">321JB120304</th>
<th align="center">321JD082405</th>
<th align="center">321JD101502</th>
<th align="center">321JL041605</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">321JP061803</th>
<th align="center">321JP061904</th>
<th align="center">321JP080305</th>
<th align="center">321JR070305</th>
<th align="center">321JV021803</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">321JW083003</th>
<th align="center">321KB112204</th>
<th align="center">321KJ012703</th>
<th align="center">321KW062503</th>
<th align="center">321LU072702</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">321MC022705</th>
<th align="center">321MS081705</th>
<th align="center">321PP043003</th>
<th align="center">321PS042604</th>
<th align="center">321RG070304</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">321RR031305</th>
<th align="center">321SD072204</th>
<th align="center">321SO020203</th>
<th align="center">321SS042805</th>
<th align="center">321SS081303</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">321ST081905</th>
<th align="center">321ST100104</th>
<th align="center">321SW012403</th>
<th align="center">321TD053102</th>
<th align="center">321TG070305</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">321TN073104</th>
<th align="center">321TV110604</th>
<th align="center">321VA082703</th>
<th align="center">321YW081805</th>
<th align="center">321ZJ092702</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">322AA050505</th>
<th align="center">322AC113004</th>
<th align="center">322AG102504</th>
<th align="center">322AN020604</th>
<th align="center">322AT111104</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">322AW040605</th>
<th align="center">322BN030103</th>
<th align="center">322BR081304</th>
<th align="center">322CB010105</th>
<th align="center">322CB083004</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">322CJ222204</th>
<th align="center">322CM041604</th>
<th align="center">322CM080803</th>
<th align="center">322CR121504</th>
<th align="center">322CT072705</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">322DB062904</th>
<th align="center">322DM050605</th>
<th align="center">322DS062904</th>
<th align="center">322EL080503</th>
<th align="center">322EM020705</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">322ER102304</th>
<th align="center">322GG110304</th>
<th align="center">322HE123102</th>
<th align="center">322HM032905</th>
<th align="center">322HO022005</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">322HS040405</th>
<th align="center">322IM020401</th>
<th align="center">322JB102904</th>
<th align="center">322JC083104</th>
<th align="center">322JP020504</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">322JW041704</th>
<th align="center">322KM030103</th>
<th align="center">322KM030405</th>
<th align="center">322KM040604</th>
<th align="center">322KS101602</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">322KT041403</th>
<th align="center">322LB060105</th>
<th align="center">322LD120204</th>
<th align="center">322LD122603</th>
<th align="center">322LN080204</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">322LS071802</th>
<th align="center">322MC020204</th>
<th align="center">322MM101404</th>
<th align="center">322MR071804</th>
<th align="center">322MT120205</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">322NB010805</th>
<th align="center">322NB061103</th>
<th align="center">322RN072805</th>
<th align="center">322SG333305</th>
<th align="center">322SS091203</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:97%;">
<caption>Table continues below</caption>
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">322SW121306</th>
<th align="center">322TG060904</th>
<th align="center">322TH052216</th>
<th align="center">322TM050405</th>
<th align="center">322TR072404</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:78%;">
<colgroup>
<col width="19%" />
<col width="19%" />
<col width="19%" />
<col width="19%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">322TS032304</th>
<th align="center">322ZM091203</th>
<th align="center">322ZR012404</th>
<th align="center">322ZR120704</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

``` r
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
    ## #   for ${q://QID1/ChoiceTextEntryValue} who attends, ... <int>,
    ## #   Q_INTENS_READ <chr>, Q_READ_1 <chr>, Q_READ_1_ADV <chr>,
    ## #   Q_READ_2 <chr>, Q_READ_2_ADV <chr>, Q_READ_3 <chr>,
    ## #   Q_READ_3_ADV <chr>, Q_free_reading1 <chr>, Q_free_reading2 <chr>,
    ## #   Q_DELAESOL_READ <chr>, S_INTENS_READ <chr>, S_Read_1 <chr>,
    ## #   S_READ_1_ADV <chr>, S_READ_2 <chr>, S_READ_2_ADV <chr>,
    ## #   S_Read_3 <chr>, S_READ_3_ADV <chr>, S_free_reading1 <chr>,
    ## #   S_free_reading2 <chr>, The following is a  list of standard Middle
    ## #   School Reading Courses for Grades 6-8 : Semester Grade-<strong>M/J DE
    ## #   LA ESOL-READ</strong> <chr>, You are entering data
    ## #   for ${q://QID1/ChoiceTextEntryValue} who attends, ..._1 <int>,
    ## #   Q_LANGARTS-1_ESOL <chr>, Q_LANGARTS_2_ESOL <chr>,
    ## #   Q_LANGARTS_3_ESOL <chr>, Q_DEVELOPMENTAL_LANGARTS_ESOL <chr>,
    ## #   Q_LANG_ARTS_1 <chr>, Q_LANG_ARTS_1_ADV <chr>, Q_LANGARTS_2 <chr>,
    ## #   Q_LANG_ARTS_2_ADV <chr>, Q_LANG_ARTS_3 <chr>, Q_LANG_ARTS_3_ADv <chr>,
    ## #   Q_ENG_2_CAMB_SEC_2 <chr>, Q_IB MYP LANG LIT 1 <chr>, Q_ENG 1 CAMB SEC
    ## #   1 <chr>, Q_IB MYP LANG & LIT 3 <chr>, Q_IB MYP LANG & LIT 2 <chr>,
    ## #   Q_ENG 3 CAMB SEC 3 <chr>, Q_INTENS_LANGARTS <chr>, Q_free_lang1 <chr>,
    ## #   Q_free_lang2 <chr>, Q_LANG ARTS TRAN <chr>, Q_DE LANG ARTS ESOL <chr>,
    ## #   blankspace <chr>, S_LANGARTS-1_ESOL <chr>, S_LANGARTS_2_ESOL <chr>,
    ## #   S_LANGARTS_3_ESOL <chr>, S_DEVELOPMENTAL_LANGARTS_ESOL <chr>,
    ## #   S_LANG_ARTS_1 <chr>, S_LANG_ARTS_1_ADV <chr>, S_LANG_ARTS_2_ADV <chr>,
    ## #   S_LANG_ARTS_3 <chr>, S_LANG_ARTS_3_ADv <chr>,
    ## #   S_ENG_2_CAMB_SEC_2 <chr>, S_IB MYP LANG LIT 1 <chr>, S_ENG 1 CAMB SEC
    ## #   1 <chr>, S_IB MYP LANG & LIT 3 <chr>, S_IB MYP LANG & LIT 2 <chr>,
    ## #   S_ENG 3 CAMB SEC 3 <chr>, S_INTENS_LANGARTS <chr>, S_free_lang1 <chr>,
    ## #   S_free_lang2 <chr>, S_LANG ARTS TRAN <chr>, S_DE LANG ARTS ESOL <chr>,
    ## #   X88 <chr>

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

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    489 obs. of  6 variables:
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

    ## [1] 1.856851

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

    ## [1] 0.99591

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
    gather("q_reading_course", "Grade",25:31, 34) %>% #gather reading columns and put them in row
    select(7,13:16, 81:82) #select reading columns
    

names(q2_reading)
```

    ## [1] "reading_avg"      "council"          "girl_code"       
    ## [4] "school"           "enrolled"         "q_reading_course"
    ## [7] "Grade"

``` r
dim(q2_reading)
```

    ## [1] 3912    7

``` r
q2_reading <-na.omit(q2_reading) #get rid of cases with no data




dim(q2_reading)
```

    ## [1] 200   7

``` r
q2_reading
```

    ## # A tibble: 200 × 7
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
    ## # ... with 190 more rows, and 2 more variables: q_reading_course <chr>,
    ## #   Grade <chr>

``` r
q2_freereading <- q2_data %>%
    select(7,13:16, 32:33) #select free enter
    
q2_freereading <- q2_freereading[,c(1,2,3,4,5,7,6)] #re-arrange columns to make them align with q2 readind df

q2_freereading <- q2_freereading %>%
    rename("reading_course" = Q_free_reading2) %>% #rename to match q2_reading
    rename("Grade" = Q_free_reading1) #rename to match q2_reading
    

dim(q2_freereading)
```

    ## [1] 489   7

``` r
q2_freereading <- na.omit(q2_freereading) #clean up to find cases with data



dim(q2_freereading)
```

    ## [1] 31  7

``` r
q2_freereading
```

    ## # A tibble: 31 × 7
    ##    reading_avg              council   girl_code       school   enrolled
    ##          <int>                <chr>       <chr>        <chr>      <chr>
    ## 1            0 West Central Council 320MG041503 Young Middle 10/29/2016
    ## 2            0 West Central Council 320SA080203 Young Middle 10/21/2016
    ## 3            0 West Central Council 320SB050304 Young Middle 10/21/2016
    ## 4            0 West Central Council 320SB122902 Young Middle 10/21/2016
    ## 5            0 West Central Council 320SC072304 Young Middle 10/21/2016
    ## 6            0 West Central Council   320120104 Young Middle 10/21/2016
    ## 7            0 West Central Council 320SD102802 Young Middle 10/21/2016
    ## 8            0 West Central Council 320TG100703 Young Middle 10/29/2016
    ## 9            0 West Central Council 320SF041404 Young Middle 10/21/2016
    ## 10           0 West Central Council 320TJ071403 Young Middle 10/21/2016
    ## # ... with 21 more rows, and 2 more variables: reading_course <chr>,
    ## #   Grade <chr>

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

    ## [1] 200   7

Semester Reading Grades
-----------------------

``` r
s2_reading <- q2_data %>%
    gather("q_reading_course", "Grade",35:41) %>%  #gather reading columns and put them in row
    select(7,13:16, 82:83) #select reading columns

s2_reading <-na.omit(s2_reading) #get rid of cases with no data

#dim(s2_reading)


#dim(s2_reading)
```

### semester free read

``` r
q2_data$S_free_reading1
```

    ##   [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [24] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [47] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [70] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [93] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [116] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [139] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [162] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [185] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [208] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [231] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [254] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [277] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [300] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [323] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [346] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [369] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [392] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [415] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [438] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [461] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [484] NA NA NA NA NA NA

``` r
dim(q2_data)
```

    ## [1] 489  88

``` r
s2_freereading <- q2_data %>%
    select(7,13:16, 42:43) #select free enter

names(s2_freereading)
```

    ## [1] "reading_avg"     "council"         "girl_code"       "school"         
    ## [5] "enrolled"        "S_free_reading1" "S_free_reading2"

``` r
s2_freereading$S_free_reading1
```

    ##   [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [24] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [47] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [70] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [93] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [116] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [139] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [162] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [185] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [208] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [231] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [254] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [277] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [300] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [323] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [346] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [369] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [392] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [415] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [438] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [461] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [484] NA NA NA NA NA NA

``` r
s2_freereading_1 <- s2_freereading %>%
    rename("reading_course" = S_free_reading2) %>% #rename to match q2_reading
    rename("Grade" = S_free_reading1) #rename to match q2_reading
    
s2_freereading_1
```

    ## # A tibble: 489 × 7
    ##    reading_avg           council   girl_code school   enrolled Grade
    ##          <int>             <chr>       <chr>  <chr>      <chr> <chr>
    ## 1            0 Panhandle Council 322MR071804  Jinks 02/08/2017  <NA>
    ## 2            0 Panhandle Council 322CM080803  Jinks 02/08/2017  <NA>
    ## 3            0 Panhandle Council 322EL080503  Jinks 02/08/2017  <NA>
    ## 4            0 Panhandle Council 322LN080204  Jinks 02/08/2017  <NA>
    ## 5            0 Panhandle Council 322TH052216  Jinks 02/08/2017  <NA>
    ## 6            0 Panhandle Council 322CT072705  Jinks 02/08/2017  <NA>
    ## 7            0 Panhandle Council 322GG110304  Jinks 02/08/2017  <NA>
    ## 8            0 Panhandle Council 322KM040604  Jinks 02/08/2017  <NA>
    ## 9            0 Panhandle Council 322AC113004  Jinks 02/08/2017  <NA>
    ## 10           0   Gateway Council 322SW121306  Jinks 02/08/2017  <NA>
    ## # ... with 479 more rows, and 1 more variables: reading_course <chr>

``` r
s2_freereading_1 <- s2_freereading[grep("READ", s2_freereading_1$reading_course, ignore.case = TRUE),]

s2_freereading_1
```

    ## # A tibble: 31 × 7
    ##    reading_avg              council   girl_code       school   enrolled
    ##          <int>                <chr>       <chr>        <chr>      <chr>
    ## 1            0 West Central Council 320MG041503 Young Middle 10/29/2016
    ## 2            0 West Central Council 320SA080203 Young Middle 10/21/2016
    ## 3            0 West Central Council 320SB050304 Young Middle 10/21/2016
    ## 4            0 West Central Council 320SB122902 Young Middle 10/21/2016
    ## 5            0 West Central Council 320SC072304 Young Middle 10/21/2016
    ## 6            0 West Central Council   320120104 Young Middle 10/21/2016
    ## 7            0 West Central Council 320SD102802 Young Middle 10/21/2016
    ## 8            0 West Central Council 320TG100703 Young Middle 10/29/2016
    ## 9            0 West Central Council 320SF041404 Young Middle 10/21/2016
    ## 10           0 West Central Council 320TJ071403 Young Middle 10/21/2016
    ## # ... with 21 more rows, and 2 more variables: S_free_reading1 <chr>,
    ## #   S_free_reading2 <chr>

``` r
#names(s2_freereading)
    
#s2_freereading <- s2_freereading[,c(1,2,3,4,5,7,6)] #re-arrange columns to make them align with q2 readind df
```

``` r
q2_reading_all <- rbind(s2_reading, q2_reading)
```

``` r
q2_reading <- q2_reading_all %>%
    filter(Grade != "Did not mean to select this course")


q2_reading
```

    ## # A tibble: 292 × 7
    ##    reading_avg              council    girl_code          school
    ##          <int>                <chr>        <chr>           <chr>
    ## 1            0 West Central Council 3202BD062105 KATHLEEN MIDDLE
    ## 2            0 West Central Council  320NC122104 KATHLEEN MIDDLE
    ## 3            0 West Central Council  320SD031905 KATHLEEN MIDDLE
    ## 4            0 West Central Council  320KE060905 KATHLEEN MIDDLE
    ## 5            0 West Central Council  320AG062003 KATHLEEN MIDDLE
    ## 6            0 West Central Council  320KJ042505 KATHLEEN MIDDLE
    ## 7            0 West Central Council  3202J080502 KATHLEEN MIDDLE
    ## 8            0 West Central Council  320YL070603 KATHLEEN MIDDLE
    ## 9            0 West Central Council  320MM051204 KATHLEEN MIDDLE
    ## 10           0 West Central Council  320KM090403 KATHLEEN MIDDLE
    ## # ... with 282 more rows, and 3 more variables: enrolled <chr>,
    ## #   q_reading_course <chr>, Grade <chr>

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
    ## 1             0 West Central Council 3202BD062105 KATHLEEN MIDDLE
    ## 2             0 West Central Council  320NC122104 KATHLEEN MIDDLE
    ## 3             0 West Central Council  320SD031905 KATHLEEN MIDDLE
    ## 4             0 West Central Council  320KE060905 KATHLEEN MIDDLE
    ## 5             0 West Central Council  320AG062003 KATHLEEN MIDDLE
    ## 6             0 West Central Council  320KJ042505 KATHLEEN MIDDLE
    ## 7             0 West Central Council  3202J080502 KATHLEEN MIDDLE
    ## 8             0 West Central Council  320YL070603 KATHLEEN MIDDLE
    ## 9             0 West Central Council  320MM051204 KATHLEEN MIDDLE
    ## 10            0 West Central Council  320KM090403 KATHLEEN MIDDLE
    ## 11            0 West Central Council  320TM070503 KATHLEEN MIDDLE
    ## 12            0 West Central Council  320AM041503 KATHLEEN MIDDLE
    ## 13            0 West Central Council  320JM111104 KATHLEEN MIDDLE
    ## 14            0 West Central Council  320SN033104 KATHLEEN MIDDLE
    ## 15            0 West Central Council  320DP061004 KATHLEEN MIDDLE
    ## 16            0 West Central Council  320DP090403 KATHLEEN MIDDLE
    ## 17            0 West Central Council  320MS121104 KATHLEEN MIDDLE
    ## 18            0 West Central Council  320AT081904 KATHLEEN MIDDLE
    ## 19            0 West Central Council  320KT102004 KATHLEEN MIDDLE
    ## 20            0 West Central Council  320DT060204 KATHLEEN MIDDLE
    ## 21            0 West Central Council  320SV121102 KATHLEEN MIDDLE
    ## 22            0 West Central Council  320SW043004 KATHLEEN MIDDLE
    ## 23            0 West Central Council  320SW041705 KATHLEEN MIDDLE
    ## 24            0    Southeast Council  321VA082703              LL
    ## 25            0 West Central Council  320LA021505   BLAKE ACADEMY
    ## 26            0 West Central Council  320NC041704   Blake Academy
    ## 27            0 West Central Council  320AV040205   Blake Academy
    ## 28            0 West Central Council  320SG022305   Blake Academy
    ## 29            0 West Central Council  320AH071505   Blake Academy
    ## 30            0 West Central Council  320CI061405   Blake Academy
    ## 31            0 West Central Council  320DJ040604   Blake Academy
    ## 32            0 West Central Council  320AM031505   Blake Academy
    ## 33            0 West Central Council  320CP041705   Blake Academy
    ## 34            0 West Central Council  320VS052505   Blake Academy
    ## 35            0 West Central Council  320AW072404   Blake Academy
    ## 36            0 West Central Council  320FB032204   Blake Academy
    ## 37            0 West Central Council  320CR022204   Blake Academy
    ## 38            0 West Central Council  320CM120402   Blake Academy
    ## 39            0 West Central Council  320LP101802   Blake Academy
    ## 40            0 West Central Council  320AT101602   Blake Academy
    ## 41            0 West Central Council  320NR060503   Blake Academy
    ## 42            0    Panhandle Council  322AG102504         Everitt
    ## 43            0      Gateway Council  313TB011705      THE BRIDGE
    ## 44            0      Gateway Council  313SH050805      THE BRIDGE
    ## 45            0      Gateway Council  313SH060304      THE BRIDGE
    ## 46            0      Gateway Council  313DJ091703      THE BRIDGE
    ## 47            0      Gateway Council  313KK122904      THE BRIDGE
    ## 48            0      Gateway Council  313AT020105      THE BRIDGE
    ## 49            0      Gateway Council  313CB010204       LAKESHORE
    ## 50            0      Gateway Council  313RB122804       LAKESHORE
    ## 51            0      Gateway Council  313AC070604       LAKESHORE
    ## 52            0      Gateway Council  313AD110204       LAKESHORE
    ## 53            0      Gateway Council  313JF121503       LAKESHORE
    ## 54            0      Gateway Council  313BH010904       LAKESHORE
    ## 55            0      Gateway Council  313AT102804       LAKESHORE
    ## 56            0      Gateway Council  313NA113005 MATTHEW GILBERT
    ## 57            0      Gateway Council  313MG081605          BUTLER
    ## 58            0      Gateway Council  313LM071304          BUTLER
    ## 59            0      Gateway Council  313PS042205          BUTLER
    ## 60            0      Gateway Council  313JA070105          BUTLER
    ## 61            0      Gateway Council  313DB051704      JEFF DAVIS
    ## 62            0      Gateway Council  313JC090403       STILLWELL
    ## 63            0      Gateway Council  313TB121603      JEB STUART
    ## 64            0      Gateway Council  313JS043004      JEB STUART
    ## 65            0      Gateway Council  313KO040704      JEB STUART
    ## 66            0      Gateway Council  313DB060804      JEB STUART
    ## 67            0      Gateway Council  313ZG041304      JEB STUART
    ## 68            0      Gateway Council  313PM021605      JEB STUART
    ## 69            0      Gateway Council  313MS030606      JEB STUART
    ## 70            0 West Central Council  320SA090704 KATHLEEN MIDDLE
    ## 71            0 West Central Council  320BM032505 KATHLEEN MIDDLE
    ## 72            0 West Central Council  3202N012805 KATHLEEN MIDDLE
    ## 73            0 West Central Council  320VR031805 KATHLEEN MIDDLE
    ## 74            0 West Central Council  320JA020205   BLAKE ACADMEY
    ## 75            0 West Central Council  320RF032305   Blake Academy
    ## 76            0 West Central Council  320CG072705   Blake Academy
    ## 77            0 West Central Council  320AW071205   Blake Academy
    ## 78            0      Gateway Council  313MA090303      THE BRIDGE
    ## 79            0      Gateway Council  313CH121603      THE BRIDGE
    ## 80            0      Gateway Council  313EO080204      THE BRIDGE
    ## 81            0      Gateway Council  313DP021104      THE BRIDGE
    ## 82            0      Gateway Council  313YR043004      THE BRIDGE
    ## 83            0      Gateway Council  313KT081504      THE BRIDGE
    ## 84            0      Gateway Council  313YK062304 MATTHEW GILBERT
    ## 85            0      Gateway Council  313RR042804 MATTHEW GILBERT
    ## 86            0      Gateway Council  313MT072302 MATTHEW GILBERT
    ## 87            0      Gateway Council  313LB031704 MATTHEW GILBERT
    ## 88            0      Gateway Council  313SB112203      JEFF DAVIS
    ## 89            0      Gateway Council  313MB080504      JEFF DAVIS
    ## 90            0      Gateway Council  313KF050404      JEFF DAVIS
    ## 91            0      Gateway Council  313TL030304      JEFF DAVIS
    ## 92            0      Gateway Council  313RJ070404       STILLWELL
    ## 93            0      Gateway Council  313JR042804       STILLWELL
    ## 94            0      Gateway Council  313KR112103      JEB STUART
    ## 95            0      Gateway Council  313LS033104      JEB STUART
    ## 96            0      Gateway Council  313ET062404      JEB STUART
    ## 97            0 West Central Council  320MC121603 KATHLEEN MIDDLE
    ## 98            0      Gateway Council  313JB110302      THE BRIDGE
    ## 99            0      Gateway Council  313AK041202      THE BRIDGE
    ## 100           0      Gateway Council  313PS082702      JEFF DAVIS
    ## 101           0      Gateway Council  313RG060502      JEFF DAVIS
    ## 102           0      Gateway Council  313DS083103      JEFF DAVIS
    ## 103           0      Gateway Council  313AK021702       STILLWELL
    ## 104           0      Gateway Council  313IS050500      JEB STUART
    ## 105           0      Gateway Council  313DH122500      JEB STUART
    ## 106           0      Gateway Council  313AS022503      JEB STUART
    ## 107           0 West Central Council  320AB061103   Blake Academy
    ## 108           0 West Central Council  320EF042903   Blake Academy
    ## 109           0 West Central Council  320AM072903   Blake Academy
    ## 110           0 West Central Council  320BR072103   Blake Academy
    ## 111           0    Panhandle Council  322MR071804           Jinks
    ## 112           0    Panhandle Council  322EL080503           Jinks
    ## 113           0    Panhandle Council  322TH052216           Jinks
    ## 114           0    Panhandle Council  322CT072705           Jinks
    ## 115           0    Panhandle Council  322AC113004           Jinks
    ## 116           0      Gateway Council  322SW121306           Jinks
    ## 117           0    Panhandle Council  322CR121504           Jinks
    ## 118           0    Panhandle Council  322MC020204           Jinks
    ## 119           0    Panhandle Council  322TR072404           Jinks
    ## 120           0    Panhandle Council  322ZR012404           Jinks
    ## 121           0 West Central Council 3202BD062105 KATHLEEN MIDDLE
    ## 122           0 West Central Council  320NC122104 KATHLEEN MIDDLE
    ## 123           0 West Central Council  320SD031905 KATHLEEN MIDDLE
    ## 124           0 West Central Council  320KE060905 KATHLEEN MIDDLE
    ## 125           0 West Central Council  320AG062003 KATHLEEN MIDDLE
    ## 126           0 West Central Council  320KJ042505 KATHLEEN MIDDLE
    ## 127           0 West Central Council  3202J080502 KATHLEEN MIDDLE
    ## 128           0 West Central Council  320YL070603 KATHLEEN MIDDLE
    ## 129           0 West Central Council  320MM051204 KATHLEEN MIDDLE
    ## 130           0 West Central Council  320KM090403 KATHLEEN MIDDLE
    ## 131           0 West Central Council  320TM070503 KATHLEEN MIDDLE
    ## 132           0 West Central Council  320AM041503 KATHLEEN MIDDLE
    ## 133           0 West Central Council  320JM111104 KATHLEEN MIDDLE
    ## 134           0 West Central Council  320SN033104 KATHLEEN MIDDLE
    ## 135           0 West Central Council  320DP061004 KATHLEEN MIDDLE
    ## 136           0 West Central Council  320DP090403 KATHLEEN MIDDLE
    ## 137           0 West Central Council  320MS121104 KATHLEEN MIDDLE
    ## 138           0 West Central Council  320AT081904 KATHLEEN MIDDLE
    ## 139           0 West Central Council  320KT102004 KATHLEEN MIDDLE
    ## 140           0 West Central Council  320DT060204 KATHLEEN MIDDLE
    ## 141           0 West Central Council  320SV121102 KATHLEEN MIDDLE
    ## 142           0 West Central Council  320SW043004 KATHLEEN MIDDLE
    ## 143           0 West Central Council  320SW041705 KATHLEEN MIDDLE
    ## 144           0    Panhandle Council  322LS071802           Jinks
    ## 145           0    Panhandle Council  322IM020401           Jinks
    ## 146           0    Panhandle Council  322NB061103           Jinks
    ## 147           0    Panhandle Council  322SG333305           Jinks
    ## 148           0    Panhandle Council  322CM041604           Jinks
    ## 149           0    Panhandle Council  322KM030103           Jinks
    ## 150           0    Panhandle Council  322BN030103           Jinks
    ## 151           0    Panhandle Council  322ZR120704           Jinks
    ## 152           0    Panhandle Council  322TS032304           Jinks
    ## 153           0    Panhandle Council  322KS101602         Everitt
    ## 154           0    Panhandle Council  322KT041403         Everitt
    ## 155           0    Panhandle Council  322JW041704         Everitt
    ## 156           0    Panhandle Council  322JC083104         Everitt
    ## 157           0    Panhandle Council  322LD120204         Everitt
    ## 158           0    Panhandle Council  322DB062904         Everitt
    ## 159           0    Panhandle Council  322JB102904         Everitt
    ## 160           0    Panhandle Council  322CB083004         Everitt
    ## 161           0    Panhandle Council  322ZM091203         Everitt
    ## 162           0    Panhandle Council  322DM050605         Everitt
    ## 163           0    Panhandle Council  322TM050405         Everitt
    ## 164           0    Panhandle Council  322RN072805         Everitt
    ## 165           0    Panhandle Council  322JP020504         Everitt
    ## 166           0    Panhandle Council  322BR081304         Everitt
    ## 167           0    Southeast Council  321VA082703              LL
    ## 168           0    Southeast Council  321TD053102              LL
    ## 169           0    Southeast Council    321012405              LL
    ## 170           0    Southeast Council  321SD072204              LL
    ## 171           0    Southeast Council  321JD101502              LL
    ## 172           0    Southeast Council  321RG070304              LL
    ## 173           0    Southeast Council  321TG070305              LL
    ## 174           0    Southeast Council  321KJ012703              LL
    ## 175           0    Southeast Council  321FJ011803              LL
    ## 176           0    Southeast Council  321ZJ092702              LL
    ## 177           0    Southeast Council  321CW071704              LL
    ## 178           0    Southeast Council  321SW012403              LL
    ## 179           0    Southeast Council  321JV021803              LL
    ## 180           0    Southeast Council  321FV022205              LL
    ## 181           0    Southeast Council  321BT100203              LL
    ## 182           0    Southeast Council  321JP061803              LL
    ## 183           0    Southeast Council  321JL041605              LL
    ## 184           0    Southeast Council  321AP011905              LL
    ## 185           0    Southeast Council  321JR070305              LL
    ## 186           0    Southeast Council  321SO020203              LL
    ## 187           0    Southeast Council  321TN073104              LL
    ## 188           0    Southeast Council  321JP080305              LL
    ## 189           0    Southeast Council  321RR031305              LL
    ## 190           0    Southeast Council  321CR101403              LL
    ## 191           0    Southeast Council  321ES020904              LL
    ## 192           0    Southeast Council  321PS042604              LL
    ## 193           0    Southeast Council  321SS042805              LL
    ## 194           0    Southeast Council  321SS081303              LL
    ## 195           0    Southeast Council  321ST100104              LL
    ## 196           0    Southeast Council  321LU072702              LL
    ## 197           0    Southeast Council  321YW081805              LL
    ## 198           0    Southeast Council  321KW062503              LL
    ## 199           0    Southeast Council  321FW062504              LL
    ## 200           0    Southeast Council  321JW083003              LL
    ## 201           0    Southeast Council  321AZ041805              LL
    ## 202           0 West Central Council  320LB062204    Young Middle
    ## 203           0 West Central Council  320KG040505    Young Middle
    ## 204           0 West Central Council  320JA101203    Young Middle
    ## 205           0 West Central Council  320LA021505   BLAKE ACADEMY
    ## 206           0 West Central Council  320NC041704   Blake Academy
    ## 207           0 West Central Council  320AV040205   Blake Academy
    ## 208           0 West Central Council  320SG022305   Blake Academy
    ## 209           0 West Central Council  320AH071505   Blake Academy
    ## 210           0 West Central Council  320CI061405   Blake Academy
    ## 211           0 West Central Council  320DJ040604   Blake Academy
    ## 212           0 West Central Council  320AM031505   Blake Academy
    ## 213           0 West Central Council  320CP041705   Blake Academy
    ## 214           0 West Central Council  320VS052505   Blake Academy
    ## 215           0 West Central Council  320AW072404   Blake Academy
    ## 216           0 West Central Council  320FB032204   Blake Academy
    ## 217           0 West Central Council  320CR022204   Blake Academy
    ## 218           0 West Central Council  320CM120402   Blake Academy
    ## 219           0 West Central Council  320LP101802   Blake Academy
    ## 220           0 West Central Council  320AT101602   Blake Academy
    ## 221           0 West Central Council  320NR060503   Blake Academy
    ## 222           0      Gateway Council  313TB011705      THE BRIDGE
    ## 223           0      Gateway Council  313SH050805      THE BRIDGE
    ## 224           0      Gateway Council  313SH060304      THE BRIDGE
    ## 225           0      Gateway Council  313DJ091703      THE BRIDGE
    ## 226           0      Gateway Council  313KK122904      THE BRIDGE
    ## 227           0      Gateway Council  313AT020105      THE BRIDGE
    ## 228           0      Gateway Council  313CB010204       LAKESHORE
    ## 229           0      Gateway Council  313RB122804       LAKESHORE
    ## 230           0      Gateway Council  313AC070604       LAKESHORE
    ## 231           0      Gateway Council  313AD110204       LAKESHORE
    ## 232           0      Gateway Council  313JF121503       LAKESHORE
    ## 233           0      Gateway Council  313BH010904       LAKESHORE
    ## 234           0      Gateway Council  313AT102804       LAKESHORE
    ## 235           0      Gateway Council  313NA113005 MATTHEW GILBERT
    ## 236           0      Gateway Council  313MG081605          BUTLER
    ## 237           0      Gateway Council  313LM071304          BUTLER
    ## 238           0      Gateway Council  313PS042205          BUTLER
    ## 239           0      Gateway Council  313JA070105          BUTLER
    ## 240           0      Gateway Council  313DB051704      JEFF DAVIS
    ## 241           0      Gateway Council  313JC090403       STILLWELL
    ## 242           0      Gateway Council  313TB121603      JEB STUART
    ## 243           0      Gateway Council  313JS043004      JEB STUART
    ## 244           0      Gateway Council  313KO040704      JEB STUART
    ## 245           0      Gateway Council  313DB060804      JEB STUART
    ## 246           0      Gateway Council  313ZG041304      JEB STUART
    ## 247           0      Gateway Council  313PM021605      JEB STUART
    ## 248           0      Gateway Council  313MS030606      JEB STUART
    ## 249           0 West Central Council  320SA090704 KATHLEEN MIDDLE
    ## 250           0 West Central Council  320BM032505 KATHLEEN MIDDLE
    ## 251           0 West Central Council  3202N012805 KATHLEEN MIDDLE
    ## 252           0 West Central Council  320VR031805 KATHLEEN MIDDLE
    ## 253           0    Panhandle Council  322AG102504         Everitt
    ## 254           0 West Central Council  320RH100404    Young Middle
    ## 255           0 West Central Council  320JA020205   BLAKE ACADMEY
    ## 256           0 West Central Council  320RF032305   Blake Academy
    ## 257           0 West Central Council  320CG072705   Blake Academy
    ## 258           0 West Central Council  320AW071205   Blake Academy
    ## 259           0      Gateway Council  313SB120603      THE BRIDGE
    ## 260           0      Gateway Council  313MA090303      THE BRIDGE
    ## 261           0      Gateway Council  313CH121603      THE BRIDGE
    ## 262           0      Gateway Council  313EO080204      THE BRIDGE
    ## 263           0      Gateway Council  313DP021104      THE BRIDGE
    ## 264           0      Gateway Council  313YR043004      THE BRIDGE
    ## 265           0      Gateway Council  313KT081504      THE BRIDGE
    ## 266           0      Gateway Council  313YK062304 MATTHEW GILBERT
    ## 267           0      Gateway Council  313RR042804 MATTHEW GILBERT
    ## 268           0      Gateway Council  313MT072302 MATTHEW GILBERT
    ## 269           0      Gateway Council  313LB031704 MATTHEW GILBERT
    ## 270           0      Gateway Council  313SB112203      JEFF DAVIS
    ## 271           0      Gateway Council  313MB080504      JEFF DAVIS
    ## 272           0      Gateway Council  313KF050404      JEFF DAVIS
    ## 273           0      Gateway Council  313TL030304      JEFF DAVIS
    ## 274           0      Gateway Council  313RJ070404       STILLWELL
    ## 275           0      Gateway Council  313JR042804       STILLWELL
    ## 276           0      Gateway Council  313KR112103      JEB STUART
    ## 277           0      Gateway Council  313LS033104      JEB STUART
    ## 278           0      Gateway Council  313ET062404      JEB STUART
    ## 279           0 West Central Council  320MC121603 KATHLEEN MIDDLE
    ## 280           0      Gateway Council  313JB110302      THE BRIDGE
    ## 281           0      Gateway Council  313AK041202      THE BRIDGE
    ## 282           0      Gateway Council  313PS082702      JEFF DAVIS
    ## 283           0      Gateway Council  313RG060502      JEFF DAVIS
    ## 284           0      Gateway Council  313DS083103      JEFF DAVIS
    ## 285           0      Gateway Council  313AK021702       STILLWELL
    ## 286           0      Gateway Council  313IS050500      JEB STUART
    ## 287           0      Gateway Council  313DH122500      JEB STUART
    ## 288           0      Gateway Council  313AS022503      JEB STUART
    ## 289           0 West Central Council  320AB061103   Blake Academy
    ## 290           0 West Central Council  320EF042903   Blake Academy
    ## 291           0 West Central Council  320AM072903   Blake Academy
    ## 292           0 West Central Council  320BR072103   Blake Academy
    ##       enrolled q_reading_course Grade reading_pts
    ## 1   11/01/2016    S_INTENS_READ     B           3
    ## 2   11/01/2016    S_INTENS_READ     C           2
    ## 3   11/01/2017    S_INTENS_READ     A           4
    ## 4   11/01/2016    S_INTENS_READ     C           2
    ## 5   11/01/2016    S_INTENS_READ     A           4
    ## 6   11/01/2016    S_INTENS_READ     C           2
    ## 7   11/01/2016    S_INTENS_READ     A           4
    ## 8   11/01/2016    S_INTENS_READ     C           2
    ## 9   11/01/2016    S_INTENS_READ     B           3
    ## 10  11/01/2016    S_INTENS_READ     B           3
    ## 11  11/01/2016    S_INTENS_READ     B           3
    ## 12  11/01/2016    S_INTENS_READ     A           4
    ## 13  11/01/2016    S_INTENS_READ     C           2
    ## 14  11/01/2016    S_INTENS_READ     A           4
    ## 15  11/01/2016    S_INTENS_READ     A           4
    ## 16  11/01/2016    S_INTENS_READ     B           3
    ## 17  11/01/2016    S_INTENS_READ     C           2
    ## 18  11/01/2016    S_INTENS_READ     B           3
    ## 19  11/01/2016    S_INTENS_READ     B           3
    ## 20  11/01/2016    S_INTENS_READ     A           4
    ## 21  11/01/2016    S_INTENS_READ     B           3
    ## 22  11/01/2016    S_INTENS_READ     B           3
    ## 23  11/01/2016    S_INTENS_READ     A           4
    ## 24  10/20/2016    S_INTENS_READ     B           3
    ## 25  10/01/2016    S_INTENS_READ     F           0
    ## 26  08/01/2016    S_INTENS_READ     C           2
    ## 27  08/01/2016    S_INTENS_READ     C           2
    ## 28  08/01/2016    S_INTENS_READ     D           1
    ## 29  08/01/2016    S_INTENS_READ     C           2
    ## 30  08/01/2016    S_INTENS_READ     D           1
    ## 31  08/01/2016    S_INTENS_READ     F           0
    ## 32  08/01/2016    S_INTENS_READ     C           2
    ## 33  08/01/2016    S_INTENS_READ     C           2
    ## 34  08/01/2016    S_INTENS_READ     C           2
    ## 35  08/01/2016    S_INTENS_READ     F           0
    ## 36  08/01/2016    S_INTENS_READ     B           3
    ## 37  08/01/2016    S_INTENS_READ     C           2
    ## 38  08/01/2016    S_INTENS_READ     C           2
    ## 39  08/01/2016    S_INTENS_READ     C           2
    ## 40  08/01/2016    S_INTENS_READ     D           1
    ## 41  08/01/2016    S_INTENS_READ     D           1
    ## 42  02/08/2017         S_Read_1     F           0
    ## 43  09/06/2016         S_Read_1     D           1
    ## 44  09/06/2016         S_Read_1     C           2
    ## 45  09/06/2016         S_Read_1     C           2
    ## 46  09/06/2016         S_Read_1     B           3
    ## 47  09/06/2016         S_Read_1     B           3
    ## 48  09/06/2016         S_Read_1     C           2
    ## 49  09/06/2016         S_Read_1     C           2
    ## 50  09/06/2016         S_Read_1     C           2
    ## 51  09/06/2016         S_Read_1     C           2
    ## 52  09/06/2016         S_Read_1     C           2
    ## 53  09/06/2016         S_Read_1     C           2
    ## 54  09/06/2016         S_Read_1     D           1
    ## 55  09/06/2016         S_Read_1     C           2
    ## 56  09/06/2016         S_Read_1     C           2
    ## 57  09/06/2016         S_Read_1     C           2
    ## 58  09/06/2016         S_Read_1     C           2
    ## 59  09/06/2016         S_Read_1     B           3
    ## 60  09/06/2016         S_Read_1     C           2
    ## 61  09/06/2016         S_Read_1     C           2
    ## 62  09/06/2016         S_Read_1     B           3
    ## 63  09/06/2016         S_Read_1     C           2
    ## 64  09/06/2016         S_Read_1     B           3
    ## 65  09/06/2016         S_Read_1     A           4
    ## 66  09/06/2016         S_Read_1     C           2
    ## 67  09/06/2016         S_Read_1     C           2
    ## 68  09/06/2016         S_Read_1     D           1
    ## 69  09/06/2016         S_Read_1     C           2
    ## 70  11/01/2016     S_READ_1_ADV     B           3
    ## 71  11/01/2016     S_READ_1_ADV     B           3
    ## 72  11/01/2016     S_READ_1_ADV     B           3
    ## 73  11/01/2016     S_READ_1_ADV     B           3
    ## 74  10/01/2016     S_READ_1_ADV     C           2
    ## 75  08/01/2016     S_READ_1_ADV     C           2
    ## 76  08/01/2016     S_READ_1_ADV     C           2
    ## 77  08/01/2016     S_READ_1_ADV     F           0
    ## 78  09/06/2016         S_READ_2     C           2
    ## 79  09/06/2016         S_READ_2     B           3
    ## 80  09/06/2016         S_READ_2     D           1
    ## 81  09/06/2016         S_READ_2     C           2
    ## 82  09/06/2016         S_READ_2     D           1
    ## 83  09/06/2016         S_READ_2     C           2
    ## 84  09/06/2016         S_READ_2     C           2
    ## 85  09/06/2016         S_READ_2     C           2
    ## 86  09/06/2016         S_READ_2     C           2
    ## 87  09/06/2016         S_READ_2     C           2
    ## 88  09/06/2016         S_READ_2     B           3
    ## 89  09/06/2016         S_READ_2     C           2
    ## 90  09/06/2016         S_READ_2     C           2
    ## 91  09/06/2016         S_READ_2     D           1
    ## 92  09/06/2016         S_READ_2     B           3
    ## 93  09/06/2016         S_READ_2     C           2
    ## 94  09/06/2016         S_READ_2     C           2
    ## 95  09/06/2016         S_READ_2     C           2
    ## 96  09/06/2016         S_READ_2     D           1
    ## 97  11/01/2016     S_READ_2_ADV     A           4
    ## 98  09/06/2016         S_Read_3     C           2
    ## 99  09/06/2016         S_Read_3     C           2
    ## 100 09/06/2016         S_Read_3     C           2
    ## 101 09/06/2016         S_Read_3     C           2
    ## 102 09/06/2016         S_Read_3     C           2
    ## 103 09/26/2016         S_Read_3     C           2
    ## 104 09/06/2016         S_Read_3     C           2
    ## 105 09/06/2016         S_Read_3     B           3
    ## 106 09/06/2016         S_Read_3     B           3
    ## 107 08/01/2016     S_READ_3_ADV     A           4
    ## 108 08/01/2016     S_READ_3_ADV     B           3
    ## 109 08/01/2016     S_READ_3_ADV     D           1
    ## 110 08/01/2016     S_READ_3_ADV     A           4
    ## 111 02/08/2017    Q_INTENS_READ     B           3
    ## 112 02/08/2017    Q_INTENS_READ     B           3
    ## 113 02/08/2017    Q_INTENS_READ     B           3
    ## 114 02/08/2017    Q_INTENS_READ     B           3
    ## 115 02/08/2017    Q_INTENS_READ     A           4
    ## 116 02/08/2017    Q_INTENS_READ     B           3
    ## 117 02/08/2017    Q_INTENS_READ     C           2
    ## 118 02/08/2017    Q_INTENS_READ     D           1
    ## 119 02/08/2017    Q_INTENS_READ     B           3
    ## 120 02/08/2017    Q_INTENS_READ     B           3
    ## 121 11/01/2016    Q_INTENS_READ     B           3
    ## 122 11/01/2016    Q_INTENS_READ     C           2
    ## 123 11/01/2017    Q_INTENS_READ     B           3
    ## 124 11/01/2016    Q_INTENS_READ     C           2
    ## 125 11/01/2016    Q_INTENS_READ     A           4
    ## 126 11/01/2016    Q_INTENS_READ     C           2
    ## 127 11/01/2016    Q_INTENS_READ     A           4
    ## 128 11/01/2016    Q_INTENS_READ     C           2
    ## 129 11/01/2016    Q_INTENS_READ     C           2
    ## 130 11/01/2016    Q_INTENS_READ     C           2
    ## 131 11/01/2016    Q_INTENS_READ     B           3
    ## 132 11/01/2016    Q_INTENS_READ     A           4
    ## 133 11/01/2016    Q_INTENS_READ     C           2
    ## 134 11/01/2016    Q_INTENS_READ     A           4
    ## 135 11/01/2016    Q_INTENS_READ     A           4
    ## 136 11/01/2016    Q_INTENS_READ     B           3
    ## 137 11/01/2016    Q_INTENS_READ     C           2
    ## 138 11/01/2016    Q_INTENS_READ     B           3
    ## 139 11/01/2016    Q_INTENS_READ     C           2
    ## 140 11/01/2016    Q_INTENS_READ     B           3
    ## 141 11/01/2016    Q_INTENS_READ     B           3
    ## 142 11/01/2016    Q_INTENS_READ     C           2
    ## 143 11/01/2016    Q_INTENS_READ     A           4
    ## 144 02/08/2017    Q_INTENS_READ     C           2
    ## 145 02/08/2017    Q_INTENS_READ     C           2
    ## 146 02/08/2017    Q_INTENS_READ     C           2
    ## 147 02/08/2017    Q_INTENS_READ     A           4
    ## 148 02/08/2017    Q_INTENS_READ     B           3
    ## 149 02/08/2017    Q_INTENS_READ     D           1
    ## 150 02/08/2017    Q_INTENS_READ     C           2
    ## 151 02/08/2017    Q_INTENS_READ     C           2
    ## 152 02/08/2017    Q_INTENS_READ     B           3
    ## 153 02/08/2017    Q_INTENS_READ     D           1
    ## 154 02/08/2017    Q_INTENS_READ     B           3
    ## 155 02/08/2017    Q_INTENS_READ     C           2
    ## 156 02/08/2017    Q_INTENS_READ     C           2
    ## 157 02/08/2017    Q_INTENS_READ     D           1
    ## 158 02/08/2017    Q_INTENS_READ     C           2
    ## 159 02/08/2017    Q_INTENS_READ     A           4
    ## 160 02/08/2017    Q_INTENS_READ     A           4
    ## 161 02/08/2017    Q_INTENS_READ     C           2
    ## 162 02/08/2017    Q_INTENS_READ     B           3
    ## 163 02/08/2017    Q_INTENS_READ     B           3
    ## 164 02/08/2017    Q_INTENS_READ     C           2
    ## 165 02/08/2017    Q_INTENS_READ     B           3
    ## 166 02/08/2017    Q_INTENS_READ     C           2
    ## 167 10/20/2016    Q_INTENS_READ     B           3
    ## 168 10/20/2016    Q_INTENS_READ     C           2
    ## 169 10/20/2016    Q_INTENS_READ     B           3
    ## 170 10/20/2016    Q_INTENS_READ     B           3
    ## 171 10/20/2016    Q_INTENS_READ     B           3
    ## 172 10/20/2016    Q_INTENS_READ     B           3
    ## 173 10/20/2016    Q_INTENS_READ     A           4
    ## 174 10/20/2016    Q_INTENS_READ     A           4
    ## 175 10/20/2016    Q_INTENS_READ     A           4
    ## 176 10/20/2016    Q_INTENS_READ     A           4
    ## 177 10/20/2016    Q_INTENS_READ     B           3
    ## 178 10/20/2016    Q_INTENS_READ     C           2
    ## 179 10/20/2016    Q_INTENS_READ     B           3
    ## 180 10/20/2016    Q_INTENS_READ     B           3
    ## 181 10/20/2016    Q_INTENS_READ     D           1
    ## 182 10/20/2016    Q_INTENS_READ     B           3
    ## 183 10/20/2016    Q_INTENS_READ     C           2
    ## 184 10/20/2016    Q_INTENS_READ     C           2
    ## 185 10/20/2016    Q_INTENS_READ     C           2
    ## 186 10/20/2016    Q_INTENS_READ     C           2
    ## 187 10/20/2016    Q_INTENS_READ     B           3
    ## 188 10/20/2016    Q_INTENS_READ     C           2
    ## 189 10/20/2016    Q_INTENS_READ     D           1
    ## 190 10/20/2016    Q_INTENS_READ     B           3
    ## 191 10/20/2016    Q_INTENS_READ     C           2
    ## 192 10/20/2016    Q_INTENS_READ     A           4
    ## 193 10/20/2016    Q_INTENS_READ     A           4
    ## 194 10/20/2016    Q_INTENS_READ     D           1
    ## 195 10/20/2016    Q_INTENS_READ     B           3
    ## 196 10/20/2016    Q_INTENS_READ     C           2
    ## 197 10/20/2016    Q_INTENS_READ     C           2
    ## 198 10/20/2016    Q_INTENS_READ     B           3
    ## 199 10/20/2016    Q_INTENS_READ     C           2
    ## 200 10/20/2016    Q_INTENS_READ     A           4
    ## 201 10/20/2016    Q_INTENS_READ     A           4
    ## 202 10/21/2016    Q_INTENS_READ     C           2
    ## 203 10/21/2016    Q_INTENS_READ     A           4
    ## 204 10/21/2016    Q_INTENS_READ     B           3
    ## 205 10/01/2016    Q_INTENS_READ     F           0
    ## 206 08/01/2016    Q_INTENS_READ     C           2
    ## 207 08/01/2016    Q_INTENS_READ     C           2
    ## 208 08/01/2016    Q_INTENS_READ     D           1
    ## 209 08/01/2016    Q_INTENS_READ     C           2
    ## 210 08/01/2016    Q_INTENS_READ     F           0
    ## 211 08/01/2016    Q_INTENS_READ     F           0
    ## 212 08/01/2016    Q_INTENS_READ     C           2
    ## 213 08/01/2016    Q_INTENS_READ     B           3
    ## 214 08/01/2016    Q_INTENS_READ     C           2
    ## 215 08/01/2016    Q_INTENS_READ     F           0
    ## 216 08/01/2016    Q_INTENS_READ     A           4
    ## 217 08/01/2016    Q_INTENS_READ     C           2
    ## 218 08/01/2016    Q_INTENS_READ     C           2
    ## 219 08/01/2016    Q_INTENS_READ     B           3
    ## 220 08/01/2016    Q_INTENS_READ     D           1
    ## 221 08/01/2016    Q_INTENS_READ     D           1
    ## 222 09/06/2016         Q_READ_1     C           2
    ## 223 09/06/2016         Q_READ_1     C           2
    ## 224 09/06/2016         Q_READ_1     C           2
    ## 225 09/06/2016         Q_READ_1     B           3
    ## 226 09/06/2016         Q_READ_1     C           2
    ## 227 09/06/2016         Q_READ_1     C           2
    ## 228 09/06/2016         Q_READ_1     C           2
    ## 229 09/06/2016         Q_READ_1     C           2
    ## 230 09/06/2016         Q_READ_1     C           2
    ## 231 09/06/2016         Q_READ_1     B           3
    ## 232 09/06/2016         Q_READ_1     C           2
    ## 233 09/06/2016         Q_READ_1     D           1
    ## 234 09/06/2016         Q_READ_1     C           2
    ## 235 09/06/2016         Q_READ_1     B           3
    ## 236 09/06/2016         Q_READ_1     C           2
    ## 237 09/06/2016         Q_READ_1     B           3
    ## 238 09/06/2016         Q_READ_1     B           3
    ## 239 09/06/2016         Q_READ_1     B           3
    ## 240 09/06/2016         Q_READ_1     C           2
    ## 241 09/06/2016         Q_READ_1     B           3
    ## 242 09/06/2016         Q_READ_1     C           2
    ## 243 09/06/2016         Q_READ_1     A           4
    ## 244 09/06/2016         Q_READ_1     A           4
    ## 245 09/06/2016         Q_READ_1     C           2
    ## 246 09/06/2016         Q_READ_1     C           2
    ## 247 09/06/2016         Q_READ_1     D           1
    ## 248 09/06/2016         Q_READ_1     B           3
    ## 249 11/01/2016     Q_READ_1_ADV     A           4
    ## 250 11/01/2016     Q_READ_1_ADV     C           2
    ## 251 11/01/2016     Q_READ_1_ADV     B           3
    ## 252 11/01/2016     Q_READ_1_ADV     B           3
    ## 253 02/08/2017     Q_READ_1_ADV     B           3
    ## 254 09/21/2016     Q_READ_1_ADV     A           4
    ## 255 10/01/2016     Q_READ_1_ADV     C           2
    ## 256 08/01/2016     Q_READ_1_ADV     C           2
    ## 257 08/01/2016     Q_READ_1_ADV     C           2
    ## 258 08/01/2016     Q_READ_1_ADV     F           0
    ## 259 09/06/2016         Q_READ_2     C           2
    ## 260 09/06/2016         Q_READ_2     D           1
    ## 261 09/06/2016         Q_READ_2     B           3
    ## 262 09/06/2016         Q_READ_2     D           1
    ## 263 09/06/2016         Q_READ_2     C           2
    ## 264 09/06/2016         Q_READ_2     D           1
    ## 265 09/06/2016         Q_READ_2     B           3
    ## 266 09/06/2016         Q_READ_2     C           2
    ## 267 09/06/2016         Q_READ_2     C           2
    ## 268 09/06/2016         Q_READ_2     C           2
    ## 269 09/06/2016         Q_READ_2     C           2
    ## 270 09/06/2016         Q_READ_2     B           3
    ## 271 09/06/2016         Q_READ_2     C           2
    ## 272 09/06/2016         Q_READ_2     C           2
    ## 273 09/06/2016         Q_READ_2     D           1
    ## 274 09/06/2016         Q_READ_2     B           3
    ## 275 09/06/2016         Q_READ_2     C           2
    ## 276 09/06/2016         Q_READ_2     C           2
    ## 277 09/06/2016         Q_READ_2     C           2
    ## 278 09/06/2016         Q_READ_2     C           2
    ## 279 11/01/2016     Q_READ_2_ADV     A           4
    ## 280 09/06/2016         Q_READ_3     C           2
    ## 281 09/06/2016         Q_READ_3     B           3
    ## 282 09/06/2016         Q_READ_3     C           2
    ## 283 09/06/2016         Q_READ_3     C           2
    ## 284 09/06/2016         Q_READ_3     C           2
    ## 285 09/26/2016         Q_READ_3     C           2
    ## 286 09/06/2016         Q_READ_3     C           2
    ## 287 09/06/2016         Q_READ_3     B           3
    ## 288 09/06/2016         Q_READ_3     B           3
    ## 289 08/01/2016     Q_READ_3_ADV     A           4
    ## 290 08/01/2016     Q_READ_3_ADV     A           4
    ## 291 08/01/2016     Q_READ_3_ADV     F           0
    ## 292 08/01/2016     Q_READ_3_ADV     A           4

``` r
dim(q2_reading)

q2_reading$girl_code <- as.character(q2_reading$girl_code)

distinct(q2_reading)

q2_unique <- q2_reading[!(duplicated(q2_reading$girl_code) | duplicated(q2_reading$girl_code, fromLast = TRUE)),]



q2_reading_quarter <- q2_unique %>%
    filter(grepl("Q_",q_reading_course))

head(q2_reading_quarter)
dim(q2_reading_quarter)
```

``` r
q2_reading_sem <- q2_reading %>%
    filter(grepl("S_", q_reading_course))


head(q2_reading_sem)

dim(q2_reading_sem)
```

``` r
extra_quarters <- anti_join(q2_reading_quarter, q2_reading_sem, by="girl_code")

extra_quarters

head(extra_quarters)

dim(extra_quarters)
```

``` r
q2_reading <- rbind(q2_reading_sem, extra_quarters)

dim(q2_reading)
```

Language Arts
=============

``` r
q2_langarts <- q2_data %>% 
    gather("langarts_course", "grade", 46:62,65:66, 68:83, 86:87) %>% #put lang arts classes in rows
    select(10, 13:16, 52:53)

    

q2_langarts <- na.omit(q2_langarts) #get rid of cases with no entry

q2_langarts
```

    ## # A tibble: 834 × 7
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
    ## # ... with 824 more rows, and 2 more variables: langarts_course <chr>,
    ## #   grade <chr>

``` r
q2_freelang <- q2_data %>%
    select(10, 13:16,63:64) #find free entry lang cases

q2_data$Q_free_lang1 #test to see if any data entry for this 
```

    ##   [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [24] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [47] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [70] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [93] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [116] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [139] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [162] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [185] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [208] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [231] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [254] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [277] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [300] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [323] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [346] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [369] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [392] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [415] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [438] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [461] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [484] NA NA NA NA NA NA

``` r
q2_freelang <- q2_freelang[,c(1,2,3,4,5,7,6)] #rearrange columns to match regular lang courses 



table(q2_freelang$Q_free_lang1, q2_freelang$Q_free_lang2) #check for data
```

    ## < table of extent 0 x 0 >

``` r
q2_freelang <- q2_freelang %>%
    rename("langarts_course" = Q_free_lang2) %>% #rename columns to match reg lang courses
    rename("grade" = Q_free_lang1)
```

    ## Warning in grep("ENGLISH", q2_freelang$langarts_course, ignore.case =
    ## TRUE, : argument 'ignore.case = TRUE' will be ignored

    ## # A tibble: 0 × 7
    ## # ... with 7 variables: lang_avg <int>, council <chr>, girl_code <chr>,
    ## #   school <chr>, enrolled <chr>, langarts_course <chr>, grade <chr>

    ## [1] "lang_avg"        "council"         "girl_code"       "school"         
    ## [5] "enrolled"        "langarts_course" "grade"

``` r
s2_freelang <- q2_data %>%
    select(10, 13:16,84:85) #find free entry lang cases

q2_data$S_free_lang1 #test to see if any data entry for this 
```

    ##   [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [24] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [47] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [70] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [93] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [116] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [139] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [162] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [185] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [208] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [231] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [254] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [277] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [300] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [323] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [346] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [369] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [392] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [415] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [438] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [461] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [484] NA NA NA NA NA NA

``` r
q2_langarts <- rbind(q2_langarts, q2_freelang_english)


q2_langarts
```

    ## # A tibble: 834 × 7
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
    ## # ... with 824 more rows, and 2 more variables: langarts_course <chr>,
    ## #   grade <chr>

``` r
q2_langarts <- q2_langarts %>%
    filter(grade != "Did not mean to select this course")


dim(q2_langarts)
```

    ## [1] 826   7

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
```

``` r
dim(q2_langarts)

q2_lang_dupes <- duplicated(q2_langarts$girl_code)  | duplicated(q2_langarts$girl_code, fromLast = TRUE)



q2_lang_dupes <- q2_langarts[q2_lang_dupes, ]

dim(q2_lang_dupes)




q2_lang_u <- q2_langarts[!(duplicated(q2_langarts$girl_code) | duplicated(q2_langarts$girl_code, fromLast = TRUE)),]

dim(q2_lang_u)



q2_lang_dupes


#q2Dupes <- duplicated(q2_data$girl_code) | duplicated(q2_data$girl_code, fromLast=TRUE)


#preDupes <-duplicated(pre$girlCode) | duplicated(pre$girlCode, fromLast=TRUE)

#preDupes <-pre[preDupes, ]

q2_lang_quarter <- q2_lang_u %>%
    filter(grepl("Q_", langarts_course))


dim(q2_lang_quarter)
```

``` r
s2_lang <- q2_lang_u %>%
    filter(grepl("S_", langarts_course))

dim(s2_lang)
```

``` r
lang_extra_quarters <- anti_join(q2_lang_quarter, s2_lang, by="girl_code")

dim(lang_extra_quarters)
```

``` r
q2_langarts <- rbind(lang_extra_quarters, s2_lang)

q2_langarts
```

### Joins

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
