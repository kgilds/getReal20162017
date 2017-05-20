q1\_dm
================

### Set working directory, library, and read raw data (needs updated data)

``` r
library(tidyverse) #load tidy package
library(sqldf)
library(pander)
```

.

``` r
q1_data <- readRDS("q1_data.Rds")


#names(q1_data)
```

``` r
#change column names averages
colnames (q1_data)[7] <- "reading_avg"
colnames (q1_data)[10] <- "lang_avg"

# change column names demographics
colnames (q1_data)[13] <- "council"
colnames (q1_data)[14] <- "girl_code"
colnames (q1_data)[15] <- "school"
colnames (q1_data)[16] <- "enrolled"

# Attendance and Behavior
colnames (q1_data)[18] <- "unexcused"
colnames (q1_data)[19] <- "excused"
colnames (q1_data)[20] <- "in_school"
colnames (q1_data)[21] <- "out_school"
colnames (q1_data)[22] <- "expelled"
colnames (q1_data)[23] <- "Nothing"


# Reading 
colnames (q1_data)[25] <- "M/J INTENS READ"
colnames (q1_data)[26] <- "M/J READ 1"
colnames (q1_data)[27] <- "M/J READ 1, ADV"
colnames (q1_data)[28] <- "M/J READ 2"
colnames (q1_data)[29] <- "M/J READ 2, ADV"
colnames (q1_data)[30] <- "M/J READ 3"
colnames (q1_data)[31] <- "M/J READ3, ADV"
colnames (q1_data)[32] <- "free_reading1"
colnames (q1_data)[33] <- "free_reading2"
colnames (q1_data)[34] <- "M/J DE LA ESOL-READ"

# change colnmaes lang arts section
colnames (q1_data)[36] <- "M/J LANG ARTS 1 ESOL"
colnames (q1_data)[37] <- "M/J LANG ARTS 2 ESOL"
colnames (q1_data)[38] <- "M/J LANG ARTS 3 ESOL"
colnames (q1_data)[39] <- "M/J DEVELOPMENTAL  LANG ARTS ESOL"
colnames (q1_data)[40] <- "M/J LANG ARTS 1"
colnames (q1_data)[41] <- "M/J LANG ARTS 1 ADV"
colnames (q1_data)[42] <- "M/J LANG ARTS 2"
colnames (q1_data)[43] <- "M/J LANG ARTS 2 ADV"
colnames (q1_data)[44] <- "M/J LANG ARTS 3"
colnames (q1_data)[45] <- "M/J LANG ARTS 3 ADv"
colnames (q1_data)[46] <- "M/J ENG 2 CAMB SEC 2"
colnames (q1_data)[47] <- "M/J IB MYP LANG LIT 1"
colnames (q1_data)[48] <- "M/J ENG 1 CAMB SEC 1"
colnames (q1_data)[49] <- "M/J IB MYP LANG & LIT 3"
colnames (q1_data)[50] <- "M/J IB MYP LANG & LIT 2"
colnames (q1_data)[51] <- "M/J ENG 3 CAMB SEC 3"
colnames (q1_data)[52] <- "M/J INTENS LANG ARTS"
colnames (q1_data)[53] <- "free_lang1"
colnames (q1_data)[54] <- "free_lang2"
colnames (q1_data)[55] <- "M/J LANG ARTS TRAN"
colnames (q1_data)[56] <- "M/J DE LANG ARTS ESOL"
colnames (q1_data)[57] <- "blankspace"

names(q1_data)
```

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
    ## [12] "You are entering academic data for Quarter 1"                                        
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
    ## [35] "You are entering data for ${q://QID1/ChoiceTextEntryValue} who attends, ..._1"       
    ## [36] "M/J LANG ARTS 1 ESOL"                                                                
    ## [37] "M/J LANG ARTS 2 ESOL"                                                                
    ## [38] "M/J LANG ARTS 3 ESOL"                                                                
    ## [39] "M/J DEVELOPMENTAL  LANG ARTS ESOL"                                                   
    ## [40] "M/J LANG ARTS 1"                                                                     
    ## [41] "M/J LANG ARTS 1 ADV"                                                                 
    ## [42] "M/J LANG ARTS 2"                                                                     
    ## [43] "M/J LANG ARTS 2 ADV"                                                                 
    ## [44] "M/J LANG ARTS 3"                                                                     
    ## [45] "M/J LANG ARTS 3 ADv"                                                                 
    ## [46] "M/J ENG 2 CAMB SEC 2"                                                                
    ## [47] "M/J IB MYP LANG LIT 1"                                                               
    ## [48] "M/J ENG 1 CAMB SEC 1"                                                                
    ## [49] "M/J IB MYP LANG & LIT 3"                                                             
    ## [50] "M/J IB MYP LANG & LIT 2"                                                             
    ## [51] "M/J ENG 3 CAMB SEC 3"                                                                
    ## [52] "M/J INTENS LANG ARTS"                                                                
    ## [53] "free_lang1"                                                                          
    ## [54] "free_lang2"                                                                          
    ## [55] "M/J LANG ARTS TRAN"                                                                  
    ## [56] "M/J DE LANG ARTS ESOL"                                                               
    ## [57] "blankspace"

``` r
q1_data$girl_code <- as.character(q1_data$girl_code)

### Make all girCode to upper case for matching
q1_data$girl_code <- toupper(q1_data$girl_code)



q1_data <- q1_data %>%
    filter(Finished ==1)

#pander(table(q1_data$girl_code)) #test for duplicate girl codes
```

``` r
q1_data$council <-sub("Girl Scouts of the Gateway Council", "Gateway Council", fixed=TRUE, q1_data$council)

q1_data$council <-sub("Girl Scouts of Citrus Council", "Citrus Council", fixed=TRUE, q1_data$council)

q1_data$council <-sub("Girl Scouts of Southeast Florida", "Southeast Council", fixed=TRUE, q1_data$council)

q1_data$council <-sub("Girl Scout Council of Tropical Florida", "Tropical Council", fixed = TRUE, q1_data$council)

q1_data$council <-sub("Girl Scouts of West Central Florida", "West Central Council", fixed = TRUE, q1_data$council)

q1_data$council <-sub("Girl Scout Council of the Panhandle", "Panhandle Council", fixed = TRUE, q1_data$council)
```

``` r
q1_data <- q1_data[!(duplicated(q1_data$girl_code) | duplicated(q1_data$girl_code, fromLast = TRUE)), ]  #find and extract unique cases

dim(q1_data)
```

    ## [1] 576  57

``` r
#pander(table(q1_data$girl_code)) #test for duplicate girl codes

#preUnique<- pre [!(duplicated(pre$girlCode) | duplicated(pre$girlCode, fromLast = TRUE)), ]

#dim(preUnique)
```

``` r
q1Dupes <- duplicated(q1_data$girl_code) | duplicated(q1_data$girl_code, fromLast=TRUE)


#preDupes <-duplicated(pre$girlCode) | duplicated(pre$girlCode, fromLast=TRUE)

#preDupes <-pre[preDupes, ]

#dim(preDupes)



### Subset the duplicates
q1Dupes <-q1_data[q1Dupes, ]


q1Dupes
```

    ## # A tibble: 0 × 57
    ## # ... with 57 variables: ResponseID <chr>, ResponseSet <chr>,
    ## #   StartDate <dttm>, EndDate <dttm>, Finished <int>, Reading-sum <int>,
    ## #   reading_avg <dbl>, Reading-weightedStdDev <dbl>, Language
    ## #   Arts-sum <int>, lang_avg <dbl>, Language Arts-weightedStdDev <dbl>,
    ## #   You are entering academic data for Quarter 1 <int>, council <chr>,
    ## #   girl_code <chr>, school <chr>, enrolled <chr>, You are entering data
    ## #   for Student: ${q://QID1/ChoiceTextEntryValue} who attends: ... <int>,
    ## #   unexcused <int>, excused <int>, in_school <int>, out_school <int>,
    ## #   expelled <chr>, Nothing <int>, You are entering data
    ## #   for ${q://QID1/ChoiceTextEntryValue} who attends, ... <int>, M/J
    ## #   INTENS READ <chr>, M/J READ 1 <chr>, M/J READ 1, ADV <chr>, M/J READ
    ## #   2 <chr>, M/J READ 2, ADV <chr>, M/J READ 3 <chr>, M/J READ3,
    ## #   ADV <chr>, free_reading1 <chr>, free_reading2 <chr>, M/J DE LA
    ## #   ESOL-READ <chr>, You are entering data
    ## #   for ${q://QID1/ChoiceTextEntryValue} who attends, ..._1 <int>, M/J
    ## #   LANG ARTS 1 ESOL <chr>, M/J LANG ARTS 2 ESOL <chr>, M/J LANG ARTS 3
    ## #   ESOL <chr>, M/J DEVELOPMENTAL LANG ARTS ESOL <chr>, M/J LANG ARTS
    ## #   1 <chr>, M/J LANG ARTS 1 ADV <chr>, M/J LANG ARTS 2 <chr>, M/J LANG
    ## #   ARTS 2 ADV <chr>, M/J LANG ARTS 3 <chr>, M/J LANG ARTS 3 ADv <chr>,
    ## #   M/J ENG 2 CAMB SEC 2 <chr>, M/J IB MYP LANG LIT 1 <chr>, M/J ENG 1
    ## #   CAMB SEC 1 <chr>, M/J IB MYP LANG & LIT 3 <chr>, M/J IB MYP LANG & LIT
    ## #   2 <chr>, M/J ENG 3 CAMB SEC 3 <chr>, M/J INTENS LANG ARTS <chr>,
    ## #   free_lang1 <chr>, free_lang2 <chr>, M/J LANG ARTS TRAN <chr>, M/J DE
    ## #   LANG ARTS ESOL <chr>, blankspace <chr>

Attendance:
===========

``` r
q1_attendance <- q1_data %>%
    select(13:16,18:19)  #take columns of interest



q1_attendance$unexcused[which(is.na(q1_attendance$unexcused))] <- 0
q1_attendance$excused[which(is.na(q1_attendance$excused))] <-0


q1_attendance <- q1_attendance %>%
        mutate("total" = unexcused + excused)


which(is.na(q1_attendance$total))
```

    ## integer(0)

``` r
mean(q1_attendance$total)
```

    ## [1] 2.046875

Behavior
========

``` r
q1_behavior <- q1_data %>%
    select(13:16, 20:21)  #take columns of interest
    
    
q1_behavior$in_school[which(is.na(q1_behavior$in_school))] <- 0  #find na and replace with 0
q1_behavior$out_school[which(is.na(q1_behavior$out_school))] <-0  #find na values and replace with 0

q1_behavior <- q1_behavior %>%   
    mutate("total"= in_school + out_school) #calculate total 
    
head(q1_behavior) #check work
```

    ## # A tibble: 6 × 7
    ##                council   girl_code        school   enrolled in_school
    ##                  <chr>       <chr>         <chr>      <chr>     <dbl>
    ## 1 West Central Council 320LA021505 BLAKE ACADEMY 09/01/2016         0
    ## 2 West Central Council 320JA020205 BLAKE ACADEMY 09/01/2016         0
    ## 3 West Central Council 320AC100104 BLAKE ACADEMY 09/01/2016         0
    ## 4 West Central Council 320CC050705 BLAKE ACADEMY 09/01/2016         0
    ## 5 West Central Council 320NC041704 BLAKE ACADEMY 09/01/2016         0
    ## 6 West Central Council 320MC111104 BLAKE ACADEMY 09/01/2016         0
    ## # ... with 2 more variables: out_school <dbl>, total <dbl>

``` r
which(is.na(q1_behavior$total))
```

    ## integer(0)

``` r
mean(q1_behavior$total)
```

    ## [1] 0.2309028

Expelled
========

``` r
q1_expelled <- q1_data %>%
    select(13:16, 22) #take columns of interest

head(q1_expelled)
```

    ## # A tibble: 6 × 5
    ##                council   girl_code        school   enrolled expelled
    ##                  <chr>       <chr>         <chr>      <chr>    <chr>
    ## 1 West Central Council 320LA021505 BLAKE ACADEMY 09/01/2016       No
    ## 2 West Central Council 320JA020205 BLAKE ACADEMY 09/01/2016       No
    ## 3 West Central Council 320AC100104 BLAKE ACADEMY 09/01/2016       No
    ## 4 West Central Council 320CC050705 BLAKE ACADEMY 09/01/2016       No
    ## 5 West Central Council 320NC041704 BLAKE ACADEMY 09/01/2016       No
    ## 6 West Central Council 320MC111104 BLAKE ACADEMY 09/01/2016       No

Reading
=======

``` r
q1_reading <- q1_data %>%
    gather("reading_course", "Grade",25:31, 34) %>% #gather reading columns and put them in row
    select(7,13:16, 50:51) #select reading columns
    

names(q1_reading)
```

    ## [1] "reading_avg"    "council"        "girl_code"      "school"        
    ## [5] "enrolled"       "reading_course" "Grade"

``` r
dim(q1_reading)
```

    ## [1] 4608    7

``` r
q1_reading <-na.omit(q1_reading) #get rid of cases with no data




dim(q1_reading)
```

    ## [1] 272   7

``` r
q1_reading
```

    ## # A tibble: 272 × 7
    ##    reading_avg              council   girl_code        school   enrolled
    ##          <dbl>                <chr>       <chr>         <chr>      <chr>
    ## 1            1 West Central Council 320LA021505 BLAKE ACADEMY 09/01/2016
    ## 2            1 West Central Council 320NC041704 BLAKE ACADEMY 09/01/2016
    ## 3            2 West Central Council 320AC040205 BLAKE ACADEMY 09/01/2016
    ## 4            1 West Central Council 320SG022305 BLAKE ACADEMY 09/01/2016
    ## 5            2 West Central Council 320AH071505 BLAKE ACADEMY 09/01/2016
    ## 6            1 West Central Council 320CI061405 BLAKE ACADEMY 09/01/2016
    ## 7            1 West Central Council 320DJ040604 BLAKE ACADEMY 09/01/2016
    ## 8            3 West Central Council 320AM031505 BLAKE ACADEMY 09/01/2016
    ## 9            2 West Central Council 320CP041705 BLAKE ACADEMY 09/01/2016
    ## 10           1 West Central Council 320VS052505 BLAKE ACADEMY 09/01/2016
    ## # ... with 262 more rows, and 2 more variables: reading_course <chr>,
    ## #   Grade <chr>

``` r
q1_freereading <- q1_data %>%
    select(7,13:16, 32:33) #select free enter
    
q1_freereading <- q1_freereading[,c(1,2,3,4,5,7,6)] #re-arrange columns to make them align with q1 readind df

q1_freereading <- q1_freereading %>%
    rename("reading_course" = free_reading2) %>% #rename to match q1_reading
    rename("Grade" = free_reading1) #rename to match q1_reading
    

dim(q1_freereading)
```

    ## [1] 576   7

``` r
q1_freereading <- na.omit(q1_freereading) #clean up to find cases with data



dim(q1_freereading)
```

    ## [1] 30  7

``` r
q1_freereading
```

    ## # A tibble: 30 × 7
    ##    reading_avg              council   girl_code        school   enrolled
    ##          <dbl>                <chr>       <chr>         <chr>      <chr>
    ## 1            3 West Central Council 320AC100104 BLAKE ACADEMY 09/01/2016
    ## 2            4 West Central Council 320CC050705 BLAKE ACADEMY 09/01/2016
    ## 3            1 West Central Council 320NC041704 BLAKE ACADEMY 09/01/2016
    ## 4            3 West Central Council 320MC111104 BLAKE ACADEMY 09/01/2016
    ## 5            2 West Central Council 320AC040205 BLAKE ACADEMY 09/01/2016
    ## 6            3 West Central Council 320JG022305 BLAKE ACADEMY 09/01/2016
    ## 7            1 West Central Council 320SG022305 BLAKE ACADEMY 09/01/2016
    ## 8            1 West Central Council 320VS052505 BLAKE ACADEMY 09/01/2016
    ## 9            1 West Central Council 320AW072404 BLAKE ACADEMY 09/01/2016
    ## 10           2 West Central Council 320CM120402 BLAKE ACADEMY 10/01/2015
    ## # ... with 20 more rows, and 2 more variables: reading_course <chr>,
    ## #   Grade <chr>

``` r
q1_freereading <- q1_freereading[grep("READ", q1_freereading$reading_course, ignore.case=TRUE, fixed=TRUE),]
```

    ## Warning in grep("READ", q1_freereading$reading_course, ignore.case =
    ## TRUE, : argument 'ignore.case = TRUE' will be ignored

``` r
q1_freereading
```

    ## # A tibble: 14 × 7
    ##    reading_avg              council   girl_code          school   enrolled
    ##          <dbl>                <chr>       <chr>           <chr>      <chr>
    ## 1            1 West Central Council 320NC041704   BLAKE ACADEMY 09/01/2016
    ## 2            2 West Central Council 320AC040205   BLAKE ACADEMY 09/01/2016
    ## 3            1 West Central Council 320SG022305   BLAKE ACADEMY 09/01/2016
    ## 4            1 West Central Council 320VS052505   BLAKE ACADEMY 09/01/2016
    ## 5            1 West Central Council 320AW072404   BLAKE ACADEMY 09/01/2016
    ## 6            2 West Central Council 320CM120402   BLAKE ACADEMY 10/01/2015
    ## 7            4 West Central Council 320DT060204 KATHLEEN MIDDLE 10/01/2016
    ## 8            3 West Central Council 320ZB062105 KATHLEEN MIDDLE 10/01/2016
    ## 9            4 West Central Council 320JW041705 KATHLEEN MIDDLE 10/01/2016
    ## 10           4 West Central Council 320TM070503 KATHLEEN MIDDLE 10/01/2016
    ## 11           4 West Central Council 320DP061004 KATHLEEN MIDDLE 10/01/2016
    ## 12           3 West Central Council 320DP090403 KATHLEEN MIDDLE 10/01/2016
    ## 13           3 West Central Council 320KM090403 KATHLEEN MIDDLE 10/01/2016
    ## 14           4 West Central Council 320LJ080502 KATHLEEN MIDDLE 10/01/2016
    ## # ... with 2 more variables: reading_course <chr>, Grade <chr>

``` r
q1_reading <- rbind(q1_reading, q1_freereading) #bind main q1_reading and free text

dim(q1_reading)
```

    ## [1] 286   7

``` r
q1_reading
```

    ## # A tibble: 286 × 7
    ##    reading_avg              council   girl_code        school   enrolled
    ## *        <dbl>                <chr>       <chr>         <chr>      <chr>
    ## 1            1 West Central Council 320LA021505 BLAKE ACADEMY 09/01/2016
    ## 2            1 West Central Council 320NC041704 BLAKE ACADEMY 09/01/2016
    ## 3            2 West Central Council 320AC040205 BLAKE ACADEMY 09/01/2016
    ## 4            1 West Central Council 320SG022305 BLAKE ACADEMY 09/01/2016
    ## 5            2 West Central Council 320AH071505 BLAKE ACADEMY 09/01/2016
    ## 6            1 West Central Council 320CI061405 BLAKE ACADEMY 09/01/2016
    ## 7            1 West Central Council 320DJ040604 BLAKE ACADEMY 09/01/2016
    ## 8            3 West Central Council 320AM031505 BLAKE ACADEMY 09/01/2016
    ## 9            2 West Central Council 320CP041705 BLAKE ACADEMY 09/01/2016
    ## 10           1 West Central Council 320VS052505 BLAKE ACADEMY 09/01/2016
    ## # ... with 276 more rows, and 2 more variables: reading_course <chr>,
    ## #   Grade <chr>

``` r
which(is.na(q1_reading$Grade))
```

    ## integer(0)

``` r
q1_reading <- q1_reading %>%
    filter(Grade != "Did not mean to select this course")
```

``` r
setwd("C:/Users/kevin/Dropbox/GetReal/Council_data/west_central_council")


q1_reading_test <- q1_reading %>%
    filter(girl_code == "320ZB062105")


write.csv(q1_reading_test, file="reading_course_question.csv", row.names=FALSE)
```

