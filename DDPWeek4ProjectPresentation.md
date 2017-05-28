Course Project: Shiny Application and Reproducible Pitch
========================================================
author: Tai Chin Chuen
date: 28 May 2017
autosize: true

Introduction
========================================================
This course project has two parts. 
- First, a Shiny application will be created and deployed on Rstudio's servers. 
- Second, a reproducible pitch presentation is prepared to present the Shiny application.

The dataset `cars` is adopted in this project and the goal is to predict the stopping distances (ft) required by the cars given that the particular speed (mph) of cars.  

Note that the data were recorded in the 1920s with 50 observations on 2 variables.

Additional Information
========================================================
For the shiny application in ios, please visit 
https://taichinchuen.shinyapps.io/DDPWeek4Project/

For the source code in github (ui.R & server.R files), please visit
https://github.com/taichinchuen/DevelopingDataProductsWeek4Project

In the Shiny Application, the left side bar panel to select:

1. The speed (mph) of the car
2. The min and max of X and Y Values shown in graph
3. Show or hide model 1 and 2

The graph in main panel adjusts automatically to reflect the effect of car's speed on the stopping distance.

Example Code
========================================================
The data give the speed (mph) of cars and the distances (ft) taken to stop.

```r
summary(cars)
```

```
     speed           dist       
 Min.   : 4.0   Min.   :  2.00  
 1st Qu.:12.0   1st Qu.: 26.00  
 Median :15.0   Median : 36.00  
 Mean   :15.4   Mean   : 42.98  
 3rd Qu.:19.0   3rd Qu.: 56.00  
 Max.   :25.0   Max.   :120.00  
```

Example Graph
========================================================
The graph shows a strong positive relationship between the speed of cars and the distances taken to stop.
<img src="DDPWeek4ProjectPresentation-figure/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />
