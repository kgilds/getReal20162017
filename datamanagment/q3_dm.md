q3\_dm
================

### Set working directory, library, and read raw data (needs updated data)

``` r
library(tidyverse) #load tidy package
library(sqldf)
library(pander)
```

.

``` r
q3_data <- readRDS("q3_data.Rds")


#names(q3_data)
```

``` r
#change column names averages
colnames (q3_data)[7] <- "reading_avg"
colnames (q3_data)[10] <- "lang_avg"

# change column names demographics
colnames (q3_data)[13] <- "council"
colnames (q3_data)[14] <- "girl_code"
colnames (q3_data)[15] <- "school"
colnames (q3_data)[16] <- "enrolled"

# Attendance and Behavior
colnames (q3_data)[18] <- "unexcused"
colnames (q3_data)[19] <- "excused"
colnames (q3_data)[20] <- "in_school"
colnames (q3_data)[21] <- "out_school"
colnames (q3_data)[22] <- "expelled"
colnames (q3_data)[23] <- "Nothing"


# Reading 
colnames (q3_data)[25] <- "M/J INTENS READ"
colnames (q3_data)[26] <- "M/J READ 1"
colnames (q3_data)[27] <- "M/J READ 1, ADV"
colnames (q3_data)[28] <- "M/J READ 2"
colnames (q3_data)[29] <- "M/J READ 2, ADV"
colnames (q3_data)[30] <- "M/J READ 3"
colnames (q3_data)[31] <- "M/J READ3, ADV"
colnames (q3_data)[32] <- "free_reading1"
colnames (q3_data)[33] <- "free_reading2"
colnames (q3_data)[34] <- "M/J DE LA ESOL-READ"

# change colnmaes lang arts section
colnames (q3_data)[36] <- "M/J LANG ARTS 1 ESOL"
colnames (q3_data)[37] <- "M/J LANG ARTS 2 ESOL"
colnames (q3_data)[38] <- "M/J LANG ARTS 3 ESOL"
colnames (q3_data)[39] <- "M/J DEVELOPMENTAL  LANG ARTS ESOL"
colnames (q3_data)[40] <- "M/J LANG ARTS 1"
colnames (q3_data)[41] <- "M/J LANG ARTS 1 ADV"
colnames (q3_data)[42] <- "M/J LANG ARTS 2"
colnames (q3_data)[43] <- "M/J LANG ARTS 2 ADV"
colnames (q3_data)[44] <- "M/J LANG ARTS 3"
colnames (q3_data)[45] <- "M/J LANG ARTS 3 ADv"
colnames (q3_data)[46] <- "M/J ENG 2 CAMB SEC 2"
colnames (q3_data)[47] <- "M/J IB MYP LANG LIT 1"
colnames (q3_data)[48] <- "M/J ENG 1 CAMB SEC 1"
colnames (q3_data)[49] <- "M/J IB MYP LANG & LIT 3"
colnames (q3_data)[50] <- "M/J IB MYP LANG & LIT 2"
colnames (q3_data)[51] <- "M/J ENG 3 CAMB SEC 3"
colnames (q3_data)[52] <- "M/J INTENS LANG ARTS"
colnames (q3_data)[53] <- "free_lang1"
colnames (q3_data)[54] <- "free_lang2"
colnames (q3_data)[55] <- "M/J LANG ARTS TRAN"
colnames (q3_data)[56] <- "M/J DE LANG ARTS ESOL"
colnames (q3_data)[57] <- "blankspace"

names(q3_data)
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
    ## [12] "You are entering academic data for Quarter 3"                                        
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
q3_data$girl_code <- as.character(q3_data$girl_code)

### Make all girCode to upper case for matching
q3_data$girl_code <- toupper(q3_data$girl_code)



q3_data <- q3_data %>%
    filter(Finished ==1)

#pander(table(q3_data$girl_code)) #test for duplicate girl codes
```

``` r
q3_data$council <-sub("Girl Scouts of the Gateway Council", "Gateway Council", fixed=TRUE, q3_data$council)

q3_data$council <-sub("Girl Scouts of Citrus Council", "Citrus Council", fixed=TRUE, q3_data$council)

q3_data$council <-sub("Girl Scouts of Southeast Florida", "Southeast Council", fixed=TRUE, q3_data$council)

q3_data$council <-sub("Girl Scout Council of Tropical Florida", "Tropical Council", fixed = TRUE, q3_data$council)

q3_data$council <-sub("Girl Scouts of West Central Florida", "West Central Council", fixed = TRUE, q3_data$council)

q3_data$council <-sub("Girl Scout Council of the Panhandle", "Panhandle Council", fixed = TRUE, q3_data$council)
```

``` r
q3_data <- q3_data[!(duplicated(q3_data$girl_code) | duplicated(q3_data$girl_code, fromLast = TRUE)), ]  #find and extract unique cases

dim(q3_data)
```

    ## [1] 386  57

``` r
#pander(table(q3_data$girl_code)) #test for duplicate girl codes

#preUnique<- pre [!(duplicated(pre$girlCode) | duplicated(pre$girlCode, fromLast = TRUE)), ]

#dim(preUnique)
```

``` r
q3Dupes <- duplicated(q3_data$girl_code) | duplicated(q3_data$girl_code, fromLast=TRUE)


#preDupes <-duplicated(pre$girlCode) | duplicated(pre$girlCode, fromLast=TRUE)

#preDupes <-pre[preDupes, ]

#dim(preDupes)



### Subset the duplicates
q3Dupes <-q3_data[q3Dupes, ]


q3Dupes
```

    ## # A tibble: 0 × 57
    ## # ... with 57 variables: ResponseID <chr>, ResponseSet <chr>,
    ## #   StartDate <dttm>, EndDate <dttm>, Finished <int>, Reading-sum <int>,
    ## #   reading_avg <int>, Reading-weightedStdDev <int>, Language
    ## #   Arts-sum <int>, lang_avg <int>, Language Arts-weightedStdDev <int>,
    ## #   You are entering academic data for Quarter 3 <int>, council <chr>,
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
q3_attendance <- q3_data %>%
    select(13:16,18:19)  #take columns of interest



q3_attendance$unexcused[which(is.na(q3_attendance$unexcused))] <- 0
q3_attendance$excused[which(is.na(q3_attendance$excused))] <-0


q3_attendance <- q3_attendance %>%
        mutate("total" = unexcused + excused)


which(is.na(q3_attendance$total))
```

    ## integer(0)

``` r
mean(q3_attendance$total)
```

    ## [1] 0.7823834

Behavior
========

``` r
q3_behavior <- q3_data %>%
    select(13:16, 20:21)  #take columns of interest
    
    
q3_behavior$in_school[which(is.na(q3_behavior$in_school))] <- 0  #find na and replace with 0
q3_behavior$out_school[which(is.na(q3_behavior$out_school))] <-0  #find na values and replace with 0

q3_behavior <- q3_behavior %>%   
    mutate("total"= in_school + out_school) #calculate total 
    
head(q3_behavior) #check work
```

    ## # A tibble: 6 × 7
    ##             council                  girl_code  school   enrolled
    ##               <chr>                      <chr>   <chr>      <chr>
    ## 1    Citrus Council TESTTHISTHATTHEEOTHERTHING Emerson 10/21/2016
    ## 2 Panhandle Council                322IM020401   Jinks 10/31/2016
    ## 3 Panhandle Council                322LN080204   Jinks 10/31/2016
    ## 4 Panhandle Council                322EL080504   Jinks 10/31/2016
    ## 5 Panhandle Council                322ZR120704   Jinks 10/31/2016
    ## 6 Panhandle Council                322DR081902   Jinks 10/31/2016
    ## # ... with 3 more variables: in_school <dbl>, out_school <dbl>,
    ## #   total <dbl>

``` r
which(is.na(q3_behavior$total))
```

    ## integer(0)

``` r
mean(q3_behavior$total)
```

    ## [1] 0.05181347

Expelled
========

``` r
q3_expelled <- q3_data %>%
    select(13:16, 22) #take columns of interest

head(q3_expelled)
```

    ## # A tibble: 6 × 5
    ##             council                  girl_code  school   enrolled expelled
    ##               <chr>                      <chr>   <chr>      <chr>    <chr>
    ## 1    Citrus Council TESTTHISTHATTHEEOTHERTHING Emerson 10/21/2016      Yes
    ## 2 Panhandle Council                322IM020401   Jinks 10/31/2016       No
    ## 3 Panhandle Council                322LN080204   Jinks 10/31/2016       No
    ## 4 Panhandle Council                322EL080504   Jinks 10/31/2016       No
    ## 5 Panhandle Council                322ZR120704   Jinks 10/31/2016       No
    ## 6 Panhandle Council                322DR081902   Jinks 10/31/2016       No

Reading
=======

``` r
q3_reading <- q3_data %>%
    gather("reading_course", "Grade",25:31, 34) %>% #gather reading columns and put them in row
    select(7,13:16, 50:51) #select reading columns
    

names(q3_reading)
```

    ## [1] "reading_avg"    "council"        "girl_code"      "school"        
    ## [5] "enrolled"       "reading_course" "Grade"

``` r
dim(q3_reading)
```

    ## [1] 3088    7

``` r
q3_reading <-na.omit(q3_reading) #get rid of cases with no data




dim(q3_reading)
```

    ## [1] 137   7

``` r
q3_reading
```

    ## # A tibble: 137 × 7
    ##    reading_avg           council   girl_code   school   enrolled
    ##          <int>             <chr>       <chr>    <chr>      <chr>
    ## 1            4 Panhandle Council 322ZR120704    Jinks 10/31/2016
    ## 2            2 Panhandle Council 322SW121306    Jinks 10/31/2016
    ## 3            1 Panhandle Council 322NB071204    Jinks 10/31/2016
    ## 4            2 Panhandle Council 322CT072705    Jinks 10/31/2016
    ## 5            1 Panhandle Council 322CR121504    Jinks 10/31/2016
    ## 6            3 Panhandle Council 322MR071804    Jinks 10/31/2016
    ## 7            2 Panhandle Council 322DB062904  Everitt 10/31/2016
    ## 8            3 Panhandle Council 322AS103104  Everitt 10/31/2016
    ## 9            2 Panhandle Council 322CB083004 Evereitt 10/31/2016
    ## 10           2 Panhandle Council 322JG102803  Everitt 10/31/2016
    ## # ... with 127 more rows, and 2 more variables: reading_course <chr>,
    ## #   Grade <chr>

``` r
q3_freereading <- q3_data %>%
    select(7,13:16, 32:33) #select free enter
    
q3_freereading <- q3_freereading[,c(1,2,3,4,5,7,6)] #re-arrange columns to make them align with q3 readind df

q3_freereading <- q3_freereading %>%
    rename("reading_course" = free_reading2) %>% #rename to match q3_reading
    rename("Grade" = free_reading1) #rename to match q3_reading
    

dim(q3_freereading)
```

    ## [1] 386   7

``` r
q3_freereading <- na.omit(q3_freereading) #clean up to find cases with data



dim(q3_freereading)
```

    ## [1] 0 7

``` r
q3_freereading
```

    ## # A tibble: 0 × 7
    ## # ... with 7 variables: reading_avg <int>, council <chr>, girl_code <chr>,
    ## #   school <chr>, enrolled <chr>, reading_course <chr>, Grade <chr>

``` r
q3_freereading <- q3_freereading[grep("READ", q3_freereading$reading_course, ignore.case=TRUE, fixed=TRUE),]
```

    ## Warning in grep("READ", q3_freereading$reading_course, ignore.case =
    ## TRUE, : argument 'ignore.case = TRUE' will be ignored

``` r
q3_freereading
```

    ## # A tibble: 0 × 7
    ## # ... with 7 variables: reading_avg <int>, council <chr>, girl_code <chr>,
    ## #   school <chr>, enrolled <chr>, reading_course <chr>, Grade <chr>

``` r
q3_reading <- rbind(q3_reading, q3_freereading) #bind main q3_reading and free text