### Reading Points

    ##     reading_avg              council     girl_code
    ## 1     1.0000000 West Central Council   320LA021505
    ## 2     1.0000000 West Central Council   320NC041704
    ## 3     2.0000000 West Central Council   320AC040205
    ## 4     1.0000000 West Central Council   320SG022305
    ## 5     2.0000000 West Central Council   320AH071505
    ## 6     1.0000000 West Central Council   320CI061405
    ## 7     1.0000000 West Central Council   320DJ040604
    ## 8     3.0000000 West Central Council   320AM031505
    ## 9     2.0000000 West Central Council   320CP041705
    ## 10    1.0000000 West Central Council   320VS052505
    ## 11    1.0000000 West Central Council   320AW072404
    ## 12    2.0000000 West Central Council   320FB032204
    ## 13    2.0000000 West Central Council   320JR071904
    ## 14    2.0000000 West Central Council   320CM120402
    ## 15    1.0000000 West Central Council   320NR060502
    ## 16    0.0000000 West Central Council   320AT101602
    ## 17    3.0000000 West Central Council   320AC020704
    ## 18    3.0000000 West Central Council   320AL061205
    ## 19    4.0000000 West Central Council   320CW071705
    ## 20    3.0000000 West Central Council   320KE060905
    ## 21    2.0000000 West Central Council   320LJ011104
    ## 22    4.0000000 West Central Council   320SD031905
    ## 23    1.0000000 West Central Council   320MS121104
    ## 24    2.0000000 West Central Council   320JM111104
    ## 25    3.0000000 West Central Council   320AT081904
    ## 26    4.0000000 West Central Council   320DT060204
    ## 27    3.0000000 West Central Council   320ZB062105
    ## 28    4.0000000 West Central Council   320JW041705
    ## 29    4.0000000 West Central Council   320AG062003
    ## 30    3.0000000 West Central Council   320KT102004
    ## 31    3.0000000 West Central Council   320MM051204
    ## 32    2.0000000 West Central Council   320NC122104
    ## 33    4.0000000 West Central Council   320TM070503
    ## 34    4.0000000 West Central Council   320AM041503
    ## 35    4.0000000 West Central Council   320DP061004
    ## 36    3.0000000 West Central Council   320DP090403
    ## 37    3.0000000 West Central Council   320KM090403
    ## 38    3.0000000 West Central Council   320SW043004
    ## 39    4.0000000 West Central Council   320LJ080502
    ## 40    3.0000000 West Central Council   320YL070603
    ## 41    3.0000000 West Central Council   320JA101703
    ## 42    2.0000000       Citrus Council 312MV12162001
    ## 43    3.0000000       Citrus Council 312GR11232004
    ## 44    3.0000000       Citrus Council 312LD05242004
    ## 45    4.0000000 West Central Council   320KG040505
    ## 46    4.0000000 West Central Council   320MH043004
    ## 47    4.0000000 West Central Council   320TJ071403
    ## 48    3.0000000 West Central Council   320MM030805
    ## 49    3.0000000 West Central Council   320CM061905
    ## 50    2.0000000    Southeast Council   321TD110403
    ## 51    4.0000000 West Central Council   320SP072305
    ## 52    3.0000000 West Central Council   320LT021405
    ## 53    4.0000000    Southeast Council   321SS042805
    ## 54    2.0000000    Southeast Council   321ST100104
    ## 55    3.0000000    Southeast Council 321AZAZ041805
    ## 56    3.0000000    Southeast Council   321VA082703
    ## 57    3.0000000    Southeast Council   321SD072204
    ## 58    3.0000000    Southeast Council   321CG091104
    ## 59    3.0000000    Southeast Council   321ZJ092702
    ## 60    3.0000000    Southeast Council   321NJ061904
    ## 61    4.0000000    Southeast Council   321WM090603
    ## 62    4.0000000    Southeast Council   321TN073104
    ## 63    2.0000000    Southeast Council   321SS081303
    ## 64    3.0000000    Southeast Council   321FW062504
    ## 65    3.0000000    Southeast Council   321PS042604
    ## 66    2.0000000    Southeast Council   321JP061803
    ## 67    3.0000000    Southeast Council   321LU072702
    ## 68    3.0000000    Southeast Council   321JV021803
    ## 69    2.0000000    Southeast Council   321LD072805
    ## 70    1.0000000    Southeast Council   321JL041605
    ## 71    2.0000000    Southeast Council   321RR031305
    ## 72    1.0000000    Southeast Council   321AP011905
    ## 73    0.3333333    Panhandle Council   322MR071804
    ## 74    1.5000000    Panhandle Council   322EL080803
    ## 75    4.0000000    Panhandle Council   322TH052216
    ## 76    3.0000000    Panhandle Council   322CT072705
    ## 77    3.0000000    Panhandle Council   322GG110304
    ## 78    3.0000000    Panhandle Council   322SW121306
    ## 79    4.0000000    Panhandle Council   322CR121504
    ## 80    3.0000000    Panhandle Council   322MC020204
    ## 81    3.0000000    Panhandle Council   322TR072404
    ## 82    4.0000000    Panhandle Council   322ZR012404
    ## 83    3.0000000    Panhandle Council   322LS071802
    ## 84    2.0000000    Panhandle Council   322IM020401
    ## 85    2.0000000    Panhandle Council   322NB061103
    ## 86    4.0000000    Panhandle Council   322GS333305
    ## 87    4.0000000    Panhandle Council   322CM041604
    ## 88    1.0000000    Panhandle Council   322KM030103
    ## 89    1.0000000    Panhandle Council   322BN030103
    ## 90    4.0000000    Panhandle Council   322ZR120704
    ## 91    2.0000000    Panhandle Council   322TS032304
    ## 92    2.0000000    Panhandle Council   322TM050405
    ## 93    3.0000000    Panhandle Council   322RN072805
    ## 94    1.0000000    Panhandle Council   322JP020504
    ## 95    2.0000000    Panhandle Council   322BR081304
    ## 96    2.0000000    Panhandle Council   322ZM091203
    ## 97    3.0000000    Panhandle Council   322DB062904
    ## 98    2.0000000    Panhandle Council   322CB083004
    ## 99    0.0000000    Panhandle Council   322JC083104
    ## 100   3.0000000    Panhandle Council   322LD120204
    ## 101   0.0000000    Panhandle Council   322KS101602
    ## 102   2.0000000    Panhandle Council   322KT041403
    ## 103   1.0000000    Panhandle Council   322JW041704
    ## 104   0.0000000    Panhandle Council   322LW082305
    ## 105   3.0000000 West Central Council   320KB061005
    ## 106   1.0000000      Gateway Council   313TB011705
    ## 107   2.0000000      Gateway Council   313SH050805
    ## 108   2.0000000      Gateway Council   313SH060304
    ## 109   3.0000000      Gateway Council   313DJ091703
    ## 110   3.0000000      Gateway Council   313KK122904
    ## 111   2.0000000      Gateway Council   313AT020105
    ## 112   3.0000000      Gateway Council   313CB010204
    ## 113   2.0000000      Gateway Council   313RB122804
    ## 114   3.0000000      Gateway Council   313AC070604
    ## 115   2.0000000      Gateway Council   314AD110204
    ## 116   1.0000000      Gateway Council   313JF121503
    ## 117   0.0000000      Gateway Council   313BH010904
    ## 118   2.0000000      Gateway Council   313AT102804
    ## 119   2.0000000      Gateway Council   313DB051704
    ## 120   2.0000000      Gateway Council   313TB121603
    ## 121   3.0000000      Gateway Council   313JS043004
    ## 122   4.0000000      Gateway Council   313KO040704
    ## 123   2.0000000      Gateway Council   313DB060804
    ## 124   3.0000000      Gateway Council   313ZG041304
    ## 125   0.0000000      Gateway Council   313PM021605
    ## 126   2.0000000      Gateway Council   313MS030606
    ## 127   3.0000000      Gateway Council   313MG081605
    ## 128   2.0000000      Gateway Council   313LM071304
    ## 129   2.0000000      Gateway Council   313NA113005
    ## 130   3.0000000      Gateway Council   313PS042205
    ## 131   2.0000000      Gateway Council   313JA070105
    ## 132   3.0000000      Gateway Council   313JC090403
    ## 133   2.0000000       Citrus Council 312SB01282004
    ## 134   3.0000000 West Central Council   320RS060104
    ## 135   3.0000000 West Central Council   320HW100404
    ## 136   4.0000000    Panhandle Council   322DM050605
    ## 137   4.0000000    Panhandle Council   322JB102904
    ## 138   2.0000000 West Central Council   320JA020205
    ## 139   2.0000000 West Central Council   320RF032305
    ## 140   2.0000000 West Central Council   320CG072705
    ## 141   0.0000000 West Central Council   320AW071205
    ## 142   4.0000000 West Central Council   320BM032505
    ## 143   3.0000000 West Central Council   320SA090704
    ## 144   3.0000000 West Central Council   320VR031805
    ## 145   4.0000000 West Central Council   320LN012805
    ## 146   3.0000000 West Central Council   320SC120104
    ## 147   4.0000000 West Central Council   320RH100404
    ## 148   3.0000000 West Central Council   320KM081905
    ## 149   4.0000000 West Central Council   320TM110304
    ## 150   4.0000000    Panhandle Council   322AG102504
    ## 151   3.0000000 West Central Council   320AM032504
    ## 152   2.0000000       Citrus Council 312BT01072004
    ## 153   2.0000000       Citrus Council 312PP10152003
    ## 154   1.0000000      Gateway Council   313SB120603
    ## 155   2.0000000      Gateway Council   313MA090303
    ## 156   3.0000000      Gateway Council   313CH121603
    ## 157   0.0000000      Gateway Council   313EO080204
    ## 158   2.0000000      Gateway Council   313DP021104
    ## 159   2.0000000      Gateway Council   313YR043004
    ## 160   2.0000000      Gateway Council   313KT081504
    ## 161   1.0000000      Gateway Council   313JS010204
    ## 162   2.0000000      Gateway Council   313YK062304
    ## 163   2.0000000      Gateway Council   313RR042804
    ## 164   3.0000000      Gateway Council   313SB112203
    ## 165   2.0000000      Gateway Council   313MD080504
    ## 166   2.0000000      Gateway Council   313KF050404
    ## 167   0.0000000      Gateway Council   313TL030304
    ## 168   2.0000000      Gateway Council   313KR112103
    ## 169   3.0000000      Gateway Council   313LS033104
    ## 170   1.0000000      Gateway Council   313ET062404
    ## 171   1.0000000      Gateway Council   313MT072302
    ## 172   3.0000000      Gateway Council   313LB031704
    ## 173   3.0000000      Gateway Council   313RJ070404
    ## 174   2.0000000      Gateway Council   313JR042804
    ## 175   2.0000000       Citrus Council 312DW01202004
    ## 176   2.0000000       Citrus Council 312DJ05172004
    ## 177   2.0000000       Citrus Council 312PP04072003
    ## 178   2.0000000       Citrus Council 312PP10262004
    ## 179   2.0000000       Citrus Council 312SP04272003
    ## 180   2.0000000       Citrus Council  312BT0172004
    ## 181   2.0000000       Citrus Council 312TE05212003
    ## 182   3.0000000 West Central Council   320SF041404
    ## 183   1.5000000 West Central Council   320EH082104
    ## 184   4.0000000 West Central Council   320JJ061804
    ## 185   3.0000000 West Central Council   320MJ093003
    ## 186   2.0000000 West Central Council   320KM041804
    ## 187   3.0000000 West Central Council   320FN072303
    ## 188   2.0000000 West Central Council   320EP061104
    ## 189   4.0000000 West Central Council   320JP112403
    ## 190   1.0000000 West Central Council   320TR051104
    ## 191   3.0000000 West Central Council   320SS070504
    ## 192   4.0000000 West Central Council   320DT031504
    ## 193   2.0000000 West Central Council   320VV060302
    ## 194   3.0000000 West Central Council   320ZS071204
    ## 195   3.0000000 West Central Council   320DS040804
    ## 196   4.0000000 West Central Council   320AM011304
    ## 197   4.0000000 West Central Council   320LM011304
    ## 198   3.0000000 West Central Council   320AC012304
    ## 199   3.0000000 West Central Council   320AR060504
    ## 200   4.0000000 West Central Council   320AH061004
    ## 201   4.0000000 West Central Council   320CC011404
    ## 202   4.0000000 West Central Council   320MC121603
    ## 203   3.0000000 West Central Council   320SB050304
    ## 204   2.0000000 West Central Council   320SC072304
    ## 205   3.0000000 West Central Council   320LC111102
    ## 206   4.0000000 West Central Council   320DE122803
    ## 207   2.0000000 West Central Council   320EF111204
    ## 208   3.0000000 West Central Council   320TG100703
    ## 209   4.0000000 West Central Council   320JP010504
    ## 210   0.0000000 West Central Council   320CW111203
    ## 211   3.0000000 West Central Council   320AR112502
    ## 212   2.0000000 West Central Council   320AC122802
    ## 213   3.0000000 West Central Council   320SA080203
    ## 214   2.0000000      Gateway Council   313JB110302
    ## 215   2.0000000      Gateway Council   313AK041202
    ## 216   3.0000000      Gateway Council   313JR101502
    ## 217   3.0000000      Gateway Council   313RG060502
    ## 218   2.0000000      Gateway Council   313DS083103
    ## 219   3.0000000      Gateway Council   313PS082702
    ## 220   2.0000000      Gateway Council   313IS050500
    ## 221   3.0000000      Gateway Council   313DH122500
    ## 222   4.0000000      Gateway Council   313AS022503
    ## 223   2.0000000      Gateway Council   313AK021702
    ## 224   4.0000000 West Central Council   320SD102802
    ## 225   3.0000000 West Central Council   320JJ120102
    ## 226   3.0000000 West Central Council   320JL033003
    ## 227   3.0000000 West Central Council   320NL041303
    ## 228   1.0000000 West Central Council   320TP041503
    ## 229   4.0000000 West Central Council   320SP042903
    ## 230   4.0000000 West Central Council   320YT091702
    ## 231   4.0000000 West Central Council   320ZU062503
    ## 232   4.0000000 West Central Council   320AB061103
    ## 233   3.0000000 West Central Council   320EF042903
    ## 234   0.0000000 West Central Council   320AM072903
    ## 235   4.0000000 West Central Council   320BR072103
    ## 236   3.0000000 West Central Council   320AG022403
    ## 237   3.0000000 West Central Council   320AN032703
    ## 238   4.0000000 West Central Council   320AM072803
    ## 239   3.0000000 West Central Council   320SA080203
    ## 240   4.0000000 West Central Council   320SB122902
    ## 241   4.0000000 West Central Council   320EC112202
    ## 242   4.0000000 West Central Council   320MG041503
    ## 243   3.0000000 West Central Council   320JG062702
    ## 244   4.0000000 West Central Council   320MG030803
    ## 245   1.0000000 West Central Council   320NC041704
    ## 246   2.0000000 West Central Council   320AC040205
    ## 247   1.0000000 West Central Council   320SG022305
    ## 248   1.0000000 West Central Council   320VS052505
    ## 249   1.0000000 West Central Council   320AW072404
    ## 250   2.0000000 West Central Council   320CM120402
    ## 251   4.0000000 West Central Council   320DT060204
    ## 252   3.0000000 West Central Council   320ZB062105
    ## 253   4.0000000 West Central Council   320JW041705
    ## 254   4.0000000 West Central Council   320TM070503
    ## 255   4.0000000 West Central Council   320DP061004
    ## 256   3.0000000 West Central Council   320DP090403
    ## 257   3.0000000 West Central Council   320KM090403
    ## 258   4.0000000 West Central Council   320LJ080502
    ##                        school   enrolled      reading_course Grade
    ## 1               BLAKE ACADEMY 09/01/2016     M/J INTENS READ     D
    ## 2               BLAKE ACADEMY 09/01/2016     M/J INTENS READ     D
    ## 3               BLAKE ACADEMY 09/01/2016     M/J INTENS READ     C
    ## 4               BLAKE ACADEMY 09/01/2016     M/J INTENS READ     D
    ## 5               BLAKE ACADEMY 09/01/2016     M/J INTENS READ     C
    ## 6               BLAKE ACADEMY 09/01/2016     M/J INTENS READ     D
    ## 7               BLAKE ACADEMY 09/01/2016     M/J INTENS READ     D
    ## 8               BLAKE ACADEMY 09/01/2016     M/J INTENS READ     B
    ## 9               BLAKE ACADEMY 09/01/2016     M/J INTENS READ     C
    ## 10              BLAKE ACADEMY 09/01/2016     M/J INTENS READ     D
    ## 11              BLAKE ACADEMY 09/01/2016     M/J INTENS READ     D
    ## 12              BLAKE ACADEMY 10/01/2016     M/J INTENS READ     C
    ## 13              BLAKE ACADEMY 10/01/2016     M/J INTENS READ     C
    ## 14              BLAKE ACADEMY 10/01/2015     M/J INTENS READ     C
    ## 15              BLAKE ACADEMY 09/01/2015     M/J INTENS READ     D
    ## 16              BLAKE ACADEMY 09/01/2014     M/J INTENS READ     F
    ## 17               Young Middle 09/21/2016     M/J INTENS READ     B
    ## 18               Young Middle 09/21/2016     M/J INTENS READ     B
    ## 19               Young Middle 09/21/2016     M/J INTENS READ     A
    ## 20            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     B
    ## 21            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     C
    ## 22            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     A
    ## 23            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     D
    ## 24            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     C
    ## 25            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     B
    ## 26            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     A
    ## 27            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     B
    ## 28            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     A
    ## 29            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     A
    ## 30            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     B
    ## 31            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     B
    ## 32            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     C
    ## 33            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     A
    ## 34            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     A
    ## 35            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     A
    ## 36            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     B
    ## 37            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     B
    ## 38            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     B
    ## 39            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     A
    ## 40            KATHLEEN MIDDLE 10/01/2016     M/J INTENS READ     B
    ## 41               Young middle 09/21/2016     M/J INTENS READ     B
    ## 42      Freedom Middle School 09/06/2016     M/J INTENS READ     A
    ## 43  Meadowbrook Middle School 09/12/2016     M/J INTENS READ     B
    ## 44   Robinswood Middle School 09/06/2016     M/J INTENS READ     B
    ## 45               Young Middle 09/21/2016     M/J INTENS READ     A
    ## 46               Young middle 09/21/2016     M/J INTENS READ     A
    ## 47               Young Middle 09/21/2016     M/J INTENS READ     A
    ## 48               Young middle 09/21/2016     M/J INTENS READ     B
    ## 49               Young Middle 09/21/2016     M/J INTENS READ     B
    ## 50                        Llm 10/11/2016     M/J INTENS READ     C
    ## 51               Young Middle 09/21/2016     M/J INTENS READ     A
    ## 52               Young Middle 09/21/2016     M/J INTENS READ     B
    ## 53                        llm 10/11/2016     M/J INTENS READ     A
    ## 54                        llm 10/11/2016     M/J INTENS READ     C
    ## 55                        llm 10/11/2016     M/J INTENS READ     B
    ## 56                        llm 10/11/2016     M/J INTENS READ     B
    ## 57                        llm 10/11/2016     M/J INTENS READ     B
    ## 58                        llm 10/11/2016     M/J INTENS READ     B
    ## 59                        llm 10/11/2016     M/J INTENS READ     B
    ## 60                        llm 10/11/2016     M/J INTENS READ     B
    ## 61                        llm 10/11/2016     M/J INTENS READ     A
    ## 62                        llm 10/11/2016     M/J INTENS READ     A
    ## 63                        llm 10/11/2016     M/J INTENS READ     C
    ## 64                        llm 10/11/2016     M/J INTENS READ     B
    ## 65                        llm 10/11/2016     M/J INTENS READ     B
    ## 66                        llm 10/11/2016     M/J INTENS READ     C
    ## 67                        llm 10/11/2016     M/J INTENS READ     B
    ## 68                        llm 10/11/2016     M/J INTENS READ     B
    ## 69                         LL 10/25/2016     M/J INTENS READ     C
    ## 70                         LL 10/25/2016     M/J INTENS READ     D
    ## 71                         LL 10/25/2016     M/J INTENS READ     C
    ## 72                         LL 10/25/2016     M/J INTENS READ     D
    ## 73                      Jinks 02/08/2017     M/J INTENS READ     B
    ## 74                      Jinks 02/08/2017     M/J INTENS READ     B
    ## 75                      Jinks 02/08/2017     M/J INTENS READ     A
    ## 76                      Jinks 02/08/2017     M/J INTENS READ     B
    ## 77                      Jinks 02/08/2017     M/J INTENS READ     B
    ## 78                      Jinks 02/08/2017     M/J INTENS READ     B
    ## 79                      Jinks 02/08/2017     M/J INTENS READ     A
    ## 80                      Jinks 02/08/2017     M/J INTENS READ     B
    ## 81                      Jinks 02/08/2017     M/J INTENS READ     B
    ## 82                      Jinks 02/08/2017     M/J INTENS READ     A
    ## 83                      Jinks 02/08/2017     M/J INTENS READ     B
    ## 84                      Jinks 02/08/2017     M/J INTENS READ     C
    ## 85                      Jinks 02/08/2017     M/J INTENS READ     C
    ## 86                      Jinks 02/08/2017     M/J INTENS READ     A
    ## 87                      Jinks 02/08/2017     M/J INTENS READ     A
    ## 88                      Jinks 02/08/2017     M/J INTENS READ     D
    ## 89                      Jinks 02/08/2017     M/J INTENS READ     D
    ## 90                      Jinks 02/08/2017     M/J INTENS READ     A
    ## 91                      Jinks 02/08/2017     M/J INTENS READ     C
    ## 92                    Everitt 02/08/2017     M/J INTENS READ     C
    ## 93                    Everitt 02/08/2017     M/J INTENS READ     B
    ## 94                    Everitt 02/08/2017     M/J INTENS READ     C
    ## 95                    Everitt 02/08/2017     M/J INTENS READ     C
    ## 96                   Evereitt 02/08/2017     M/J INTENS READ     C
    ## 97                    Everitt 02/08/2017     M/J INTENS READ     B
    ## 98                    Everitt 02/08/2017     M/J INTENS READ     C
    ## 99                    Everitt 02/08/2017     M/J INTENS READ     F
    ## 100                   Everitt 02/08/2017     M/J INTENS READ     B
    ## 101                   Everitt 02/08/2017     M/J INTENS READ     F
    ## 102                   Everitt 02/08/2017     M/J INTENS READ     C
    ## 103                   Everitt 02/08/2017     M/J INTENS READ     C
    ## 104                   Everitt 02/08/2017     M/J INTENS READ     F
    ## 105              Young Middle 09/21/2016          M/J READ 1     B
    ## 106                THE BRIDGE 09/06/2016          M/J READ 1     D
    ## 107                THE BRIDGE 09/06/2016          M/J READ 1     C
    ## 108                THE BRIDGE 09/06/2016          M/J READ 1     C
    ## 109                THE BRIDGE 09/06/2016          M/J READ 1     B
    ## 110                THE BRIDGE 09/06/2016          M/J READ 1     B
    ## 111                THE BRIDGE 09/06/2016          M/J READ 1     C
    ## 112                 LAKESHORE 09/06/2016          M/J READ 1     B
    ## 113                 LAKESHORE 09/06/2016          M/J READ 1     C
    ## 114                 LAKESHORE 09/06/2016          M/J READ 1     B
    ## 115                 LAKESHORE 09/06/2016          M/J READ 1     C
    ## 116                 LAKESHORE 09/06/2016          M/J READ 1     D
    ## 117                 LAKESHORE 09/06/2016          M/J READ 1     F
    ## 118                 LAKESHORE 09/06/2016          M/J READ 1     C
    ## 119                JEFF DAVIS 09/06/2016          M/J READ 1     C
    ## 120                JEB STUART 09/06/2016          M/J READ 1     C
    ## 121                JEB STUART 09/06/2016          M/J READ 1     B
    ## 122                JEB STUART 09/06/2016          M/J READ 1     A
    ## 123                JEB STUART 09/06/2016          M/J READ 1     C
    ## 124                JEB STUART 09/06/2016          M/J READ 1     B
    ## 125                JEB STUART 09/06/2016          M/J READ 1     F
    ## 126                JEB STUART 09/06/2016          M/J READ 1     C
    ## 127                    BUTLER 09/06/2016          M/J READ 1     B
    ## 128                    BUTLER 09/06/2016          M/J READ 1     C
    ## 129           MATTHEW GILBERT 09/06/2016          M/J READ 1     C
    ## 130                    BUTLER 09/06/2016          M/J READ 1     B
    ## 131                    BUTLER 09/06/2016          M/J READ 1     C
    ## 132                 STILLWELL 09/06/2016          M/J READ 1     B
    ## 133  Robinswood Middle School 09/06/2016          M/J READ 1     C
    ## 134              Young Middle 09/21/2016          M/J READ 1     B
    ## 135              Young Middle 09/21/2016          M/J READ 1     B
    ## 136                   Everitt 02/08/2017          M/J READ 1     A
    ## 137                   Everitt 02/08/2017          M/J READ 1     A
    ## 138             BLAKE ACADEMY 09/01/2016     M/J READ 1, ADV     C
    ## 139             BLAKE ACADEMY 09/01/2016     M/J READ 1, ADV     C
    ## 140             BLAKE ACADEMY 09/01/2016     M/J READ 1, ADV     C
    ## 141             BLAKE ACADEMY 09/01/2016     M/J READ 1, ADV     F
    ## 142           KATHLEEN MIDDLE 10/01/2016     M/J READ 1, ADV     A
    ## 143           KATHLEEN MIDDLE 10/01/2016     M/J READ 1, ADV     B
    ## 144           KATHLEEN MIDDLE 10/01/2016     M/J READ 1, ADV     B
    ## 145           KATHLEEN MIDDLE 10/01/2016     M/J READ 1, ADV     A
    ## 146              Young Middle 09/21/2016     M/J READ 1, ADV     B
    ## 147              Young Middle 09/21/2016     M/J READ 1, ADV     A
    ## 148              Young Middle 09/21/2016     M/J READ 1, ADV     B
    ## 149              Young Middle 09/21/2016     M/J READ 1, ADV     A
    ## 150                   Everitt 02/08/2017     M/J READ 1, ADV     A
    ## 151              Young Middle 09/21/2016          M/J READ 2     B
    ## 152  Robinswood Middle School 09/06/2016          M/J READ 2     C
    ## 153  Robinswood Middle School 09/06/2016          M/J READ 2     C
    ## 154                THE BRIDGE 09/06/2016          M/J READ 2     D
    ## 155                THE BRIDGE 09/06/2016          M/J READ 2     C
    ## 156                THE BRIDGE 09/06/2016          M/J READ 2     B
    ## 157                THE BRIDGE 09/06/2016          M/J READ 2     F
    ## 158                THE BRIDGE 09/06/2016          M/J READ 2     C
    ## 159                THE BRIDGE 09/06/2016          M/J READ 2     C
    ## 160                THE BRIDGE 09/06/2016          M/J READ 2     C
    ## 161           MATTHEW GILBERT 09/06/2016          M/J READ 2     D
    ## 162           MATTHEW GILBERT 09/06/2016          M/J READ 2     C
    ## 163           MATTHEW GILBERT 09/06/2016          M/J READ 2     C
    ## 164                JEFF DAVIS 09/06/2016          M/J READ 2     B
    ## 165                JEFF DAVIS 09/06/2016          M/J READ 2     C
    ## 166                JEFF DAVIS 09/06/2016          M/J READ 2     C
    ## 167                JEFF DAVIS 09/06/2016          M/J READ 2     F
    ## 168                JEB STUART 09/06/2016          M/J READ 2     C
    ## 169                JEB STUART 09/06/2016          M/J READ 2     B
    ## 170                JEB STUART 09/06/2016          M/J READ 2     D
    ## 171           MATTHEW GILBERT 09/06/2016          M/J READ 2     C
    ## 172           MATTHEW GILBERT 09/06/2016          M/J READ 2     B
    ## 173                 STILLWELL 09/06/2016          M/J READ 2     B
    ## 174                 STILLWELL 09/06/2016          M/J READ 2     C
    ## 175  Robinswood Middle School 09/06/2016          M/J READ 2     C
    ## 176  Robinswood Middle School 09/06/2016          M/J READ 2     C
    ## 177  Robinswood Middle School 09/06/2016          M/J READ 2     C
    ## 178  Robinswood Middle School 09/06/2016          M/J READ 2     C
    ## 179 Robinswood  Middle School 09/06/2016          M/J READ 2     C
    ## 180  Robinswood Middle School 09/06/2016          M/J READ 2     C
    ## 181  Robinswood Middle School 09/06/2016          M/J READ 2     C
    ## 182              Young Middle 09/21/2016          M/J READ 2     B
    ## 183              Young Middle 09/21/2016          M/J READ 2     B
    ## 184              Young middle 09/21/2016          M/J READ 2     A
    ## 185              Young middle 09/21/2016          M/J READ 2     B
    ## 186              Young Middle 09/21/2016          M/J READ 2     C
    ## 187              Young Middle 09/21/2016          M/J READ 2     B
    ## 188              Young Middle 09/21/2016          M/J READ 2     C
    ## 189              young middle 09/21/2016          M/J READ 2     A
    ## 190              Young Middle 09/21/2016          M/J READ 2     D
    ## 191              Young Middle 09/21/2016          M/J READ 2     B
    ## 192              Young Middle 09/21/2016          M/J READ 2     A
    ## 193              Young Middle 09/21/2016          M/J READ 2     C
    ## 194             BLAKE ACADEMY 10/01/2016     M/J READ 2, ADV     B
    ## 195             BLAKE ACADEMY 10/01/2016     M/J READ 2, ADV     B
    ## 196             BLAKE ACADEMY 10/01/2016     M/J READ 2, ADV     A
    ## 197             BLAKE ACADEMY 10/01/2016     M/J READ 2, ADV     A
    ## 198              Young Middle 09/21/2016     M/J READ 2, ADV     B
    ## 199              Young Middle 09/21/2016     M/J READ 2, ADV     B
    ## 200              Young Middle 09/21/2016     M/J READ 2, ADV     A
    ## 201              Young Middle 09/21/2016     M/J READ 2, ADV     A
    ## 202           KATHLEEN MIDDLE 10/01/2016     M/J READ 2, ADV     A
    ## 203              Young Middle 09/21/2016     M/J READ 2, ADV     B
    ## 204              Young Middle 09/21/2016     M/J READ 2, ADV     C
    ## 205              Young Middle 09/21/2016     M/J READ 2, ADV     B
    ## 206              Young Middle 09/21/2016     M/J READ 2, ADV     A
    ## 207              Young Middle 09/21/2016     M/J READ 2, ADV     C
    ## 208              Young middle 09/21/2016     M/J READ 2, ADV     B
    ## 209              Young Middle 09/21/2016     M/J READ 2, ADV     A
    ## 210              Young Middle 09/21/2016     M/J READ 2, ADV     F
    ## 211              Young Middle 09/21/2016          M/J READ 3     B
    ## 212              Young Middle 09/21/2016          M/J READ 3     C
    ## 213              Young Middle 09/21/2016          M/J READ 3     C
    ## 214                THE BRIDGE 09/06/2016          M/J READ 3     C
    ## 215                THE BRIDGE 09/06/2016          M/J READ 3     C
    ## 216                THE BRIDGE 09/06/2016          M/J READ 3     B
    ## 217                JEFF DAVIS 09/06/2016          M/J READ 3     B
    ## 218                JEFF DAVIS 09/06/2016          M/J READ 3     C
    ## 219                JEFF DAVIS 09/06/2016          M/J READ 3     B
    ## 220                JEB STUART 09/06/2016          M/J READ 3     C
    ## 221                JEB STUART 09/06/2016          M/J READ 3     B
    ## 222                JEB STUART 09/06/2016          M/J READ 3     A
    ## 223                 STILLWELL 09/06/2016          M/J READ 3     C
    ## 224              Young Middle 09/21/2016          M/J READ 3     A
    ## 225              Young middle 09/21/2016          M/J READ 3     B
    ## 226              Young Middle 09/21/2016          M/J READ 3     B
    ## 227              Young Middle 09/21/2016          M/J READ 3     B
    ## 228              Young middle 09/21/2016          M/J READ 3     D
    ## 229              Young Middle 09/21/2016          M/J READ 3     A
    ## 230              Young Middle 09/21/2016          M/J READ 3     A
    ## 231              young middle 09/21/2016          M/J READ 3     A
    ## 232             BLAKE ACADEMY 10/01/2014      M/J READ3, ADV     A
    ## 233             BLAKE ACADEMY 09/01/2014      M/J READ3, ADV     B
    ## 234             BLAKE ACADEMY 09/01/2014      M/J READ3, ADV     F
    ## 235             BLAKE ACADEMY 09/01/2014      M/J READ3, ADV     A
    ## 236              Young Middle 09/21/2016      M/J READ3, ADV     B
    ## 237              Young Middle 09/21/2016      M/J READ3, ADV     B
    ## 238              Young Middle 09/21/2016      M/J READ3, ADV     A
    ## 239              Young Middle 09/21/2016      M/J READ3, ADV     A
    ## 240              Young Middle 09/21/2016      M/J READ3, ADV     A
    ## 241              Young Middle 09/21/2016      M/J READ3, ADV     A
    ## 242              Young Middle 09/21/2016      M/J READ3, ADV     A
    ## 243              Young Middle 09/21/2016      M/J READ3, ADV     B
    ## 244              Young middle 09/21/2016      M/J READ3, ADV     A
    ## 245             BLAKE ACADEMY 09/01/2016 M/J INENS READ (MC)     D
    ## 246             BLAKE ACADEMY 09/01/2016 M/J INENS READ (MC)     C
    ## 247             BLAKE ACADEMY 09/01/2016 M/J INENS READ (MC)     D
    ## 248             BLAKE ACADEMY 09/01/2016 M/J INENS READ (MC)     D
    ## 249             BLAKE ACADEMY 09/01/2016 M/J INENS READ (MC)     D
    ## 250             BLAKE ACADEMY 10/01/2015 M/J INENS READ (MC)     C
    ## 251           KATHLEEN MIDDLE 10/01/2016 M/J INENS READ (MC)     A
    ## 252           KATHLEEN MIDDLE 10/01/2016 M/J INENS READ (MC)     B
    ## 253           KATHLEEN MIDDLE 10/01/2016 M/J INENS READ (MC)     A
    ## 254           KATHLEEN MIDDLE 10/01/2016 M/J INENS READ (MC)     A
    ## 255           KATHLEEN MIDDLE 10/01/2016 M/J INENS READ (MC)     A
    ## 256           KATHLEEN MIDDLE 10/01/2016 M/J INENS READ (MC)     B
    ## 257           KATHLEEN MIDDLE 10/01/2016 M/J INENS READ (MC)     B
    ## 258           KATHLEEN MIDDLE 10/01/2016 M/J INENS READ (MC)     A
    ##     reading_pts
    ## 1             1
    ## 2             1
    ## 3             2
    ## 4             1
    ## 5             2
    ## 6             1
    ## 7             1
    ## 8             3
    ## 9             2
    ## 10            1
    ## 11            1
    ## 12            2
    ## 13            2
    ## 14            2
    ## 15            1
    ## 16            0
    ## 17            3
    ## 18            3
    ## 19            4
    ## 20            3
    ## 21            2
    ## 22            4
    ## 23            1
    ## 24            2
    ## 25            3
    ## 26            4
    ## 27            3
    ## 28            4
    ## 29            4
    ## 30            3
    ## 31            3
    ## 32            2
    ## 33            4
    ## 34            4
    ## 35            4
    ## 36            3
    ## 37            3
    ## 38            3
    ## 39            4
    ## 40            3
    ## 41            3
    ## 42            4
    ## 43            3
    ## 44            3
    ## 45            4
    ## 46            4
    ## 47            4
    ## 48            3
    ## 49            3
    ## 50            2
    ## 51            4
    ## 52            3
    ## 53            4
    ## 54            2
    ## 55            3
    ## 56            3
    ## 57            3
    ## 58            3
    ## 59            3
    ## 60            3
    ## 61            4
    ## 62            4
    ## 63            2
    ## 64            3
    ## 65            3
    ## 66            2
    ## 67            3
    ## 68            3
    ## 69            2
    ## 70            1
    ## 71            2
    ## 72            1
    ## 73            3
    ## 74            3
    ## 75            4
    ## 76            3
    ## 77            3
    ## 78            3
    ## 79            4
    ## 80            3
    ## 81            3
    ## 82            4
    ## 83            3
    ## 84            2
    ## 85            2
    ## 86            4
    ## 87            4
    ## 88            1
    ## 89            1
    ## 90            4
    ## 91            2
    ## 92            2
    ## 93            3
    ## 94            2
    ## 95            2
    ## 96            2
    ## 97            3
    ## 98            2
    ## 99            0
    ## 100           3
    ## 101           0
    ## 102           2
    ## 103           2
    ## 104           0
    ## 105           3
    ## 106           1
    ## 107           2
    ## 108           2
    ## 109           3
    ## 110           3
    ## 111           2
    ## 112           3
    ## 113           2
    ## 114           3
    ## 115           2
    ## 116           1
    ## 117           0
    ## 118           2
    ## 119           2
    ## 120           2
    ## 121           3
    ## 122           4
    ## 123           2
    ## 124           3
    ## 125           0
    ## 126           2
    ## 127           3
    ## 128           2
    ## 129           2
    ## 130           3
    ## 131           2
    ## 132           3
    ## 133           2
    ## 134           3
    ## 135           3
    ## 136           4
    ## 137           4
    ## 138           2
    ## 139           2
    ## 140           2
    ## 141           0
    ## 142           4
    ## 143           3
    ## 144           3
    ## 145           4
    ## 146           3
    ## 147           4
    ## 148           3
    ## 149           4
    ## 150           4
    ## 151           3
    ## 152           2
    ## 153           2
    ## 154           1
    ## 155           2
    ## 156           3
    ## 157           0
    ## 158           2
    ## 159           2
    ## 160           2
    ## 161           1
    ## 162           2
    ## 163           2
    ## 164           3
    ## 165           2
    ## 166           2
    ## 167           0
    ## 168           2
    ## 169           3
    ## 170           1
    ## 171           2
    ## 172           3
    ## 173           3
    ## 174           2
    ## 175           2
    ## 176           2
    ## 177           2
    ## 178           2
    ## 179           2
    ## 180           2
    ## 181           2
    ## 182           3
    ## 183           3
    ## 184           4
    ## 185           3
    ## 186           2
    ## 187           3
    ## 188           2
    ## 189           4
    ## 190           1
    ## 191           3
    ## 192           4
    ## 193           2
    ## 194           3
    ## 195           3
    ## 196           4
    ## 197           4
    ## 198           3
    ## 199           3
    ## 200           4
    ## 201           4
    ## 202           4
    ## 203           3
    ## 204           2
    ## 205           3
    ## 206           4
    ## 207           2
    ## 208           3
    ## 209           4
    ## 210           0
    ## 211           3
    ## 212           2
    ## 213           2
    ## 214           2
    ## 215           2
    ## 216           3
    ## 217           3
    ## 218           2
    ## 219           3
    ## 220           2
    ## 221           3
    ## 222           4
    ## 223           2
    ## 224           4
    ## 225           3
    ## 226           3
    ## 227           3
    ## 228           1
    ## 229           4
    ## 230           4
    ## 231           4
    ## 232           4
    ## 233           3
    ## 234           0
    ## 235           4
    ## 236           3
    ## 237           3
    ## 238           4
    ## 239           4
    ## 240           4
    ## 241           4
    ## 242           4
    ## 243           3
    ## 244           4
    ## 245           1
    ## 246           2
    ## 247           1
    ## 248           1
    ## 249           1
    ## 250           2
    ## 251           4
    ## 252           3
    ## 253           4
    ## 254           4
    ## 255           4
    ## 256           3
    ## 257           3
    ## 258           4

