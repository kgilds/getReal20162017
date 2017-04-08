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


#names(q2_data)
```

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
    gather("reading_course", "Grade",25:31, 34) %>% #gather reading columns and put them in row
    select(7,13:16, 81:82) #select reading columns
    

names(q2_reading)
```

    ## [1] "reading_avg"    "council"        "girl_code"      "school"        
    ## [5] "enrolled"       "reading_course" "Grade"

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
    ## # ... with 190 more rows, and 2 more variables: reading_course <chr>,
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

``` r
q2_reading
```

    ## # A tibble: 200 × 7
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
    ## # ... with 190 more rows, and 2 more variables: reading_course <chr>,
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

    ## # A tibble: 182 × 7
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
    ## # ... with 172 more rows, and 2 more variables: reading_course <chr>,
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
    ## 92            0 West Central Council  320LB062204    Young Middle
    ## 93            0 West Central Council  320KG040505    Young Middle
    ## 94            0 West Central Council  320JA101203    Young Middle
    ## 95            0 West Central Council  320LA021505   BLAKE ACADEMY
    ## 96            0 West Central Council  320NC041704   Blake Academy
    ## 97            0 West Central Council  320AV040205   Blake Academy
    ## 98            0 West Central Council  320SG022305   Blake Academy
    ## 99            0 West Central Council  320AH071505   Blake Academy
    ## 100           0 West Central Council  320CI061405   Blake Academy
    ## 101           0 West Central Council  320DJ040604   Blake Academy
    ## 102           0 West Central Council  320AM031505   Blake Academy
    ## 103           0 West Central Council  320CP041705   Blake Academy
    ## 104           0 West Central Council  320VS052505   Blake Academy
    ## 105           0 West Central Council  320AW072404   Blake Academy
    ## 106           0 West Central Council  320FB032204   Blake Academy
    ## 107           0 West Central Council  320CR022204   Blake Academy
    ## 108           0 West Central Council  320CM120402   Blake Academy
    ## 109           0 West Central Council  320LP101802   Blake Academy
    ## 110           0 West Central Council  320AT101602   Blake Academy
    ## 111           0 West Central Council  320NR060503   Blake Academy
    ## 112           0      Gateway Council  313TB011705      THE BRIDGE
    ## 113           0      Gateway Council  313SH050805      THE BRIDGE
    ## 114           0      Gateway Council  313SH060304      THE BRIDGE
    ## 115           0      Gateway Council  313DJ091703      THE BRIDGE
    ## 116           0      Gateway Council  313KK122904      THE BRIDGE
    ## 117           0      Gateway Council  313AT020105      THE BRIDGE
    ## 118           0      Gateway Council  313CB010204       LAKESHORE
    ## 119           0      Gateway Council  313RB122804       LAKESHORE
    ## 120           0      Gateway Council  313AC070604       LAKESHORE
    ## 121           0      Gateway Council  313AD110204       LAKESHORE
    ## 122           0      Gateway Council  313JF121503       LAKESHORE
    ## 123           0      Gateway Council  313BH010904       LAKESHORE
    ## 124           0      Gateway Council  313AT102804       LAKESHORE
    ## 125           0      Gateway Council  313NA113005 MATTHEW GILBERT
    ## 126           0      Gateway Council  313MG081605          BUTLER
    ## 127           0      Gateway Council  313LM071304          BUTLER
    ## 128           0      Gateway Council  313PS042205          BUTLER
    ## 129           0      Gateway Council  313JA070105          BUTLER
    ## 130           0      Gateway Council  313DB051704      JEFF DAVIS
    ## 131           0      Gateway Council  313JC090403       STILLWELL
    ## 132           0      Gateway Council  313TB121603      JEB STUART
    ## 133           0      Gateway Council  313JS043004      JEB STUART
    ## 134           0      Gateway Council  313KO040704      JEB STUART
    ## 135           0      Gateway Council  313DB060804      JEB STUART
    ## 136           0      Gateway Council  313ZG041304      JEB STUART
    ## 137           0      Gateway Council  313PM021605      JEB STUART
    ## 138           0      Gateway Council  313MS030606      JEB STUART
    ## 139           0 West Central Council  320SA090704 KATHLEEN MIDDLE
    ## 140           0 West Central Council  320BM032505 KATHLEEN MIDDLE
    ## 141           0 West Central Council  3202N012805 KATHLEEN MIDDLE
    ## 142           0 West Central Council  320VR031805 KATHLEEN MIDDLE
    ## 143           0    Panhandle Council  322AG102504         Everitt
    ## 144           0 West Central Council  320RH100404    Young Middle
    ## 145           0 West Central Council  320JA020205   BLAKE ACADMEY
    ## 146           0 West Central Council  320RF032305   Blake Academy
    ## 147           0 West Central Council  320CG072705   Blake Academy
    ## 148           0 West Central Council  320AW071205   Blake Academy
    ## 149           0      Gateway Council  313SB120603      THE BRIDGE
    ## 150           0      Gateway Council  313MA090303      THE BRIDGE
    ## 151           0      Gateway Council  313CH121603      THE BRIDGE
    ## 152           0      Gateway Council  313EO080204      THE BRIDGE
    ## 153           0      Gateway Council  313DP021104      THE BRIDGE
    ## 154           0      Gateway Council  313YR043004      THE BRIDGE
    ## 155           0      Gateway Council  313KT081504      THE BRIDGE
    ## 156           0      Gateway Council  313YK062304 MATTHEW GILBERT
    ## 157           0      Gateway Council  313RR042804 MATTHEW GILBERT
    ## 158           0      Gateway Council  313MT072302 MATTHEW GILBERT
    ## 159           0      Gateway Council  313LB031704 MATTHEW GILBERT
    ## 160           0      Gateway Council  313SB112203      JEFF DAVIS
    ## 161           0      Gateway Council  313MB080504      JEFF DAVIS
    ## 162           0      Gateway Council  313KF050404      JEFF DAVIS
    ## 163           0      Gateway Council  313TL030304      JEFF DAVIS
    ## 164           0      Gateway Council  313RJ070404       STILLWELL
    ## 165           0      Gateway Council  313JR042804       STILLWELL
    ## 166           0      Gateway Council  313KR112103      JEB STUART
    ## 167           0      Gateway Council  313LS033104      JEB STUART
    ## 168           0      Gateway Council  313ET062404      JEB STUART
    ## 169           0 West Central Council  320MC121603 KATHLEEN MIDDLE
    ## 170           0      Gateway Council  313JB110302      THE BRIDGE
    ## 171           0      Gateway Council  313AK041202      THE BRIDGE
    ## 172           0      Gateway Council  313PS082702      JEFF DAVIS
    ## 173           0      Gateway Council  313RG060502      JEFF DAVIS
    ## 174           0      Gateway Council  313DS083103      JEFF DAVIS
    ## 175           0      Gateway Council  313AK021702       STILLWELL
    ## 176           0      Gateway Council  313IS050500      JEB STUART
    ## 177           0      Gateway Council  313DH122500      JEB STUART
    ## 178           0      Gateway Council  313AS022503      JEB STUART
    ## 179           0 West Central Council  320AB061103   Blake Academy
    ## 180           0 West Central Council  320EF042903   Blake Academy
    ## 181           0 West Central Council  320AM072903   Blake Academy
    ## 182           0 West Central Council  320BR072103   Blake Academy
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
    ## 92  10/21/2016 M/J INTENS READ     C           2
    ## 93  10/21/2016 M/J INTENS READ     A           4
    ## 94  10/21/2016 M/J INTENS READ     B           3
    ## 95  10/01/2016 M/J INTENS READ     F           0
    ## 96  08/01/2016 M/J INTENS READ     C           2
    ## 97  08/01/2016 M/J INTENS READ     C           2
    ## 98  08/01/2016 M/J INTENS READ     D           1
    ## 99  08/01/2016 M/J INTENS READ     C           2
    ## 100 08/01/2016 M/J INTENS READ     F           0
    ## 101 08/01/2016 M/J INTENS READ     F           0
    ## 102 08/01/2016 M/J INTENS READ     C           2
    ## 103 08/01/2016 M/J INTENS READ     B           3
    ## 104 08/01/2016 M/J INTENS READ     C           2
    ## 105 08/01/2016 M/J INTENS READ     F           0
    ## 106 08/01/2016 M/J INTENS READ     A           4
    ## 107 08/01/2016 M/J INTENS READ     C           2
    ## 108 08/01/2016 M/J INTENS READ     C           2
    ## 109 08/01/2016 M/J INTENS READ     B           3
    ## 110 08/01/2016 M/J INTENS READ     D           1
    ## 111 08/01/2016 M/J INTENS READ     D           1
    ## 112 09/06/2016      M/J READ 1     C           2
    ## 113 09/06/2016      M/J READ 1     C           2
    ## 114 09/06/2016      M/J READ 1     C           2
    ## 115 09/06/2016      M/J READ 1     B           3
    ## 116 09/06/2016      M/J READ 1     C           2
    ## 117 09/06/2016      M/J READ 1     C           2
    ## 118 09/06/2016      M/J READ 1     C           2
    ## 119 09/06/2016      M/J READ 1     C           2
    ## 120 09/06/2016      M/J READ 1     C           2
    ## 121 09/06/2016      M/J READ 1     B           3
    ## 122 09/06/2016      M/J READ 1     C           2
    ## 123 09/06/2016      M/J READ 1     D           1
    ## 124 09/06/2016      M/J READ 1     C           2
    ## 125 09/06/2016      M/J READ 1     B           3
    ## 126 09/06/2016      M/J READ 1     C           2
    ## 127 09/06/2016      M/J READ 1     B           3
    ## 128 09/06/2016      M/J READ 1     B           3
    ## 129 09/06/2016      M/J READ 1     B           3
    ## 130 09/06/2016      M/J READ 1     C           2
    ## 131 09/06/2016      M/J READ 1     B           3
    ## 132 09/06/2016      M/J READ 1     C           2
    ## 133 09/06/2016      M/J READ 1     A           4
    ## 134 09/06/2016      M/J READ 1     A           4
    ## 135 09/06/2016      M/J READ 1     C           2
    ## 136 09/06/2016      M/J READ 1     C           2
    ## 137 09/06/2016      M/J READ 1     D           1
    ## 138 09/06/2016      M/J READ 1     B           3
    ## 139 11/01/2016 M/J READ 1, ADV     A           4
    ## 140 11/01/2016 M/J READ 1, ADV     C           2
    ## 141 11/01/2016 M/J READ 1, ADV     B           3
    ## 142 11/01/2016 M/J READ 1, ADV     B           3
    ## 143 02/08/2017 M/J READ 1, ADV     B           3
    ## 144 09/21/2016 M/J READ 1, ADV     A           4
    ## 145 10/01/2016 M/J READ 1, ADV     C           2
    ## 146 08/01/2016 M/J READ 1, ADV     C           2
    ## 147 08/01/2016 M/J READ 1, ADV     C           2
    ## 148 08/01/2016 M/J READ 1, ADV     F           0
    ## 149 09/06/2016      M/J READ 2     C           2
    ## 150 09/06/2016      M/J READ 2     D           1
    ## 151 09/06/2016      M/J READ 2     B           3
    ## 152 09/06/2016      M/J READ 2     D           1
    ## 153 09/06/2016      M/J READ 2     C           2
    ## 154 09/06/2016      M/J READ 2     D           1
    ## 155 09/06/2016      M/J READ 2     B           3
    ## 156 09/06/2016      M/J READ 2     C           2
    ## 157 09/06/2016      M/J READ 2     C           2
    ## 158 09/06/2016      M/J READ 2     C           2
    ## 159 09/06/2016      M/J READ 2     C           2
    ## 160 09/06/2016      M/J READ 2     B           3
    ## 161 09/06/2016      M/J READ 2     C           2
    ## 162 09/06/2016      M/J READ 2     C           2
    ## 163 09/06/2016      M/J READ 2     D           1
    ## 164 09/06/2016      M/J READ 2     B           3
    ## 165 09/06/2016      M/J READ 2     C           2
    ## 166 09/06/2016      M/J READ 2     C           2
    ## 167 09/06/2016      M/J READ 2     C           2
    ## 168 09/06/2016      M/J READ 2     C           2
    ## 169 11/01/2016 M/J READ 2, ADV     A           4
    ## 170 09/06/2016      M/J READ 3     C           2
    ## 171 09/06/2016      M/J READ 3     B           3
    ## 172 09/06/2016      M/J READ 3     C           2
    ## 173 09/06/2016      M/J READ 3     C           2
    ## 174 09/06/2016      M/J READ 3     C           2
    ## 175 09/26/2016      M/J READ 3     C           2
    ## 176 09/06/2016      M/J READ 3     C           2
    ## 177 09/06/2016      M/J READ 3     B           3
    ## 178 09/06/2016      M/J READ 3     B           3
    ## 179 08/01/2016  M/J READ3, ADV     A           4
    ## 180 08/01/2016  M/J READ3, ADV     A           4
    ## 181 08/01/2016  M/J READ3, ADV     F           0
    ## 182 08/01/2016  M/J READ3, ADV     A           4

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

    ## # A tibble: 494 × 7
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
    ## # ... with 484 more rows, and 2 more variables: langarts_course <chr>,
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

    ## # A tibble: 494 × 7
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
    ## # ... with 484 more rows, and 2 more variables: langarts_course <chr>,
    ## #   grade <chr>