dim(q3_reading)
```

    ## [1] 137   7

``` r
q3_reading
```

    ## # A tibble: 137 × 7
    ##    reading_avg           council   girl_code   school   enrolled
    ## *        <int>             <chr>       <chr>    <chr>      <chr>
    ## 1            4 Panhandle Council 322ZR120704    Jinks 10/31/2016
    ## 2            2 Panhandle Council 322SW121306    Jinks 10/31/2016
    ## 3            1 Panhandle Council 322NB071204    Jinks 10/31/2016
    ## 4            2 Panhandle Council 322CT072705    Jinks 10/31/2016
    ## 5            1 Panhandle Council 322CR121504    Jinks 10/31/2016
    ## 6            3 Panhandle Council 322MR071804    Jinks 10/31/2016
    ## 7            2 Panhandle Council 322DB062904  Everitt 10/31/2016
    ## 8            3 Panhandle Council 322AS103104  Everitt 10/31/2016
    ## 9            2 Panhandle Council 322CB083004 Evereitt 10/31/2016
    ## 10           2 Panhandle Council 322JG102803  Everitt 10/31/2016
    ## # ... with 127 more rows, and 2 more variables: reading_course <chr>,
    ## #   Grade <chr>

``` r
which(is.na(q3_reading$Grade))
```

    ## integer(0)

``` r
q3_reading <- q3_reading %>%
    filter(Grade != "Did not mean to select this course")
```

### Reading Points

    ##     reading_avg           council                  girl_code
    ## 1             4 Panhandle Council                322ZR120704
    ## 2             2 Panhandle Council                322SW121306
    ## 3             1 Panhandle Council                322NB071204
    ## 4             2 Panhandle Council                322CT072705
    ## 5             1 Panhandle Council                322CR121504
    ## 6             3 Panhandle Council                322MR071804
    ## 7             2 Panhandle Council                322DB062904
    ## 8             3 Panhandle Council                322AS103104
    ## 9             2 Panhandle Council                322CB083004
    ## 10            2 Panhandle Council                322JG102803
    ## 11            3 Panhandle Council                322MT050405
    ## 12            3 Panhandle Council                322GP111403
    ## 13            1 Panhandle Council                322LW082305
    ## 14            2 Panhandle Council                322JW041704
    ## 15            2 Panhandle Council                322ZM091203
    ## 16            3 Southeast Council                321VA082703
    ## 17            1 Southeast Council                321DA102702
    ## 18            3 Southeast Council                321KB052104
    ## 19            2 Southeast Council                321TG112103
    ## 20            3 Southeast Council                321ZJ092702
    ## 21            2 Southeast Council                321JP080305
    ## 22            2 Southeast Council                321AP011905
    ## 23            4 Southeast Council                321AZ041805
    ## 24            4 Southeast Council                321JW083003
    ## 25            2 Southeast Council                321KB061205
    ## 26            2 Southeast Council                321LD072805
    ## 27            1 Southeast Council                321JL041605
    ## 28            2 Southeast Council                321TD053102
    ## 29            2 Southeast Council                321BT100203
    ## 30            3 Southeast Council                321TG070305
    ## 31            2 Southeast Council                321YW081805
    ## 32            3 Southeast Council                321RG070304
    ## 33            2 Southeast Council                321SM053105
    ## 34            2 Southeast Council                321JR070305
    ## 35            3 Southeast Council                321TH050304
    ## 36            3 Southeast Council                321JD012405
    ## 37            1 Southeast Council                321SC122804
    ## 38            2 Southeast Council                321AD052205
    ## 39            2 Southeast Council                321FV022205
    ## 40            2 Southeast Council                321KD091304
    ## 41            3 Southeast Council                321WM090603
    ## 42            2 Southeast Council                321SO020203
    ## 43            2 Southeast Council                 321RR03305
    ## 44            4 Southeast Council                321CW071704
    ## 45            1 Southeast Council                321SW012403
    ## 46            2 Southeast Council                321NA081804
    ## 47            4 Panhandle Council                322SG333305
    ## 48            2 Southeast Council                321KJ012703
    ## 49            3 Southeast Council                321JP061803
    ## 50            2 Southeast Council                321CR101403
    ## 51            2 Southeast Council                321JD101502
    ## 52            0 Southeast Council                321LU072702
    ## 53            3 Southeast Council                321JV021803
    ## 54            3 Southeast Council                321KW062503
    ## 55            1 Southeast Council                321TD110403
    ## 56            3 Southeast Council                321CG091104
    ## 57            2 Southeast Council                321ST100104
    ## 58            2 Southeast Council                321FW062504
    ## 59            2 Southeast Council                321SS081303
    ## 60            4 Southeast Council                321PS042604
    ## 61            4 Southeast Council                321SS042805
    ## 62            2 Southeast Council                321AB010104
    ## 63            3 Southeast Council                321DC062705
    ## 64            3 Southeast Council                321SD072204
    ## 65            3 Southeast Council                321DK100204
    ## 66            2 Southeast Council                321TN073104
    ## 67            2 Panhandle Council                322EL080504
    ## 68            3 Panhandle Council                322CD010505
    ## 69            3 Panhandle Council                322DM050605
    ## 70            2   Gateway Council                313TB011705
    ## 71            2   Gateway Council                313SH050805
    ## 72            3   Gateway Council                313SH060304
    ## 73            3   Gateway Council                313DJ091703
    ## 74            3   Gateway Council                313KK122904
    ## 75            3   Gateway Council                313AT020105
    ## 76            3   Gateway Council                313CB010204
    ## 77            2   Gateway Council                313RB122804
    ## 78            2   Gateway Council                313AT102804
    ## 79            3   Gateway Council                313NA113005
    ## 80            3   Gateway Council                313PS042205
    ## 81            3   Gateway Council                313JA070105
    ## 82            3   Gateway Council                313MG081605
    ## 83            3   Gateway Council                313LM071304
    ## 84            3   Gateway Council                313JC090403
    ## 85            3   Gateway Council                313DB060804
    ## 86            3   Gateway Council                313ZG041304
    ## 87            2   Gateway Council                313PM021605
    ## 88            3   Gateway Council                313MS030606
    ## 89            4   Gateway Council                313JS043004
    ## 90            4   Gateway Council                313KO040704
    ## 91            3   Gateway Council                313KM110503
    ## 92            3   Gateway Council                313TB121603
    ## 93            3   Gateway Council                313DB051704
    ## 94            3 Panhandle Council                322AH011305
    ## 95            2    Citrus Council TESTTHISTHATTHEEOTHERTHING
    ## 96            2   Gateway Council                313SB120603
    ## 97            2   Gateway Council                313MA090303
    ## 98            3   Gateway Council                313CH121603
    ## 99            2   Gateway Council                313EO080204
    ## 100           2   Gateway Council                313DP021104
    ## 101           2   Gateway Council                313YR043004
    ## 102           3   Gateway Council                313KT081504
    ## 103           3   Gateway Council                313JS010204
    ## 104           3   Gateway Council                313YK062304
    ## 105           3   Gateway Council                 313AS40404
    ## 106           3 Panhandle Council                313RR042804
    ## 107           3   Gateway Council                313MT072302
    ## 108           3   Gateway Council                313LB031704
    ## 109           3   Gateway Council                313SB112203
    ## 110           3   Gateway Council                313RJ070404
    ## 111           3   Gateway Council                313JR042804
    ## 112           2   Gateway Council                313KR112103
    ## 113           3   Gateway Council                313ET062404
    ## 114           2   Gateway Council                313MB080504
    ## 115           2   Gateway Council                313KF050404
    ## 116           2   Gateway Council                313TL030304
    ## 117           3   Gateway Council                313JB110302
    ## 118           3   Gateway Council                313AK041202
    ## 119           3   Gateway Council                313JR101502
    ## 120           2   Gateway Council                313AK021702
    ## 121           3   Gateway Council                313DH122500
    ## 122           3   Gateway Council                313AS022503
    ## 123           3   Gateway Council                313JS050500
    ## 124           3   Gateway Council                313PS082702
    ## 125           3   Gateway Council                313DS083103
    ##              school   enrolled  reading_course Grade reading_pts
    ## 1             Jinks 10/31/2016 M/J INTENS READ     A           4
    ## 2             Jinks 10/31/2016 M/J INTENS READ     C           2
    ## 3             Jinks 10/31/2016 M/J INTENS READ     D           1
    ## 4             Jinks 10/31/2016 M/J INTENS READ     C           2
    ## 5             Jinks 10/31/2016 M/J INTENS READ     D           1
    ## 6             Jinks 10/31/2016 M/J INTENS READ     B           3
    ## 7           Everitt 10/31/2016 M/J INTENS READ     C           2
    ## 8           Everitt 10/31/2016 M/J INTENS READ     B           3
    ## 9          Evereitt 10/31/2016 M/J INTENS READ     C           2
    ## 10          Everitt 10/31/2016 M/J INTENS READ     C           2
    ## 11          Everitt 10/31/2016 M/J INTENS READ     B           3
    ## 12          Everitt 10/31/2016 M/J INTENS READ     B           3
    ## 13          Everitt 10/31/2016 M/J INTENS READ     D           1
    ## 14          Everitt 10/31/2016 M/J INTENS READ     C           2
    ## 15          Everitt 10/31/2016 M/J INTENS READ     C           2
    ## 16              llm 10/11/2016 M/J INTENS READ     B           3
    ## 17              llm 10/11/2016 M/J INTENS READ     D           1
    ## 18              llm 10/11/2016 M/J INTENS READ     B           3
    ## 19              llm 10/11/2016 M/J INTENS READ     C           2
    ## 20              llm 10/11/2016 M/J INTENS READ     B           3
    ## 21               LL 10/20/2016 M/J INTENS READ     C           2
    ## 22               LL 10/20/2016 M/J INTENS READ     C           2
    ## 23               LL 10/20/2016 M/J INTENS READ     A           4
    ## 24               LL 10/20/2016 M/J INTENS READ     A           4
    ## 25               LL 10/20/2016 M/J INTENS READ     C           2
    ## 26               LL 10/20/2016 M/J INTENS READ     C           2
    ## 27               LL 10/20/2016 M/J INTENS READ     D           1
    ## 28               LL 10/20/2016 M/J INTENS READ     C           2
    ## 29               LL 10/20/2016 M/J INTENS READ     C           2
    ## 30               LL 10/20/2016 M/J INTENS READ     B           3
    ## 31               LL 10/20/2016 M/J INTENS READ     C           2
    ## 32               LL 10/20/2016 M/J INTENS READ     B           3
    ## 33               LL 10/20/2016 M/J INTENS READ     C           2
    ## 34               LL 10/20/2016 M/J INTENS READ     C           2
    ## 35               LL 10/20/2016 M/J INTENS READ     B           3
    ## 36               LL 10/20/2016 M/J INTENS READ     B           3
    ## 37               LL 10/20/2016 M/J INTENS READ     D           1
    ## 38               LL 10/20/2016 M/J INTENS READ     C           2
    ## 39               LL 10/20/2016 M/J INTENS READ     C           2
    ## 40               LL 10/20/2016 M/J INTENS READ     C           2
    ## 41               LL 10/20/2016 M/J INTENS READ     B           3
    ## 42               LL 10/20/2016 M/J INTENS READ     C           2
    ## 43               LL 10/20/2016 M/J INTENS READ     C           2
    ## 44               LL 10/20/2016 M/J INTENS READ     A           4
    ## 45               LL 10/20/2016 M/J INTENS READ     D           1
    ## 46               LL 10/20/2016 M/J INTENS READ     C           2
    ## 47            Jinks 10/31/2016 M/J INTENS READ     A           4
    ## 48              llm 10/11/2016 M/J INTENS READ     C           2
    ## 49              Llm 10/11/2016 M/J INTENS READ     B           3
    ## 50              Llm 10/11/2016 M/J INTENS READ     C           2
    ## 51              Llm 10/11/2016 M/J INTENS READ     C           2
    ## 52              Llm 10/11/2016 M/J INTENS READ     F           0
    ## 53              Llm 10/11/2016 M/J INTENS READ     B           3
    ## 54              Llm 10/11/2016 M/J INTENS READ     B           3
    ## 55              Llm 10/11/2016 M/J INTENS READ     D           1
    ## 56              Llm 10/11/2016 M/J INTENS READ     B           3
    ## 57              Llm 10/11/2016 M/J INTENS READ     C           2
    ## 58              Llm 10/11/2016 M/J INTENS READ     C           2
    ## 59              Llm 10/11/2016 M/J INTENS READ     C           2
    ## 60              Llm 10/11/2016 M/J INTENS READ     A           4
    ## 61              Llm 10/11/2016 M/J INTENS READ     A           4
    ## 62              Llm 10/11/2016 M/J INTENS READ     C           2
    ## 63              Llm 10/11/2016 M/J INTENS READ     B           3
    ## 64              Llm 10/11/2016 M/J INTENS READ     B           3
    ## 65              Llm 10/11/2016 M/J INTENS READ     B           3
    ## 66              Llm 10/11/2016 M/J INTENS READ     C           2
    ## 67            Jinks 10/31/2016      M/J READ 1     C           2
    ## 68          Everitt 10/31/2016      M/J READ 1     B           3
    ## 69          Everitt 10/31/2016      M/J READ 1     B           3
    ## 70       THE BRIDGE 09/06/2016      M/J READ 1     C           2
    ## 71       THE BRIDGE 09/06/2016      M/J READ 1     C           2
    ## 72       THE BRIDGE 09/06/2016      M/J READ 1     B           3
    ## 73       THE BRIDGE 09/06/2016      M/J READ 1     B           3
    ## 74       THE BRIDGE 09/06/2016      M/J READ 1     B           3
    ## 75       THE BRIDGE 09/06/2016      M/J READ 1     B           3
    ## 76        LAKESHORE 09/06/2016      M/J READ 1     B           3
    ## 77        LAKESHORE 09/06/2016      M/J READ 1     C           2
    ## 78        LAKESHORE 09/06/2016      M/J READ 1     C           2
    ## 79  MATTHEW GILBERT 09/06/2016      M/J READ 1     B           3
    ## 80           BUTLER 09/06/2016      M/J READ 1     B           3
    ## 81           BUTLER 09/06/2016      M/J READ 1     B           3
    ## 82           BUTLER 09/06/2016      M/J READ 1     B           3
    ## 83           BUTLER 09/06/2016      M/J READ 1     B           3
    ## 84        STILLWELL 09/06/2016      M/J READ 1     B           3
    ## 85       JEB STUART 09/06/2016      M/J READ 1     B           3
    ## 86       JEB STUART 09/06/2016      M/J READ 1     B           3
    ## 87       JEB STUART 09/06/2016      M/J READ 1     C           2
    ## 88       JEB STUART 09/06/2016      M/J READ 1     B           3
    ## 89       JEB STUART 09/06/2016      M/J READ 1     A           4
    ## 90       JEB STUART 09/06/2016      M/J READ 1     A           4
    ## 91       JEB STUART 09/06/2016      M/J READ 1     B           3
    ## 92       JEB STUART 09/06/2016      M/J READ 1     B           3
    ## 93       JEFF DAVIS 09/06/2016      M/J READ 1     B           3
    ## 94          Everitt 10/31/2016 M/J READ 1, ADV     B           3
    ## 95          Emerson 10/21/2016      M/J READ 2     C           2
    ## 96       THE BRIDGE 09/06/2016      M/J READ 2     C           2
    ## 97       THE BRIDGE 09/06/2016      M/J READ 2     C           2
    ## 98       THE BRIDGE 09/06/2016      M/J READ 2     B           3
    ## 99       THE BRIDGE 09/06/2016      M/J READ 2     C           2
    ## 100      THE BRIDGE 09/06/2016      M/J READ 2     C           2
    ## 101      THE BRIDGE 09/06/2016      M/J READ 2     C           2
    ## 102      THE BRIDGE 09/06/2016      M/J READ 2     B           3
    ## 103 MATTHEW GILBERT 09/06/2016      M/J READ 2     B           3
    ## 104 MATTHEW GILBERT 09/06/2016      M/J READ 2     B           3
    ## 105 MATTHEW GILBERT 09/06/2016      M/J READ 2     B           3
    ## 106 MATTHEW GILBERT 09/06/2016      M/J READ 2     B           3
    ## 107 MATTHEW GILBERT 09/06/2016      M/J READ 2     B           3
    ## 108 MATTHEW GILBERT 09/06/2016      M/J READ 2     B           3
    ## 109      JEFF DAVIS 09/06/2016      M/J READ 2     B           3
    ## 110       STILLWELL 09/06/2016      M/J READ 2     B           3
    ## 111       STILLWELL 09/06/2016      M/J READ 2     B           3
    ## 112      JEB STUART 09/06/2016      M/J READ 2     C           2
    ## 113      JEB STUART 09/06/2016      M/J READ 2     B           3
    ## 114      JEFF DAVIS 09/06/2016      M/J READ 2     C           2
    ## 115      JEFF DAVIS 09/06/2016      M/J READ 2     C           2
    ## 116      JEFF DAVIS 09/06/2016      M/J READ 2     C           2
    ## 117      THE BRIDGE 09/06/2016      M/J READ 3     B           3
    ## 118      THE BRIDGE 09/06/2016      M/J READ 3     B           3
    ## 119      THE BRIDGE 09/06/2016      M/J READ 3     B           3
    ## 120       STILLWELL 09/06/2016      M/J READ 3     C           2
    ## 121      JEB STUART 09/06/2016      M/J READ 3     B           3
    ## 122      JEB STUART 09/06/2016      M/J READ 3     B           3
    ## 123      JEB STUART 09/06/2016      M/J READ 3     B           3
    ## 124      JEFF DAVIS 09/06/2016      M/J READ 3     B           3
    ## 125      JEFF DAVIS 09/06/2016      M/J READ 3     B           3

Language Arts
=============

``` r
q3_langarts <- q3_data %>% 
    gather("langarts_course", "grade", 36:52,55:56)%>% #put lang arts classes in rows
    select(10, 13:16, 39:40) #select lang arts courses and grades