Language Arts
=============

``` r
q1_langarts <- q1_data %>% 
    gather("langarts_course", "grade", 36:52,55:56)%>% #put lang arts classes in rows
    select(10, 13:16, 39:40) #select lang arts courses and grades

names(q1_langarts)
```

    ## [1] "lang_avg"        "council"         "girl_code"       "school"         
    ## [5] "enrolled"        "langarts_course" "grade"

``` r
q1_langarts <- na.omit(q1_langarts) #get rid of cases with no entry

q1_langarts
```

    ## # A tibble: 578 × 7
    ##    lang_avg              council     girl_code                    school
    ##       <dbl>                <chr>         <chr>                     <chr>
    ## 1         4       Citrus Council 312SP04272003 Robinswood  Middle School
    ## 2         3 West Central Council   320LA021505             BLAKE ACADEMY
    ## 3         3 West Central Council   320JA020205             BLAKE ACADEMY
    ## 4         4 West Central Council   320NC041704             BLAKE ACADEMY
    ## 5         3 West Central Council   320AC040205             BLAKE ACADEMY
    ## 6         3 West Central Council   320CG072705             BLAKE ACADEMY
    ## 7         4 West Central Council   320JG022305             BLAKE ACADEMY
    ## 8         3 West Central Council   320SG022305             BLAKE ACADEMY
    ## 9         3 West Central Council   320AH071505             BLAKE ACADEMY
    ## 10        4 West Central Council   320CI061405             BLAKE ACADEMY
    ## # ... with 568 more rows, and 3 more variables: enrolled <chr>,
    ## #   langarts_course <chr>, grade <chr>

