


Multiple Correspondence analysis
========================================================
type: prompt
incremental: false
autosize: true

- Dimensionality reduction method
- Analyses the pattern of relationships of several categorical
variables
- Generalization of PCA and a extension of correspondence analysis (CA)
- Deals with categorical variables, but continuous ones can be used as background (sublimentary) variables

Multiple Correspondence analysis
========================================================
incremental: false
autosize: true

Output of summary contains...

- Eigenvalues: the variances and the percentage of variances retained by each dimension
- Individuals: the individuals coordinates, the contribution and the cos2 (quality of representation) on the first two dimensions.
- Categories: the coordinates of the first 10 active variable categories, the contribution and the cos2 on the dimensions 1 and 2. This table contains also a column called v.test. The value of the v.test is generally comprised between 2 and -2. For a given variable category, if the absolute value of the v.test is superior to 2, this means that the coordinate is significantly different from 0.
- Categorical variables (eta2): the squared correlation between each variable and the dimensions

[Source](http://www.sthda.com/english/wiki/multiple-correspondence-analysis-essentials-interpretation-and-application-to-investigate-the-associations-between-categories-of-multiple-qualitative-variables-r-software-and-data-mining)

Multiple Correspondence analysis
========================================================
incremental: false
autosize: true

MCA plot:
- You can plot for variables, individuals and background (sublimentary variables) separately or you can draw them in the same plot

***




```
Error in dimnames(res) <- list(attributes(tab)$row.names, listModa) : 
  length of 'dimnames' [2] not equal to array extent
```