names(q3_langarts)
```

    ## [1] "lang_avg"        "council"         "girl_code"       "school"         
    ## [5] "enrolled"        "langarts_course" "grade"

``` r
q3_langarts <- na.omit(q3_langarts) #get rid of cases with no entry

q3_langarts
```

    ## # A tibble: 386 × 7
    ##    lang_avg           council   girl_code   school   enrolled
    ##       <int>             <chr>       <chr>    <chr>      <chr>
    ## 1         2 Panhandle Council 322LN080204    Jinks 10/31/2016
    ## 2         2 Panhandle Council 322EL080504    Jinks 10/31/2016
    ## 3         1 Panhandle Council 322SW121306    Jinks 10/31/2016
    ## 4         2 Panhandle Council 322CT072705    Jinks 10/31/2016
    ## 5         1 Panhandle Council 322CR121504    Jinks 10/31/2016
    ## 6         3 Panhandle Council 322MR071804    Jinks 10/31/2016
    ## 7         3 Panhandle Council 322AS103104  Everitt 10/31/2016
    ## 8         3 Panhandle Council 322CB083004 Evereitt 10/31/2016
    ## 9         2 Panhandle Council 322CD010505  Everitt 10/31/2016
    ## 10        1 Panhandle Council 322DM050605  Everitt 10/31/2016
    ## # ... with 376 more rows, and 2 more variables: langarts_course <chr>,
    ## #   grade <chr>

``` r
q3_freelang <- q3_data %>%
    select(10, 13:16,53:54) #find free entry lang cases

names(q3_freelang)
```

    ## [1] "lang_avg"   "council"    "girl_code"  "school"     "enrolled"  
    ## [6] "free_lang1" "free_lang2"

``` r
q3_freelang <- q3_freelang[,c(1,2,3,4,5,7,6)] #rearrange columns to match regular lang courses 



table(q3_freelang$free_lang1, q3_freelang$free_lang2) #check for data
```

    ## < table of extent 0 x 0 >

``` r
q3_freelang <- q3_freelang %>%
    rename("langarts_course" = free_lang2) %>% #rename columns to match reg lang courses
    rename("grade" = free_lang1)



names(q3_freelang)
```

    ## [1] "lang_avg"        "council"         "girl_code"       "school"         
    ## [5] "enrolled"        "langarts_course" "grade"

    ## Warning in grep("ENGLISH", q3_freelang$langarts_course, ignore.case =
    ## TRUE, : argument 'ignore.case = TRUE' will be ignored

    ## # A tibble: 0 × 7
    ## # ... with 7 variables: lang_avg <int>, council <chr>, girl_code <chr>,
    ## #   school <chr>, enrolled <chr>, langarts_course <chr>, grade <chr>

    ## [1] "lang_avg"        "council"         "girl_code"       "school"         
    ## [5] "enrolled"        "langarts_course" "grade"

``` r
q3_langarts <- rbind(q3_langarts, q3_freelang_english)
```

``` r
q3_langarts <- q3_langarts %>%
    filter(grade != "Did not mean to select this course")


dim(q3_langarts)
```

    ## [1] 378   7

``` r
which(is.na(q3_langarts$grade))
```

    ## integer(0)

Languge Points
--------------

``` r
lang_pts <- numeric(0)

for(i in q3_langarts$grade){

     lang_pts<- c(lang_pts,switch(i, "A" =4, "B"=3, "C"=2, "D"=1, "F"=0))

     lang_pts
}

q3_langarts <-cbind(q3_langarts, lang_pts)