``` r
q1_freelang <- q1_data %>%
    select(10, 13:16,53:54) #find free entry lang cases

names(q1_freelang)
```

    ## [1] "lang_avg"   "council"    "girl_code"  "school"     "enrolled"  
    ## [6] "free_lang1" "free_lang2"

``` r
q1_freelang <- q1_freelang[,c(1,2,3,4,5,7,6)] #rearrange columns to match regular lang courses 



table(q1_freelang$free_lang1, q1_freelang$free_lang2) #check for data
```

    ##                                     
    ##                                      ENGLISH
    ##   B                                        1
    ##   C                                        1
    ##   Did not mean to select this course       0

``` r
q1_freelang <- q1_freelang %>%
    rename("langarts_course" = free_lang2) %>% #rename columns to match reg lang courses
    rename("grade" = free_lang1)



names(q1_freelang)
```

    ## [1] "lang_avg"        "council"         "girl_code"       "school"         
    ## [5] "enrolled"        "langarts_course" "grade"

    ## Warning in grep("ENGLISH", q1_freelang$langarts_course, ignore.case =
    ## TRUE, : argument 'ignore.case = TRUE' will be ignored

    ## # A tibble: 2 × 7
    ##   lang_avg        council     girl_code   school   enrolled
    ##      <dbl>          <chr>         <chr>    <chr>      <chr>
    ## 1        2 Citrus Council 312BD02222003 MEMORIAL 09/26/2016
    ## 2        3 Citrus Council 312SS05162003 MEMORIAL 09/26/2016
    ## # ... with 2 more variables: langarts_course <chr>, grade <chr>

    ## [1] "lang_avg"        "council"         "girl_code"       "school"         
    ## [5] "enrolled"        "langarts_course" "grade"

``` r
q1_langarts <- rbind(q1_langarts, q1_freelang_english)
```

``` r
q1_langarts <- q1_langarts %>%
    filter(grade != "Did not mean to select this course")


dim(q1_langarts)
```

    ## [1] 566   7

``` r
which(is.na(q1_langarts$grade))
```

    ## integer(0)

Languge Points
--------------

