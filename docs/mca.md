

Multiple Correspondence analysis
========================================================
type: prompt
incremental: false
autosize: true

<font size=6>

- Dimensionality reduction method
- Analyses the pattern of relationships of several categorical
variables
- Generalization of PCA and a extension of correspondence analysis (CA)
- Deals with categorical variables, but continuous ones can be used as background (sublimentary) variables

</font>

Multiple Correspondence analysis
========================================================
incremental: false
autosize: true

<font size=6>

- In the analysis, you can either use the [indicator or the Burt matrix](https://en.wikipedia.org/wiki/Multiple_correspondence_analysis#As_an_extension_of_correspondences_analysis). 
- tästä jotain lisää ? yhteys CA:han ?
- ...

- And next, let's look how the MCA outputs look in R!

</font>

MCA summary
========================================================
incremental: false
autosize: true
left: 40%

<font size=5>

Output of summary contains...

- **Eigenvalues**: the variances and the percentage of variances retained by each dimension
- **Individuals**: the individuals coordinates, the contribution (ctr) and the cos2 (cosini squared, quality of representation) on the first two dimensions.

</font>

***

<font size=4>


```

Call:
MCA(X = data, graph = FALSE, method = "indicator") 


Eigenvalues
                       Dim.1   Dim.2   Dim.3   Dim.4
Variance               0.413   0.334   0.330   0.256
% of var.             30.992  25.053  24.743  19.212
Cumulative % of var.  30.992  56.045  80.788 100.000

Individuals (the 3 first)
          Dim.1    ctr   cos2    Dim.2    ctr   cos2    Dim.3    ctr
1      |  0.283  0.065  0.056 | -0.283  0.080  0.056 | -0.534  0.288
2      |  1.055  0.898  0.802 | -0.431  0.185  0.134 | -0.209  0.044
3      |  0.138  0.015  0.035 | -0.048  0.002  0.004 | -0.103  0.011
         cos2  
1       0.199 |
2       0.032 |
3       0.019 |

Categories (the 3 first)
           Dim.1     ctr    cos2  v.test     Dim.2     ctr    cos2  v.test
Label1 |   1.199  28.599   0.471  11.862 |  -0.786  15.197   0.202  -7.775
Label2 |  -0.569  16.801   0.584 -13.214 |  -0.121   0.935   0.026  -2.803
Label3 |   0.639   3.627   0.051   3.887 |   2.468  66.852   0.753  15.002
           Dim.3     ctr    cos2  v.test  
Label1 |  -0.274   1.875   0.025  -2.714 |
Label2 |  -0.092   0.553   0.015  -2.142 |
Label3 |   1.154  14.813   0.165   7.018 |

Categorical variables (eta2)
         Dim.1 Dim.2 Dim.3  
Var1   | 0.608 0.832 0.171 |
Var2   | 0.079 0.154 0.741 |
Var3   | 0.553 0.017 0.078 |
```

</font>

MCA summary(2)
========================================================
incremental: false
autosize: true
left: 40%

<font size=5>

Output of summary contains...

- **Categories**: the coordinates of the variable categories, the contribution (ctr), the cosini squared and v.test value. The v.test follows normal distribution: if the value is below/above $\pm$ 1.96, the coordinate is significantly different from zero.
- **Categorical variables**: the squared correlation between each variable and the dimensions. If the value is close to one it indicates a strong link with the variable and dimension.

</font>

***

<font size=4>


```

Call:
MCA(X = data, graph = FALSE, method = "indicator") 


Eigenvalues
                       Dim.1   Dim.2   Dim.3   Dim.4
Variance               0.413   0.334   0.330   0.256
% of var.             30.992  25.053  24.743  19.212
Cumulative % of var.  30.992  56.045  80.788 100.000

Individuals (the 3 first)
          Dim.1    ctr   cos2    Dim.2    ctr   cos2    Dim.3    ctr
1      |  0.283  0.065  0.056 | -0.283  0.080  0.056 | -0.534  0.288
2      |  1.055  0.898  0.802 | -0.431  0.185  0.134 | -0.209  0.044
3      |  0.138  0.015  0.035 | -0.048  0.002  0.004 | -0.103  0.011
         cos2  
1       0.199 |
2       0.032 |
3       0.019 |

Categories (the 3 first)
           Dim.1     ctr    cos2  v.test     Dim.2     ctr    cos2  v.test
Label1 |   1.199  28.599   0.471  11.862 |  -0.786  15.197   0.202  -7.775
Label2 |  -0.569  16.801   0.584 -13.214 |  -0.121   0.935   0.026  -2.803
Label3 |   0.639   3.627   0.051   3.887 |   2.468  66.852   0.753  15.002
           Dim.3     ctr    cos2  v.test  
Label1 |  -0.274   1.875   0.025  -2.714 |
Label2 |  -0.092   0.553   0.015  -2.142 |
Label3 |   1.154  14.813   0.165   7.018 |

Categorical variables (eta2)
         Dim.1 Dim.2 Dim.3  
Var1   | 0.608 0.832 0.171 |
Var2   | 0.079 0.154 0.741 |
Var3   | 0.553 0.017 0.078 |
```

[Read more](http://www.sthda.com/english/wiki/multiple-correspondence-analysis-essentials-interpretation-and-application-to-investigate-the-associations-between-categories-of-multiple-qualitative-variables-r-software-and-data-mining)

</font>


MCA plot(1)
========================================================
incremental: false
autosize: true
left: 65%

<font size=6>

MCA plot:
- You can plot for variables, individuals and background (sublimentary variables) separately or you can draw them in the same plot. 
- `plot.MCA()` function in R (from FactoMineR) has a lot of options for plotting
- Let's see a minimal example

See a [video](https://www.youtube.com/watch?v=reG8Y9ZgcaQ) of MCA (plotting options start at 5:36).

</font>

MCA plot(2)
========================================================
incremental: false
autosize: true
left: 65%

<font size=6>

- On the right we have MCA factor map, where are variables drawn on the first two dimensions
    - On the plot you can see correlations of the variables and the dimensions (The squared correlations of variables and dimensions are the coordinates)
    - The distance between column points gives a measure of their similarity
    - For example Label3 correlates with 2. dimension, but Level2 has little effect on either of the dimensions. Label2 and Name2 are more similar than Label2 and Level2.

</font>

***

![plot of chunk unnamed-chunk-4](mca-figure/unnamed-chunk-4-1.png)

[Read more](http://factominer.free.fr/classical-methods/multiple-correspondence-analysis.html)