q3_langarts
```

    ##     lang_avg           council                  girl_code          school
    ## 1          2 Panhandle Council                322LN080204           Jinks
    ## 2          2 Panhandle Council                322EL080504           Jinks
    ## 3          1 Panhandle Council                322SW121306           Jinks
    ## 4          2 Panhandle Council                322CT072705           Jinks
    ## 5          1 Panhandle Council                322CR121504           Jinks
    ## 6          3 Panhandle Council                322MR071804           Jinks
    ## 7          3 Panhandle Council                322AS103104         Everitt
    ## 8          3 Panhandle Council                322CB083004        Evereitt
    ## 9          2 Panhandle Council                322CD010505         Everitt
    ## 10         1 Panhandle Council                322DM050605         Everitt
    ## 11         3 Panhandle Council                322MT050405         Everitt
    ## 12         2 Panhandle Council                322RN072805         Everitt
    ## 13         1 Panhandle Council                322LW082305         Everitt
    ## 14         2 Panhandle Council                322JW041704         Everitt
    ## 15         2 Panhandle Council                322ZM091203         Everitt
    ## 16         3 Southeast Council                321EC020105             llm
    ## 17         2 Southeast Council                321JP080305              LL
    ## 18         3 Southeast Council                321AP011905              LL
    ## 19         3 Southeast Council                321AZ041805              LL
    ## 20         2 Southeast Council                321KB061205              LL
    ## 21         4 Southeast Council                321JD082405              LL
    ## 22         3 Southeast Council                321JB120304              LL
    ## 23         2 Southeast Council                321LD072805              LL
    ## 24         2 Southeast Council                321JL041605              LL
    ## 25         2 Southeast Council                321BT100203              LL
    ## 26         4 Southeast Council                321AR080305              LL
    ## 27         2 Southeast Council                321MM020905              LL
    ## 28         3 Southeast Council                321TG070305              LL
    ## 29         2 Southeast Council                321YW081805              LL
    ## 30         4 Southeast Council                321GN100704              LL
    ## 31         3 Southeast Council                321ST081905              LL
    ## 32         3 Southeast Council                321SM053105              LL
    ## 33         3 Southeast Council                321JR070305              LL
    ## 34         4 Southeast Council                321JD012405              LL
    ## 35         2 Southeast Council                321SC122804              LL
    ## 36         0 Southeast Council                321FV022205              LL
    ## 37         2 Southeast Council                321KD091304              LL
    ## 38         3 Southeast Council                 321RR03305              LL
    ## 39         3 Southeast Council                321BT042805              LL
    ## 40         2 Southeast Council                321SW012403              LL
    ## 41         4 Southeast Council                321AJ091504              LL
    ## 42         3   Gateway Council                313TB011705      THE BRIDGE
    ## 43         3   Gateway Council                313TC050304      THE BRIDGE
    ## 44         3   Gateway Council                313WF101404      THE BRIDGE
    ## 45         3   Gateway Council                313SH050805      THE BRIDGE
    ## 46         3   Gateway Council                313SH060304      THE BRIDGE
    ## 47         2   Gateway Council                313TH110705      THE BRIDGE
    ## 48         4   Gateway Council                313DJ091703      THE BRIDGE
    ## 49         3   Gateway Council                313HJ090903     THE  BRIDGE
    ## 50         3   Gateway Council                313KK122904      THE BRIDGE
    ## 51         2   Gateway Council                313DK070605      THE BRIDGE
    ## 52         3   Gateway Council                313KK110804      THE BRIDGE
    ## 53         3   Gateway Council                313AT020105      THE BRIDGE
    ## 54         3   Gateway Council                313CB010204       LAKESHORE
    ## 55         3   Gateway Council                313RB122804       LAKESHORE
    ## 56         2   Gateway Council                313YH121304       LAKESHORE
    ## 57         4   Gateway Council                313EM041205       LAKESHORE
    ## 58         3   Gateway Council                313SN101204       LAKESHORE
    ## 59         3   Gateway Council                313KP101803       LAKESHORE
    ## 60         3   Gateway Council                313AR021304       LAKESHORE
    ## 61         3   Gateway Council                313SS050505       LAKESHORE
    ## 62         3   Gateway Council                313AT102804       LAKESHORE
    ## 63         3   Gateway Council                313MT010905       LAKESHORE
    ## 64         3   Gateway Council                313MW060105       LAKESHORE
    ## 65         3   Gateway Council                313BJ041205 MATTHEW GILBERT
    ## 66         2   Gateway Council                313TH110904 MATTHEW GILBERT
    ## 67         3   Gateway Council                313NA113005 MATTHEW GILBERT
    ## 68         3   Gateway Council                313KD010705          BUTLER
    ## 69         3   Gateway Council                313MH041204          BUTLER
    ## 70         2   Gateway Council                313SW030404          BUTLER
    ## 71         3   Gateway Council                313LR081605          BUTLER
    ## 72         3   Gateway Council                313FF111603          BUTLER
    ## 73         3   Gateway Council              313EFEF080305          BUTLER
    ## 74         3   Gateway Council                313PS042205          BUTLER
    ## 75         3   Gateway Council                313DE080804          BUTLER
    ## 76         4   Gateway Council                313JA070105          BUTLER
    ## 77         2   Gateway Council                313MG081605          BUTLER
    ## 78         3   Gateway Council                313LM071304          BUTLER
    ## 79         2   Gateway Council                313JC090403       STILLWELL
    ## 80         3   Gateway Council                313GG010305       STILLWELL
    ## 81         3   Gateway Council                313MH122904       STILLWELL
    ## 82         2   Gateway Council                313JS093004       STILLWELL
    ## 83         2   Gateway Council                313LS010404       STILLWELL
    ## 84         3   Gateway Council                313DB060804      JEB STUART
    ## 85         3   Gateway Council                313HC040605      JEB STUART
    ## 86         3   Gateway Council                313DD122004      JEB STUART
    ## 87         3   Gateway Council                313JE010703      JEB STUART
    ## 88         4   Gateway Council                313YG081804      JEB STUART
    ## 89         3   Gateway Council                313ZG041304      JEB STUART
    ## 90         2   Gateway Council                313CJ082905      JEB STUART
    ## 91         2   Gateway Council                313CJ091804      JEB STUART
    ## 92         1 Panhandle Council                322SG333305           Jinks
    ## 93         2   Gateway Council                313PM021605      JEB STUART
    ## 94         3   Gateway Council                313AO080104      JEB STUART
    ## 95         3   Gateway Council                313MS030606      JEB STUART
    ## 96         3   Gateway Council                313MS113004      JEB STUART
    ## 97         2   Gateway Council                313JT060205      JEB STUART
    ## 98         2   Gateway Council                313DW052505      JEB STUART
    ## 99         3   Gateway Council                313DW122104      JEB STUART
    ## 100        2   Gateway Council                313CW111804      JEB STUART
    ## 101        2   Gateway Council                313HW060205      JEB STUART
    ## 102        3   Gateway Council                313MW040605      JEB STUART
    ## 103        4   Gateway Council                313JS043004      JEB STUART
    ## 104        4   Gateway Council                313KO040704      JEB STUART
    ## 105        3   Gateway Council                313TW081103      JEB STUART
    ## 106        2   Gateway Council                313CM120704      JEB STUART
    ## 107        3   Gateway Council                313SL020605      JEB STUART
    ## 108        3   Gateway Council                313KM110503      JEB STUART
    ## 109        3   Gateway Council                313TB121603      JEB STUART
    ## 110        4   Gateway Council                313DM121103      JEB STUART
    ## 111        3   Gateway Council                313KR120804      JEB STUART
    ## 112        3   Gateway Council                313IW110204      JEB STUART
    ## 113        2   Gateway Council                313DB051704      JEFF DAVIS
    ## 114        3   Gateway Council                313JJ051805      JEFF DAVIS
    ## 115        2 Southeast Council                321TD110403             Llm
    ## 116        3 Southeast Council                321TL080206             Llm
    ## 117        2 Southeast Council                321ST100104             Llm
    ## 118        3 Southeast Council                321TV110604             Llm
    ## 119        3 Southeast Council                321JP061904             Llm
    ## 120        3 Southeast Council                321DC062705             Llm
    ## 121        2 Panhandle Council                322AN020604   Merritt Brown
    ## 122        2 Panhandle Council                322AA050505   Merritt Brown
    ## 123        3 Panhandle Council                322NB020604   Merritt Brown
    ## 124        2 Panhandle Council                322CB010105   Merritt Brown
    ## 125        3 Panhandle Council                322TG060904   Merritt Brown
    ## 126        2 Panhandle Council               322LB0600105   Merritt Brown
    ## 127        3 Panhandle Council                322MM101404   Merritt Brown
    ## 128        2 Panhandle Council                322HM032905   Merritt Brown
    ## 129        3 Panhandle Council                322ER102304   Merritt Brown
    ## 130        2 Panhandle Council                322MT120205   Merritt Brown
    ## 131        3 Panhandle Council                322AW040605   Merritt Brown
    ## 132        4 Panhandle Council                322AG102504         Everitt
    ## 133        3 Southeast Council                321SD072204             Llm
    ## 134        4 Panhandle Council                322KM030405   Merritt Brown
    ## 135        2 Panhandle Council                322HO022005   Merritt Brown
    ## 136        4 Panhandle Council                322HS040405   Merritt Brown
    ## 137        2 Panhandle Council                322ZR120704           Jinks
    ## 138        3 Panhandle Council                322NB071204           Jinks
    ## 139        1 Panhandle Council                322BN030103           Jinks
    ## 140        0 Panhandle Council                322AM152904           jinks
    ## 141        2 Panhandle Council                322DB062904         Everitt
    ## 142        3 Panhandle Council                322DS051804         Everitt
    ## 143        3 Southeast Council                321VA082703             llm
    ## 144        3 Southeast Council                321TG112103             llm
    ## 145        2 Southeast Council                321ZJ092702             llm
    ## 146        1 Southeast Council                321JW083003              LL
    ## 147        2 Southeast Council                321TD053102              LL
    ## 148        3 Southeast Council                 32ER110803              LL
    ## 149        2 Southeast Council                321RG070304              LL
    ## 150        2 Southeast Council                321TH050304              LL
    ## 151        3 Southeast Council                321DB122003              LL
    ## 152        2 Southeast Council                321WM090603              LL
    ## 153        3 Southeast Council                321SO020203              LL
    ## 154        4 Southeast Council                321CW071704              LL
    ## 155        4 Southeast Council                321NA081804              LL
    ## 156        3   Gateway Council                313SB120603      THE BRIDGE
    ## 157        2   Gateway Council                313MA090303      THE BRIDGE
    ## 158        3   Gateway Council                313AB062704      THE BRIDGE
    ## 159        3   Gateway Council                313DB011903      THE BRIDGE
    ## 160        3   Gateway Council                313IC052403      THE BRIDGE
    ## 161        3   Gateway Council                313AC103103      THE BRIDGE
    ## 162        2   Gateway Council                313CC100602      THE BRIDGE
    ## 163        3   Gateway Council                313BC040204      THE BRIDGE
    ## 164        3   Gateway Council                313KE082704      THE BRIDGE
    ## 165        2   Gateway Council                313KG061204      THE BRIDGE
    ## 166        3   Gateway Council                313CH121603      THE BRIDGE
    ## 167        3   Gateway Council                313CH082603      THE BRIDGE
    ## 168        2   Gateway Council                313AH081503      THE BRIDGE
    ## 169        2   Gateway Council                313EO080204      THE BRIDGE
    ## 170        3   Gateway Council                313DJ031804      THE BRIDGE
    ## 171        3   Gateway Council                313JL110303      THE BRIDGE
    ## 172        3   Gateway Council                313JM072404      THE BRIDGE
    ## 173        3   Gateway Council                313JM100903      THE BRIDGE
    ## 174        2   Gateway Council                313OM101303      THE BRIDGE
    ## 175        3   Gateway Council                313BM050404      THE BRIDGE
    ## 176        2   Gateway Council                313AN121503      THE BRIDGE
    ## 177        3   Gateway Council                313DP021104      THE BRIDGE
    ## 178        2   Gateway Council                313AP072605      THE BRIDGE
    ## 179        3   Gateway Council                313ER122203      THE BRIDGE
    ## 180        3   Gateway Council                313YR043004      THE BRIDGE
    ## 181        3   Gateway Council                313SS111303      THE BRIDGE
    ## 182        3   Gateway Council                313KT081504      THE BRIDGE
    ## 183        2   Gateway Council                313MW031804      THE BRIDGE
    ## 184        3   Gateway Council                313JW030304      THE BRIDGE
    ## 185        3   Gateway Council                313AW042604      THE BRIDGE
    ## 186        3   Gateway Council                313NJ060203       LAKESHORE
    ## 187        3   Gateway Council                313JJ050404       LAKESHORE
    ## 188        3   Gateway Council                313TR041903       LAKESHORE
    ## 189        2   Gateway Council                313AA021404 MATTHEW GILBERT
    ## 190        2   Gateway Council                313JS010204 MATTHEW GILBERT
    ## 191        3   Gateway Council                313YK062304 MATTHEW GILBERT
    ## 192        3   Gateway Council                313LG030104 MATTHEW GILBERT
    ## 193        3   Gateway Council                 313AS40404 MATTHEW GILBERT
    ## 194        3   Gateway Council                313DW080604 MATTHEW GILBERT
    ## 195        3 Panhandle Council                313RR042804 MATTHEW GILBERT
    ## 196        3   Gateway Council                313AT041103 MATTHEW GILBERT
    ## 197        3   Gateway Council                313MT072302 MATTHEW GILBERT
    ## 198        3   Gateway Council                313LB031704 MATTHEW GILBERT
    ## 199        3   Gateway Council                313PB032604      JEFF DAVIS
    ## 200        3   Gateway Council                313SB112203      JEFF DAVIS
    ## 201        3   Gateway Council                313KM051404          BUTLER
    ## 202        2   Gateway Council                313KB121203       STILLWELL
    ## 203        2   Gateway Council                313AB021104       STILLWELL
    ## 204        2   Gateway Council                313DH102103       STILLWELL
    ## 205        3   Gateway Council                313RJ070404       STILLWELL
    ## 206        2   Gateway Council                313GL041504       STILLWELL
    ## 207        3   Gateway Council                313RM061404       STILLWELL
    ## 208        3   Gateway Council                313AM041503       STILLWELL
    ## 209        2   Gateway Council                313AN050505       STILLWELL
    ## 210        3   Gateway Council                313JR042804       STILLWELL
    ## 211        2   Gateway Council                313MR041504       STILLWELL
    ## 212        2   Gateway Council                313SS010203       STILLWELL
    ## 213        3   Gateway Council                313BW033004       STILLWELL
    ## 214        3   Gateway Council                313TW112603      JEB STUART
    ## 215        3   Gateway Council                313PW100903      JEB STUART
    ## 216        2   Gateway Council                313BB060903      JEB STUART
    ## 217        3   Gateway Council                313RG012904      JEB STUART
    ## 218        2   Gateway Council                313SS052202      JEB STUART
    ## 219        3   Gateway Council                313JC112403      JEB STUART
    ## 220        3   Gateway Council                313TL090104      JEB STUART
    ## 221        3   Gateway Council                313AO122203      JEB STUART
    ## 222        3   Gateway Council                313KR112103      JEB STUART
    ## 223        3   Gateway Council                313ET062404      JEB STUART
    ## 224        3   Gateway Council                313AW030804      JEB STUART
    ## 225        2   Gateway Council                313JW111402      JEB STUART
    ## 226        2   Gateway Council                313TH011603      JEB STUART
    ## 227        2   Gateway Council                313JU052004      JEB STUART
    ## 228        3   Gateway Council                313TK052204      JEFF DAVIS
    ## 229        3   Gateway Council                313JC111703      JEFF DAVIS
    ## 230        4   Gateway Council                313JD052404      JEFF DAVIS
    ## 231        3   Gateway Council                313GG091004      JEFF DAVIS
    ## 232        2   Gateway Council                313CC013004      JEFF DAVIS
    ## 233        4   Gateway Council                313AA032704      JEFF DAVIS
    ## 234        3   Gateway Council                313EC083004      JEFF DAVIS
    ## 235        3   Gateway Council                313BH072703      JEFF DAVIS
    ## 236        3   Gateway Council                313MR022004      JEFF DAVIS
    ## 237        3   Gateway Council                313IL080503      JEFF DAVIS
    ## 238        2   Gateway Council                313SL072203      JEFF DAVIS
    ## 239        2   Gateway Council                313JW081004      JEFF DAVIS
    ## 240        3   Gateway Council                313MB080504      JEFF DAVIS
    ## 241        3   Gateway Council                313SB082404      JEFF DAVIS
    ## 242        3   Gateway Council                313JB040304      JEFF DAVIS
    ## 243        2   Gateway Council                313AC110203      JEFF DAVIS
    ## 244        4   Gateway Council                313MC113003      JEFF DAVIS
    ## 245        4   Gateway Council                313JC022004      JEFF DAVIS
    ## 246        3   Gateway Council                313KF050404      JEFF DAVIS
    ## 247        3   Gateway Council                313JJ110103      JEFF DAVIS
    ## 248        3   Gateway Council                313JM022304      JEFF DAVIS
    ## 249        3   Gateway Council                313TL030304      JEFF DAVIS
    ## 250        3   Gateway Council                313PM041804      JEFF DAVIS
    ## 251        2   Gateway Council                313RM032403      JEFF DAVIS
    ## 252        2   Gateway Council                313HS090603      JEFF DAVIS
    ## 253        3   Gateway Council                313ES120603      JEFF DAVIS
    ## 254        2   Gateway Council                313GS111903      JEFF DAVIS
    ## 255        2   Gateway Council                313QT082604      JEFF DAVIS
    ## 256        3   Gateway Council                313LW060204      JEFF DAVIS
    ## 257        4 Southeast Council                321ML073004             Llm
    ## 258        3 Southeast Council                321KW062503             Llm
    ## 259        3 Southeast Council                321CG091104             Llm
    ## 260        3 Southeast Council                321RL061603             Llm
    ## 261        3 Southeast Council                321BP061502             Llm
    ## 262        2 Southeast Council                321FW062504             Llm
    ## 263        2 Southeast Council                321SS081303             Llm
    ## 264        3 Southeast Council                321SA011504             Llm
    ## 265        4 Southeast Council                321KB112204             Llm
    ## 266        2 Southeast Council                321AB010104             Llm
    ## 267        3 Southeast Council                321DK100204             Llm
    ## 268        3   Gateway Council                313LF022804      THE BRIDGE
    ## 269        4 Panhandle Council                322IM020401           Jinks
    ## 270        3 Panhandle Council                322DR081902           Jinks
    ## 271        3 Panhandle Council                322DR082803           Jinks
    ## 272        4 Southeast Council                321MA081902             LLM
    ## 273        4 Southeast Council                321PA012503             llm
    ## 274        4 Southeast Council                321KB052104             llm
    ## 275        4 Southeast Council                321BB091003             llm
    ## 276        4 Southeast Council                321SE122802             llm
    ## 277        3 Southeast Council                321AD052205              LL
    ## 278        3   Gateway Council                313KA072203      THE BRIDGE
    ## 279        3   Gateway Council                313JB122202      THE BRIDGE
    ## 280        3   Gateway Council                313JB110302      THE BRIDGE
    ## 281        2   Gateway Council                313TB110703      THE BRIDGE
    ## 282        3   Gateway Council                313JC121003      THE BRIDGE
    ## 283        3   Gateway Council                313BC091702      THE BRIDGE
    ## 284        2   Gateway Council                313AC082303      THE BRIDGE
    ## 285        2   Gateway Council                313AE110601      THE BRIDGE
    ## 286        3   Gateway Council                313AF040403      THE BRIDGE
    ## 287        2   Gateway Council                313MH042903      THE BRIDGE
    ## 288        2   Gateway Council                313TH070301      THE BRIDGE
    ## 289        3   Gateway Council                313AJ100201      THE BRIDGE
    ## 290        3   Gateway Council                313AJ092102      THE BRIDGE
    ## 291        2   Gateway Council                313AK041202      THE BRIDGE
    ## 292        2   Gateway Council                313DL121201      THE BRIDGE
    ## 293        3   Gateway Council                313JM040603      THE BRIDGE
    ## 294        3   Gateway Council                313PM042502      THE BRIDGE
    ## 295        3   Gateway Council                313KM011503      THE BRIDGE
    ## 296        2   Gateway Council                313PM082503      THE BRIDGE
    ## 297        2   Gateway Council                313BM090401      THE BRIDGE
    ## 298        3   Gateway Council                313JP070503      THE BRIDGE
    ## 299        2   Gateway Council                313TP102402      THE BRIDGE
    ## 300        3   Gateway Council                313JR081602      THE BRIDGE
    ## 301        3   Gateway Council                313TR030302      THE BRIDGE
    ## 302        3   Gateway Council                313JR021003      THE BRIDGE
    ## 303        3   Gateway Council                313JR101502      THE BRIDGE
    ## 304        3   Gateway Council                313FS100200      THE BRIDGE
    ## 305        3   Gateway Council                313SS101701      THE BRIDGE
    ## 306        3   Gateway Council                313TS010303      THE BRIDGE
    ## 307        3   Gateway Council                313JT062302      THE BRIDGE
    ## 308        3   Gateway Council                313TT120602      THE BRIDGE
    ## 309        3   Gateway Council                313JT111801      THE BRIDGE
    ## 310        3   Gateway Council                313KT082103      THE BRIDGE
    ## 311        3   Gateway Council                313AW110303      THE BRIDGE
    ## 312        2   Gateway Council                313CW122702      THE BRIDGE
    ## 313        3   Gateway Council                313SW091704      THE BRIDGE
    ## 314        3   Gateway Council                313AT050703       LAKESHORE
    ## 315        4   Gateway Council                313LD062403 MATTHEW GILBERT
    ## 316        3   Gateway Council                313RA101702 MATTHEW GILBERT
    ## 317        3   Gateway Council                313MB022803 MATTHEW GILBERT
    ## 318        3   Gateway Council                313SR030803 MATTHEW GILBERT
    ## 319        3   Gateway Council                313MM120502       STILLWELL
    ## 320        3   Gateway Council                313TB091302       STILLWELL
    ## 321        3   Gateway Council                313ZC040702       STILLWELL
    ## 322        3   Gateway Council                313AC082403       STILLWELL
    ## 323        3   Gateway Council                313MD030503       STILLWELL
    ## 324        3   Gateway Council                313HF112202       STILLWELL
    ## 325        3   Gateway Council                313AH092102       STILLWELL
    ## 326        3   Gateway Council                313AK021702       STILLWELL
    ## 327        2   Gateway Council                313TS120902       STILLWELL
    ## 328        2   Gateway Council                313CT061203       STILLWELL
    ## 329        3   Gateway Council                313BW122602       STILLWELL
    ## 330        3   Gateway Council                313VZ100902      JEB STUART
    ## 331        3   Gateway Council                313KB070103      JEB STUART
    ## 332        2   Gateway Council                313TD082503      JEB STUART
    ## 333        2   Gateway Council                313AG030404      JEB STUART
    ## 334        3   Gateway Council                313DH122500      JEB STUART
    ## 335        3   Gateway Council                313AJ041002      JEB STUART
    ## 336        3   Gateway Council                313KJ060502      JEB STUART
    ## 337        2   Gateway Council                313NL121902      JEB STUART
    ## 338        3 Panhandle Council                322AT111104           Mowat
    ## 339        3   Gateway Council                313RR053001      JEB STUART
    ## 340        3   Gateway Council                313AS022503      JEB STUART
    ## 341        3   Gateway Council                313KH120302      JEB STUART
    ## 342        3   Gateway Council                313JS050500      JEB STUART
    ## 343        3   Gateway Council                313DD031903      JEB STUART
    ## 344        2   Gateway Council                313TT080603      JEB STUART
    ## 345        2   Gateway Council                313ME110803      JEB STUART
    ## 346        3   Gateway Council                313VP021302      JEB STUART
    ## 347        3   Gateway Council                313AN031402      JEB STUART
    ## 348        3   Gateway Council                313KB052502      JEB STUART
    ## 349        2   Gateway Council                313TL052902      JEB STUART
    ## 350        3   Gateway Council                313DB040203      JEFF DAVIS
    ## 351        3   Gateway Council                313PS082702      JEFF DAVIS
    ## 352        3   Gateway Council                313VM051001      JEFF DAVIS
    ## 353        2   Gateway Council                313LB031003      JEFF DAVIS
    ## 354        3   Gateway Council                313AC112702      JEFF DAVIS
    ## 355        2   Gateway Council                313MS022702      JEFF DAVIS
    ## 356        3   Gateway Council                313KW061403      JEFF DAVIS
    ## 357        3   Gateway Council                313KD031602      JEFF DAVIS
    ## 358        3   Gateway Council                313DF021003      JEFF DAVIS
    ## 359        3   Gateway Council                313KH061102      JEFF DAVIS
    ## 360        2   Gateway Council                313JN101801      JEFF DAVIS
    ## 361        3   Gateway Council                313DS083103      JEFF DAVIS
    ## 362        3   Gateway Council                313MS091502      JEFF DAVIS
    ## 363        3   Gateway Council                313JT051502      JEFF DAVIS
    ## 364        4 Southeast Council                321KJ012703             llm
    ## 365        4 Southeast Council                321SM012903             Llm
    ## 366        3 Southeast Council                321JP061803             Llm
    ## 367        4 Southeast Council                321PP043003             Llm
    ## 368        3 Southeast Council                321JD101502             Llm
    ## 369        3 Southeast Council                321LU072702             Llm
    ## 370        3 Southeast Council                321JV021803             Llm
    ## 371        3 Panhandle Council                322CJ222204           Jinks
    ## 372        1    Citrus Council TESTTHISTHATTHEEOTHERTHING         Emerson
    ## 373        3 Panhandle Council                322GP111403         Everitt
    ## 374        3 Southeast Council                321MS081705             Llm
    ## 375        4 Southeast Council                321PS042604             Llm
    ## 376        4 Southeast Council                321SS042805             Llm
    ## 377        3 Southeast Council                321SG020905             Llm
    ## 378        3 Southeast Council                321TN073104             Llm
    ##       enrolled      langarts_course grade lang_pts
    ## 1   10/31/2016      M/J LANG ARTS 1     C        2
    ## 2   10/31/2016      M/J LANG ARTS 1     C        2
    ## 3   10/31/2016      M/J LANG ARTS 1     D        1
    ## 4   10/31/2016      M/J LANG ARTS 1     C        2
    ## 5   10/31/2016      M/J LANG ARTS 1     D        1
    ## 6   10/31/2016      M/J LANG ARTS 1     B        3
    ## 7   10/31/2016      M/J LANG ARTS 1     B        3
    ## 8   10/31/2016      M/J LANG ARTS 1     B        3
    ## 9   10/31/2016      M/J LANG ARTS 1     C        2
    ## 10  10/31/2016      M/J LANG ARTS 1     D        1
    ## 11  10/31/2016      M/J LANG ARTS 1     B        3
    ## 12  10/31/2016      M/J LANG ARTS 1     C        2
    ## 13  10/31/2016      M/J LANG ARTS 1     D        1
    ## 14  10/31/2016      M/J LANG ARTS 1     C        2
    ## 15  10/31/2016      M/J LANG ARTS 1     C        2
    ## 16  10/11/2016      M/J LANG ARTS 1     B        3
    ## 17  10/20/2016      M/J LANG ARTS 1     C        2
    ## 18  10/20/2016      M/J LANG ARTS 1     B        3
    ## 19  10/20/2016      M/J LANG ARTS 1     B        3
    ## 20  10/20/2016      M/J LANG ARTS 1     C        2
    ## 21  10/20/2016      M/J LANG ARTS 1     A        4
    ## 22  10/20/2016      M/J LANG ARTS 1     B        3
    ## 23  10/20/2016      M/J LANG ARTS 1     C        2
    ## 24  10/20/2016      M/J LANG ARTS 1     C        2
    ## 25  10/20/2016      M/J LANG ARTS 1     C        2
    ## 26  10/20/2016      M/J LANG ARTS 1     A        4
    ## 27  10/20/2016      M/J LANG ARTS 1     C        2
    ## 28  10/20/2016      M/J LANG ARTS 1     B        3
    ## 29  10/20/2016      M/J LANG ARTS 1     C        2
    ## 30  10/20/2016      M/J LANG ARTS 1     A        4
    ## 31  10/20/2016      M/J LANG ARTS 1     B        3
    ## 32  10/20/2016      M/J LANG ARTS 1     B        3
    ## 33  10/20/2016      M/J LANG ARTS 1     B        3
    ## 34  10/20/2016      M/J LANG ARTS 1     A        4
    ## 35  10/20/2016      M/J LANG ARTS 1     C        2
    ## 36  10/20/2016      M/J LANG ARTS 1     F        0
    ## 37  10/20/2016      M/J LANG ARTS 1     C        2
    ## 38  10/20/2016      M/J LANG ARTS 1     B        3
    ## 39  10/20/2016      M/J LANG ARTS 1     B        3
    ## 40  10/20/2016      M/J LANG ARTS 1     C        2
    ## 41  10/20/2016      M/J LANG ARTS 1     A        4
    ## 42  09/06/2016      M/J LANG ARTS 1     B        3
    ## 43  09/06/2016      M/J LANG ARTS 1     B        3
    ## 44  09/06/2016      M/J LANG ARTS 1     B        3
    ## 45  09/06/2016      M/J LANG ARTS 1     B        3
    ## 46  09/06/2016      M/J LANG ARTS 1     B        3
    ## 47  09/06/2016      M/J LANG ARTS 1     C        2
    ## 48  09/06/2016      M/J LANG ARTS 1     A        4
    ## 49  09/06/2016      M/J LANG ARTS 1     B        3
    ## 50  09/06/2016      M/J LANG ARTS 1     B        3
    ## 51  09/06/2016      M/J LANG ARTS 1     C        2
    ## 52  09/06/2016      M/J LANG ARTS 1     B        3
    ## 53  09/06/2016      M/J LANG ARTS 1     B        3
    ## 54  09/06/2016      M/J LANG ARTS 1     B        3
    ## 55  09/06/2016      M/J LANG ARTS 1     B        3
    ## 56  09/06/2016      M/J LANG ARTS 1     C        2
    ## 57  09/06/2016      M/J LANG ARTS 1     A        4
    ## 58  09/06/2016      M/J LANG ARTS 1     B        3
    ## 59  09/06/2016      M/J LANG ARTS 1     B        3
    ## 60  09/06/2016      M/J LANG ARTS 1     B        3
    ## 61  09/06/2016      M/J LANG ARTS 1     B        3
    ## 62  09/06/2016      M/J LANG ARTS 1     B        3
    ## 63  09/06/2016      M/J LANG ARTS 1     B        3
    ## 64  09/06/2016      M/J LANG ARTS 1     B        3
    ## 65  09/06/2016      M/J LANG ARTS 1     B        3
    ## 66  09/06/2016      M/J LANG ARTS 1     C        2
    ## 67  09/06/2016      M/J LANG ARTS 1     B        3
    ## 68  09/06/2016      M/J LANG ARTS 1     B        3
    ## 69  09/06/2016      M/J LANG ARTS 1     B        3
    ## 70  09/06/2016      M/J LANG ARTS 1     C        2
    ## 71  09/06/2016      M/J LANG ARTS 1     B        3
    ## 72  09/06/2016      M/J LANG ARTS 1     B        3
    ## 73  09/06/2016      M/J LANG ARTS 1     B        3
    ## 74  09/06/2016      M/J LANG ARTS 1     B        3
    ## 75  09/06/2016      M/J LANG ARTS 1     B        3
    ## 76  09/06/2016      M/J LANG ARTS 1     A        4
    ## 77  09/06/2016      M/J LANG ARTS 1     C        2
    ## 78  09/06/2016      M/J LANG ARTS 1     B        3
    ## 79  09/06/2016      M/J LANG ARTS 1     C        2
    ## 80  09/06/2016      M/J LANG ARTS 1     B        3
    ## 81  09/06/2016      M/J LANG ARTS 1     B        3
    ## 82  09/06/2016      M/J LANG ARTS 1     C        2
    ## 83  09/06/2016      M/J LANG ARTS 1     C        2
    ## 84  09/06/2016      M/J LANG ARTS 1     B        3
    ## 85  09/06/2016      M/J LANG ARTS 1     B        3
    ## 86  09/06/2016      M/J LANG ARTS 1     B        3
    ## 87  09/06/2016      M/J LANG ARTS 1     B        3
    ## 88  09/06/2016      M/J LANG ARTS 1     A        4
    ## 89  09/06/2016      M/J LANG ARTS 1     B        3
    ## 90  09/06/2016      M/J LANG ARTS 1     C        2
    ## 91  09/06/2016      M/J LANG ARTS 1     C        2
    ## 92  10/31/2016      M/J LANG ARTS 1     D        1
    ## 93  09/06/2016      M/J LANG ARTS 1     C        2
    ## 94  09/06/2016      M/J LANG ARTS 1     B        3
    ## 95  09/06/2016      M/J LANG ARTS 1     B        3
    ## 96  09/06/2016      M/J LANG ARTS 1     B        3
    ## 97  09/06/2016      M/J LANG ARTS 1     C        2
    ## 98  09/06/2016      M/J LANG ARTS 1     C        2
    ## 99  09/06/2016      M/J LANG ARTS 1     B        3
    ## 100 09/06/2016      M/J LANG ARTS 1     C        2
    ## 101 09/06/2016      M/J LANG ARTS 1     C        2
    ## 102 09/06/2016      M/J LANG ARTS 1     B        3
    ## 103 09/06/2016      M/J LANG ARTS 1     A        4
    ## 104 09/06/2016      M/J LANG ARTS 1     A        4
    ## 105 09/06/2016      M/J LANG ARTS 1     B        3
    ## 106 09/06/2016      M/J LANG ARTS 1     C        2
    ## 107 09/06/2016      M/J LANG ARTS 1     B        3
    ## 108 09/06/2016      M/J LANG ARTS 1     B        3
    ## 109 09/06/2016      M/J LANG ARTS 1     B        3
    ## 110 09/06/2016      M/J LANG ARTS 1     A        4
    ## 111 09/06/2016      M/J LANG ARTS 1     B        3
    ## 112 09/06/2016      M/J LANG ARTS 1     B        3
    ## 113 09/06/2016      M/J LANG ARTS 1     C        2
    ## 114 09/06/2016      M/J LANG ARTS 1     B        3
    ## 115 10/11/2016      M/J LANG ARTS 1     C        2
    ## 116 10/11/2016      M/J LANG ARTS 1     B        3
    ## 117 10/11/2016      M/J LANG ARTS 1     C        2
    ## 118 10/11/2016      M/J LANG ARTS 1     B        3
    ## 119 10/11/2016      M/J LANG ARTS 1     B        3
    ## 120 10/11/2016      M/J LANG ARTS 1     B        3
    ## 121 10/31/2016      M/J LANG ARTS 1     C        2
    ## 122 10/31/2016      M/J LANG ARTS 1     C        2
    ## 123 10/31/2016      M/J LANG ARTS 1     B        3
    ## 124 10/31/2016      M/J LANG ARTS 1     C        2
    ## 125 10/31/2016      M/J LANG ARTS 1     B        3
    ## 126 10/31/2016      M/J LANG ARTS 1     C        2
    ## 127 10/31/2016      M/J LANG ARTS 1     B        3
    ## 128 10/31/2016      M/J LANG ARTS 1     C        2
    ## 129 10/31/2016      M/J LANG ARTS 1     B        3
    ## 130 10/31/2016      M/J LANG ARTS 1     C        2
    ## 131 10/31/2016      M/J LANG ARTS 1     B        3
    ## 132 10/31/2016  M/J LANG ARTS 1 ADV     A        4
    ## 133 10/11/2016  M/J LANG ARTS 1 ADV     B        3
    ## 134 10/31/2016  M/J LANG ARTS 1 ADV     A        4
    ## 135 10/31/2016  M/J LANG ARTS 1 ADV     C        2
    ## 136 10/31/2016  M/J LANG ARTS 1 ADV     A        4
    ## 137 10/31/2016      M/J LANG ARTS 2     C        2
    ## 138 10/31/2016      M/J LANG ARTS 2     B        3
    ## 139 10/31/2016      M/J LANG ARTS 2     D        1
    ## 140 10/31/2016      M/J LANG ARTS 2     F        0
    ## 141 10/31/2016      M/J LANG ARTS 2     C        2
    ## 142 10/31/2016      M/J LANG ARTS 2     B        3
    ## 143 10/11/2016      M/J LANG ARTS 2     B        3
    ## 144 10/11/2016      M/J LANG ARTS 2     B        3
    ## 145 10/11/2016      M/J LANG ARTS 2     C        2
    ## 146 10/20/2016      M/J LANG ARTS 2     D        1
    ## 147 10/20/2016      M/J LANG ARTS 2     C        2
    ## 148 10/20/2016      M/J LANG ARTS 2     B        3
    ## 149 10/20/2016      M/J LANG ARTS 2     C        2
    ## 150 10/20/2016      M/J LANG ARTS 2     C        2
    ## 151 10/20/2016      M/J LANG ARTS 2     B        3
    ## 152 10/20/2016      M/J LANG ARTS 2     C        2
    ## 153 10/20/2016      M/J LANG ARTS 2     B        3
    ## 154 10/20/2016      M/J LANG ARTS 2     A        4
    ## 155 10/20/2016      M/J LANG ARTS 2     A        4
    ## 156 09/06/2016      M/J LANG ARTS 2     B        3
    ## 157 09/06/2016      M/J LANG ARTS 2     C        2
    ## 158 09/06/2016      M/J LANG ARTS 2     B        3
    ## 159 09/06/2016      M/J LANG ARTS 2     B        3
    ## 160 09/06/2016      M/J LANG ARTS 2     B        3
    ## 161 09/06/2016      M/J LANG ARTS 2     B        3
    ## 162 09/06/2016      M/J LANG ARTS 2     C        2
    ## 163 09/06/2016      M/J LANG ARTS 2     B        3
    ## 164 09/06/2016      M/J LANG ARTS 2     B        3
    ## 165 09/06/2016      M/J LANG ARTS 2     C        2
    ## 166 09/06/2016      M/J LANG ARTS 2     B        3
    ## 167 09/06/2016      M/J LANG ARTS 2     B        3
    ## 168 09/06/2016      M/J LANG ARTS 2     C        2
    ## 169 09/06/2016      M/J LANG ARTS 2     C        2
    ## 170 09/06/2016      M/J LANG ARTS 2     B        3
    ## 171 09/06/2016      M/J LANG ARTS 2     B        3
    ## 172 09/06/2016      M/J LANG ARTS 2     B        3
    ## 173 09/06/2016      M/J LANG ARTS 2     B        3
    ## 174 09/06/2016      M/J LANG ARTS 2     C        2
    ## 175 09/06/2016      M/J LANG ARTS 2     B        3
    ## 176 09/06/2016      M/J LANG ARTS 2     C        2
    ## 177 09/06/2016      M/J LANG ARTS 2     B        3
    ## 178 09/06/2016      M/J LANG ARTS 2     C        2
    ## 179 09/06/2016      M/J LANG ARTS 2     B        3
    ## 180 09/06/2016      M/J LANG ARTS 2     B        3
    ## 181 09/06/2016      M/J LANG ARTS 2     B        3
    ## 182 09/06/2016      M/J LANG ARTS 2     B        3
    ## 183 09/06/2016      M/J LANG ARTS 2     C        2
    ## 184 09/06/2016      M/J LANG ARTS 2     B        3
    ## 185 09/06/2016      M/J LANG ARTS 2     B        3
    ## 186 09/06/2016      M/J LANG ARTS 2     B        3
    ## 187 09/06/2016      M/J LANG ARTS 2     B        3
    ## 188 09/06/2016      M/J LANG ARTS 2     B        3
    ## 189 09/06/2016      M/J LANG ARTS 2     C        2
    ## 190 09/06/2016      M/J LANG ARTS 2     C        2
    ## 191 09/06/2016      M/J LANG ARTS 2     B        3
    ## 192 09/06/2016      M/J LANG ARTS 2     B        3
    ## 193 09/06/2016      M/J LANG ARTS 2     B        3
    ## 194 09/06/2016      M/J LANG ARTS 2     B        3
    ## 195 09/06/2016      M/J LANG ARTS 2     B        3
    ## 196 09/06/2016      M/J LANG ARTS 2     B        3
    ## 197 09/06/2016      M/J LANG ARTS 2     B        3
    ## 198 09/06/2016      M/J LANG ARTS 2     B        3
    ## 199 09/06/2016      M/J LANG ARTS 2     B        3
    ## 200 09/06/2016      M/J LANG ARTS 2     B        3
    ## 201 09/06/2016      M/J LANG ARTS 2     B        3
    ## 202 09/06/2016      M/J LANG ARTS 2     C        2
    ## 203 09/06/2016      M/J LANG ARTS 2     C        2
    ## 204 09/06/2016      M/J LANG ARTS 2     C        2
    ## 205 09/06/2016      M/J LANG ARTS 2     B        3
    ## 206 09/06/2016      M/J LANG ARTS 2     C        2
    ## 207 09/06/2016      M/J LANG ARTS 2     B        3
    ## 208 09/06/2016      M/J LANG ARTS 2     B        3
    ## 209 09/06/2016      M/J LANG ARTS 2     C        2
    ## 210 09/06/2016      M/J LANG ARTS 2     B        3
    ## 211 09/06/2016      M/J LANG ARTS 2     C        2
    ## 212 09/06/2016      M/J LANG ARTS 2     C        2
    ## 213 09/06/2016      M/J LANG ARTS 2     B        3
    ## 214 09/06/2016      M/J LANG ARTS 2     B        3
    ## 215 09/06/2016      M/J LANG ARTS 2     B        3
    ## 216 09/06/2016      M/J LANG ARTS 2     C        2
    ## 217 09/06/2016      M/J LANG ARTS 2     B        3
    ## 218 09/06/2016      M/J LANG ARTS 2     C        2
    ## 219 09/06/2016      M/J LANG ARTS 2     B        3
    ## 220 09/06/2016      M/J LANG ARTS 2     B        3
    ## 221 09/06/2016      M/J LANG ARTS 2     B        3
    ## 222 09/06/2016      M/J LANG ARTS 2     B        3
    ## 223 09/06/2016      M/J LANG ARTS 2     B        3
    ## 224 09/06/2016      M/J LANG ARTS 2     B        3
    ## 225 09/06/2016      M/J LANG ARTS 2     C        2
    ## 226 09/06/2016      M/J LANG ARTS 2     C        2
    ## 227 09/06/2016      M/J LANG ARTS 2     C        2
    ## 228 09/06/2016      M/J LANG ARTS 2     B        3
    ## 229 09/06/2016      M/J LANG ARTS 2     B        3
    ## 230 09/06/2016      M/J LANG ARTS 2     A        4
    ## 231 09/06/2016      M/J LANG ARTS 2     B        3
    ## 232 09/06/2016      M/J LANG ARTS 2     C        2
    ## 233 09/06/2016      M/J LANG ARTS 2     A        4
    ## 234 09/06/2016      M/J LANG ARTS 2     B        3
    ## 235 09/06/2016      M/J LANG ARTS 2     B        3
    ## 236 09/06/2016      M/J LANG ARTS 2     B        3
    ## 237 09/06/2016      M/J LANG ARTS 2     B        3
    ## 238 09/06/2016      M/J LANG ARTS 2     C        2
    ## 239 09/06/2016      M/J LANG ARTS 2     C        2
    ## 240 09/06/2016      M/J LANG ARTS 2     B        3
    ## 241 09/06/2016      M/J LANG ARTS 2     B        3
    ## 242 09/06/2016      M/J LANG ARTS 2     B        3
    ## 243 09/06/2016      M/J LANG ARTS 2     C        2
    ## 244 09/06/2016      M/J LANG ARTS 2     A        4
    ## 245 09/06/2016      M/J LANG ARTS 2     A        4
    ## 246 09/06/2016      M/J LANG ARTS 2     B        3
    ## 247 09/06/2016      M/J LANG ARTS 2     B        3
    ## 248 09/06/2016      M/J LANG ARTS 2     B        3
    ## 249 09/06/2016      M/J LANG ARTS 2     B        3
    ## 250 09/06/2016      M/J LANG ARTS 2     B        3
    ## 251 09/06/2016      M/J LANG ARTS 2     C        2
    ## 252 09/06/2016      M/J LANG ARTS 2     C        2
    ## 253 09/06/2016      M/J LANG ARTS 2     B        3
    ## 254 09/06/2016      M/J LANG ARTS 2     C        2
    ## 255 09/06/2016      M/J LANG ARTS 2     C        2
    ## 256 09/06/2016      M/J LANG ARTS 2     B        3
    ## 257 10/11/2016      M/J LANG ARTS 2     A        4
    ## 258 10/11/2016      M/J LANG ARTS 2     B        3
    ## 259 10/11/2016      M/J LANG ARTS 2     B        3
    ## 260 10/11/2016      M/J LANG ARTS 2     B        3
    ## 261 10/11/2016      M/J LANG ARTS 2     B        3
    ## 262 10/11/2016      M/J LANG ARTS 2     C        2
    ## 263 10/11/2016      M/J LANG ARTS 2     C        2
    ## 264 10/11/2016      M/J LANG ARTS 2     B        3
    ## 265 10/11/2016      M/J LANG ARTS 2     A        4
    ## 266 10/11/2016      M/J LANG ARTS 2     C        2
    ## 267 10/11/2016      M/J LANG ARTS 2     B        3
    ## 268 09/06/2016  M/J LANG ARTS 2 ADV     B        3
    ## 269 10/31/2016      M/J LANG ARTS 3     A        4
    ## 270 10/31/2016      M/J LANG ARTS 3     B        3
    ## 271 10/31/2016      M/J LANG ARTS 3     B        3
    ## 272 10/11/2016      M/J LANG ARTS 3     A        4
    ## 273 10/11/2016      M/J LANG ARTS 3     A        4
    ## 274 10/11/2016      M/J LANG ARTS 3     A        4
    ## 275 10/11/2016      M/J LANG ARTS 3     A        4
    ## 276 10/11/2016      M/J LANG ARTS 3     A        4
    ## 277 10/20/2016      M/J LANG ARTS 3     B        3
    ## 278 09/06/2016      M/J LANG ARTS 3     B        3
    ## 279 09/06/2016      M/J LANG ARTS 3     B        3
    ## 280 09/06/2016      M/J LANG ARTS 3     B        3
    ## 281 09/06/2016      M/J LANG ARTS 3     C        2
    ## 282 09/06/2016      M/J LANG ARTS 3     B        3
    ## 283 09/06/2016      M/J LANG ARTS 3     B        3
    ## 284 09/06/2016      M/J LANG ARTS 3     C        2
    ## 285 09/06/2016      M/J LANG ARTS 3     C        2
    ## 286 09/06/2016      M/J LANG ARTS 3     B        3
    ## 287 09/06/2016      M/J LANG ARTS 3     C        2
    ## 288 09/06/2016      M/J LANG ARTS 3     C        2
    ## 289 09/06/2016      M/J LANG ARTS 3     B        3
    ## 290 09/06/2016      M/J LANG ARTS 3     B        3
    ## 291 09/06/2016      M/J LANG ARTS 3     C        2
    ## 292 09/06/2016      M/J LANG ARTS 3     C        2
    ## 293 09/06/2016      M/J LANG ARTS 3     B        3
    ## 294 09/06/2016      M/J LANG ARTS 3     B        3
    ## 295 09/06/2016      M/J LANG ARTS 3     B        3
    ## 296 09/06/2016      M/J LANG ARTS 3     C        2
    ## 297 09/06/2016      M/J LANG ARTS 3     C        2
    ## 298 09/06/2016      M/J LANG ARTS 3     B        3
    ## 299 09/06/2016      M/J LANG ARTS 3     C        2
    ## 300 09/06/2016      M/J LANG ARTS 3     B        3
    ## 301 09/06/2016      M/J LANG ARTS 3     B        3
    ## 302 09/06/2016      M/J LANG ARTS 3     B        3
    ## 303 09/06/2016      M/J LANG ARTS 3     B        3
    ## 304 09/06/2016      M/J LANG ARTS 3     B        3
    ## 305 09/06/2017      M/J LANG ARTS 3     B        3
    ## 306 09/06/2016      M/J LANG ARTS 3     B        3
    ## 307 09/06/2016      M/J LANG ARTS 3     B        3
    ## 308 09/06/2016      M/J LANG ARTS 3     B        3
    ## 309 09/06/2016      M/J LANG ARTS 3     B        3
    ## 310 09/06/2016      M/J LANG ARTS 3     B        3
    ## 311 09/06/2016      M/J LANG ARTS 3     B        3
    ## 312 09/06/2016      M/J LANG ARTS 3     C        2
    ## 313 09/06/2016      M/J LANG ARTS 3     B        3
    ## 314 09/06/2016      M/J LANG ARTS 3     B        3
    ## 315 09/06/2016      M/J LANG ARTS 3     A        4
    ## 316 09/06/2016      M/J LANG ARTS 3     B        3
    ## 317 09/06/2016      M/J LANG ARTS 3     B        3
    ## 318 09/06/2016      M/J LANG ARTS 3     B        3
    ## 319 09/06/2016      M/J LANG ARTS 3     B        3
    ## 320 09/06/2016      M/J LANG ARTS 3     B        3
    ## 321 09/06/2016      M/J LANG ARTS 3     B        3
    ## 322 09/06/2016      M/J LANG ARTS 3     B        3
    ## 323 09/06/2016      M/J LANG ARTS 3     B        3
    ## 324 09/06/2016      M/J LANG ARTS 3     B        3
    ## 325 09/06/2016      M/J LANG ARTS 3     B        3
    ## 326 09/06/2016      M/J LANG ARTS 3     B        3
    ## 327 09/06/2016      M/J LANG ARTS 3     C        2
    ## 328 09/06/2016      M/J LANG ARTS 3     C        2
    ## 329 09/06/2016      M/J LANG ARTS 3     B        3
    ## 330 09/06/2016      M/J LANG ARTS 3     B        3
    ## 331 09/06/2016      M/J LANG ARTS 3     B        3
    ## 332 09/06/2016      M/J LANG ARTS 3     C        2
    ## 333 09/06/2016      M/J LANG ARTS 3     C        2
    ## 334 09/06/2016      M/J LANG ARTS 3     B        3
    ## 335 09/06/2016      M/J LANG ARTS 3     B        3
    ## 336 09/06/2016      M/J LANG ARTS 3     B        3
    ## 337 09/06/2016      M/J LANG ARTS 3     C        2
    ## 338 10/31/2016      M/J LANG ARTS 3     B        3
    ## 339 09/06/2016      M/J LANG ARTS 3     B        3
    ## 340 09/06/2016      M/J LANG ARTS 3     B        3
    ## 341 09/06/2016      M/J LANG ARTS 3     B        3
    ## 342 09/06/2016      M/J LANG ARTS 3     B        3
    ## 343 09/06/2016      M/J LANG ARTS 3     B        3
    ## 344 09/06/2016      M/J LANG ARTS 3     C        2
    ## 345 09/06/2016      M/J LANG ARTS 3     C        2
    ## 346 09/06/2016      M/J LANG ARTS 3     B        3
    ## 347 09/06/2016      M/J LANG ARTS 3     B        3
    ## 348 09/06/2016      M/J LANG ARTS 3     B        3
    ## 349 09/06/2016      M/J LANG ARTS 3     C        2
    ## 350 09/06/2016      M/J LANG ARTS 3     B        3
    ## 351 09/06/2016      M/J LANG ARTS 3     B        3
    ## 352 09/06/2016      M/J LANG ARTS 3     B        3
    ## 353 09/06/2016      M/J LANG ARTS 3     C        2
    ## 354 09/06/2016      M/J LANG ARTS 3     B        3
    ## 355 09/06/2016      M/J LANG ARTS 3     C        2
    ## 356 09/06/2016      M/J LANG ARTS 3     B        3
    ## 357 09/06/2016      M/J LANG ARTS 3     B        3
    ## 358 09/06/2016      M/J LANG ARTS 3     B        3
    ## 359 09/06/2016      M/J LANG ARTS 3     B        3
    ## 360 09/06/2016      M/J LANG ARTS 3     C        2
    ## 361 09/06/2016      M/J LANG ARTS 3     B        3
    ## 362 09/06/2016      M/J LANG ARTS 3     B        3
    ## 363 09/06/2016      M/J LANG ARTS 3     B        3
    ## 364 10/11/2016      M/J LANG ARTS 3     A        4
    ## 365 10/11/2016      M/J LANG ARTS 3     A        4
    ## 366 10/11/2016      M/J LANG ARTS 3     B        3
    ## 367 10/11/2016      M/J LANG ARTS 3     A        4
    ## 368 10/11/2016      M/J LANG ARTS 3     B        3
    ## 369 10/11/2016      M/J LANG ARTS 3     B        3
    ## 370 10/11/2016      M/J LANG ARTS 3     B        3
    ## 371 10/31/2016 M/J ENG 1 CAMB SEC 1     B        3
    ## 372 10/21/2016 M/J INTENS LANG ARTS     D        1
    ## 373 10/31/2016 M/J INTENS LANG ARTS     B        3
    ## 374 10/11/2016 M/J INTENS LANG ARTS     B        3
    ## 375 10/11/2016 M/J INTENS LANG ARTS     A        4
    ## 376 10/11/2016 M/J INTENS LANG ARTS     A        4
    ## 377 10/11/2016 M/J INTENS LANG ARTS     B        3
    ## 378 10/11/2016 M/J INTENS LANG ARTS     B        3

Join All Behavior Data
======================

``` r
q3_behavior_data <- full_join(q3_behavior, q3_attendance, by="girl_code")