``` r
lang_pts <- numeric(0)

for(i in q1_langarts$grade){

     lang_pts<- c(lang_pts,switch(i, "A" =4, "B"=3, "C"=2, "D"=1, "F"=0))

     lang_pts
}

q1_langarts <-cbind(q1_langarts, lang_pts)

q1_langarts
```

    ##      lang_avg              council     girl_code                    school
    ## 1   4.0000000       Citrus Council 312SP04272003 Robinswood  Middle School
    ## 2   3.0000000 West Central Council   320LA021505             BLAKE ACADEMY
    ## 3   3.0000000 West Central Council   320JA020205             BLAKE ACADEMY
    ## 4   4.0000000 West Central Council   320NC041704             BLAKE ACADEMY
    ## 5   3.0000000 West Central Council   320AC040205             BLAKE ACADEMY
    ## 6   3.0000000 West Central Council   320CG072705             BLAKE ACADEMY
    ## 7   4.0000000 West Central Council   320JG022305             BLAKE ACADEMY
    ## 8   3.0000000 West Central Council   320SG022305             BLAKE ACADEMY
    ## 9   3.0000000 West Central Council   320AH071505             BLAKE ACADEMY
    ## 10  4.0000000 West Central Council   320CI061405             BLAKE ACADEMY
    ## 11  3.0000000 West Central Council   320DJ040604             BLAKE ACADEMY
    ## 12  3.0000000 West Central Council   320AM031505             BLAKE ACADEMY
    ## 13  4.0000000 West Central Council   320CP041705             BLAKE ACADEMY
    ## 14  2.0000000 West Central Council   320VS052505             BLAKE ACADEMY
    ## 15  2.0000000 West Central Council   320AW072404             BLAKE ACADEMY
    ## 16  2.0000000 West Central Council   320AW071205             BLAKE ACADEMY
    ## 17  3.0000000 West Central Council   320AC020704              Young Middle
    ## 18  3.0000000 West Central Council   320AL061205              Young Middle
    ## 19  3.0000000 West Central Council   320CW071705              Young Middle
    ## 20  4.0000000 West Central Council   320KE060905           KATHLEEN MIDDLE
    ## 21  4.0000000 West Central Council   320LJ011104           KATHLEEN MIDDLE
    ## 22  3.0000000 West Central Council   320MS121104           KATHLEEN MIDDLE
    ## 23  4.0000000 West Central Council   320JM111104           KATHLEEN MIDDLE
    ## 24  4.0000000 West Central Council   320AT081904           KATHLEEN MIDDLE
    ## 25  4.0000000 West Central Council   320DT060204           KATHLEEN MIDDLE
    ## 26  3.0000000 West Central Council   320ZB062105           KATHLEEN MIDDLE
    ## 27  4.0000000 West Central Council   320JW041705           KATHLEEN MIDDLE
    ## 28  3.0000000 West Central Council   320KT102004           KATHLEEN MIDDLE
    ## 29  4.0000000 West Central Council   320NC122104           KATHLEEN MIDDLE
    ## 30  2.0000000 West Central Council   320KM090403           KATHLEEN MIDDLE
    ## 31  4.0000000 West Central Council   320JA101703              Young middle
    ## 32  4.0000000       Citrus Council 312AS03082005     Freedom Middle School
    ## 33  1.0000000      Gateway Council   313TB011705                THE BRIDGE
    ## 34  3.0000000      Gateway Council   313TC050304                THE BRIDGE
    ## 35  1.0000000      Gateway Council   313SH050805                THE BRIDGE
    ## 36  2.0000000      Gateway Council   313SH060304                THE BRIDGE
    ## 37  2.0000000      Gateway Council   313TH110705                THE BRIDGE
    ## 38  1.0000000      Gateway Council   313DJ091703                THE BRIDGE
    ## 39  2.0000000      Gateway Council   313HJ090903                THE BRIDGE
    ## 40  1.5000000      Gateway Council   313KK122904                THE BRIDGE
    ## 41  2.0000000      Gateway Council   313DK070605                THE BRIDGE
    ## 42  1.0000000      Gateway Council   313KK110804                THE BRIDGE
    ## 43  2.0000000      Gateway Council   313AT020105                THE BRIDGE
    ## 44  2.0000000      Gateway Council   313CB010204                 LAKESHORE
    ## 45  1.0000000      Gateway Council   313RB122804                 LAKESHORE
    ## 46  2.0000000      Gateway Council   313KB012305                 LAKESHORE
    ## 47  1.0000000      Gateway Council   313PB121703                 LAKESHORE
    ## 48  3.0000000      Gateway Council   313AB040805                 LAKESHORE
    ## 49  3.0000000      Gateway Council   313AC072105                 LAKESHORE
    ## 50  3.0000000      Gateway Council   313AC070604                 LAKESHORE
    ## 51  1.0000000      Gateway Council   314AD110204                 LAKESHORE
    ## 52  1.0000000      Gateway Council   313JF121503                 LAKESHORE
    ## 53  1.0000000      Gateway Council   313BH010904                 LAKESHORE
    ## 54  2.0000000      Gateway Council   313YH121304                 LAKESHORE
    ## 55  4.0000000      Gateway Council   313EM041205                 LAKESHORE
    ## 56  2.0000000      Gateway Council   313SN101204                 LAKESHORE
    ## 57  3.0000000      Gateway Council   313KP101803                 LAKESHORE
    ## 58  1.0000000      Gateway Council   313AR021304                 LAKESHORE
    ## 59  2.0000000      Gateway Council   313SS050505                 LAKESHORE
    ## 60  3.0000000      Gateway Council   313AT102804                 LAKESHORE
    ## 61  2.0000000      Gateway Council   313MT010905                 LAKESHORE
    ## 62  2.0000000      Gateway Council   313MW060105                 LAKESHORE
    ## 63  3.0000000      Gateway Council   313BJ041205           MATTHEW GILBERT
    ## 64  1.0000000      Gateway Council   313TH110904           MATTHEW GILBERT
    ## 65  2.0000000      Gateway Council   313JJ051805                JEFF DAVIS
    ## 66  2.0000000      Gateway Council   313DB051704                JEFF DAVIS
    ## 67  3.0000000      Gateway Council   313TB121603                JEB STUART
    ## 68  4.0000000      Gateway Council   313DM121103                JEB STUART
    ## 69  1.0000000      Gateway Council   313KR120804                JEB STUART
    ## 70  3.0000000      Gateway Council   313IW110204                JEB STUART
    ## 71  3.0000000      Gateway Council   313JS043004                JEB STUART
    ## 72  4.0000000      Gateway Council   313KO040704                JEB STUART
    ## 73  2.0000000      Gateway Council   313TW081103                JEB STUART
    ## 74  3.0000000      Gateway Council   313CM120704                JEB STUART
    ## 75  3.0000000      Gateway Council   313SL020605                JEB STUART
    ## 76  3.0000000      Gateway Council   313KM110503                JEB STUART
    ## 77  3.0000000      Gateway Council   313DB060804                JEB STUART
    ## 78  3.0000000      Gateway Council   313HC040605                JEB STUART
    ## 79  3.0000000      Gateway Council   313DD122004                JEB STUART
    ## 80  2.0000000      Gateway Council   313JE010703                JEB STUART
    ## 81  4.0000000      Gateway Council   313YG081804                JEB STUART
    ## 82  2.0000000      Gateway Council   313ZG041304                JEB STUART
    ## 83  2.0000000      Gateway Council   313CJ082905                JEB STUART
    ## 84  1.0000000      Gateway Council   313CJ091804                JEB STUART
    ## 85  1.0000000      Gateway Council   313PM021605                JEB STUART
    ## 86  2.0000000      Gateway Council   313AO080104                JEB STUART
    ## 87  2.0000000      Gateway Council   313MS030606                JEB STUART
    ## 88  3.0000000      Gateway Council   313MS113004                JEB STUART
    ## 89  2.0000000      Gateway Council   313JT060205                JEB STUART
    ## 90  1.0000000      Gateway Council   313DW052505                JEB STUART
    ## 91  2.0000000      Gateway Council   313DW122104                JEB STUART
    ## 92  3.0000000      Gateway Council   313CW111804                JEB STUART
    ## 93  2.0000000      Gateway Council   313HW060205                JEB STUART
    ## 94  2.0000000      Gateway Council   313MW040605                JEB STUART
    ## 95  2.0000000      Gateway Council   313MG081605                    BUTLER
    ## 96  1.0000000      Gateway Council   313LM071304                    BUTLER
    ## 97  2.0000000      Gateway Council   313NA113005           MATTHEW GILBERT
    ## 98  3.0000000      Gateway Council   313KD010705                    BUTLER
    ## 99  2.0000000      Gateway Council   313MH041204                    BUTLER
    ## 100 1.0000000      Gateway Council   313SW030404                    BUTLER
    ## 101 3.0000000      Gateway Council   313LR081605                    BUTLER
    ## 102 2.0000000      Gateway Council   313FF111603                    BUTLER
    ## 103 1.0000000      Gateway Council   313EF080305                    BUTLER
    ## 104 3.0000000      Gateway Council   313PS042205                    BUTLER
    ## 105 4.0000000      Gateway Council   313DE080804                    BUTLER
    ## 106 3.0000000      Gateway Council   313JA070105                    BUTLER
    ## 107 2.0000000      Gateway Council   313JC090403                 STILLWELL
    ## 108 4.0000000      Gateway Council   313GG010305                 STILLWELL
    ## 109 3.0000000      Gateway Council   313MH122904                 STILLWELL
    ## 110 2.0000000       Citrus Council 312JG10172005        Meadowbrook Middle
    ## 111 4.0000000       Citrus Council 312TW07162005        Meadowbrook Middle
    ## 112 4.0000000       Citrus Council 312MM08072005 Meadowbrook Middle School
    ## 113 1.0000000      Gateway Council   313JS093004                 STILLWELL
    ## 114 3.0000000      Gateway Council   313LS010404                 STILLWELL
    ## 115 4.0000000       Citrus Council 312SM07242005 Meadowbrook Middle School
    ## 116 3.0000000       Citrus Council 312TF11112003 Meadowbrook Middle School
    ## 117 4.0000000       Citrus Council 312GR11232004 Meadowbrook Middle School
    ## 118 4.0000000 West Central Council   320KG040505              Young Middle
    ## 119 4.0000000 West Central Council   320MH043004              Young middle
    ## 120 2.0000000    Panhandle Council   322AA050505             Merritt Brown
    ## 121 3.0000000    Panhandle Council   322NB010805             Merritt Brown
    ## 122 1.0000000    Panhandle Council   322CB010105             Merritt Brown
    ## 123 3.0000000    Panhandle Council   322TG060904             Merritt Brown
    ## 124 1.0000000    Panhandle Council   322LB060105             Merritt Brown
    ## 125 0.0000000    Panhandle Council   322EM020705              Meritt Brown
    ## 126 3.0000000    Panhandle Council   322MM101404             Merritt Brown
    ## 127 4.0000000    Panhandle Council   322KM030405             Merritt Brown
    ## 128 2.0000000    Panhandle Council   322HM032905             Merritt Brown
    ## 129 2.0000000    Panhandle Council   322HO022005             Merritt Brown
    ## 130 3.0000000    Panhandle Council   322ER102304             Merritt Brown
    ## 131 3.0000000    Panhandle Council   322HS040405             Merritt Brown
    ## 132 1.0000000    Panhandle Council   322MT120205             Merritt Brown
    ## 133 1.5000000    Panhandle Council   322AW040605             Merritt Brown
    ## 134 3.0000000    Panhandle Council   322AN020604             Merritt Brown
    ## 135 4.0000000 West Central Council   320MM030805              Young middle
    ## 136 2.0000000    Southeast Council   321TD110403                       Llm
    ## 137 3.0000000    Southeast Council   321YA013004                       Llm
    ## 138 4.0000000 West Central Council   320SP072305              Young Middle
    ## 139 3.0000000 West Central Council   320RS060104              Young Middle
    ## 140 4.0000000    Southeast Council   321SS042805                       llm
    ## 141 3.0000000    Southeast Council   321ST100104                       llm
    ## 142 2.0000000    Southeast Council   321JL041605                        LL
    ## 143 3.0000000    Southeast Council   321AP011905                        LL
    ## 144 0.6666667    Panhandle Council   322MR071804                     Jinks
    ## 145 3.0000000    Panhandle Council   322EL080803                     Jinks
    ## 146 2.0000000    Panhandle Council   322LN080204                     Jinks
    ## 147 3.0000000    Panhandle Council   322CT072705                     Jinks
    ## 148 1.5000000    Panhandle Council   322GG110304                     Jinks
    ## 149 3.0000000    Panhandle Council   322KM040404                     Jinks
    ## 150 3.0000000    Panhandle Council   322SW121306                     Jinks
    ## 151 2.0000000    Panhandle Council   322CR121504                     Jinks
    ## 152 2.0000000    Panhandle Council   322TR072404                     Jinks
    ## 153 3.0000000    Panhandle Council   322ZR012404                     Jinks
    ## 154 2.0000000    Panhandle Council   322GS333305                     Jinks
    ## 155 1.0000000    Panhandle Council   322ZR120704                     Jinks
    ## 156 1.0000000    Panhandle Council   322DM050605                   Everitt
    ## 157 3.0000000    Panhandle Council   322TM050405                   Everitt
    ## 158 3.0000000    Panhandle Council   322RN072805                   Everitt
    ## 159 4.0000000    Panhandle Council   322AG102504                   Everitt
    ## 160 2.0000000    Panhandle Council   322ZM091203                  Evereitt
    ## 161 3.0000000    Panhandle Council   322JB102904                   Everitt
    ## 162 4.0000000    Panhandle Council   322CB083004                   Everitt
    ## 163 0.0000000    Panhandle Council   322JC083104                   Everitt
    ## 164 2.0000000    Panhandle Council   322LD120204                   Everitt
    ## 165 2.0000000    Panhandle Council   322KT041403                   Everitt
    ## 166 2.0000000    Panhandle Council   322JW041704                   Everitt
    ## 167 4.0000000 West Central Council   320AC100104             BLAKE ACADEMY
    ## 168 3.0000000 West Central Council   320CC050705             BLAKE ACADEMY
    ## 169 4.0000000 West Central Council   320MC111104             BLAKE ACADEMY
    ## 170 3.0000000 West Central Council   320RF032305             BLAKE ACADEMY
    ## 171 4.0000000 West Central Council   320SD031905           KATHLEEN MIDDLE
    ## 172 4.0000000 West Central Council   320BM032505           KATHLEEN MIDDLE
    ## 173 4.0000000 West Central Council   320DG092204           KATHLEEN MIDDLE
    ## 174 4.0000000 West Central Council   320MM120704           KATHLEEN MIDDLE
    ## 175 4.0000000 West Central Council   320SA090704           KATHLEEN MIDDLE
    ## 176 4.0000000 West Central Council   320VR031805           KATHLEEN MIDDLE
    ## 177 4.0000000 West Central Council   320LN012805           KATHLEEN MIDDLE
    ## 178 4.0000000 West Central Council   320ZB062705           KATHLEEN MIDDLE
    ## 179 4.0000000 West Central Council   320KB061005              Young Middle
    ## 180 3.0000000 West Central Council   320SC120104              Young Middle
    ## 181 1.5000000      Gateway Council   313JC112403                JEB STUART
    ## 182 4.0000000       Citrus Council 312IS06162005        Meadowbrook Middle
    ## 183 4.0000000       Citrus Council  312ZD1292004 Meadowbrook Middle School
    ## 184 4.0000000 West Central Council   320RH100404              Young Middle
    ## 185 4.0000000 West Central Council   320KM081905              Young Middle
    ## 186 4.0000000 West Central Council   320TM110304              Young Middle
    ## 187 3.0000000    Southeast Council   321EC020105                       Llm
    ## 188 3.0000000    Southeast Council   321MC030803                       Llm
    ## 189 3.0000000 West Central Council   320CM061905              Young Middle
    ## 190 3.0000000    Southeast Council   321ED071305                       Llm
    ## 191 4.0000000    Southeast Council   321TA080206                       Llm
    ## 192 4.0000000 West Central Council   320LT021405              Young Middle
    ## 193 3.0000000 West Central Council   320HW100404              Young Middle
    ## 194 4.0000000    Southeast Council   321MS081705                       llm
    ## 195 2.0000000    Southeast Council   321TV110604                       llm
    ## 196 3.0000000    Southeast Council 321AZAZ041805                       llm
    ## 197 2.0000000    Southeast Council   321LD072805                        LL
    ## 198 3.0000000    Southeast Council   321RR031305                        LL
    ## 199 4.0000000    Southeast Council   321JD082405                        LL
    ## 200 4.0000000    Southeast Council   321JB120304                        LL
    ## 201 4.0000000 West Central Council   320ZS071204             BLAKE ACADEMY
    ## 202 4.0000000 West Central Council   320DS040804             BLAKE ACADEMY
    ## 203 4.0000000 West Central Council   320FB032204             BLAKE ACADEMY
    ## 204 4.0000000 West Central Council   320LM011304             BLAKE ACADEMY
    ## 205 4.0000000 West Central Council   320JR071904             BLAKE ACADEMY
    ## 206 4.0000000 West Central Council   320AM032504              Young Middle
    ## 207 3.0000000 West Central Council   320CC011404              Young Middle
    ## 208 3.0000000 West Central Council   320MM051204           KATHLEEN MIDDLE
    ## 209 2.0000000 West Central Council   320DP061004           KATHLEEN MIDDLE
    ## 210 3.0000000 West Central Council   320DP090403           KATHLEEN MIDDLE
    ## 211 3.0000000 West Central Council   320SW043004           KATHLEEN MIDDLE
    ## 212 4.0000000 West Central Council   320SB050304              Young Middle
    ## 213 3.0000000 West Central Council   320SC072304              Young Middle
    ## 214 4.0000000 West Central Council   320LC111102              Young Middle
    ## 215 4.0000000       Citrus Council 312MR12312003     Freedom Middle School
    ## 216 2.0000000       Citrus Council 312BT01072004  Robinswood Middle School
    ## 217 2.0000000       Citrus Council 312LB07252004  Robinswood Middle School
    ## 218 3.0000000       Citrus Council 312PP10152003  Robinswood Middle School
    ## 219 2.0000000      Gateway Council   313SB120603                THE BRIDGE
    ## 220 2.0000000      Gateway Council   313MA090303                THE BRIDGE
    ## 221 3.0000000      Gateway Council   313AB062704                THE BRIDGE
    ## 222 2.0000000      Gateway Council   313DB011903                THE BRIDGE
    ## 223 2.0000000      Gateway Council   313JC052403                THE BRIDGE
    ## 224 2.0000000      Gateway Council   313AC103103                THE BRIDGE
    ## 225 2.0000000      Gateway Council   313CC100602                THE BRIDGE
    ## 226 1.0000000      Gateway Council   313BC040204                THE BRIDGE
    ## 227 3.0000000      Gateway Council   313KE082704                THE BRIDGE
    ## 228 2.0000000      Gateway Council   313LF022804                THE BRIDGE
    ## 229 2.0000000      Gateway Council   313KG061204                THE BRIDGE
    ## 230 3.0000000      Gateway Council   313CH121603                THE BRIDGE
    ## 231 2.0000000      Gateway Council   313CH082603                THE BRIDGE
    ## 232 1.0000000      Gateway Council   313AH081503                THE BRIDGE
    ## 233 1.0000000      Gateway Council   313EO080204                THE BRIDGE
    ## 234 3.0000000      Gateway Council   313DJ031804                THE BRIDGE
    ## 235 2.0000000      Gateway Council   313JL110303                THE BRIDGE
    ## 236 3.0000000      Gateway Council   313JM072404                THE BRIDGE
    ## 237 2.0000000      Gateway Council   313JM100903                THE BRIDGE
    ## 238 0.0000000      Gateway Council   313OM101303                THE BRIDGE
    ## 239 1.0000000      Gateway Council   313BM050404                THE BRIDGE
    ## 240 0.0000000      Gateway Council   313AN121503               THE  BRIDGE
    ## 241 2.0000000      Gateway Council   313DP021104                THE BRIDGE
    ## 242 2.0000000      Gateway Council   313AP072605                THE BRIDGE
    ## 243 3.0000000      Gateway Council   313ER122203                THE BRIDGE
    ## 244 2.0000000      Gateway Council   313YR043004                THE BRIDGE
    ## 245 2.0000000      Gateway Council   313SS111303                THE BRIDGE
    ## 246 3.0000000      Gateway Council   313KT081504                THE BRIDGE
    ## 247 1.0000000      Gateway Council   313MW031804                THE BRIDGE
    ## 248 2.0000000      Gateway Council   313JW030304                THE BRIDGE
    ## 249 1.0000000      Gateway Council   313AW042604                THE BRIDGE
    ## 250 2.0000000      Gateway Council   313NJ060203                 LAKESHORE
    ## 251 3.0000000      Gateway Council   313JJ050404                 LAKESHORE
    ## 252 2.0000000      Gateway Council   313TR041903                 LAKESHORE
    ## 253 2.0000000      Gateway Council   313AA021404           MATTHEW GILBERT
    ## 254 2.0000000      Gateway Council   313JS010204           MATTHEW GILBERT
    ## 255 2.0000000      Gateway Council   313YK062304           MATTHEW GILBERT
    ## 256 3.0000000      Gateway Council   313LG030104           MATTHEW GILBERT
    ## 257 2.0000000      Gateway Council   313AS040404           MATTHEW GILBERT
    ## 258 2.0000000      Gateway Council   313DW080604           MATTHEW GILBERT
    ## 259 2.0000000      Gateway Council   313RR042804           MATTHEW GILBERT
    ## 260 1.0000000      Gateway Council   313AT041103           MATTHEW GILBERT
    ## 261 2.0000000      Gateway Council   313PB032604                JEFF DAVIS
    ## 262 2.0000000      Gateway Council   313SB112203                JEFF DAVIS
    ## 263 2.0000000      Gateway Council   313MD080504                JEFF DAVIS
    ## 264 3.0000000      Gateway Council   313SB082404                JEFF DAVIS
    ## 265 1.0000000      Gateway Council   313JB040304                JEFF DAVIS
    ## 266 2.0000000      Gateway Council   313AC110203                JEFF DAVIS
    ## 267 4.0000000      Gateway Council   313MC113003                JEFF DAVIS
    ## 268 3.0000000      Gateway Council   313JC022004                JEFF DAVIS
    ## 269 3.0000000      Gateway Council   313KF050404                JEFF DAVIS
    ## 270 3.0000000      Gateway Council   313JJ110103                JEFF DAVIS
    ## 271 1.0000000      Gateway Council   313JM022304                JEFF DAVIS
    ## 272 1.0000000      Gateway Council   313TL030304                JEFF DAVIS
    ## 273 2.0000000      Gateway Council   313PM041804                JEFF DAVIS
    ## 274 3.0000000      Gateway Council   313RM032403                JEFF DAVIS
    ## 275 2.0000000      Gateway Council   313HS090603                JEFF DAVIS
    ## 276 2.0000000      Gateway Council   313ES120603                JEFF DAVIS
    ## 277 3.0000000      Gateway Council   313GS111903                JEFF DAVIS
    ## 278 2.0000000      Gateway Council   313KT042704                JEFF DAVIS
    ## 279 1.0000000      Gateway Council   313QT082604                JEFF DAVIS
    ## 280 2.0000000      Gateway Council   313LW060204                JEFF DAVIS
    ## 281 2.0000000      Gateway Council   313GG091004                JEFF DAVIS
    ## 282 1.0000000      Gateway Council   313CC013004                JEFF DAVIS
    ## 283 4.0000000      Gateway Council   313AA032704                JEFF DAVIS
    ## 284 3.0000000      Gateway Council   313EC083004                JEFF DAVIS
    ## 285 3.0000000      Gateway Council   313BH072703                JEFF DAVIS
    ## 286 2.0000000      Gateway Council   313MR022004                JEFF DAVIS
    ## 287 1.0000000      Gateway Council   313IL080503                JEFF DAVIS
    ## 288 1.5000000      Gateway Council   313SL072203                JEFF DAVIS
    ## 289 0.0000000      Gateway Council   313JW081004                JEFF DAVIS
    ## 290 3.0000000      Gateway Council   313TK052204                JEFF DAVIS
    ## 291 2.0000000      Gateway Council   313JC111703                JEFF DAVIS
    ## 292 4.0000000      Gateway Council   313JD052404                JEFF DAVIS
    ## 293 1.5000000      Gateway Council   313JC112403                JEB STUART
    ## 294 3.0000000      Gateway Council   313TL090104                JEB STUART
    ## 295 2.0000000      Gateway Council   313AO122203                JEB STUART
    ## 296 2.0000000      Gateway Council   313KR112103                JEB STUART
    ## 297 2.0000000      Gateway Council   313LS033104                JEB STUART
    ## 298 2.0000000      Gateway Council   313ET062404                JEB STUART
    ## 299 2.0000000      Gateway Council   313AW030804                JEB STUART
    ## 300 1.0000000      Gateway Council   313JW111402                JEB STUART
    ## 301 0.0000000      Gateway Council   313TH011603                JEB STUART
    ## 302 3.0000000      Gateway Council   313JU052004                JEB STUART
    ## 303 1.0000000      Gateway Council   313BB060903                JEB STUART
    ## 304 2.0000000      Gateway Council   313RG012904                JEB STUART
    ## 305 2.0000000      Gateway Council   313SS052202                JEB STUART
    ## 306 4.0000000      Gateway Council   313TW112603                JEB STUART
    ## 307 3.0000000      Gateway Council   313HW021803                JEB STUART
    ## 308 1.0000000      Gateway Council   313PW100903                JEB STUART
    ## 309 2.0000000      Gateway Council   313KM051404                    BUTLER
    ## 310 3.0000000      Gateway Council   313MT072302           MATTHEW GILBERT
    ## 311 1.0000000      Gateway Council   313LB031704           MATTHEW GILBERT
    ## 312 2.0000000      Gateway Council   313KB121203                 STILLWELL
    ## 313 1.0000000      Gateway Council   313AB021104                 STILLWELL
    ## 314 1.0000000      Gateway Council   313DH102103                 STILLWELL
    ## 315 2.0000000      Gateway Council   313RJ070404                 STILLWELL
    ## 316 1.0000000      Gateway Council   313CL071703                 STILLWELL
    ## 317 0.0000000      Gateway Council   313GL041504                 STILLWELL
    ## 318 4.0000000      Gateway Council   313RM061404                 STILLWELL
    ## 319 3.0000000      Gateway Council   313AM041503                 STILLWELL
    ## 320 2.0000000      Gateway Council   313AN050505                 STILLWELL
    ## 321 3.0000000      Gateway Council   313JR042804                 STILLWELL
    ## 322 2.0000000      Gateway Council   313MR041504                 STILLWELL
    ## 323 2.0000000      Gateway Council   313SS010203                 STILLWELL
    ## 324 2.0000000      Gateway Council    313BW03304                 STILLWELL
    ## 325 4.0000000       Citrus Council 312LD05242004  Robinswood Middle School
    ## 326 1.0000000       Citrus Council 312DW01202004  Robinswood Middle School
    ## 327 3.0000000       Citrus Council 312EA08062004         Robinswood Middle
    ## 328 3.0000000       Citrus Council 312DJ05172004  Robinswood Middle School
    ## 329 2.0000000       Citrus Council 312PP04072003  Robinswood Middle School
    ## 330 2.0000000       Citrus Council 312PP10262004  Robinswood Middle School
    ## 331 3.0000000       Citrus Council 312NB03222004  Robinswood Middle School
    ## 332 2.0000000       Citrus Council  312BT0172004  Robinswood Middle School
    ## 333 2.0000000       Citrus Council 312SB01282004  Robinswood Middle School
    ## 334 3.0000000       Citrus Council 312TE05212003  Robinswood Middle School
    ## 335 4.0000000 West Central Council   320EF111204              Young Middle
    ## 336 3.0000000 West Central Council   320TG100703              Young middle
    ## 337 3.0000000 West Central Council   320EH082104              Young Middle
    ## 338 3.0000000 West Central Council   320JJ061804              Young middle
    ## 339 4.0000000 West Central Council   320MJ093003              Young middle
    ## 340 3.0000000 West Central Council   320EP061104              Young Middle
    ## 341 3.0000000 West Central Council   320JP010504              Young Middle
    ## 342 3.0000000 West Central Council   320TR051104              Young Middle
    ## 343 4.0000000 West Central Council   320SS070504              Young Middle
    ## 344 4.0000000 West Central Council   320DT031504              Young Middle
    ## 345 3.0000000    Southeast Council   321VA082703                       llm
    ## 346 3.0000000    Southeast Council   321SD072204                       llm
    ## 347 3.0000000    Southeast Council   321CG091104                       llm
    ## 348 2.0000000    Southeast Council   321ZJ092702                       llm
    ## 349 3.0000000    Southeast Council   321NJ061904                       llm
    ## 350 3.0000000    Southeast Council   321WM090603                       llm
    ## 351 2.0000000    Southeast Council   321SS081303                       llm
    ## 352 3.0000000    Southeast Council   321FW062504                       llm
    ## 353 3.0000000    Southeast Council   321PS042604                       llm
    ## 354 3.0000000 West Central Council   320CW111203              Young Middle
    ## 355 4.0000000    Panhandle Council   322TH052216                     Jinks
    ## 356 0.0000000    Panhandle Council   322NB061103                     Jinks
    ## 357 4.0000000    Panhandle Council   322CM041604                     Jinks
    ## 358 1.0000000    Panhandle Council   322KM030103                     Jinks
    ## 359 1.0000000    Panhandle Council   322BN030103                     Jinks
    ## 360 2.0000000    Panhandle Council   322SS091203                     Jinks
    ## 361 2.0000000    Panhandle Council   322TS032304                     Jinks
    ## 362 2.0000000    Panhandle Council   322JP020504                   Everitt
    ## 363 2.0000000    Panhandle Council   322DS062904                   Everitt
    ## 364 3.0000000    Panhandle Council   322DB062904                   Everitt
    ## 365 3.0000000    Panhandle Council   322LD122603                   Everitt
    ## 366 1.0000000    Panhandle Council   322KS101602                   Everitt
    ## 367 4.0000000 West Central Council   320AM011304             BLAKE ACADEMY
    ## 368 4.0000000 West Central Council 320AD12032003              Young Middle
    ## 369 3.0000000 West Central Council   320AC012304              Young Middle
    ## 370 4.0000000 West Central Council   320AS062504              Young Middle
    ## 371 4.0000000 West Central Council   320AR060504              Young Middle
    ## 372 4.0000000 West Central Council   320AH061004              Young Middle
    ## 373 4.0000000 West Central Council   320AG062003           KATHLEEN MIDDLE
    ## 374 4.0000000 West Central Council   320JR112403           KATHLEEN MIDDLE
    ## 375 4.0000000 West Central Council   320SH112304           KATHLEEN MIDDLE
    ## 376 4.0000000 West Central Council   320SY060804           KATHLEEN MIDDLE
    ## 377 3.0000000 West Central Council   320MC121603           KATHLEEN MIDDLE
    ## 378 4.0000000 West Central Council   320PB062204              Young Middle
    ## 379 4.0000000       Citrus Council 312AP04092004     Freedom Middle School
    ## 380 4.0000000       Citrus Council 312LS03262004     Freedom Middle School
    ## 381 3.0000000       Citrus Council 312ZS09302003  Robinswood Middle School
    ## 382 3.0000000       Citrus Council 312IN10052004     Freedom Middle School
    ## 383 2.0000000       Citrus Council 312WD05082004  Robinswood Middle School
    ## 384 2.0000000       Citrus Council 312NP11022003  Robinswood Middle School
    ## 385 1.5000000       Citrus Council 312IN10052003  Robinswood Middle School
    ## 386 2.0000000       Citrus Council 312WD05082003  Robinswood Middle School
    ## 387 4.0000000 West Central Council   320CD010605              Young Middle
    ## 388 4.0000000 West Central Council   320MD082804              Young Middle
    ## 389 4.0000000 West Central Council   320DE122803              Young Middle
    ## 390 4.0000000 West Central Council   320SF041404              Young Middle
    ## 391 4.0000000 West Central Council   320GL022604              Young Middle
    ## 392 4.0000000 West Central Council   320SM102203              Young Middle
    ## 393 4.0000000 West Central Council   320JM011404              Young middle
    ## 394 3.0000000 West Central Council   320KM041804              Young Middle
    ## 395 4.0000000 West Central Council   320FN072303              Young Middle
    ## 396 4.0000000 West Central Council   320CO110303              Young middle
    ## 397 4.0000000 West Central Council   320QP042204              Young Middle
    ## 398 4.0000000 West Central Council   320JP112403              young middle
    ## 399 4.0000000 West Central Council   320JS031504              YOUNG MIDDLE
    ## 400 4.0000000 West Central Council   320DS110703              Young Middle
    ## 401 4.0000000 West Central Council   320VV060302              Young Middle
    ## 402 3.0000000    Southeast Council   321SA011504                       llm
    ## 403 4.0000000    Southeast Council   321DB122003                       llm
    ## 404 3.0000000    Southeast Council   321ML073004                       llm
    ## 405 2.0000000    Southeast Council   321RM121303                       llm
    ## 406 2.0000000    Southeast Council   321TN073104                       llm
    ## 407 4.0000000    Southeast Council   321BP061502                       llm
    ## 408 3.0000000    Southeast Council   321SM012903                       llm
    ## 409 4.0000000 West Central Council   320SW080104              Young Middle
    ## 410 4.0000000 West Central Council   320AB061103             BLAKE ACADEMY
    ## 411 4.0000000 West Central Council   320EF042903             BLAKE ACADEMY
    ## 412 3.0000000 West Central Council   320CM120402             BLAKE ACADEMY
    ## 413 2.0000000 West Central Council   320AM072903             BLAKE ACADEMY
    ## 414 4.0000000 West Central Council   320BR072103             BLAKE ACADEMY
    ## 415 2.0000000 West Central Council   320NR060502             BLAKE ACADEMY
    ## 416 2.0000000 West Central Council   320AT101602             BLAKE ACADEMY
    ## 417 1.0000000 West Central Council   320AC122802              Young Middle
    ## 418 4.0000000 West Central Council   320MM111601           KATHLEEN MIDDLE
    ## 419 4.0000000 West Central Council   320TM070503           KATHLEEN MIDDLE
    ## 420 2.0000000 West Central Council   320LJ080502           KATHLEEN MIDDLE
    ## 421 2.0000000 West Central Council   320YL070603           KATHLEEN MIDDLE
    ## 422 3.0000000 West Central Council   320RM110102           KATHLEEN MIDDLE
    ## 423 3.0000000 West Central Council   320SA080203              Young Middle
    ## 424 4.0000000 West Central Council   320SB122902              Young Middle
    ## 425 4.0000000       Citrus Council 312MV12162001     Freedom Middle School
    ## 426 2.0000000      Gateway Council   313KA072203                THE BRIDGE
    ## 427 2.0000000      Gateway Council   313JB110302                THE BRIDGE
    ## 428 3.0000000      Gateway Council   313JB122202                THE BRIDGE
    ## 429 2.0000000      Gateway Council   313TB110703                THE BRIDGE
    ## 430 3.0000000      Gateway Council   313JC121003                THE BRIDGE
    ## 431 2.0000000      Gateway Council   313BC091702                THE BRIDGE
    ## 432 1.0000000      Gateway Council   313AC082303                THE BRIDGE
    ## 433 2.0000000      Gateway Council   313AE110601                THE BRIDGE
    ## 434 3.0000000      Gateway Council   313MH042903                THE BRIDGE
    ## 435 2.0000000      Gateway Council   313TH070301                THE BRIDGE
    ## 436 2.0000000      Gateway Council   313AJ100201                THE BRIDGE
    ## 437 2.0000000      Gateway Council   313AJ092102                THE BRIDGE
    ## 438 1.0000000      Gateway Council   313AK041202                THE BRIDGE
    ## 439 2.0000000      Gateway Council   313DL121201                THE BRIDGE
    ## 440 3.0000000      Gateway Council   313JM040603                THE BRIDGE
    ## 441 1.0000000      Gateway Council   313PM042502                THE BRIDGE
    ## 442 2.0000000      Gateway Council   313PM082503                THE BRIDGE
    ## 443 1.0000000      Gateway Council   313KM011503                THE BRIDGE
    ## 444 2.0000000      Gateway Council   313BM090401                THE BRIDGE
    ## 445 3.0000000      Gateway Council   313JP070503                THE BRIDGE
    ## 446 2.0000000      Gateway Council   313TP102402                THE BRIDGE
    ## 447 3.0000000      Gateway Council   313JR081602                THE BRIDGE
    ## 448 2.0000000      Gateway Council   313TR030302                THE BRIDGE
    ## 449 3.0000000      Gateway Council   313JR021003                THE BRIDGE
    ## 450 3.0000000      Gateway Council   313JR101502                THE BRIDGE
    ## 451 3.0000000      Gateway Council   313FS100200                THE BRIDGE
    ## 452 3.0000000      Gateway Council   313SS101701                THE BRIDGE
    ## 453 4.0000000      Gateway Council   313TS010303                THE BRIDGE
    ## 454 3.0000000      Gateway Council   313JT062302                THE BRIDGE
    ## 455 2.0000000      Gateway Council   313TT120602                THE BRIDGE
    ## 456 2.0000000      Gateway Council   313JT111801                THE BRIDGE
    ## 457 3.0000000      Gateway Council   313KT082103                THE BRIDGE
    ## 458 3.0000000      Gateway Council   313AW110303                THE BRIDGE
    ## 459 1.0000000      Gateway Council   313CW122702                THE BRIDGE
    ## 460 0.0000000      Gateway Council   313SW091704                THE BRIDGE
    ## 461 2.0000000      Gateway Council   313DC061403                 LAKESHORE
    ## 462 3.0000000      Gateway Council   313AT050703                 LAKESHORE
    ## 463 2.0000000      Gateway Council   313RC022402           MATTHEW GILBERT
    ## 464 4.0000000      Gateway Council   313LD062403           MATTHEW GILBERT
    ## 465 2.0000000      Gateway Council   313RA101702           MATTHEW GILBERT
    ## 466 3.0000000      Gateway Council   313MB022803           MATTHEW GILBERT
    ## 467 3.0000000      Gateway Council   313SR030803           MATTHEW GILBERT
    ## 468 2.0000000      Gateway Council   313KD031602                JEFF DAVIS
    ## 469 0.5000000      Gateway Council   313DF021003                JEFF DAVIS
    ## 470 3.0000000      Gateway Council   313RG060502                JEFF DAVIS
    ## 471 2.0000000      Gateway Council   313KH061102                JEFF DAVIS
    ## 472 2.0000000      Gateway Council   313JN101801                JEFF DAVIS
    ## 473 3.0000000      Gateway Council   313DS083103                JEFF DAVIS
    ## 474 4.0000000      Gateway Council   313MS091502                JEFF DAVIS
    ## 475 3.0000000      Gateway Council   313JT051502                JEFF DAVIS
    ## 476 3.0000000      Gateway Council   313KW061403                JEFF DAVIS
    ## 477 3.0000000      Gateway Council   313VM051001                JEFF DAVIS
    ## 478 2.0000000      Gateway Council   313LB031003                JEFF DAVIS
    ## 479 2.0000000      Gateway Council   313AC112702                JEFF DAVIS
    ## 480 1.0000000      Gateway Council   313MS022702                JEFF DAVIS
    ## 481 3.0000000      Gateway Council   313DB040203                JEFF DAVIS
    ## 482 1.5000000      Gateway Council   313PS082702                JEFF DAVIS
    ## 483 1.0000000      Gateway Council   313TL052902                JEB STUART
    ## 484 2.0000000      Gateway Council   313KH120302                JEB STUART
    ## 485 2.0000000      Gateway Council   313IS050500                JEB STUART
    ## 486 3.0000000      Gateway Council   313DD031903                JEB STUART
    ## 487 1.0000000      Gateway Council   313TT080603                JEB STUART
    ## 488 2.0000000      Gateway Council   313ME110803                JEB STUART
    ## 489 1.0000000      Gateway Council   313VP021302                JEB STUART
    ## 490 3.0000000      Gateway Council   313AN031402                JEB STUART
    ## 491 2.0000000      Gateway Council   313KB052502                JEB STUART
    ## 492 2.0000000      Gateway Council   313KB070103                JEB STUART
    ## 493 2.0000000      Gateway Council   313TD082503                JEB STUART
    ## 494 1.0000000      Gateway Council   313AG030404                JEB STUART
    ## 495 3.0000000      Gateway Council   313DH122500                JEB STUART
    ## 496 2.0000000      Gateway Council   313AJ041002                JEB STUART
    ## 497 3.0000000      Gateway Council   313KJ060502                JEB STUART
    ## 498 3.0000000      Gateway Council   313NL121902                JEB STUART
    ## 499 3.0000000      Gateway Council   313RR053001                JEB STUART
    ## 500 3.0000000      Gateway Council   313AS022503                JEB STUART
    ## 501 2.0000000      Gateway Council   313VZ100902                JEB STUART
    ## 502 2.0000000      Gateway Council   313MM120502                 STILLWELL
    ## 503 3.0000000      Gateway Council   313TB091302                 STILLWELL
    ## 504 4.0000000      Gateway Council   313ZC040702                 STILLWELL
    ## 505 3.0000000      Gateway Council   313AC082403                 STILLWELL
    ## 506 2.0000000      Gateway Council   313MD030503                 STILLWELL
    ## 507 2.0000000      Gateway Council   313HF112202                 STILLWELL
    ## 508 4.0000000      Gateway Council   313AH092102                 STILLWELL
    ## 509 2.0000000      Gateway Council   313AK021702                 STILLWELL
    ## 510 2.0000000      Gateway Council   313TS120902                 STILLWELL
    ## 511 2.0000000      Gateway Council   313CT061203                 STILLWELL
    ## 512 2.0000000      Gateway Council   313BW122602                 STILLWELL
    ## 513 1.0000000 West Central Council   320TP041503              Young middle
    ## 514 3.0000000    Southeast Council   321MA081902                       llm
    ## 515 4.0000000    Southeast Council   321BB091003                       llm
    ## 516 2.0000000    Southeast Council   321JP061803                       llm
    ## 517 4.0000000    Southeast Council   321PP043003                       llm
    ## 518 3.0000000    Southeast Council   321LU072702                       llm
    ## 519 4.0000000    Southeast Council   321JV021803                       llm
    ## 520 4.0000000    Panhandle Council   322CM080803                     Jinks
    ## 521 4.0000000    Panhandle Council   322MC020204                     Jinks
    ## 522 3.0000000    Panhandle Council   322LS071802                     Jinks
    ## 523 2.0000000    Panhandle Council   322IM020401                     Jinks
    ## 524 3.0000000    Panhandle Council   322AT111104                     Mowat
    ## 525 1.5000000    Panhandle Council   322HE123102                     Jinks
    ## 526 4.0000000 West Central Council   320DM041603             BLAKE ACADEMY
    ## 527 3.0000000 West Central Council   320IR061103             BLAKE ACADEMY
    ## 528 4.0000000 West Central Council   320MW123002             BLAKE ACADEMY
    ## 529 4.0000000 West Central Council   320IW012403             BLAKE ACADEMY
    ## 530 4.0000000 West Central Council   320AG022403              Young Middle
    ## 531 4.0000000 West Central Council   320AR112502              Young Middle
    ## 532 2.0000000 West Central Council   320AN032703              Young Middle
    ## 533 1.5000000 West Central Council   320AM072803              Young Middle
    ## 534 4.0000000 West Central Council   320BC091802             BLAKE ACADEMY
    ## 535 4.0000000 West Central Council   320CC061503           KATHLEEN MIDDLE
    ## 536 4.0000000 West Central Council   320AM041503           KATHLEEN MIDDLE
    ## 537 3.0000000 West Central Council   320OA051703              Young Middle
    ## 538 3.0000000 West Central Council   320SB020803              Young Middle
    ## 539 4.0000000 West Central Council   320EC112202              Young Middle
    ## 540 4.0000000 West Central Council   320GC121002              Young Middle
    ## 541 4.0000000 West Central Council   320SD102802              Young Middle
    ## 542 4.0000000 West Central Council   320SD031803              Young Middle
    ## 543 3.0000000 West Central Council   320MG041503              Young Middle
    ## 544 4.0000000 West Central Council   320JG062702              Young Middle
    ## 545 3.0000000 West Central Council   320RG071003              Young Middle
    ## 546 1.5000000 West Central Council   320MG030803              Young middle
    ## 547 4.0000000 West Central Council   320TH032403              Young middle
    ## 548 3.0000000 West Central Council   320JJ120102              Young middle
    ## 549 4.0000000 West Central Council   320TJ071403              Young Middle
    ## 550 3.0000000 West Central Council   320JL033003              Young Middle
    ## 551 2.0000000 West Central Council   320NL041303              Young Middle
    ## 552 4.0000000 West Central Council   320RM112402              Young Middle
    ## 553 4.0000000 West Central Council   320JM060403              Young middle
    ## 554 3.0000000 West Central Council   320CP011403              Young middle
    ## 555 4.0000000 West Central Council   320JP062103              Young middle
    ## 556 3.0000000 West Central Council   320SP042903              Young Middle
    ## 557 2.0000000 West Central Council   320YT091702              Young Middle
    ## 558 3.0000000 West Central Council   320SU062503              Young Middle
    ## 559 4.0000000 West Central Council   320ZU062503              young middle
    ## 560 1.5000000    Southeast Council   321FJ090103                       llm
    ## 561 4.0000000 West Central Council   320DW112402              Young Middle
    ## 562 3.0000000    Panhandle Council   322CJ222204                     Jinks
    ## 563 2.0000000    Panhandle Council   322BR081304                   Everitt
    ## 564 0.0000000    Panhandle Council   322LW082305                   Everitt
    ## 565 2.0000000       Citrus Council 312BD02222003                  MEMORIAL
    ## 566 3.0000000       Citrus Council 312SS05162003                  MEMORIAL
    ##       enrolled      langarts_course grade lang_pts
    ## 1   09/06/2016 M/J LANG ARTS 2 ESOL     A        4
    ## 2   09/01/2016      M/J LANG ARTS 1     B        3
    ## 3   09/01/2016      M/J LANG ARTS 1     B        3
    ## 4   09/01/2016      M/J LANG ARTS 1     A        4
    ## 5   09/01/2016      M/J LANG ARTS 1     B        3
    ## 6   09/01/2016      M/J LANG ARTS 1     B        3
    ## 7   09/01/2016      M/J LANG ARTS 1     A        4
    ## 8   09/01/2016      M/J LANG ARTS 1     B        3
    ## 9   09/01/2016      M/J LANG ARTS 1     B        3
    ## 10  09/01/2016      M/J LANG ARTS 1     A        4
    ## 11  09/01/2016      M/J LANG ARTS 1     B        3
    ## 12  09/01/2016      M/J LANG ARTS 1     B        3
    ## 13  09/01/2016      M/J LANG ARTS 1     A        4
    ## 14  09/01/2016      M/J LANG ARTS 1     C        2
    ## 15  09/01/2016      M/J LANG ARTS 1     C        2
    ## 16  09/01/2016      M/J LANG ARTS 1     C        2
    ## 17  09/21/2016      M/J LANG ARTS 1     B        3
    ## 18  09/21/2016      M/J LANG ARTS 1     B        3
    ## 19  09/21/2016      M/J LANG ARTS 1     B        3
    ## 20  10/01/2016      M/J LANG ARTS 1     A        4
    ## 21  10/01/2016      M/J LANG ARTS 1     A        4
    ## 22  10/01/2016      M/J LANG ARTS 1     B        3
    ## 23  10/01/2016      M/J LANG ARTS 1     A        4
    ## 24  10/01/2016      M/J LANG ARTS 1     A        4
    ## 25  10/01/2016      M/J LANG ARTS 1     A        4
    ## 26  10/01/2016      M/J LANG ARTS 1     B        3
    ## 27  10/01/2016      M/J LANG ARTS 1     A        4
    ## 28  10/01/2016      M/J LANG ARTS 1     B        3
    ## 29  10/01/2016      M/J LANG ARTS 1     A        4
    ## 30  10/01/2016      M/J LANG ARTS 1     C        2
    ## 31  09/21/2016      M/J LANG ARTS 1     A        4
    ## 32  09/06/2016      M/J LANG ARTS 1     A        4
    ## 33  09/06/2016      M/J LANG ARTS 1     D        1
    ## 34  09/06/2016      M/J LANG ARTS 1     B        3
    ## 35  09/06/2016      M/J LANG ARTS 1     D        1
    ## 36  09/06/2016      M/J LANG ARTS 1     C        2
    ## 37  09/06/2016      M/J LANG ARTS 1     C        2
    ## 38  09/06/2016      M/J LANG ARTS 1     D        1
    ## 39  09/06/2016      M/J LANG ARTS 1     C        2
    ## 40  09/06/2016      M/J LANG ARTS 1     B        3
    ## 41  09/06/2016      M/J LANG ARTS 1     C        2
    ## 42  09/06/2016      M/J LANG ARTS 1     D        1
    ## 43  09/06/2016      M/J LANG ARTS 1     C        2
    ## 44  09/06/2016      M/J LANG ARTS 1     C        2
    ## 45  09/06/2016      M/J LANG ARTS 1     D        1
    ## 46  09/06/2016      M/J LANG ARTS 1     C        2
    ## 47  09/06/2016      M/J LANG ARTS 1     D        1
    ## 48  09/06/2016      M/J LANG ARTS 1     B        3
    ## 49  09/06/2016      M/J LANG ARTS 1     B        3
    ## 50  09/06/2016      M/J LANG ARTS 1     B        3
    ## 51  09/06/2016      M/J LANG ARTS 1     D        1
    ## 52  09/06/2016      M/J LANG ARTS 1     D        1
    ## 53  09/06/2016      M/J LANG ARTS 1     D        1
    ## 54  09/06/2016      M/J LANG ARTS 1     C        2
    ## 55  09/06/2016      M/J LANG ARTS 1     A        4
    ## 56  09/06/2016      M/J LANG ARTS 1     C        2
    ## 57  09/06/2016      M/J LANG ARTS 1     B        3
    ## 58  09/06/2016      M/J LANG ARTS 1     D        1
    ## 59  09/06/2016      M/J LANG ARTS 1     C        2
    ## 60  09/06/2016      M/J LANG ARTS 1     B        3
    ## 61  09/06/2016      M/J LANG ARTS 1     C        2
    ## 62  09/06/2016      M/J LANG ARTS 1     C        2
    ## 63  09/06/2016      M/J LANG ARTS 1     B        3
    ## 64  09/06/2016      M/J LANG ARTS 1     D        1
    ## 65  09/06/2016      M/J LANG ARTS 1     C        2
    ## 66  09/06/2016      M/J LANG ARTS 1     C        2
    ## 67  09/06/2016      M/J LANG ARTS 1     B        3
    ## 68  09/06/2016      M/J LANG ARTS 1     A        4
    ## 69  09/06/2016      M/J LANG ARTS 1     D        1
    ## 70  09/06/2016      M/J LANG ARTS 1     B        3
    ## 71  09/06/2016      M/J LANG ARTS 1     B        3
    ## 72  09/06/2016      M/J LANG ARTS 1     A        4
    ## 73  09/06/2016      M/J LANG ARTS 1     C        2
    ## 74  09/06/2016      M/J LANG ARTS 1     B        3
    ## 75  09/06/2016      M/J LANG ARTS 1     B        3
    ## 76  09/06/2016      M/J LANG ARTS 1     B        3
    ## 77  09/06/2016      M/J LANG ARTS 1     B        3
    ## 78  09/06/2016      M/J LANG ARTS 1     B        3
    ## 79  09/06/2016      M/J LANG ARTS 1     B        3
    ## 80  09/06/2016      M/J LANG ARTS 1     C        2
    ## 81  09/06/2016      M/J LANG ARTS 1     A        4
    ## 82  09/06/2016      M/J LANG ARTS 1     C        2
    ## 83  09/06/2016      M/J LANG ARTS 1     C        2
    ## 84  09/06/2016      M/J LANG ARTS 1     D        1
    ## 85  09/06/2016      M/J LANG ARTS 1     D        1
    ## 86  09/06/2016      M/J LANG ARTS 1     C        2
    ## 87  09/06/2016      M/J LANG ARTS 1     C        2
    ## 88  09/06/2016      M/J LANG ARTS 1     B        3
    ## 89  09/06/2016      M/J LANG ARTS 1     C        2
    ## 90  09/06/2016      M/J LANG ARTS 1     D        1
    ## 91  09/06/2016      M/J LANG ARTS 1     C        2
    ## 92  09/06/2016      M/J LANG ARTS 1     B        3
    ## 93  09/06/2016      M/J LANG ARTS 1     C        2
    ## 94  09/06/2016      M/J LANG ARTS 1     C        2
    ## 95  09/06/2016      M/J LANG ARTS 1     C        2
    ## 96  09/06/2016      M/J LANG ARTS 1     D        1
    ## 97  09/06/2016      M/J LANG ARTS 1     C        2
    ## 98  09/06/2016      M/J LANG ARTS 1     B        3
    ## 99  09/06/2016      M/J LANG ARTS 1     C        2
    ## 100 09/06/2016      M/J LANG ARTS 1     D        1
    ## 101 09/06/2016      M/J LANG ARTS 1     B        3
    ## 102 09/06/2016      M/J LANG ARTS 1     C        2
    ## 103 09/06/2016      M/J LANG ARTS 1     D        1
    ## 104 09/06/2016      M/J LANG ARTS 1     B        3
    ## 105 09/06/2016      M/J LANG ARTS 1     A        4
    ## 106 09/06/2016      M/J LANG ARTS 1     B        3
    ## 107 09/06/2016      M/J LANG ARTS 1     C        2
    ## 108 09/06/2016      M/J LANG ARTS 1     A        4
    ## 109 09/06/2016      M/J LANG ARTS 1     B        3
    ## 110 09/12/2016      M/J LANG ARTS 1     C        2
    ## 111 09/12/2016      M/J LANG ARTS 1     A        4
    ## 112 09/12/2016      M/J LANG ARTS 1     A        4
    ## 113 09/06/2016      M/J LANG ARTS 1     D        1
    ## 114 09/06/2016      M/J LANG ARTS 1     B        3
    ## 115 09/12/2016      M/J LANG ARTS 1     A        4
    ## 116 09/12/2016      M/J LANG ARTS 1     B        3
    ## 117 09/12/2016      M/J LANG ARTS 1     A        4
    ## 118 09/21/2016      M/J LANG ARTS 1     A        4
    ## 119 09/21/2016      M/J LANG ARTS 1     A        4
    ## 120 10/01/2016      M/J LANG ARTS 1     C        2
    ## 121 10/01/2016      M/J LANG ARTS 1     B        3
    ## 122 10/01/2016      M/J LANG ARTS 1     D        1
    ## 123 10/01/2016      M/J LANG ARTS 1     B        3
    ## 124 10/01/2016      M/J LANG ARTS 1     D        1
    ## 125 10/01/2016      M/J LANG ARTS 1     F        0
    ## 126 10/01/2016      M/J LANG ARTS 1     B        3
    ## 127 10/01/2016      M/J LANG ARTS 1     A        4
    ## 128 10/01/2016      M/J LANG ARTS 1     C        2
    ## 129 10/01/2016      M/J LANG ARTS 1     C        2
    ## 130 10/01/2016      M/J LANG ARTS 1     B        3
    ## 131 10/01/2016      M/J LANG ARTS 1     B        3
    ## 132 10/01/2016      M/J LANG ARTS 1     D        1
    ## 133 10/01/2016      M/J LANG ARTS 1     B        3
    ## 134 10/01/2016      M/J LANG ARTS 1     B        3
    ## 135 09/21/2016      M/J LANG ARTS 1     A        4
    ## 136 10/11/2016      M/J LANG ARTS 1     C        2
    ## 137 10/11/2016      M/J LANG ARTS 1     B        3
    ## 138 09/21/2016      M/J LANG ARTS 1     A        4
    ## 139 09/21/2016      M/J LANG ARTS 1     B        3
    ## 140 10/11/2016      M/J LANG ARTS 1     A        4
    ## 141 10/11/2016      M/J LANG ARTS 1     B        3
    ## 142 10/25/2016      M/J LANG ARTS 1     C        2
    ## 143 10/25/2016      M/J LANG ARTS 1     B        3
    ## 144 02/08/2017      M/J LANG ARTS 1     C        2
    ## 145 02/08/2017      M/J LANG ARTS 1     B        3
    ## 146 02/08/2017      M/J LANG ARTS 1     C        2
    ## 147 02/08/2017      M/J LANG ARTS 1     B        3
    ## 148 02/08/2017      M/J LANG ARTS 1     B        3
    ## 149 02/08/2017      M/J LANG ARTS 1     B        3
    ## 150 02/08/2017      M/J LANG ARTS 1     B        3
    ## 151 02/08/2017      M/J LANG ARTS 1     C        2
    ## 152 02/08/2017      M/J LANG ARTS 1     C        2
    ## 153 02/08/2017      M/J LANG ARTS 1     B        3
    ## 154 02/08/2017      M/J LANG ARTS 1     C        2
    ## 155 02/08/2017      M/J LANG ARTS 1     D        1
    ## 156 02/08/2017      M/J LANG ARTS 1     D        1
    ## 157 02/08/2017      M/J LANG ARTS 1     B        3
    ## 158 02/08/2017      M/J LANG ARTS 1     B        3
    ## 159 02/08/2017      M/J LANG ARTS 1     A        4
    ## 160 02/08/2017      M/J LANG ARTS 1     C        2
    ## 161 02/08/2017      M/J LANG ARTS 1     B        3
    ## 162 02/08/2017      M/J LANG ARTS 1     A        4
    ## 163 02/08/2017      M/J LANG ARTS 1     F        0
    ## 164 02/08/2017      M/J LANG ARTS 1     C        2
    ## 165 02/08/2017      M/J LANG ARTS 1     C        2
    ## 166 02/08/2017      M/J LANG ARTS 1     C        2
    ## 167 09/01/2016  M/J LANG ARTS 1 ADV     A        4
    ## 168 09/01/2016  M/J LANG ARTS 1 ADV     B        3
    ## 169 09/01/2016  M/J LANG ARTS 1 ADV     A        4
    ## 170 09/01/2016  M/J LANG ARTS 1 ADV     B        3
    ## 171 10/01/2016  M/J LANG ARTS 1 ADV     A        4
    ## 172 10/01/2016  M/J LANG ARTS 1 ADV     A        4
    ## 173 10/01/2016  M/J LANG ARTS 1 ADV     A        4
    ## 174 10/01/2016  M/J LANG ARTS 1 ADV     A        4
    ## 175 10/01/2016  M/J LANG ARTS 1 ADV     A        4
    ## 176 10/01/2016  M/J LANG ARTS 1 ADV     A        4
    ## 177 10/01/2016  M/J LANG ARTS 1 ADV     A        4
    ## 178 10/01/2016  M/J LANG ARTS 1 ADV     A        4
    ## 179 09/21/2016  M/J LANG ARTS 1 ADV     A        4
    ## 180 09/21/2016  M/J LANG ARTS 1 ADV     B        3
    ## 181 09/06/2016  M/J LANG ARTS 1 ADV     D        1
    ## 182 09/12/2016  M/J LANG ARTS 1 ADV     A        4
    ## 183 09/12/2016  M/J LANG ARTS 1 ADV     A        4
    ## 184 09/21/2016  M/J LANG ARTS 1 ADV     A        4
    ## 185 09/21/2016  M/J LANG ARTS 1 ADV     A        4
    ## 186 09/21/2016  M/J LANG ARTS 1 ADV     A        4
    ## 187 10/11/2016  M/J LANG ARTS 1 ADV     B        3
    ## 188 10/11/2016  M/J LANG ARTS 1 ADV     B        3
    ## 189 09/21/2016  M/J LANG ARTS 1 ADV     B        3
    ## 190 10/11/2016  M/J LANG ARTS 1 ADV     B        3
    ## 191 10/11/2016  M/J LANG ARTS 1 ADV     A        4
    ## 192 09/21/2016  M/J LANG ARTS 1 ADV     A        4
    ## 193 09/21/2016  M/J LANG ARTS 1 ADV     B        3
    ## 194 10/11/2016  M/J LANG ARTS 1 ADV     A        4
    ## 195 10/11/2016  M/J LANG ARTS 1 ADV     C        2
    ## 196 10/11/2016  M/J LANG ARTS 1 ADV     B        3
    ## 197 10/25/2016  M/J LANG ARTS 1 ADV     C        2
    ## 198 10/25/2016  M/J LANG ARTS 1 ADV     B        3
    ## 199 10/25/2016  M/J LANG ARTS 1 ADV     A        4
    ## 200 10/25/2016  M/J LANG ARTS 1 ADV     A        4
    ## 201 10/01/2016      M/J LANG ARTS 2     A        4
    ## 202 10/01/2016      M/J LANG ARTS 2     A        4
    ## 203 10/01/2016      M/J LANG ARTS 2     A        4
    ## 204 10/01/2016      M/J LANG ARTS 2     A        4
    ## 205 10/01/2016      M/J LANG ARTS 2     A        4
    ## 206 09/21/2016      M/J LANG ARTS 2     A        4
    ## 207 09/21/2016      M/J LANG ARTS 2     B        3
    ## 208 10/01/2016      M/J LANG ARTS 2     B        3
    ## 209 10/01/2016      M/J LANG ARTS 2     C        2
    ## 210 10/01/2016      M/J LANG ARTS 2     B        3
    ## 211 10/01/2016      M/J LANG ARTS 2     B        3
    ## 212 09/21/2016      M/J LANG ARTS 2     A        4
    ## 213 09/21/2016      M/J LANG ARTS 2     B        3
    ## 214 09/21/2016      M/J LANG ARTS 2     A        4
    ## 215 09/06/2016      M/J LANG ARTS 2     A        4
    ## 216 09/06/2016      M/J LANG ARTS 2     C        2
    ## 217 09/06/2016      M/J LANG ARTS 2     C        2
    ## 218 09/06/2016      M/J LANG ARTS 2     B        3
    ## 219 09/06/2016      M/J LANG ARTS 2     C        2
    ## 220 09/06/2016      M/J LANG ARTS 2     C        2
    ## 221 09/06/2016      M/J LANG ARTS 2     B        3
    ## 222 09/06/2016      M/J LANG ARTS 2     C        2
    ## 223 09/06/2016      M/J LANG ARTS 2     C        2
    ## 224 09/06/2016      M/J LANG ARTS 2     C        2
    ## 225 09/06/2016      M/J LANG ARTS 2     C        2
    ## 226 09/06/2016      M/J LANG ARTS 2     D        1
    ## 227 09/06/2016      M/J LANG ARTS 2     B        3
    ## 228 09/06/2016      M/J LANG ARTS 2     C        2
    ## 229 09/06/2016      M/J LANG ARTS 2     C        2
    ## 230 09/06/2016      M/J LANG ARTS 2     B        3
    ## 231 09/06/2015      M/J LANG ARTS 2     C        2
    ## 232 09/06/2016      M/J LANG ARTS 2     D        1
    ## 233 09/06/2016      M/J LANG ARTS 2     D        1
    ## 234 09/06/2016      M/J LANG ARTS 2     B        3
    ## 235 09/06/2016      M/J LANG ARTS 2     C        2
    ## 236 09/06/2016      M/J LANG ARTS 2     B        3
    ## 237 09/06/2016      M/J LANG ARTS 2     C        2
    ## 238 09/06/2016      M/J LANG ARTS 2     F        0
    ## 239 09/06/2016      M/J LANG ARTS 2     D        1
    ## 240 09/06/2016      M/J LANG ARTS 2     F        0
    ## 241 09/06/2016      M/J LANG ARTS 2     C        2
    ## 242 09/06/2016      M/J LANG ARTS 2     C        2
    ## 243 09/06/2016      M/J LANG ARTS 2     B        3
    ## 244 09/06/2016      M/J LANG ARTS 2     C        2
    ## 245 09/06/2016      M/J LANG ARTS 2     C        2
    ## 246 09/06/2016      M/J LANG ARTS 2     B        3
    ## 247 09/06/2016      M/J LANG ARTS 2     C        2
    ## 248 09/06/2016      M/J LANG ARTS 2     C        2
    ## 249 09/06/2016      M/J LANG ARTS 2     D        1
    ## 250 09/06/2016      M/J LANG ARTS 2     C        2
    ## 251 09/06/2016      M/J LANG ARTS 2     B        3
    ## 252 09/06/2016      M/J LANG ARTS 2     C        2
    ## 253 09/06/2016      M/J LANG ARTS 2     C        2
    ## 254 09/06/2016      M/J LANG ARTS 2     C        2
    ## 255 09/06/2016      M/J LANG ARTS 2     C        2
    ## 256 09/06/2016      M/J LANG ARTS 2     B        3
    ## 257 09/06/2016      M/J LANG ARTS 2     C        2
    ## 258 09/06/2016      M/J LANG ARTS 2     C        2
    ## 259 09/06/2016      M/J LANG ARTS 2     C        2
    ## 260 09/06/2016      M/J LANG ARTS 2     D        1
    ## 261 09/06/2016      M/J LANG ARTS 2     C        2
    ## 262 09/06/2016      M/J LANG ARTS 2     C        2
    ## 263 09/06/2016      M/J LANG ARTS 2     C        2
    ## 264 09/06/2016      M/J LANG ARTS 2     B        3
    ## 265 09/06/2016      M/J LANG ARTS 2     D        1
    ## 266 09/06/2016      M/J LANG ARTS 2     C        2
    ## 267 09/06/2016      M/J LANG ARTS 2     A        4
    ## 268 09/06/2016      M/J LANG ARTS 2     B        3
    ## 269 09/06/2016      M/J LANG ARTS 2     B        3
    ## 270 09/06/2016      M/J LANG ARTS 2     B        3
    ## 271 09/06/2016      M/J LANG ARTS 2     D        1
    ## 272 09/06/2016      M/J LANG ARTS 2     D        1
    ## 273 09/06/2016      M/J LANG ARTS 2     C        2
    ## 274 09/06/2016      M/J LANG ARTS 2     B        3
    ## 275 09/06/2016      M/J LANG ARTS 2     C        2
    ## 276 09/06/2016      M/J LANG ARTS 2     C        2
    ## 277 09/06/2016      M/J LANG ARTS 2     B        3
    ## 278 09/06/2016      M/J LANG ARTS 2     C        2
    ## 279 09/06/2016      M/J LANG ARTS 2     D        1
    ## 280 09/06/2016      M/J LANG ARTS 2     C        2
    ## 281 09/06/2016      M/J LANG ARTS 2     C        2
    ## 282 09/06/2016      M/J LANG ARTS 2     D        1
    ## 283 09/06/2016      M/J LANG ARTS 2     A        4
    ## 284 09/06/2016      M/J LANG ARTS 2     B        3
    ## 285 09/06/2016      M/J LANG ARTS 2     B        3
    ## 286 09/06/2016      M/J LANG ARTS 2     C        2
    ## 287 09/06/2016      M/J LANG ARTS 2     D        1
    ## 288 09/06/2016      M/J LANG ARTS 2     B        3
    ## 289 09/06/2016      M/J LANG ARTS 2     F        0
    ## 290 09/06/2016      M/J LANG ARTS 2     B        3
    ## 291 09/06/2016      M/J LANG ARTS 2     C        2
    ## 292 09/06/2016      M/J LANG ARTS 2     A        4
    ## 293 09/06/2016      M/J LANG ARTS 2     C        2
    ## 294 09/06/2016      M/J LANG ARTS 2     B        3
    ## 295 09/06/2016      M/J LANG ARTS 2     C        2
    ## 296 09/06/2016      M/J LANG ARTS 2     C        2
    ## 297 09/06/2016      M/J LANG ARTS 2     C        2
    ## 298 09/06/2016      M/J LANG ARTS 2     C        2
    ## 299 09/06/2016      M/J LANG ARTS 2     C        2
    ## 300 09/06/2016      M/J LANG ARTS 2     D        1
    ## 301 09/06/2016      M/J LANG ARTS 2     F        0
    ## 302 09/06/2016      M/J LANG ARTS 2     B        3
    ## 303 09/06/2016      M/J LANG ARTS 2     D        1
    ## 304 09/06/2016      M/J LANG ARTS 2     C        2
    ## 305 09/06/2016      M/J LANG ARTS 2     C        2
    ## 306 09/06/2016      M/J LANG ARTS 2     A        4
    ## 307 09/06/2016      M/J LANG ARTS 2     B        3
    ## 308 09/06/2016      M/J LANG ARTS 2     D        1
    ## 309 09/06/2016      M/J LANG ARTS 2     C        2
    ## 310 09/06/2016      M/J LANG ARTS 2     B        3
    ## 311 09/06/2016      M/J LANG ARTS 2     D        1
    ## 312 09/06/2016      M/J LANG ARTS 2     C        2
    ## 313 09/06/2016      M/J LANG ARTS 2     D        1
    ## 314 09/06/2016      M/J LANG ARTS 2     D        1
    ## 315 09/06/2016      M/J LANG ARTS 2     C        2
    ## 316 09/06/2016      M/J LANG ARTS 2     D        1
    ## 317 09/06/2016      M/J LANG ARTS 2     F        0
    ## 318 09/06/2016      M/J LANG ARTS 2     A        4
    ## 319 09/06/2016      M/J LANG ARTS 2     B        3
    ## 320 09/06/2016      M/J LANG ARTS 2     C        2
    ## 321 09/06/2016      M/J LANG ARTS 2     B        3
    ## 322 09/06/2016      M/J LANG ARTS 2     C        2
    ## 323 09/06/2016      M/J LANG ARTS 2     C        2
    ## 324 09/06/2016      M/J LANG ARTS 2     C        2
    ## 325 09/06/2016      M/J LANG ARTS 2     A        4
    ## 326 09/06/2016      M/J LANG ARTS 2     D        1
    ## 327 09/06/2016      M/J LANG ARTS 2     B        3
    ## 328 09/06/2016      M/J LANG ARTS 2     B        3
    ## 329 09/06/2016      M/J LANG ARTS 2     C        2
    ## 330 09/06/2016      M/J LANG ARTS 2     C        2
    ## 331 09/06/2016      M/J LANG ARTS 2     B        3
    ## 332 09/06/2016      M/J LANG ARTS 2     C        2
    ## 333 09/06/2016      M/J LANG ARTS 2     C        2
    ## 334 09/06/2016      M/J LANG ARTS 2     B        3
    ## 335 09/21/2016      M/J LANG ARTS 2     A        4
    ## 336 09/21/2016      M/J LANG ARTS 2     B        3
    ## 337 09/21/2016      M/J LANG ARTS 2     B        3
    ## 338 09/21/2016      M/J LANG ARTS 2     B        3
    ## 339 09/21/2016      M/J LANG ARTS 2     A        4
    ## 340 09/21/2016      M/J LANG ARTS 2     B        3
    ## 341 09/21/2016      M/J LANG ARTS 2     B        3
    ## 342 09/21/2016      M/J LANG ARTS 2     B        3
    ## 343 09/21/2016      M/J LANG ARTS 2     A        4
    ## 344 09/21/2016      M/J LANG ARTS 2     A        4
    ## 345 10/11/2016      M/J LANG ARTS 2     B        3
    ## 346 10/11/2016      M/J LANG ARTS 2     B        3
    ## 347 10/11/2016      M/J LANG ARTS 2     B        3
    ## 348 10/11/2016      M/J LANG ARTS 2     C        2
    ## 349 10/11/2016      M/J LANG ARTS 2     B        3
    ## 350 10/11/2016      M/J LANG ARTS 2     B        3
    ## 351 10/11/2016      M/J LANG ARTS 2     C        2
    ## 352 10/11/2016      M/J LANG ARTS 2     B        3
    ## 353 10/11/2016      M/J LANG ARTS 2     B        3
    ## 354 09/21/2016      M/J LANG ARTS 2     B        3
    ## 355 02/08/2017      M/J LANG ARTS 2     A        4
    ## 356 02/08/2017      M/J LANG ARTS 2     F        0
    ## 357 02/08/2017      M/J LANG ARTS 2     A        4
    ## 358 02/08/2017      M/J LANG ARTS 2     D        1
    ## 359 02/08/2017      M/J LANG ARTS 2     D        1
    ## 360 02/08/2017      M/J LANG ARTS 2     C        2
    ## 361 02/08/2017      M/J LANG ARTS 2     C        2
    ## 362 02/08/2017      M/J LANG ARTS 2     C        2
    ## 363 02/08/2017      M/J LANG ARTS 2     C        2
    ## 364 02/08/2017      M/J LANG ARTS 2     B        3
    ## 365 02/08/2017      M/J LANG ARTS 2     B        3
    ## 366 02/08/2017      M/J LANG ARTS 2     D        1
    ## 367 10/01/2016  M/J LANG ARTS 2 ADV     A        4
    ## 368 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 369 09/21/2016  M/J LANG ARTS 2 ADV     B        3
    ## 370 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 371 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 372 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 373 10/01/2016  M/J LANG ARTS 2 ADV     A        4
    ## 374 10/01/2016  M/J LANG ARTS 2 ADV     A        4
    ## 375 10/01/2016  M/J LANG ARTS 2 ADV     A        4
    ## 376 10/01/2016  M/J LANG ARTS 2 ADV     A        4
    ## 377 10/01/2016  M/J LANG ARTS 2 ADV     B        3
    ## 378 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 379 09/06/2016  M/J LANG ARTS 2 ADV     A        4
    ## 380 09/06/2016  M/J LANG ARTS 2 ADV     A        4
    ## 381 09/06/2016  M/J LANG ARTS 2 ADV     B        3
    ## 382 09/06/2016  M/J LANG ARTS 2 ADV     B        3
    ## 383 09/06/2016  M/J LANG ARTS 2 ADV     C        2
    ## 384 09/06/2016  M/J LANG ARTS 2 ADV     C        2
    ## 385 09/06/2016  M/J LANG ARTS 2 ADV     B        3
    ## 386 09/06/2016  M/J LANG ARTS 2 ADV     C        2
    ## 387 09/16/2016  M/J LANG ARTS 2 ADV     A        4
    ## 388 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 389 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 390 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 391 09/26/2016  M/J LANG ARTS 2 ADV     A        4
    ## 392 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 393 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 394 09/21/2016  M/J LANG ARTS 2 ADV     B        3
    ## 395 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 396 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 397 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 398 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 399 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 400 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 401 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 402 10/11/2016  M/J LANG ARTS 2 ADV     B        3
    ## 403 10/11/2016  M/J LANG ARTS 2 ADV     A        4
    ## 404 10/11/2016  M/J LANG ARTS 2 ADV     B        3
    ## 405 10/11/2016  M/J LANG ARTS 2 ADV     C        2
    ## 406 10/11/2016  M/J LANG ARTS 2 ADV     C        2
    ## 407 10/11/2016  M/J LANG ARTS 2 ADV     A        4
    ## 408 10/11/2016  M/J LANG ARTS 2 ADV     B        3
    ## 409 09/21/2016  M/J LANG ARTS 2 ADV     A        4
    ## 410 10/01/2014      M/J LANG ARTS 3     A        4
    ## 411 09/01/2014      M/J LANG ARTS 3     A        4
    ## 412 10/01/2015      M/J LANG ARTS 3     B        3
    ## 413 09/01/2014      M/J LANG ARTS 3     C        2
    ## 414 09/01/2014      M/J LANG ARTS 3     A        4
    ## 415 09/01/2015      M/J LANG ARTS 3     C        2
    ## 416 09/01/2014      M/J LANG ARTS 3     C        2
    ## 417 09/21/2016      M/J LANG ARTS 3     D        1
    ## 418 10/01/2016      M/J LANG ARTS 3     A        4
    ## 419 10/01/2016      M/J LANG ARTS 3     A        4
    ## 420 10/01/2016      M/J LANG ARTS 3     C        2
    ## 421 10/01/2016      M/J LANG ARTS 3     C        2
    ## 422 10/01/2016      M/J LANG ARTS 3     B        3
    ## 423 09/21/2016      M/J LANG ARTS 3     B        3
    ## 424 09/21/2016      M/J LANG ARTS 3     A        4
    ## 425 09/06/2016      M/J LANG ARTS 3     A        4
    ## 426 09/06/2016      M/J LANG ARTS 3     C        2
    ## 427 09/06/2016      M/J LANG ARTS 3     C        2
    ## 428 09/06/2016      M/J LANG ARTS 3     B        3
    ## 429 09/06/2016      M/J LANG ARTS 3     C        2
    ## 430 09/06/2016      M/J LANG ARTS 3     B        3
    ## 431 09/06/2016      M/J LANG ARTS 3     C        2
    ## 432 09/06/2016      M/J LANG ARTS 3     D        1
    ## 433 09/06/2016      M/J LANG ARTS 3     C        2
    ## 434 09/06/2016      M/J LANG ARTS 3     B        3
    ## 435 09/06/2016      M/J LANG ARTS 3     C        2
    ## 436 09/06/2016      M/J LANG ARTS 3     C        2
    ## 437 09/06/2016      M/J LANG ARTS 3     C        2
    ## 438 09/06/2016      M/J LANG ARTS 3     D        1
    ## 439 09/06/2016      M/J LANG ARTS 3     C        2
    ## 440 09/06/2016      M/J LANG ARTS 3     B        3
    ## 441 09/06/2016      M/J LANG ARTS 3     D        1
    ## 442 09/06/2016      M/J LANG ARTS 3     C        2
    ## 443 09/06/2016      M/J LANG ARTS 3     D        1
    ## 444 09/06/2016      M/J LANG ARTS 3     C        2
    ## 445 09/06/2016      M/J LANG ARTS 3     B        3
    ## 446 09/06/2016      M/J LANG ARTS 3     C        2
    ## 447 09/06/2016      M/J LANG ARTS 3     B        3
    ## 448 09/06/2016      M/J LANG ARTS 3     C        2
    ## 449 09/06/2016      M/J LANG ARTS 3     B        3
    ## 450 09/06/2016      M/J LANG ARTS 3     B        3
    ## 451 09/06/2016      M/J LANG ARTS 3     B        3
    ## 452 09/06/2016      M/J LANG ARTS 3     B        3
    ## 453 09/06/2016      M/J LANG ARTS 3     A        4
    ## 454 09/06/2016      M/J LANG ARTS 3     B        3
    ## 455 09/06/2016      M/J LANG ARTS 3     C        2
    ## 456 09/06/2016      M/J LANG ARTS 3     C        2
    ## 457 09/06/2016      M/J LANG ARTS 3     B        3
    ## 458 09/06/2016      M/J LANG ARTS 3     B        3
    ## 459 09/06/2016      M/J LANG ARTS 3     D        1
    ## 460 09/06/2016      M/J LANG ARTS 3     F        0
    ## 461 09/06/2016      M/J LANG ARTS 3     C        2
    ## 462 09/06/2016      M/J LANG ARTS 3     B        3
    ## 463 09/06/2016      M/J LANG ARTS 3     C        2
    ## 464 09/06/2016      M/J LANG ARTS 3     A        4
    ## 465 09/06/2016      M/J LANG ARTS 3     C        2
    ## 466 09/06/2016      M/J LANG ARTS 3     B        3
    ## 467 09/06/2016      M/J LANG ARTS 3     B        3
    ## 468 09/06/2016      M/J LANG ARTS 3     C        2
    ## 469 09/06/2016      M/J LANG ARTS 3     D        1
    ## 470 09/06/2016      M/J LANG ARTS 3     B        3
    ## 471 09/06/2016      M/J LANG ARTS 3     C        2
    ## 472 09/06/2016      M/J LANG ARTS 3     C        2
    ## 473 09/06/2016      M/J LANG ARTS 3     B        3
    ## 474 09/06/2016      M/J LANG ARTS 3     A        4
    ## 475 09/06/2016      M/J LANG ARTS 3     B        3
    ## 476 09/06/2016      M/J LANG ARTS 3     B        3
    ## 477 09/06/2016      M/J LANG ARTS 3     B        3
    ## 478 09/06/2016      M/J LANG ARTS 3     C        2
    ## 479 09/06/2016      M/J LANG ARTS 3     C        2
    ## 480 09/06/2016      M/J LANG ARTS 3     D        1
    ## 481 09/06/2016      M/J LANG ARTS 3     B        3
    ## 482 09/06/2016      M/J LANG ARTS 3     B        3
    ## 483 09/06/2016      M/J LANG ARTS 3     D        1
    ## 484 09/06/2016      M/J LANG ARTS 3     C        2
    ## 485 09/06/2016      M/J LANG ARTS 3     C        2
    ## 486 09/06/2016      M/J LANG ARTS 3     B        3
    ## 487 09/06/2016      M/J LANG ARTS 3     D        1
    ## 488 09/06/2016      M/J LANG ARTS 3     C        2
    ## 489 09/06/2016      M/J LANG ARTS 3     D        1
    ## 490 09/06/2016      M/J LANG ARTS 3     B        3
    ## 491 09/06/2016      M/J LANG ARTS 3     C        2
    ## 492 09/06/2016      M/J LANG ARTS 3     C        2
    ## 493 09/06/2016      M/J LANG ARTS 3     C        2
    ## 494 09/06/2016      M/J LANG ARTS 3     D        1
    ## 495 09/06/2016      M/J LANG ARTS 3     B        3
    ## 496 09/06/2016      M/J LANG ARTS 3     C        2
    ## 497 09/06/2016      M/J LANG ARTS 3     B        3
    ## 498 09/06/2016      M/J LANG ARTS 3     B        3
    ## 499 09/06/2016      M/J LANG ARTS 3     B        3
    ## 500 09/06/2016      M/J LANG ARTS 3     B        3
    ## 501 09/06/2016      M/J LANG ARTS 3     C        2
    ## 502 09/06/2016      M/J LANG ARTS 3     C        2
    ## 503 09/06/2016      M/J LANG ARTS 3     B        3
    ## 504 09/06/2016      M/J LANG ARTS 3     A        4
    ## 505 09/06/2016      M/J LANG ARTS 3     B        3
    ## 506 09/06/2016      M/J LANG ARTS 3     C        2
    ## 507 09/06/2016      M/J LANG ARTS 3     C        2
    ## 508 09/06/2016      M/J LANG ARTS 3     A        4
    ## 509 09/06/2016      M/J LANG ARTS 3     C        2
    ## 510 09/06/2016      M/J LANG ARTS 3     C        2
    ## 511 09/06/2016      M/J LANG ARTS 3     C        2
    ## 512 09/06/2016      M/J LANG ARTS 3     C        2
    ## 513 09/21/2016      M/J LANG ARTS 3     D        1
    ## 514 10/11/2016      M/J LANG ARTS 3     B        3
    ## 515 10/11/2016      M/J LANG ARTS 3     A        4
    ## 516 10/11/2016      M/J LANG ARTS 3     C        2
    ## 517 10/11/2016      M/J LANG ARTS 3     A        4
    ## 518 10/11/2016      M/J LANG ARTS 3     B        3
    ## 519 10/11/2016      M/J LANG ARTS 3     A        4
    ## 520 02/08/2017      M/J LANG ARTS 3     A        4
    ## 521 02/08/2017      M/J LANG ARTS 3     A        4
    ## 522 02/08/2017      M/J LANG ARTS 3     B        3
    ## 523 02/08/2017      M/J LANG ARTS 3     C        2
    ## 524 10/06/2016      M/J LANG ARTS 3     B        3
    ## 525 02/15/2017      M/J LANG ARTS 3     B        3
    ## 526 09/01/2015  M/J LANG ARTS 3 ADv     A        4
    ## 527 09/01/2015  M/J LANG ARTS 3 ADv     B        3
    ## 528 09/01/2016  M/J LANG ARTS 3 ADv     A        4
    ## 529 09/01/2014  M/J LANG ARTS 3 ADv     A        4
    ## 530 09/21/2016  M/J LANG ARTS 3 ADv     A        4
    ## 531 09/21/2016  M/J LANG ARTS 3 ADv     A        4
    ## 532 09/21/2016  M/J LANG ARTS 3 ADv     C        2
    ## 533 09/21/2016  M/J LANG ARTS 3 ADv     B        3
    ## 534 10/01/2016  M/J LANG ARTS 3 ADv     A        4
    ## 535 10/01/2016  M/J LANG ARTS 3 ADv     A        4
    ## 536 10/01/2016  M/J LANG ARTS 3 ADv     A        4
    ## 537 09/21/2016  M/J LANG ARTS 3 ADv     B        3
    ## 538 09/21/2016  M/J LANG ARTS 3 ADv     B        3
    ## 539 09/21/2016  M/J LANG ARTS 3 ADv     A        4
    ## 540 09/21/2016  M/J LANG ARTS 3 ADv     A        4
    ## 541 09/21/2016  M/J LANG ARTS 3 ADv     A        4
    ## 542 09/21/2016  M/J LANG ARTS 3 ADv     A        4
    ## 543 09/21/2016  M/J LANG ARTS 3 ADv     B        3
    ## 544 09/21/2016  M/J LANG ARTS 3 ADv     A        4
    ## 545 09/21/2016  M/J LANG ARTS 3 ADv     B        3
    ## 546 09/21/2016  M/J LANG ARTS 3 ADv     B        3
    ## 547 09/21/2016  M/J LANG ARTS 3 ADv     A        4
    ## 548 09/21/2016  M/J LANG ARTS 3 ADv     B        3
    ## 549 09/21/2016  M/J LANG ARTS 3 ADv     A        4
    ## 550 09/21/2016  M/J LANG ARTS 3 ADv     B        3
    ## 551 09/21/2016  M/J LANG ARTS 3 ADv     C        2
    ## 552 09/21/2016  M/J LANG ARTS 3 ADv     A        4
    ## 553 09/21/2016  M/J LANG ARTS 3 ADv     A        4
    ## 554 09/21/2016  M/J LANG ARTS 3 ADv     B        3
    ## 555 09/21/2016  M/J LANG ARTS 3 ADv     A        4
    ## 556 09/21/2016  M/J LANG ARTS 3 ADv     B        3
    ## 557 09/21/2016  M/J LANG ARTS 3 ADv     A        4
    ## 558 09/21/2016  M/J LANG ARTS 3 ADv     B        3
    ## 559 09/21/2016  M/J LANG ARTS 3 ADv     A        4
    ## 560 10/11/2016  M/J LANG ARTS 3 ADv     B        3
    ## 561 09/21/2016  M/J LANG ARTS 3 ADv     A        4
    ## 562 02/08/2017 M/J ENG 3 CAMB SEC 3     B        3
    ## 563 02/08/2017 M/J INTENS LANG ARTS     C        2
    ## 564 02/08/2017 M/J INTENS LANG ARTS     F        0
    ## 565 09/26/2016              ENGLISH     C        2
    ## 566 09/26/2016              ENGLISH     B        3

