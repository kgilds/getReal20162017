Attendance\_history
================
Kevin Gilds, MPA
February 18, 2017

Attendance Outcome Achievement
==============================

The number of students in the dataset are **1245** and the number of students that could be matched across two years is **128**.The percent of students with a succesful outcome is **61.69%**. A successful outcome means not missing a day of school and the student decreasing their number of absences from baseline grading period to the final grading period.

| Success |    n|  percent|
|:--------|----:|--------:|
| FALSE   |  477|   38.31%|
| TRUE    |  768|   61.69%|

| Match | Success |    n|  percent|
|:------|:--------|----:|--------:|
| No    | TRUE    |  672|   60.16%|
| Yes   | TRUE    |   96|   75.00%|

### Achievment by Council

| Council              | Year\_Id | Success |    n|  percent|
|:---------------------|:---------|:--------|----:|--------:|
| Citrus Council       | 14-15    | TRUE    |   50|   64.10%|
| Citrus Council       | 15-16    | TRUE    |   23|   65.71%|
| Gateway Council      | 14-15    | TRUE    |  104|   94.55%|
| Gateway Council      | 15-16    | TRUE    |   70|   26.22%|
| Panhandle Council    | 14-15    | TRUE    |  157|   61.57%|
| Southeast Council    | 14-15    | TRUE    |   88|   74.58%|
| Southeast Council    | 15-16    | TRUE    |   55|   55.00%|
| Tropical Council     | 14-15    | TRUE    |    6|   75.00%|
| Tropical Council     | 15-16    | TRUE    |    3|   60.00%|
| West Central Council | 14-15    | TRUE    |  134|  100.00%|
| West Central Council | 15-16    | TRUE    |   78|   57.78%|

### Decrease in Absences

### Average Decrease for students who had a chance to improve attendance

Avg\_Change
-----------

-0.1867816

| Match |  Avg\_Change|
|:------|------------:|
| No    |   -0.2228916|
| Yes   |    0.5625000|

| Year\_Id |  Avg\_Change|
|:---------|------------:|
| 14-15    |   -2.1095306|
| 15-16    |    0.9317343|

![](Figs/abs_plot-1.png)

    ## $x
    ## [1] "Pre and Post Difference"
    ## 
    ## $y
    ## [1] "Council"
    ## 
    ## $title
    ## [1] "Healthy Releationship Survey Results"
    ## 
    ## attr(,"class")
    ## [1] "labels"