dim(q3_behavior_data)
```

    ## [1] 386  13

``` r
head(q3_behavior_data)
```

    ## # A tibble: 6 × 13
    ##           council.x                  girl_code school.x enrolled.x
    ##               <chr>                      <chr>    <chr>      <chr>
    ## 1    Citrus Council TESTTHISTHATTHEEOTHERTHING  Emerson 10/21/2016
    ## 2 Panhandle Council                322IM020401    Jinks 10/31/2016
    ## 3 Panhandle Council                322LN080204    Jinks 10/31/2016
    ## 4 Panhandle Council                322EL080504    Jinks 10/31/2016
    ## 5 Panhandle Council                322ZR120704    Jinks 10/31/2016
    ## 6 Panhandle Council                322DR081902    Jinks 10/31/2016
    ## # ... with 9 more variables: in_school <dbl>, out_school <dbl>,
    ## #   total.x <dbl>, council.y <chr>, school.y <chr>, enrolled.y <chr>,
    ## #   unexcused <dbl>, excused <dbl>, total.y <dbl>

``` r
names(q3_behavior_data)
```

    ##  [1] "council.x"  "girl_code"  "school.x"   "enrolled.x" "in_school" 
    ##  [6] "out_school" "total.x"    "council.y"  "school.y"   "enrolled.y"
    ## [11] "unexcused"  "excused"    "total.y"

``` r
q3_behavior_data <- q3_behavior_data %>%
    select(1,2,3,4, 5, 7, 13) %>%
    rename(council = council.x) %>%
    rename(school = school.x) %>%
    rename(enrolled = enrolled.x) %>%
    rename(suspension_total = total.x)%>%
    rename(absences_total = total.y)