Join All Behavior Data
======================

``` r
q1_behavior_data <- full_join(q1_behavior, q1_attendance, by="girl_code")

dim(q1_behavior_data)
```

    ## [1] 576  13

``` r
head(q1_behavior_data)
```

    ## # A tibble: 6 × 13
    ##              council.x   girl_code      school.x enrolled.x in_school
    ##                  <chr>       <chr>         <chr>      <chr>     <dbl>
    ## 1 West Central Council 320LA021505 BLAKE ACADEMY 09/01/2016         0
    ## 2 West Central Council 320JA020205 BLAKE ACADEMY 09/01/2016         0
    ## 3 West Central Council 320AC100104 BLAKE ACADEMY 09/01/2016         0
    ## 4 West Central Council 320CC050705 BLAKE ACADEMY 09/01/2016         0
    ## 5 West Central Council 320NC041704 BLAKE ACADEMY 09/01/2016         0
    ## 6 West Central Council 320MC111104 BLAKE ACADEMY 09/01/2016         0
    ## # ... with 8 more variables: out_school <dbl>, total.x <dbl>,
    ## #   council.y <chr>, school.y <chr>, enrolled.y <chr>, unexcused <dbl>,
    ## #   excused <dbl>, total.y <dbl>

``` r
names(q1_behavior_data)
```

    ##  [1] "council.x"  "girl_code"  "school.x"   "enrolled.x" "in_school" 
    ##  [6] "out_school" "total.x"    "council.y"  "school.y"   "enrolled.y"
    ## [11] "unexcused"  "excused"    "total.y"

