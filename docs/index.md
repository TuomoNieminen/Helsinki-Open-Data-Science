

Introduction to Open Data Science
========================================================
incremental: true
autosize: true
transition: none

University of Helsinki, spring 2017
- prof. Kimmo Vehkalahti with  
- Tuomo Nieminen and Emma Kämäräinen  

Contents
========================================================
incremental: false

- Regression and model validation  
- Clustering and classification  
- Dimensionality reduction techniques  
- Multivariate statistical modelling   
- Causal inference  





Regression and model validation
========================================================
type: sub-section

What is a statistical model?
========================================================

A statistical model 

- Embodies a set of assumptions and describes the generation of a sample from a population
- Represents the data generating process
- The uncertainty related to a sample of data is described using probability distributions

<!-- source: [wikipedia](https://en.wikipedia.org/wiki/Statistical_model) -->

Linear regression models
========================================================

Linear regression is an approach for modeling the relationship between a scalar dependent variable $y$ and one or more explanatory variables $X$.  

There are many applications for linear models such as

- Prediction or forecasting
- Quantifying the strength of the relationship between $y$ and $X$


Assumptions of linear regression models
========================================================

In linear regression, it is assumed that the relationship between $y$ and  $X$ is *linear*:

$$y = \alpha + \beta \cdot X + \epsilon$$

- The goal is to estimate the unkown parameters $\alpha$ and $\beta$
- An unobservable random variable ($\epsilon$) is assumed to add noise to the observations
- Often it is reasonable to assume $\epsilon \sim N(0, \sigma^2)$

<!-- source: [wikipedia](https://en.wikipedia.org/wiki/Linear_regression) -->


Simple regression
========================================================

In a simple case, there is only one explanatory variable $x$

$y =  \alpha + \beta \cdot x + \epsilon$

R:  
```lm(y ~ x)```  

***
![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-1.png)



Multiple regression (1)
========================================================

The model can also include more than one explanatory variable

$$y = \alpha + \beta_1 \cdot x_1 + \beta_2 \cdot x_2 + \epsilon$$

R:  
```lm(y ~ x1 + x2)```  

***
![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png)


Multiple regression (2)
========================================================

In the general case, there can be any number of explanatory variables

$$y = \alpha + \beta_1 \cdot x_1 + \beta_2 \cdot x_2 + ... + \beta_d \cdot x_d + \epsilon$$

R:  
```lm(y ~ x1 + x2 + ... + xd)```  

Polynomial terms
========================================================

It is also possible to add polynomial terms, if the effect of a variable is non-linear

$$y = \alpha + \beta_1 \cdot x + \beta_2 \cdot x^2$$

R:  
```lm(y ~ x + I(x^2))```  

***

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3-1.png)


Interaction terms
========================================================
 Finally, it is also possible to add interaction terms, if the variables can affect each other
 
 $$y = \alpha + \beta_1 \cdot x_1 + \beta_2 \cdot x_2 + \beta_3 \cdot x_1 \cdot x_2$$
 
R:  
```lm(y ~ x1 + x2 + I(x1*x2))```  