head(q3_behavior_data)
```

    ## # A tibble: 6 × 7
    ##             council                  girl_code  school   enrolled
    ##               <chr>                      <chr>   <chr>      <chr>
    ## 1    Citrus Council TESTTHISTHATTHEEOTHERTHING Emerson 10/21/2016
    ## 2 Panhandle Council                322IM020401   Jinks 10/31/2016
    ## 3 Panhandle Council                322LN080204   Jinks 10/31/2016
    ## 4 Panhandle Council                322EL080504   Jinks 10/31/2016
    ## 5 Panhandle Council                322ZR120704   Jinks 10/31/2016
    ## 6 Panhandle Council                322DR081902   Jinks 10/31/2016
    ## # ... with 3 more variables: in_school <dbl>, suspension_total <dbl>,
    ## #   absences_total <dbl>

``` r
q3_behavior_data <- full_join(q3_behavior_data, q3_expelled, by="girl_code")

names(q3_behavior_data)
```

    ##  [1] "council.x"        "girl_code"        "school.x"        
    ##  [4] "enrolled.x"       "in_school"        "suspension_total"
    ##  [7] "absences_total"   "council.y"        "school.y"        
    ## [10] "enrolled.y"       "expelled"

``` r
q3_behavior_data <- q3_behavior_data %>%
    select(1, 2, 3, 4, 6,7,11) %>%
    rename(council = council.x) %>%
    rename(school = school.x)%>%
    rename(enrolled = enrolled.x)
    #rename(expelled = expelled.x)