``` r
q1_behavior_data <- q1_behavior_data %>%
    select(1,2,3,4, 5, 7, 13) %>%
    rename(council = council.x) %>%
    rename(school = school.x) %>%
    rename(enrolled = enrolled.x) %>%
    rename(suspension_total = total.x)%>%
    rename(absences_total = total.y)

head(q1_behavior_data)
```

    ## # A tibble: 6 × 7
    ##                council   girl_code        school   enrolled in_school
    ##                  <chr>       <chr>         <chr>      <chr>     <dbl>
    ## 1 West Central Council 320LA021505 BLAKE ACADEMY 09/01/2016         0
    ## 2 West Central Council 320JA020205 BLAKE ACADEMY 09/01/2016         0
    ## 3 West Central Council 320AC100104 BLAKE ACADEMY 09/01/2016         0
    ## 4 West Central Council 320CC050705 BLAKE ACADEMY 09/01/2016         0
    ## 5 West Central Council 320NC041704 BLAKE ACADEMY 09/01/2016         0
    ## 6 West Central Council 320MC111104 BLAKE ACADEMY 09/01/2016         0
    ## # ... with 2 more variables: suspension_total <dbl>, absences_total <dbl>

``` r
q1_behavior_data <- full_join(q1_behavior_data, q1_expelled, by="girl_code")

names(q1_behavior_data)
```

    ##  [1] "council.x"        "girl_code"        "school.x"        
    ##  [4] "enrolled.x"       "in_school"        "suspension_total"
    ##  [7] "absences_total"   "council.y"        "school.y"        
    ## [10] "enrolled.y"       "expelled"