``` r
q2_langarts <- q2_langarts %>%
    filter(grade != "Did not mean to select this course")


dim(q2_langarts)
```

    ## [1] 491   7

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
    ## 96         4      Gateway Council  313FF111603          BUTLER 09/06/2016
    ## 97         2      Gateway Council  313EF080305          BUTLER 09/06/2016
    ## 98         4      Gateway Council  313PS042205          BUTLER 09/06/2016
    ## 99         2      Gateway Council  313DE080804          BUTLER 09/06/2016
    ## 100        3      Gateway Council  313JA070105          BUTLER 09/06/2016
    ## 101        1      Gateway Council  313DB051704      JEFF DAVIS 09/06/2016
    ## 102        1      Gateway Council  313JC090403       STILLWELL 09/06/2016
    ## 103        3      Gateway Council  313GG010305       STILLWELL 09/06/2016
    ## 104        2      Gateway Council  313MH122904       STILLWELL 09/06/2016
    ## 105        2      Gateway Council  313JS093004       STILLWELL 09/06/2016
    ## 106        2      Gateway Council  313LS010404       STILLWELL 09/06/2016
    ## 107        3      Gateway Council  313TB121603      JEB STUART 09/06/2016
    ## 108        4      Gateway Council  313DM121103       STILLWELL 09/06/2016
    ## 109        2      Gateway Council  313IW110204      JEB STUART 09/06/2016
    ## 110        3      Gateway Council  313JS043004      JEB STUART 09/06/2016
    ## 111        3      Gateway Council  313KO040704      JEB STUART 09/06/2016
    ## 112        2      Gateway Council  313TW081103      JEB STUART 09/06/2016
    ## 113        2      Gateway Council  313CM120704      JEB STUART 09/06/2016
    ## 114        2      Gateway Council  313SL020605      JEB STUART 09/06/2016
    ## 115        2      Gateway Council  313KM110503      JEB STUART 09/06/2016
    ## 116        3      Gateway Council  313DB060804      JEB STUART 09/06/2016
    ## 117        2      Gateway Council  313HC040605      JEB STUART 09/06/2016
    ## 118        3      Gateway Council  313DD122004      JEB STUART 09/06/2016
    ## 119        2      Gateway Council  313JE010703      JEB STUART 09/06/2016
    ## 120        4      Gateway Council  313YG081804      JEB STUART 09/06/2016
    ## 121        2      Gateway Council  313ZG041304      JEB STUART 09/06/2016
    ## 122        2      Gateway Council  313CJ082905      JEB STUART 09/06/2016
    ## 123        1      Gateway Council  313CJ091804      JEB STUART 09/06/2016
    ## 124        1      Gateway Council  313PM021605      JEB STUART 09/06/2016
    ## 125        2      Gateway Council  313AO080104      JEB STUART 09/06/2016
    ## 126        4      Gateway Council  313MS030606      JEB STUART 09/06/2016
    ## 127        2      Gateway Council  313MS113004      JEB STUART 09/06/2016
    ## 128        2      Gateway Council  313JT060205      JEB STUART 09/06/2016
    ## 129        2      Gateway Council  313DW052505      JEB STUART 09/06/2016
    ## 130        2      Gateway Council  313DW122104      JEB STUART 09/06/2016
    ## 131        2      Gateway Council  313CW111804      JEB STUART 09/06/2016
    ## 132        1      Gateway Council  313HW060205      JEB STUART 09/06/2016
    ## 133        1      Gateway Council  313MW040605      JEB STUART 09/06/2016
    ## 134        3 West Central Council  320KG040505    Young Middle 10/21/2016
    ## 135        4 West Central Council  320JA101203    Young Middle 10/21/2016
    ## 136        2 West Central Council  320AC020704    Young Middle 10/21/2016
    ## 137        3 West Central Council  320MH043004    Young Middle 10/21/2016
    ## 138        3 West Central Council  320JA020205   BLAKE ACADMEY 10/01/2016
    ## 139        3 West Central Council  320LA021505   BLAKE ACADEMY 10/01/2016
    ## 140        3 West Central Council  320NC041704   Blake Academy 08/01/2016
    ## 141        3 West Central Council  320AV040205   Blake Academy 08/01/2016
    ## 142        4 West Central Council  320CG072705   Blake Academy 08/01/2016
    ## 143        4 West Central Council  320JG022305   Blake Academy 08/01/2016
    ## 144        2 West Central Council  320SG022305   Blake Academy 08/01/2016
    ## 145        3 West Central Council  320AH071505   Blake Academy 08/01/2016
    ## 146        3 West Central Council  320CI061405   Blake Academy 08/01/2016
    ## 147        4 West Central Council  320DJ040604   Blake Academy 08/01/2016
    ## 148        4 West Central Council  320AM031505   Blake Academy 08/01/2016
    ## 149        4 West Central Council  320CP041705   Blake Academy 08/01/2016
    ## 150        2 West Central Council  320VS052505   Blake Academy 08/01/2016
    ## 151        3 West Central Council  320AW072404   Blake Academy 08/01/2016
    ## 152        2 West Central Council  320AW071205   Blake Academy 08/01/2016
    ## 153        4 West Central Council  320SA090704 KATHLEEN MIDDLE 11/01/2016
    ## 154        4 West Central Council  3202B062705 KATHLEEN MIDDLE 11/01/2017
    ## 155        4 West Central Council  320SD031905 KATHLEEN MIDDLE 11/01/2017
    ## 156        4 West Central Council  320DG092204 KATHLEEN MIDDLE 11/01/2016
    ## 157        4 West Central Council  320MM120704 KATHLEEN MIDDLE 11/01/2016
    ## 158        3 West Central Council  320BM032505 KATHLEEN MIDDLE 11/01/2016
    ## 159        4 West Central Council  3202N012805 KATHLEEN MIDDLE 11/01/2016
    ## 160        4 West Central Council  320VR031805 KATHLEEN MIDDLE 11/01/2016
    ## 161        2    Southeast Council  321JB120304              LL 10/20/2016
    ## 162        2    Southeast Council  321MC022705              LL 10/20/2016
    ## 163        4    Southeast Council    321012405              LL 10/20/2016
    ## 164        4    Southeast Council  321JD082405              LL 10/20/2016
    ## 165        3    Southeast Council  321TG070305              LL 10/20/2016
    ## 166        2    Southeast Council  321TV110604              LL 10/20/2016
    ## 167        1    Southeast Council  321FV022205              LL 10/20/2016
    ## 168        3     Tropical Council  321GN100704              LL 10/20/2016
    ## 169        2    Southeast Council  321JP061904              LL 10/20/2016
    ## 170        3    Southeast Council  321RR031305              LL 10/20/2016
    ## 171        4    Southeast Council  321AR080305              LL 10/20/2016
    ## 172        2    Southeast Council  321MS081705              LL 10/20/2016
    ## 173        3    Southeast Council  321ST081905              LL 10/20/2016
    ## 174        3    Southeast Council  321BT042805              LL 10/20/2016
    ## 175        4    Southeast Council  321AZ041805              LL 10/20/2016
    ## 176        2 West Central Council    320120104    Young Middle 10/21/2016
    ## 177        2      Gateway Council  313LS033104      JEB STUART 09/06/2016
    ## 178        4 West Central Council  320RH100404    Young Middle 09/21/2016
    ## 179        4 West Central Council  320NH120404    Young Middle 10/21/2016
    ## 180        4 West Central Council  320KB061005    young Middle 10/21/2016
    ## 181        3 West Central Council  320VC032105    Young Middle 10/21/2016
    ## 182        4 West Central Council  320CC050705   BLAKE ACADEMY 10/01/2016
    ## 183        4 West Central Council  320AC100104   BLAKE ACADEMY 10/01/2016
    ## 184        4 West Central Council  320MC111104   Blake Academy 08/01/2016
    ## 185        3 West Central Council  320RF032305   Blake Academy 08/01/2016
    ## 186        2    Panhandle Council  322TH052216           Jinks 02/08/2017
    ## 187        0    Panhandle Council  322AC113004           Jinks 02/08/2017
    ## 188        3 West Central Council  320MM051204 KATHLEEN MIDDLE 11/01/2016
    ## 189        2 West Central Council  320DP061004 KATHLEEN MIDDLE 11/01/2016
    ## 190        3 West Central Council  320DP090403 KATHLEEN MIDDLE 11/01/2016
    ## 191        3 West Central Council  320SW043004 KATHLEEN MIDDLE 11/01/2016
    ## 192        2    Panhandle Council  322NB061103           Jinks 02/08/2017
    ## 193        2    Panhandle Council  322CM041604           Jinks 02/08/2017
    ## 194        1    Panhandle Council  322KM030103           Jinks 02/08/2017
    ## 195        2    Panhandle Council  322BN030103           Jinks 02/08/2017
    ## 196        1    Panhandle Council  322ZR120704           Jinks 02/08/2017
    ## 197        0    Panhandle Council  322SS091203           Jinks 02/08/2017
    ## 198        2    Panhandle Council  322TS032304           Jinks 02/08/2017
    ## 199        1    Panhandle Council  322KS101602         Everitt 02/08/2017
    ## 200        2    Panhandle Council  322LD122603         Everitt 02/08/2017
    ## 201        2    Panhandle Council  322DB062904         Everitt 02/08/2017
    ## 202        3    Panhandle Council  322JP020504         Everitt 02/08/2017
    ## 203        3    Panhandle Council  322DS062904         Everitt 02/08/2017
    ## 204        3    Southeast Council  321VA082703              LL 10/20/2016
    ## 205        3    Southeast Council  321KB112204              LL 10/20/2016
    ## 206        3    Southeast Council  321TD053102              LL 10/20/2016
    ## 207        1    Southeast Council  321RG070304              LL 10/20/2016
    ## 208        1    Southeast Council  321ZJ092702              LL 10/20/2016
    ## 209        4    Southeast Council  321CW071704              LL 10/20/2016
    ## 210        2    Southeast Council  321SO020203              LL 10/20/2016
    ## 211        3    Southeast Council  321CR101403              LL 10/20/2016
    ## 212        2    Southeast Council  321ER110803              LL 10/20/2016
    ## 213        1    Southeast Council  321ES020904              LL 10/20/2016
    ## 214        4    Southeast Council  321PS042604              LL 10/20/2016
    ## 215        2    Southeast Council  321SS081303              LL 10/20/2016
    ## 216        3    Southeast Council  321KW062503              LL 10/20/2016
    ## 217        2    Southeast Council  321FW062504              LL 10/20/2016
    ## 218        3    Southeast Council  321JW083003              LL 10/20/2016
    ## 219        4 West Central Council  320SB050304    Young Middle 10/21/2016
    ## 220        3 West Central Council  320SC072304    Young Middle 10/21/2016
    ## 221        2      Gateway Council  313SB120603      THE BRIDGE 09/06/2016
    ## 222        2      Gateway Council  313MA090303      THE BRIDGE 09/06/2016
    ## 223        2      Gateway Council  313AB062704      THE BRIDGE 09/06/2016
    ## 224        3      Gateway Council  313DB011903      THE BRIDGE 09/06/2016
    ## 225        3      Gateway Council  313IC052403      THE BRIDGE 09/06/2016
    ## 226        2      Gateway Council  313AC103103      THE BRIDGE 09/06/2016
    ## 227        2      Gateway Council  313CC100602      THE BRIDGE 09/06/2016
    ## 228        3      Gateway Council  313BC040204      THE BRIDGE 09/06/2016
    ## 229        3      Gateway Council  313KE082704      THE BRIDGE 09/06/2016
    ## 230        3      Gateway Council  313LF022804     THE  BRIDGE 09/06/2016
    ## 231        3      Gateway Council  313KG061204      THE BRIDGE 09/06/2016
    ## 232        2      Gateway Council  313CH121603      THE BRIDGE 09/06/2016
    ## 233        3      Gateway Council  313CH082603      THE BRIDGE 09/06/2016
    ## 234        1      Gateway Council  313AH081503      THE BRIDGE 09/06/2016
    ## 235        1      Gateway Council  313EO080204      THE BRIDGE 09/06/2016
    ## 236        3      Gateway Council  313DJ031804      THE BRIDGE 09/06/2016
    ## 237        2      Gateway Council  313JL110303      THE BRIDGE 09/06/2016
    ## 238        2      Gateway Council  313JM072404      THE BRIDGE 09/06/2016
    ## 239        2      Gateway Council  313JM100903      THE BRIDGE 09/06/2016
    ## 240        1      Gateway Council  313OM101303      THE BRIDGE 09/06/2016
    ## 241        1      Gateway Council  313BM050404      THE BRIDGE 09/06/2016
    ## 242        0      Gateway Council  313AN121503      THE BRIDGE 09/06/2016
    ## 243        1      Gateway Council  313DP021104      THE BRIDGE 09/06/2016
    ## 244        1      Gateway Council  313AP072605      THE BRIDGE 09/06/2016
    ## 245        2      Gateway Council  313ER122203      THE BRIDGE 09/06/2016
    ## 246        1      Gateway Council  313YR043004      THE BRIDGE 09/06/2016
    ## 247        3      Gateway Council  313KT081504      THE BRIDGE 09/06/2016
    ## 248        1      Gateway Council  313MW031804      THE BRIDGE 09/06/2014
    ## 249        2      Gateway Council  313JW030304      THE BRIDGE 09/06/2016
    ## 250        1      Gateway Council  313AW042604      THE BRIDGE 09/06/2016
    ## 251        3      Gateway Council  313NJ060203       LAKESHORE 09/06/2016
    ## 252        3      Gateway Council  313JJ050404       LAKESHORE 09/06/2016
    ## 253        2      Gateway Council  313TR041903       LAKESHORE 09/06/2016
    ## 254        2      Gateway Council  313AA021404 MATTHEW GILBERT 09/06/2016
    ## 255        2      Gateway Council  313JS010204 MATTHEW GILBERT 09/06/2016
    ## 256        2      Gateway Council  313YK062304 MATTHEW GILBERT 09/06/2016
    ## 257        3      Gateway Council  313LG030104 MATTHEW GILBERT 09/06/2016
    ## 258        2      Gateway Council  313AS040404 MATTHEW GILBERT 09/06/2016
    ## 259        2      Gateway Council  313DW080604 MATTHEW GILBERT 09/06/2016
    ## 260        3      Gateway Council  313RR042804 MATTHEW GILBERT 09/06/2016
    ## 261        2      Gateway Council  313AT041103 MATTHEW GILBERT 09/06/2016
    ## 262        2      Gateway Council  313MT072302 MATTHEW GILBERT 09/06/2016
    ## 263        2      Gateway Council  313LB031704 MATTHEW GILBERT 09/06/2016
    ## 264        3      Gateway Council  313KM051404          BUTLER 09/06/2016
    ## 265        2      Gateway Council  313TK052204      JEFF DAVIS 09/06/2016
    ## 266        2      Gateway Council  313JC111703      JEFF DAVIS 09/06/2016
    ## 267        3      Gateway Council  313JD052404      JEFF DAVIS 09/06/2016
    ## 268        3      Gateway Council  313GG091004      JEFF DAVIS 09/06/2016
    ## 269        2      Gateway Council  313CC013004      JEFF DAVIS 09/06/2016
    ## 270        4      Gateway Council  313AA032704      JEFF DAIVS 09/06/2016
    ## 271        2      Gateway Council  313EC083004      JEFF DAVIS 09/06/2016
    ## 272        2      Gateway Council  313BH072703      JEFF DAVIS 09/06/2016
    ## 273        2      Gateway Council  313MR022004      JEFF DAVIS 09/06/2016
    ## 274        2      Gateway Council  313IL080503      JEFF DAVIS 09/06/2016
    ## 275        0      Gateway Council  313JW081004      JEFF DAVIS 09/06/2016
    ## 276        3      Gateway Council  313PB032604      JEFF DAVIS 09/06/2016
    ## 277        3      Gateway Council  313SB112203      JEFF DAVIS 09/06/2016
    ## 278        2      Gateway Council  313MB080504      JEFF DAVIS 09/06/2016
    ## 279        3      Gateway Council  313SB082404      JEFF DAVIS 09/06/2016
    ## 280        2      Gateway Council  313JB040304      JEFF DAVIS 09/06/2016
    ## 281        2      Gateway Council  313AC110203      JEFF DAVIS 09/06/2016
    ## 282        4      Gateway Council  313MC113003      JEFF DAVIS 09/06/2016
    ## 283        4      Gateway Council  313JC022004      JEFF DAVIS 09/06/2016
    ## 284        2      Gateway Council  313KF050404      JEFF DAVIS 09/06/2016
    ## 285        1      Gateway Council  313JJ110103      JEFF DAVIS 09/06/2016
    ## 286        1      Gateway Council  313JM022304      JEFF DAVIS 09/06/2016
    ## 287        1      Gateway Council  313TL030304      JEFF DAVIS 09/06/2016
    ## 288        1      Gateway Council  313PM041804      JEFF DAVIS 09/06/2016
    ## 289        2      Gateway Council  313RM032403      JEFF DAVIS 09/06/2016
    ## 290        2      Gateway Council  313HS090603      JEFF DAVIS 09/06/2017
    ## 291        3      Gateway Council  313ES120603      JEFF DAVIS 09/06/2016
    ## 292        2      Gateway Council  313GS111903      JEFF DAVIS 09/06/2016
    ## 293        2      Gateway Council  313KT042704      JEFF DAVIS 09/06/2016
    ## 294        2      Gateway Council  313QT082604      JEFF DAVIS 09/06/2016
    ## 295        2      Gateway Council  313LW060204      JEFF DAVIS 09/06/2016
    ## 296        1      Gateway Council  313KB121203       STILLWELL 09/06/2016
    ## 297        2      Gateway Council  313AB021104       STILLWELL 09/06/2016
    ## 298        2      Gateway Council  313DH102103       STILLWELL 09/06/2016
    ## 299        1      Gateway Council  313RJ070404       STILLWELL 09/06/2016
    ## 300        1      Gateway Council  313CL071703       STILLWELL 09/06/2016
    ## 301        1      Gateway Council  313GL041504       STILLWELL 09/06/2016
    ## 302        3      Gateway Council  313RM061404       STILLWELL 09/06/2016
    ## 303        2      Gateway Council  313AM041503       STILLWELL 09/06/2016
    ## 304        2      Gateway Council  313AN050505       STILLWELL 09/06/2016
    ## 305        2      Gateway Council  313JR042804       STILLWELL 09/06/2016
    ## 306        1      Gateway Council  313SS010203       STILLWELL 09/06/2016
    ## 307        3      Gateway Council  313BW033004       STILLWELL 09/06/2016
    ## 308        2      Gateway Council  313JC112403      JEB STUART 09/06/2016
    ## 309        3      Gateway Council  313AO122203      JEB STUART 09/06/2016
    ## 310        2      Gateway Council  313KR112103      JEB STUART 09/06/2016
    ## 311        2      Gateway Council  313ET062404      JEB STUART 09/06/2016
    ## 312        2      Gateway Council  313AW030804      JEB STUART 09/06/2016
    ## 313        2      Gateway Council  313JW111402      JEB STUART 09/06/2016
    ## 314        1      Gateway Council  313TH011603      JEB STUART 09/06/2016
    ## 315        1      Gateway Council  313JU052004      JEB STUART 09/06/2016
    ## 316        1      Gateway Council  313BB060903      JEB STUART 09/06/2016
    ## 317        2      Gateway Council  313KH120302      JEB STUART 09/06/2016
    ## 318        3      Gateway Council  313DD031903      JEB STUART 09/06/2016
    ## 319        2      Gateway Council  313RG012904      JEB STUART 09/06/2016
    ## 320        1      Gateway Council  313SS052202      JEB STUART 09/06/2016
    ## 321        2      Gateway Council  313TW112603      JEB STUART 09/06/2016
    ## 322        2      Gateway Council  313HW021803      JEB STUART 09/06/2016
    ## 323        1      Gateway Council  313PW100903      JEB STUART 09/06/2016
    ## 324        3 West Central Council  320TG100703    Young Middle 10/29/2016
    ## 325        3 West Central Council  320MJ093003    Young Middle 10/21/2016
    ## 326        3 West Central Council  320LC111102    Young Middle 10/21/2016
    ## 327        3 West Central Council  320JJ061804    Young Middle 10/21/2016
    ## 328        3 West Central Council  320EH082104    Young Middle 10/21/2016
    ## 329        3 West Central Council  320EF111204    Young Middle 10/21/2016
    ## 330        4 West Central Council  320CC011404    Young Middle 10/21/2016
    ## 331        2 West Central Council  320DB041404    Young middle 10/24/2016
    ## 332        4 West Central Council  320ZG030304    Young Middle 10/21/2016
    ## 333        4 West Central Council  320FB032204   Blake Academy 08/01/2016
    ## 334        3 West Central Council  320CR022204   Blake Academy 08/01/2016
    ## 335        4 West Central Council  320MC121603 KATHLEEN MIDDLE 11/01/2016
    ## 336        3 West Central Council  320AG062003 KATHLEEN MIDDLE 11/01/2016
    ## 337        4 West Central Council  320SH112304 KATHLEEN MIDDLE 11/01/2016
    ## 338        4 West Central Council  320SN033104 KATHLEEN MIDDLE 11/01/2016
    ## 339        3 West Central Council  320JR112403 KATHLEEN MIDDLE 11/01/2016
    ## 340        4 West Central Council  320SY060804 KATHLEEN MIDDLE 11/01/2016
    ## 341        2    Southeast Council  321TN073104              LL 10/20/2016
    ## 342        2    Southeast Council  321BP061502              LL 10/20/2016
    ## 343        3 West Central Council  320SF041404    Young Middle 10/21/2016
    ## 344        3 West Central Council  320PB062204    Young Middle 10/29/2016
    ## 345        4 West Central Council  320MD082804    Young Middle 10/21/2016
    ## 346        3 West Central Council  320DE122803    Young Middle 10/21/2016
    ## 347        4 West Central Council  320CD010605    Young Middle 10/21/2016
    ## 348        4 West Central Council  320AH061004    Young Middle 10/21/2016
    ## 349        3 West Central Council  320AD123003    Young Middle 10/21/2016
    ## 350        3 West Central Council  320AC012304    Young Middle 10/21/2016
    ## 351        3 West Central Council  320AH063004    Young Middle 10/21/2016
    ## 352        2    Panhandle Council  322CM080803           Jinks 02/08/2017
    ## 353        1    Panhandle Council  322MC020204           Jinks 02/08/2017
    ## 354        2 West Central Council  320LB052402 KATHLEEN MIDDLE 11/01/2016
    ## 355        4 West Central Council  3202J080502 KATHLEEN MIDDLE 11/01/2016
    ## 356        0 West Central Council  320YL070603 KATHLEEN MIDDLE 11/01/2016
    ## 357        3 West Central Council  320RM110102 KATHLEEN MIDDLE 11/01/2016
    ## 358        3 West Central Council  320MM111601 KATHLEEN MIDDLE 11/01/2016
    ## 359        3 West Central Council  320TM070503 KATHLEEN MIDDLE 11/01/2016
    ## 360        2 West Central Council  320SV121102 KATHLEEN MIDDLE 11/01/2016
    ## 361        1    Panhandle Council  322LS071802           Jinks 02/08/2017
    ## 362        2    Panhandle Council  322IM020401           Jinks 02/08/2017
    ## 363        3    Panhandle Council  322AT111104           Mowat 10/06/2016
    ## 364        3    Southeast Council  321JD101502              LL 10/20/2016
    ## 365        4    Southeast Council  321KJ012703              LL 10/20/2016
    ## 366        4    Southeast Council  321FJ011803              LL 10/20/2016
    ## 367        3    Southeast Council  321JV021803              LL 10/20/2016
    ## 368        2    Southeast Council  321JP061803              LL 10/20/2016
    ## 369        4    Southeast Council  321PP043003              LL 10/20/2016
    ## 370        2    Southeast Council  321LU072702              LL 10/20/2016
    ## 371        2 West Central Council  320SA080203    Young Middle 10/21/2016
    ## 372        3 West Central Council  320SB122902    Young Middle 10/21/2016
    ## 373        2      Gateway Council  313KA072203      THE BRIDGE 09/06/2016
    ## 374        2      Gateway Council  313JB110302      THE BRIDGE 09/06/2016
    ## 375        2      Gateway Council  313JB122202      THE BRIDGE 09/06/2016
    ## 376        2      Gateway Council  313TB110703      THE BRIDGE 09/06/2016
    ## 377        3      Gateway Council  313JC121003      THE BRIDGE 09/06/2016
    ## 378        2      Gateway Council  313BC091702      THE BRIDGE 09/06/2016
    ## 379        1      Gateway Council  313AC082303      THE BRIDGE 09/06/2016
    ## 380        2      Gateway Council  313AE110601      THE BRIDGE 09/06/2016
    ## 381        3      Gateway Council  313AF040403      THE BRIDGE 09/06/2016
    ## 382        2      Gateway Council  313MH042903      THE BRIDGE 09/06/2016
    ## 383        2      Gateway Council  313TH070301      THE BRIDGE 09/06/2016
    ## 384        2      Gateway Council  313AJ092102      THE BRIDGE 09/06/2016
    ## 385        2      Gateway Council  313AK041202      THE BRIDGE 09/06/2016
    ## 386        1      Gateway Council  313DL121201      THE BRIDGE 09/06/2016
    ## 387        3      Gateway Council  313JM040603      THE BRIDGE 09/06/2016
    ## 388        2      Gateway Council  313PM042502      THE BRIDGE 09/06/2016
    ## 389        2      Gateway Council  313PM082503      THE BRIDGE 09/06/2016
    ## 390        2      Gateway Council  313BM090401      THE BRIDGE 09/06/2016
    ## 391        3      Gateway Council  313JP070503      THE BRIDGE 09/06/2016
    ## 392        2      Gateway Council  313TP102402      THE BRIDGE 09/06/2016
    ## 393        3      Gateway Council  313TR030302      THE BRIDGE 09/06/2016
    ## 394        3      Gateway Council  313JR021003      THE BRIDGE 09/06/2016
    ## 395        2      Gateway Council  313SS111303      THE BRIDGE 09/06/2016
    ## 396        3      Gateway Council  313TS010303      THE BRIDGE 09/06/2016
    ## 397        3      Gateway Council  313JT062302      THE BRIDGE 09/06/2016
    ## 398        2      Gateway Council  313TT120602      THE BRIDGE 09/06/2016
    ## 399        2      Gateway Council  313JT111801      THE BRIDGE 09/06/2016
    ## 400        3      Gateway Council  313KT082103      THE BRIDGE 09/06/2016
    ## 401        2      Gateway Council  313AW110303      THE BRIDGE 09/06/2016
    ## 402        1      Gateway Council  313CW122702      THE BRIDGE 09/06/2016
    ## 403        2      Gateway Council  313SW091704      THE BRIDGE 09/06/2016
    ## 404        2      Gateway Council  313DC061403       LAKESHORE 09/06/2016
    ## 405        3      Gateway Council  313AT050703       LAKESHORE 09/06/2016
    ## 406        3      Gateway Council  313RC022402 MATTHEW GILBERT 09/06/2016
    ## 407        4      Gateway Council  313LD062403 MATTHEW GILBERT 09/06/2016
    ## 408        2      Gateway Council  313RA101702 MATTHEW GILBERT 09/06/2016
    ## 409        4      Gateway Council  313MB022803 MATTHEW GILBERT 09/06/2016
    ## 410        3      Gateway Council  313SR030803 MATTHEW GILBERT 09/06/2016
    ## 411        3      Gateway Council  313DB040203      JEFF DAIVS 09/06/2016
    ## 412        3      Gateway Council  313PS082702      JEFF DAVIS 09/06/2016
    ## 413        3      Gateway Council  313VM051001      JEFF DAVIS 09/06/2016
    ## 414        1      Gateway Council  313LB031003      JEFF DAVIS 09/06/2016
    ## 415        2      Gateway Council  313SL072203      JEFF DAVIS 09/06/2016
    ## 416        0      Gateway Council  313MS022702      JEFF DAVIS 09/06/2016
    ## 417        2      Gateway Council  313KD031602      JEFF DAVIS 09/06/2016
    ## 418        2      Gateway Council  313DF021003      JEFF DAVIS 09/06/2016
    ## 419        2      Gateway Council  313RG060502      JEFF DAVIS 09/06/2016
    ## 420        2      Gateway Council  313KH061102      JEFF DAVIS 09/06/2016
    ## 421        2      Gateway Council  313JN101801      JEFF DAVIS 09/06/2016
    ## 422        4      Gateway Council  313DS083103      JEFF DAVIS 09/06/2016
    ## 423        3      Gateway Council  313MS091502      JEFF DAVIS 09/06/2016
    ## 424        3      Gateway Council  313JT051502      JEFF DAVIS 09/06/2016
    ## 425        2      Gateway Council  313KW061403      JEFF DAVIS 09/06/2016
    ## 426        3      Gateway Council  313MM120502       STILLWELL 09/06/2016
    ## 427        3      Gateway Council  313TB091302       STILLWELL 09/06/2016
    ## 428        3      Gateway Council  313ZC040702       STILLWELL 09/06/2016
    ## 429        3      Gateway Council  313AC082403       STILLWELL 09/06/2016
    ## 430        2      Gateway Council  313MD030503       STILLWELL 09/06/2016
    ## 431        2      Gateway Council  313HF112202       STILLWELL 09/06/2016
    ## 432        2      Gateway Council  313AH092102       STILLWELL 09/06/2016
    ## 433        2      Gateway Council  313AK021702       STILLWELL 09/26/2016
    ## 434        1      Gateway Council  313TS120902       STILLWELL 09/06/2016
    ## 435        1      Gateway Council  313CT061203       STILLWELL 09/06/2016
    ## 436        3      Gateway Council  313BW122602       STILLWELL 09/06/2016
    ## 437        2      Gateway Council  313TL052902      JEB STUART 09/06/2016
    ## 438        2      Gateway Council  313IS050500      JEB STUART 09/06/2016
    ## 439        1      Gateway Council  313TT080603      JEB STUART 09/06/2016
    ## 440        1      Gateway Council  313ME110803      JEB STUART 09/06/2016
    ## 441        2      Gateway Council  313VP021302      JEB STUART 09/06/2016
    ## 442        2      Gateway Council  313AN031402      JEB STUART 09/06/2016
    ## 443        2      Gateway Council  313KB052502      JEB STUART 09/06/2016
    ## 444        2      Gateway Council  313KB070103      JEB STUART 09/06/2016
    ## 445        2      Gateway Council  313TD082503      JEB STUART 09/06/2016
    ## 446        1      Gateway Council  313AG030404      JEB STUART 09/06/2016
    ## 447        3      Gateway Council  313DH122500      JEB STUART 09/06/2016
    ## 448        2      Gateway Council  313AJ041002      JEB STUART 09/06/2016
    ## 449        3      Gateway Council  313KJ060502      JEB STUART 09/06/2016
    ## 450        2      Gateway Council  313NL121902      JEB STUART 09/06/2016
    ## 451        2      Gateway Council  313RR053001      JEB STUART 09/06/2016
    ## 452        3      Gateway Council  313AS022503      JEB STUART 09/06/2016
    ## 453        3      Gateway Council  313VZ100902      JEB STUART 09/06/2016
    ## 454        2    Panhandle Council  322HE123102           Jinks 02/15/2017
    ## 455        4 West Central Council  320AB061103   Blake Academy 08/01/2016
    ## 456        4 West Central Council  320EF042903   Blake Academy 08/01/2016
    ## 457        2 West Central Council  320CM120402   Blake Academy 08/01/2016
    ## 458        3 West Central Council  320AM072903   Blake Academy 08/01/2016
    ## 459        1 West Central Council  320LP101802   Blake Academy 08/01/2016
    ## 460        3 West Central Council  320AT101602   Blake Academy 08/01/2016
    ## 461        3 West Central Council  320NR060503   Blake Academy 08/01/2016
    ## 462        4 West Central Council  320RB082103 KATHLEEN MIDDLE 11/01/2016
    ## 463        4 West Central Council  320CC061503 KATHLEEN MIDDLE 11/01/2016
    ## 464        4 West Central Council  320AM041503 KATHLEEN MIDDLE 11/01/2016
    ## 465        3 West Central Council  320MG041503    Young Middle 10/29/2016
    ## 466        3 West Central Council  320SB020803    Young Middle 10/21/2016
    ## 467        3 West Central Council  320SD102802    Young Middle 10/21/2016
    ## 468        4 West Central Council  320SD031803    Young Middle 10/21/2016
    ## 469        3 West Central Council  320RG071003    Young Middle 10/29/2016
    ## 470        3 West Central Council  320TJ071403    Young Middle 10/21/2016
    ## 471        4 West Central Council  320TH032403    Young Middle 10/21/2016
    ## 472        3 West Central Council  320JG062702    young Middle 10/21/2016
    ## 473        3 West Central Council  320JJ120102    Young Middle 10/21/2016
    ## 474        3 West Central Council  320GC121002    Young Middle 10/21/2016
    ## 475        4 West Central Council  320EC112202    Young Middle 10/21/2016
    ## 476        4 West Central Council  320AG022403    Young Middle 10/21/2016
    ## 477        4 West Central Council  320MG030803    Young Middle 10/21/2016
    ## 478        4 West Central Council  320BC091802   Blake Academy 08/01/2016
    ## 479        4 West Central Council  320DM041603   Blake Academy 08/01/2016
    ## 480        4 West Central Council  320IR061103   Blake Academy 08/01/2016
    ## 481        3 West Central Council  320IW012403   Blake Academy 08/01/2016
    ## 482        4 West Central Council  320MW120302   Blake Academy 08/01/2016
    ## 483        4    Panhandle Council  322CJ222204           Jinks 02/08/2017
    ## 484        2    Panhandle Council  322AA050505   Merritt Brown 10/01/2016
    ## 485        4    Panhandle Council  322HS040405  Merrittt Brown 10/01/2016
    ## 486        3    Southeast Council  321SD072204              LL 10/20/2016
    ## 487        3    Southeast Council  321BT100203              LL 10/20/2016
    ## 488        1 West Central Council  320LB062204    Young Middle 10/21/2016
    ## 489        4 West Central Council  320BR072103   Blake Academy 08/01/2016
    ## 490        4 West Central Council  320NG052903 KATHLEEN MIDDLE 11/01/2016
    ## 491        3     Tropical Council  321GN100704              LL 10/20/2016
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
    ## 96        M/J LANG ARTS 1     A        4
    ## 97        M/J LANG ARTS 1     C        2
    ## 98        M/J LANG ARTS 1     A        4
    ## 99        M/J LANG ARTS 1     C        2
    ## 100       M/J LANG ARTS 1     B        3
    ## 101       M/J LANG ARTS 1     D        1
    ## 102       M/J LANG ARTS 1     D        1
    ## 103       M/J LANG ARTS 1     B        3
    ## 104       M/J LANG ARTS 1     C        2
    ## 105       M/J LANG ARTS 1     C        2
    ## 106       M/J LANG ARTS 1     C        2
    ## 107       M/J LANG ARTS 1     B        3
    ## 108       M/J LANG ARTS 1     A        4
    ## 109       M/J LANG ARTS 1     C        2
    ## 110       M/J LANG ARTS 1     B        3
    ## 111       M/J LANG ARTS 1     B        3
    ## 112       M/J LANG ARTS 1     C        2
    ## 113       M/J LANG ARTS 1     C        2
    ## 114       M/J LANG ARTS 1     C        2
    ## 115       M/J LANG ARTS 1     C        2
    ## 116       M/J LANG ARTS 1     B        3
    ## 117       M/J LANG ARTS 1     C        2
    ## 118       M/J LANG ARTS 1     B        3
    ## 119       M/J LANG ARTS 1     C        2
    ## 120       M/J LANG ARTS 1     A        4
    ## 121       M/J LANG ARTS 1     C        2
    ## 122       M/J LANG ARTS 1     C        2
    ## 123       M/J LANG ARTS 1     D        1
    ## 124       M/J LANG ARTS 1     D        1
    ## 125       M/J LANG ARTS 1     C        2
    ## 126       M/J LANG ARTS 1     A        4
    ## 127       M/J LANG ARTS 1     C        2
    ## 128       M/J LANG ARTS 1     C        2
    ## 129       M/J LANG ARTS 1     C        2
    ## 130       M/J LANG ARTS 1     C        2
    ## 131       M/J LANG ARTS 1     C        2
    ## 132       M/J LANG ARTS 1     D        1
    ## 133       M/J LANG ARTS 1     D        1
    ## 134       M/J LANG ARTS 1     B        3
    ## 135       M/J LANG ARTS 1     A        4
    ## 136       M/J LANG ARTS 1     C        2
    ## 137       M/J LANG ARTS 1     B        3
    ## 138       M/J LANG ARTS 1     B        3
    ## 139       M/J LANG ARTS 1     B        3
    ## 140       M/J LANG ARTS 1     B        3
    ## 141       M/J LANG ARTS 1     B        3
    ## 142       M/J LANG ARTS 1     A        4
    ## 143       M/J LANG ARTS 1     A        4
    ## 144       M/J LANG ARTS 1     C        2
    ## 145       M/J LANG ARTS 1     B        3
    ## 146       M/J LANG ARTS 1     B        3
    ## 147       M/J LANG ARTS 1     A        4
    ## 148       M/J LANG ARTS 1     A        4
    ## 149       M/J LANG ARTS 1     A        4
    ## 150       M/J LANG ARTS 1     C        2
    ## 151       M/J LANG ARTS 1     B        3
    ## 152       M/J LANG ARTS 1     C        2
    ## 153   M/J LANG ARTS 1 ADV     A        4
    ## 154   M/J LANG ARTS 1 ADV     A        4
    ## 155   M/J LANG ARTS 1 ADV     A        4
    ## 156   M/J LANG ARTS 1 ADV     A        4
    ## 157   M/J LANG ARTS 1 ADV     A        4
    ## 158   M/J LANG ARTS 1 ADV     B        3
    ## 159   M/J LANG ARTS 1 ADV     A        4
    ## 160   M/J LANG ARTS 1 ADV     A        4
    ## 161   M/J LANG ARTS 1 ADV     C        2
    ## 162   M/J LANG ARTS 1 ADV     C        2
    ## 163   M/J LANG ARTS 1 ADV     A        4
    ## 164   M/J LANG ARTS 1 ADV     A        4
    ## 165   M/J LANG ARTS 1 ADV     B        3
    ## 166   M/J LANG ARTS 1 ADV     C        2
    ## 167   M/J LANG ARTS 1 ADV     D        1
    ## 168   M/J LANG ARTS 1 ADV     B        3
    ## 169   M/J LANG ARTS 1 ADV     C        2
    ## 170   M/J LANG ARTS 1 ADV     B        3
    ## 171   M/J LANG ARTS 1 ADV     A        4
    ## 172   M/J LANG ARTS 1 ADV     C        2
    ## 173   M/J LANG ARTS 1 ADV     B        3
    ## 174   M/J LANG ARTS 1 ADV     B        3
    ## 175   M/J LANG ARTS 1 ADV     A        4
    ## 176   M/J LANG ARTS 1 ADV     C        2
    ## 177   M/J LANG ARTS 1 ADV     C        2
    ## 178   M/J LANG ARTS 1 ADV     A        4
    ## 179   M/J LANG ARTS 1 ADV     A        4
    ## 180   M/J LANG ARTS 1 ADV     A        4
    ## 181   M/J LANG ARTS 1 ADV     B        3
    ## 182   M/J LANG ARTS 1 ADV     A        4
    ## 183   M/J LANG ARTS 1 ADV     A        4
    ## 184   M/J LANG ARTS 1 ADV     A        4
    ## 185   M/J LANG ARTS 1 ADV     B        3
    ## 186       M/J LANG ARTS 2     C        2
    ## 187       M/J LANG ARTS 2     F        0
    ## 188       M/J LANG ARTS 2     B        3
    ## 189       M/J LANG ARTS 2     C        2
    ## 190       M/J LANG ARTS 2     B        3
    ## 191       M/J LANG ARTS 2     B        3
    ## 192       M/J LANG ARTS 2     C        2
    ## 193       M/J LANG ARTS 2     C        2
    ## 194       M/J LANG ARTS 2     D        1
    ## 195       M/J LANG ARTS 2     C        2
    ## 196       M/J LANG ARTS 2     D        1
    ## 197       M/J LANG ARTS 2     F        0
    ## 198       M/J LANG ARTS 2     C        2
    ## 199       M/J LANG ARTS 2     D        1
    ## 200       M/J LANG ARTS 2     C        2
    ## 201       M/J LANG ARTS 2     C        2
    ## 202       M/J LANG ARTS 2     B        3
    ## 203       M/J LANG ARTS 2     B        3
    ## 204       M/J LANG ARTS 2     B        3
    ## 205       M/J LANG ARTS 2     B        3
    ## 206       M/J LANG ARTS 2     B        3
    ## 207       M/J LANG ARTS 2     D        1
    ## 208       M/J LANG ARTS 2     D        1
    ## 209       M/J LANG ARTS 2     A        4
    ## 210       M/J LANG ARTS 2     C        2
    ## 211       M/J LANG ARTS 2     B        3
    ## 212       M/J LANG ARTS 2     C        2
    ## 213       M/J LANG ARTS 2     D        1
    ## 214       M/J LANG ARTS 2     A        4
    ## 215       M/J LANG ARTS 2     C        2
    ## 216       M/J LANG ARTS 2     B        3
    ## 217       M/J LANG ARTS 2     C        2
    ## 218       M/J LANG ARTS 2     B        3
    ## 219       M/J LANG ARTS 2     A        4
    ## 220       M/J LANG ARTS 2     B        3
    ## 221       M/J LANG ARTS 2     C        2
    ## 222       M/J LANG ARTS 2     C        2
    ## 223       M/J LANG ARTS 2     C        2
    ## 224       M/J LANG ARTS 2     B        3
    ## 225       M/J LANG ARTS 2     B        3
    ## 226       M/J LANG ARTS 2     C        2
    ## 227       M/J LANG ARTS 2     C        2
    ## 228       M/J LANG ARTS 2     B        3
    ## 229       M/J LANG ARTS 2     B        3
    ## 230       M/J LANG ARTS 2     B        3
    ## 231       M/J LANG ARTS 2     B        3
    ## 232       M/J LANG ARTS 2     C        2
    ## 233       M/J LANG ARTS 2     B        3
    ## 234       M/J LANG ARTS 2     D        1
    ## 235       M/J LANG ARTS 2     D        1
    ## 236       M/J LANG ARTS 2     B        3
    ## 237       M/J LANG ARTS 2     C        2
    ## 238       M/J LANG ARTS 2     C        2
    ## 239       M/J LANG ARTS 2     C        2
    ## 240       M/J LANG ARTS 2     D        1
    ## 241       M/J LANG ARTS 2     D        1
    ## 242       M/J LANG ARTS 2     F        0
    ## 243       M/J LANG ARTS 2     D        1
    ## 244       M/J LANG ARTS 2     D        1
    ## 245       M/J LANG ARTS 2     C        2
    ## 246       M/J LANG ARTS 2     D        1
    ## 247       M/J LANG ARTS 2     B        3
    ## 248       M/J LANG ARTS 2     D        1
    ## 249       M/J LANG ARTS 2     C        2
    ## 250       M/J LANG ARTS 2     D        1
    ## 251       M/J LANG ARTS 2     B        3
    ## 252       M/J LANG ARTS 2     B        3
    ## 253       M/J LANG ARTS 2     C        2
    ## 254       M/J LANG ARTS 2     C        2
    ## 255       M/J LANG ARTS 2     C        2
    ## 256       M/J LANG ARTS 2     C        2
    ## 257       M/J LANG ARTS 2     B        3
    ## 258       M/J LANG ARTS 2     C        2
    ## 259       M/J LANG ARTS 2     C        2
    ## 260       M/J LANG ARTS 2     B        3
    ## 261       M/J LANG ARTS 2     C        2
    ## 262       M/J LANG ARTS 2     C        2
    ## 263       M/J LANG ARTS 2     C        2
    ## 264       M/J LANG ARTS 2     B        3
    ## 265       M/J LANG ARTS 2     C        2
    ## 266       M/J LANG ARTS 2     C        2
    ## 267       M/J LANG ARTS 2     B        3
    ## 268       M/J LANG ARTS 2     B        3
    ## 269       M/J LANG ARTS 2     C        2
    ## 270       M/J LANG ARTS 2     A        4
    ## 271       M/J LANG ARTS 2     C        2
    ## 272       M/J LANG ARTS 2     C        2
    ## 273       M/J LANG ARTS 2     C        2
    ## 274       M/J LANG ARTS 2     C        2
    ## 275       M/J LANG ARTS 2     F        0
    ## 276       M/J LANG ARTS 2     B        3
    ## 277       M/J LANG ARTS 2     B        3
    ## 278       M/J LANG ARTS 2     C        2
    ## 279       M/J LANG ARTS 2     B        3
    ## 280       M/J LANG ARTS 2     C        2
    ## 281       M/J LANG ARTS 2     C        2
    ## 282       M/J LANG ARTS 2     A        4
    ## 283       M/J LANG ARTS 2     A        4
    ## 284       M/J LANG ARTS 2     C        2
    ## 285       M/J LANG ARTS 2     D        1
    ## 286       M/J LANG ARTS 2     D        1
    ## 287       M/J LANG ARTS 2     D        1
    ## 288       M/J LANG ARTS 2     D        1
    ## 289       M/J LANG ARTS 2     C        2
    ## 290       M/J LANG ARTS 2     C        2
    ## 291       M/J LANG ARTS 2     B        3
    ## 292       M/J LANG ARTS 2     C        2
    ## 293       M/J LANG ARTS 2     C        2
    ## 294       M/J LANG ARTS 2     C        2
    ## 295       M/J LANG ARTS 2     C        2
    ## 296       M/J LANG ARTS 2     D        1
    ## 297       M/J LANG ARTS 2     C        2
    ## 298       M/J LANG ARTS 2     C        2
    ## 299       M/J LANG ARTS 2     D        1
    ## 300       M/J LANG ARTS 2     D        1
    ## 301       M/J LANG ARTS 2     D        1
    ## 302       M/J LANG ARTS 2     B        3
    ## 303       M/J LANG ARTS 2     C        2
    ## 304       M/J LANG ARTS 2     C        2
    ## 305       M/J LANG ARTS 2     C        2
    ## 306       M/J LANG ARTS 2     D        1
    ## 307       M/J LANG ARTS 2     B        3
    ## 308       M/J LANG ARTS 2     C        2
    ## 309       M/J LANG ARTS 2     B        3
    ## 310       M/J LANG ARTS 2     C        2
    ## 311       M/J LANG ARTS 2     C        2
    ## 312       M/J LANG ARTS 2     C        2
    ## 313       M/J LANG ARTS 2     C        2
    ## 314       M/J LANG ARTS 2     D        1
    ## 315       M/J LANG ARTS 2     D        1
    ## 316       M/J LANG ARTS 2     D        1
    ## 317       M/J LANG ARTS 2     C        2
    ## 318       M/J LANG ARTS 2     B        3
    ## 319       M/J LANG ARTS 2     C        2
    ## 320       M/J LANG ARTS 2     D        1
    ## 321       M/J LANG ARTS 2     C        2
    ## 322       M/J LANG ARTS 2     C        2
    ## 323       M/J LANG ARTS 2     D        1
    ## 324       M/J LANG ARTS 2     B        3
    ## 325       M/J LANG ARTS 2     B        3
    ## 326       M/J LANG ARTS 2     B        3
    ## 327       M/J LANG ARTS 2     B        3
    ## 328       M/J LANG ARTS 2     B        3
    ## 329       M/J LANG ARTS 2     B        3
    ## 330       M/J LANG ARTS 2     A        4
    ## 331       M/J LANG ARTS 2     C        2
    ## 332       M/J LANG ARTS 2     A        4
    ## 333       M/J LANG ARTS 2     A        4
    ## 334       M/J LANG ARTS 2     B        3
    ## 335   M/J LANG ARTS 2 ADV     A        4
    ## 336   M/J LANG ARTS 2 ADV     B        3
    ## 337   M/J LANG ARTS 2 ADV     A        4
    ## 338   M/J LANG ARTS 2 ADV     A        4
    ## 339   M/J LANG ARTS 2 ADV     B        3
    ## 340   M/J LANG ARTS 2 ADV     A        4
    ## 341   M/J LANG ARTS 2 ADV     C        2
    ## 342   M/J LANG ARTS 2 ADV     C        2
    ## 343   M/J LANG ARTS 2 ADV     B        3
    ## 344   M/J LANG ARTS 2 ADV     B        3
    ## 345   M/J LANG ARTS 2 ADV     A        4
    ## 346   M/J LANG ARTS 2 ADV     B        3
    ## 347   M/J LANG ARTS 2 ADV     A        4
    ## 348   M/J LANG ARTS 2 ADV     A        4
    ## 349   M/J LANG ARTS 2 ADV     B        3
    ## 350   M/J LANG ARTS 2 ADV     B        3
    ## 351   M/J LANG ARTS 2 ADV     B        3
    ## 352       M/J LANG ARTS 3     C        2
    ## 353       M/J LANG ARTS 3     D        1
    ## 354       M/J LANG ARTS 3     C        2
    ## 355       M/J LANG ARTS 3     A        4
    ## 356       M/J LANG ARTS 3     F        0
    ## 357       M/J LANG ARTS 3     B        3
    ## 358       M/J LANG ARTS 3     B        3
    ## 359       M/J LANG ARTS 3     B        3
    ## 360       M/J LANG ARTS 3     C        2
    ## 361       M/J LANG ARTS 3     D        1
    ## 362       M/J LANG ARTS 3     C        2
    ## 363       M/J LANG ARTS 3     B        3
    ## 364       M/J LANG ARTS 3     B        3
    ## 365       M/J LANG ARTS 3     A        4
    ## 366       M/J LANG ARTS 3     A        4
    ## 367       M/J LANG ARTS 3     B        3
    ## 368       M/J LANG ARTS 3     C        2
    ## 369       M/J LANG ARTS 3     A        4
    ## 370       M/J LANG ARTS 3     C        2
    ## 371       M/J LANG ARTS 3     C        2
    ## 372       M/J LANG ARTS 3     B        3
    ## 373       M/J LANG ARTS 3     C        2
    ## 374       M/J LANG ARTS 3     C        2
    ## 375       M/J LANG ARTS 3     C        2
    ## 376       M/J LANG ARTS 3     C        2
    ## 377       M/J LANG ARTS 3     B        3
    ## 378       M/J LANG ARTS 3     C        2
    ## 379       M/J LANG ARTS 3     D        1
    ## 380       M/J LANG ARTS 3     C        2
    ## 381       M/J LANG ARTS 3     B        3
    ## 382       M/J LANG ARTS 3     C        2
    ## 383       M/J LANG ARTS 3     C        2
    ## 384       M/J LANG ARTS 3     C        2
    ## 385       M/J LANG ARTS 3     C        2
    ## 386       M/J LANG ARTS 3     D        1
    ## 387       M/J LANG ARTS 3     B        3
    ## 388       M/J LANG ARTS 3     C        2
    ## 389       M/J LANG ARTS 3     C        2
    ## 390       M/J LANG ARTS 3     C        2
    ## 391       M/J LANG ARTS 3     B        3
    ## 392       M/J LANG ARTS 3     C        2
    ## 393       M/J LANG ARTS 3     B        3
    ## 394       M/J LANG ARTS 3     B        3
    ## 395       M/J LANG ARTS 3     C        2
    ## 396       M/J LANG ARTS 3     B        3
    ## 397       M/J LANG ARTS 3     B        3
    ## 398       M/J LANG ARTS 3     C        2
    ## 399       M/J LANG ARTS 3     C        2
    ## 400       M/J LANG ARTS 3     B        3
    ## 401       M/J LANG ARTS 3     C        2
    ## 402       M/J LANG ARTS 3     D        1
    ## 403       M/J LANG ARTS 3     C        2
    ## 404       M/J LANG ARTS 3     C        2
    ## 405       M/J LANG ARTS 3     B        3
    ## 406       M/J LANG ARTS 3     B        3
    ## 407       M/J LANG ARTS 3     A        4
    ## 408       M/J LANG ARTS 3     C        2
    ## 409       M/J LANG ARTS 3     A        4
    ## 410       M/J LANG ARTS 3     B        3
    ## 411       M/J LANG ARTS 3     B        3
    ## 412       M/J LANG ARTS 3     B        3
    ## 413       M/J LANG ARTS 3     B        3
    ## 414       M/J LANG ARTS 3     D        1
    ## 415       M/J LANG ARTS 3     C        2
    ## 416       M/J LANG ARTS 3     F        0
    ## 417       M/J LANG ARTS 3     C        2
    ## 418       M/J LANG ARTS 3     C        2
    ## 419       M/J LANG ARTS 3     C        2
    ## 420       M/J LANG ARTS 3     C        2
    ## 421       M/J LANG ARTS 3     C        2
    ## 422       M/J LANG ARTS 3     A        4
    ## 423       M/J LANG ARTS 3     B        3
    ## 424       M/J LANG ARTS 3     B        3
    ## 425       M/J LANG ARTS 3     C        2
    ## 426       M/J LANG ARTS 3     B        3
    ## 427       M/J LANG ARTS 3     B        3
    ## 428       M/J LANG ARTS 3     B        3
    ## 429       M/J LANG ARTS 3     B        3
    ## 430       M/J LANG ARTS 3     C        2
    ## 431       M/J LANG ARTS 3     C        2
    ## 432       M/J LANG ARTS 3     C        2
    ## 433       M/J LANG ARTS 3     C        2
    ## 434       M/J LANG ARTS 3     D        1
    ## 435       M/J LANG ARTS 3     D        1
    ## 436       M/J LANG ARTS 3     B        3
    ## 437       M/J LANG ARTS 3     C        2
    ## 438       M/J LANG ARTS 3     C        2
    ## 439       M/J LANG ARTS 3     D        1
    ## 440       M/J LANG ARTS 3     D        1
    ## 441       M/J LANG ARTS 3     C        2
    ## 442       M/J LANG ARTS 3     C        2
    ## 443       M/J LANG ARTS 3     C        2
    ## 444       M/J LANG ARTS 3     C        2
    ## 445       M/J LANG ARTS 3     C        2
    ## 446       M/J LANG ARTS 3     D        1
    ## 447       M/J LANG ARTS 3     B        3
    ## 448       M/J LANG ARTS 3     C        2
    ## 449       M/J LANG ARTS 3     B        3
    ## 450       M/J LANG ARTS 3     C        2
    ## 451       M/J LANG ARTS 3     C        2
    ## 452       M/J LANG ARTS 3     B        3
    ## 453       M/J LANG ARTS 3     B        3
    ## 454       M/J LANG ARTS 3     C        2
    ## 455       M/J LANG ARTS 3     A        4
    ## 456       M/J LANG ARTS 3     A        4
    ## 457       M/J LANG ARTS 3     C        2
    ## 458       M/J LANG ARTS 3     B        3
    ## 459       M/J LANG ARTS 3     D        1
    ## 460       M/J LANG ARTS 3     B        3
    ## 461       M/J LANG ARTS 3     B        3
    ## 462   M/J LANG ARTS 3 ADv     A        4
    ## 463   M/J LANG ARTS 3 ADv     A        4
    ## 464   M/J LANG ARTS 3 ADv     A        4
    ## 465   M/J LANG ARTS 3 ADv     B        3
    ## 466   M/J LANG ARTS 3 ADv     B        3
    ## 467   M/J LANG ARTS 3 ADv     B        3
    ## 468   M/J LANG ARTS 3 ADv     A        4
    ## 469   M/J LANG ARTS 3 ADv     B        3
    ## 470   M/J LANG ARTS 3 ADv     B        3
    ## 471   M/J LANG ARTS 3 ADv     A        4
    ## 472   M/J LANG ARTS 3 ADv     B        3
    ## 473   M/J LANG ARTS 3 ADv     B        3
    ## 474   M/J LANG ARTS 3 ADv     B        3
    ## 475   M/J LANG ARTS 3 ADv     A        4
    ## 476   M/J LANG ARTS 3 ADv     A        4
    ## 477   M/J LANG ARTS 3 ADv     A        4
    ## 478   M/J LANG ARTS 3 ADv     A        4
    ## 479   M/J LANG ARTS 3 ADv     A        4
    ## 480   M/J LANG ARTS 3 ADv     A        4
    ## 481   M/J LANG ARTS 3 ADv     B        3
    ## 482   M/J LANG ARTS 3 ADv     A        4
    ## 483  M/J ENG 3 CAMB SEC 3     A        4
    ## 484  M/J INTENS LANG ARTS     C        2
    ## 485  M/J INTENS LANG ARTS     A        4
    ## 486  M/J INTENS LANG ARTS     B        3
    ## 487  M/J INTENS LANG ARTS     B        3
    ## 488  M/J INTENS LANG ARTS     D        1
    ## 489  M/J INTENS LANG ARTS     A        4
    ## 490 M/J DE LANG ARTS ESOL     A        4
    ## 491 M/J DE LANG ARTS ESOL     D        1

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