head(q3_behavior_data)
```

    ## # A tibble: 6 × 7
    ##             council                  girl_code  school   enrolled
    ##               <chr>                      <chr>   <chr>      <chr>
    ## 1    Citrus Council TESTTHISTHATTHEEOTHERTHING Emerson 10/21/2016
    ## 2 Panhandle Council                322IM020401   Jinks 10/31/2016
    ## 3 Panhandle Council                322LN080204   Jinks 10/31/2016
    ## 4 Panhandle Council                322EL080504   Jinks 10/31/2016
    ## 5 Panhandle Council                322ZR120704   Jinks 10/31/2016
    ## 6 Panhandle Council                322DR081902   Jinks 10/31/2016
    ## # ... with 3 more variables: suspension_total <dbl>, absences_total <dbl>,
    ## #   expelled <chr>

Combine Grades
==============

``` r
q3_grades_c <- full_join(q3_reading, q3_langarts, by="girl_code")

names(q3_grades_c)
```

    ##  [1] "reading_avg"     "council.x"       "girl_code"      
    ##  [4] "school.x"        "enrolled.x"      "reading_course" 
    ##  [7] "Grade"           "reading_pts"     "lang_avg"       
    ## [10] "council.y"       "school.y"        "enrolled.y"     
    ## [13] "langarts_course" "grade"           "lang_pts"

``` r
q3_grades_c <- q3_grades_c %>%
    select(2,6,7,12,13) %>%
    rename(council = council.x)