``` r
q1_behavior_data <- q1_behavior_data %>%
    select(1, 2, 3, 4, 6,7,11) %>%
    rename(council = council.x) %>%
    rename(school = school.x)%>%
    rename(enrolled = enrolled.x)
    #rename(expelled = expelled.x)


head(q1_behavior_data)
```

    ## # A tibble: 6 × 7
    ##                council   girl_code        school   enrolled
    ##                  <chr>       <chr>         <chr>      <chr>
    ## 1 West Central Council 320LA021505 BLAKE ACADEMY 09/01/2016
    ## 2 West Central Council 320JA020205 BLAKE ACADEMY 09/01/2016
    ## 3 West Central Council 320AC100104 BLAKE ACADEMY 09/01/2016
    ## 4 West Central Council 320CC050705 BLAKE ACADEMY 09/01/2016
    ## 5 West Central Council 320NC041704 BLAKE ACADEMY 09/01/2016
    ## 6 West Central Council 320MC111104 BLAKE ACADEMY 09/01/2016
    ## # ... with 3 more variables: suspension_total <dbl>, absences_total <dbl>,
    ## #   expelled <chr>

Combine Grades
==============

``` r
q1_grades_c <- full_join(q1_reading, q1_langarts, by="girl_code")

names(q1_grades_c)
```

    ##  [1] "reading_avg"     "council.x"       "girl_code"      
    ##  [4] "school.x"        "enrolled.x"      "reading_course" 
    ##  [7] "Grade"           "reading_pts"     "lang_avg"       
    ## [10] "council.y"       "school.y"        "enrolled.y"     
    ## [13] "langarts_course" "grade"           "lang_pts"

``` r
q1_grades_c <- q1_grades_c %>%
    select(2,6,7,12,13) %>%
    rename(council = council.x)

head(q1_grades_c)
```

    ##                council  reading_course Grade enrolled.y langarts_course
    ## 1 West Central Council M/J INTENS READ     D 09/01/2016 M/J LANG ARTS 1
    ## 2 West Central Council M/J INTENS READ     D 09/01/2016 M/J LANG ARTS 1
    ## 3 West Central Council M/J INTENS READ     C 09/01/2016 M/J LANG ARTS 1
    ## 4 West Central Council M/J INTENS READ     D 09/01/2016 M/J LANG ARTS 1
    ## 5 West Central Council M/J INTENS READ     C 09/01/2016 M/J LANG ARTS 1
    ## 6 West Central Council M/J INTENS READ     D 09/01/2016 M/J LANG ARTS 1

``` r
setwd("C:/Users/kevin/Dropbox/GetReal/Data/sqlite")


getReal_db<- dbConnect(SQLite(), dbname="outcome_history.sqlite") #established connection with database

dbWriteTable(conn =getReal_db, name= "Q1_attendance_1617", value= q1_attendance, row.names=FALSE, overwrite=TRUE)
```

    ## [1] TRUE

``` r
dbWriteTable(conn =getReal_db, name= "Q1_behavior_1617", value= q1_behavior, row.names=FALSE, overwrite=TRUE)
```

    ## [1] TRUE

``` r
dbWriteTable(conn =getReal_db, name= "Q1_expelled_1617", value= q1_expelled, row.names=FALSE, overwrite=TRUE)
```

    ## [1] TRUE

``` r
dbWriteTable(conn =getReal_db, name= "Q1_reading_1617", value= q1_reading, row.names=FALSE, overwrite=TRUE)
```

    ## [1] TRUE

``` r
dbWriteTable(conn =getReal_db, name= "Q1_langarts_1617", value= q1_langarts, row.names=FALSE, overwrite=TRUE)
```

    ## [1] TRUE

``` r
dbWriteTable(conn =getReal_db, name= "Q1_duplicates_1617", value= q1Dupes, row.names=FALSE, overwrite=TRUE)
```

    ## [1] TRUE

``` r
dbWriteTable(conn =getReal_db, name= "Q1_behavior_data_1617", value= q1_behavior_data, row.names=FALSE, overwrite=TRUE)
```

    ## [1] TRUE

Functions
=========

``` r
grades_file <- function(x) {
    grade_file <- filter(q1_grades_c, council == x)
    write.csv (grade_file, file="grade_file_q1.csv", row.names=FALSE)
    
    
}
```

``` r
behavior_file <- function(x){
    behavior_file <- filter(q1_behavior_data, council== x)
    write.csv(behavior_file, file="behavior.file_q1.csv", row.names=FALSE)

    }
```

``` r
grade_dupes_file <-function(x){
    grade_dupes <-filter(q1Dupes, council== x)
    write.csv(grade_dupes, file="grade_dupes_q1.csv", row.names=FALSE)
    
}
```

### Citrus Council

``` r
setwd("C:/Users/kevin/Dropbox/GetReal/Council_data/citrus_council")


grades_file("Citrus Council")

behavior_file("Citrus Council")

grade_dupes_file("Citrus Council")
```

### Gateway Council

``` r
setwd("C:/Users/kevin/Dropbox/GetReal/Council_data/gateway_council")

grades_file("Gateway Council")

behavior_file("Gateway Council")

grade_dupes_file("Gateway Council")
```

### Southeast Council

``` r
setwd("C:/Users/kevin/Dropbox/GetReal/Council_data/southeast")


grades_file("Southeast Council")

behavior_file("Southeast Council")

grade_dupes_file("Southeast Council")
```

### Tropical Council

``` r
setwd("C:/Users/kevin/Dropbox/GetReal/Council_data/tropical_council")

grades_file("Tropical Council")

behavior_file("Tropical Council")

grade_dupes_file("Tropical Council")
```

### Panhandle Council

``` r
setwd("C:/Users/kevin/Dropbox/GetReal/Council_data/panhandle_council")

grades_file("Panhandle Council")

behavior_file("Panhandle Council")

grade_dupes_file("Panhandle Council")
```

### West Central Council

``` r
setwd("C:/Users/kevin/Dropbox/GetReal/Council_data/west_central_council")

grades_file("West Central Council")

behavior_file("West Central Council")

grade_dupes_file("West Central Council")
```

=======
