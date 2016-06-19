---
title       : MPG Prediction
subtitle    : A shiny app
author      : B Porter
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : zenburn      # 
widgets     : [bootstrap, quiz]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction
### MPG Prediction App
* We have created a simple shiny app that predicts MPG based on the weight of a vehicle.
* We use linear regression to create the predictions

### Why use this app?
* You are helping to design new vehicles at your company and the MPG is a major factor in the design process
* You are purchasing a new vehicle and want to predict what your MPG might be

--- .class #id 

## How to use the app
* You can use the right side panel to input the weight of the car you want to predict the MPG for
* It is important that you note the units expected. The units should be in 1000's of pounds
* For example: If the car weight is 3,620 lbs you should input 3.62
* On the main panel we show you three things:
  * What you entered as input
  * The predicted MPG from the linear model
  * A plot showing the linear fit and in red a vertical line showing the input weight

--- .class #id

## How it works ##

* The app uses the mtcars data set


```r
require(datasets)
data(mtcars)
```
* It then builds a linear model fit using lm()
* Here is an example of how the prediction works

```r
modelFit <- lm(mpg ~ wt, data = mtcars)
predict(modelFit, newdata=data.frame(wt=3.0))[[1]]
```

```
## [1] 21.25171
```
* When the app is updated with a new value it is predicted using the linear fit and displayed in the shiny app

--- &radio
## Quiz

If you want to know the MPG prediction for a car weighing 4,380 lbs what would you set the input of the MPG Prediction app to?

1. 43.8
2. _4.38_
3. 438.0
4. 4380

*** .hint 
the expected units are 1000 lbs

*** .explanation 
The units are 1000 lbs so you divide 4,380 by 1,000. Making the input 4.38