head(q3_grades_c)
```

    ##             council  reading_course Grade enrolled.y langarts_course
    ## 1 Panhandle Council M/J INTENS READ     A 10/31/2016 M/J LANG ARTS 2
    ## 2 Panhandle Council M/J INTENS READ     C 10/31/2016 M/J LANG ARTS 1
    ## 3 Panhandle Council M/J INTENS READ     D 10/31/2016 M/J LANG ARTS 2
    ## 4 Panhandle Council M/J INTENS READ     C 10/31/2016 M/J LANG ARTS 1
    ## 5 Panhandle Council M/J INTENS READ     D 10/31/2016 M/J LANG ARTS 1
    ## 6 Panhandle Council M/J INTENS READ     B 10/31/2016 M/J LANG ARTS 1

``` r
setwd("C:/Users/kevin/Dropbox/GetReal/Data/sqlite")


getReal_db<- dbConnect(SQLite(), dbname="outcome_history.sqlite") #established connection with database

dbWriteTable(conn =getReal_db, name= "Q3_attendance_1617", value= q3_attendance, row.names=FALSE, overwrite=TRUE)
```

    ## [1] TRUE

``` r
dbWriteTable(conn =getReal_db, name= "Q3_behavior_1617", value= q3_behavior, row.names=FALSE, overwrite=TRUE)
```

    ## [1] TRUE

``` r
dbWriteTable(conn =getReal_db, name= "Q3_expelled_1617", value= q3_expelled, row.names=FALSE, overwrite=TRUE)
```

    ## [1] TRUE

``` r
dbWriteTable(conn =getReal_db, name= "Q3_reading_1617", value= q3_reading, row.names=FALSE, overwrite=TRUE)
```

    ## [1] TRUE

``` r
dbWriteTable(conn =getReal_db, name= "Q3_langarts_1617", value= q3_langarts, row.names=FALSE, overwrite=TRUE)
```

    ## [1] TRUE

``` r
dbWriteTable(conn =getReal_db, name= "Q3_duplicates_1617", value= q3Dupes, row.names=FALSE, overwrite=TRUE)
```

    ## [1] TRUE

``` r
dbWriteTable(conn =getReal_db, name= "Q3_behavior_data_1617", value= q3_behavior_data, row.names=FALSE, overwrite=TRUE)
```

    ## [1] TRUE

Functions
=========

``` r
grades_file <- function(x) {
    grade_file <- filter(q3_grades_c, council == x)
    write.csv (grade_file, file="grade_file_q3.csv", row.names=FALSE)
    
    
}
```

``` r
behavior_file <- function(x){
    behavior_file <- filter(q3_behavior_data, council== x)
    write.csv(behavior_file, file="behavior.file_q3.csv", row.names=FALSE)

    }
```

``` r
grade_dupes_file <-function(x){
    grade_dupes <-filter(q3Dupes, council== x)
    write.csv(grade_dupes, file="grade_dupes_q3.csv", row.names=FALSE)
    
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
