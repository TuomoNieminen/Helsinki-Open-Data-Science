Clustering and classification
========================================================
type: sub-section

For IODS by Emma Kämäräinen

<br>
<br>
<br>
<br>

Powered by RMarkdown. The code for this presentation is  [here.](https://github.com/TuomoNieminen/Helsinki-Open-Data-Science/blob/master/docs/cluster_classification.Rpres)

Clustering and classification
========================================================
incremental: false

Classification:
- Identify in which (sub-)group the observation belongs

Clustering: 
- Find groups within data so that observations within groups are more similar with each other than with observations with other groups


Clustering and classification
========================================================
incremental: false

- Distance measures
- K-means
- Linear discriminant analysis
- Quadric discriminant analysis

Distance measures
==================================================
incremental: false

How to determine if observations are similar or dissimilar with each others?

- [Euklidean distance](https://en.wikipedia.org/wiki/Euclidean_distance)
- [Manhattan/Taxicab distance](https://en.wikipedia.org/wiki/Taxicab_geometry) (axis-aligned directions)
- [Jaccard index](https://en.wikipedia.org/wiki/Jaccard_index) (binary/categorical distance measure)
- [Hamming distance](https://en.wikipedia.org/wiki/Hamming_distance) (distance measure for words/strings)

K-means (1)
==================================================
incremental: false
autosize: true

- K-means is possibly the oldest and used clustering method in many fields of study
    - Easy to use and relatively fast, often finds a solution
    - Small change in the dataset can produce very different results
    
***

*nice plot here*

K-means (2)
==================================================
incremental: false

Algorithm

1. Choose the number of clusters you want to have and pick initial cluster centroids.
2. Calculate distances between centroids and datapoints. 
3. For all the data points: Assign data point to cluster based on which centroid is closest.
4. Update centroids: within each cluster, calculate new centroid
5. Update clusters: Calculate distances between data points and updated centroids. If some other centroid is closer than the cluster centroid where the data point belongs, the data point changes cluster.

Continue updating steps until the centroids or the clusters do not change

K-means (3)
==================================================
incremental: false

- Distance measure in the algorithm
- Similarity/dissimilarity measures between data points
- Calculating centroid: usually mean of the data points of the cluster
- If distance measure is euclidean distance, the mean as centroid minimizes the objective function of k-means


Linear discriminant analysis(1)
==================================================

Linear discriminant analysis (LDA) is a classification method. It can be used to model binary variables, like in logistic regression, or multiple class variables. LDA is a probabilistic model that forms a class conditional distribution of the data for each of the classes.

[Bayes' rule](https://en.wikipedia.org/wiki/Bayes'_theorem) is used to predict in what class the observation belongs to.

The probability of the observations being in a certain class can be written $P(y=k|X$ where X denotes the data and there are k number of classes. 
 
http://scikit-learn.org/stable/modules/lda_qda.html 

Linear discriminant analysis(2)
==================================================

The conditional distribution of the data can be written as $P(X|y=k)$ where X means the data and k denotes the kth class. The conditional probability is modelled by using multivariate Gaussian distribution

Cross Validation
==================================================

- Split the data into two: training set and test/validation set 
- Train the statistical model with training set
- Use test set validate the performace of the model:
    + Error rate for classification
    + Mean squared error for example linear regeression
    + Other error measures
- IMPORTANT

DA biplot
==================================================

