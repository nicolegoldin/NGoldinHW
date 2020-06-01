Resampling

Which model had the best balanced accuracy score?
The Logistic Regression Model with the Naive Oversampling created the best balanced accuracy score of 67.7%

Which model had the best recall score?
The Logistic Regression Model with the SMOTE Oversampling created the best recall score of 69%

Which model had the best geometric mean score?
The Logistic Regression Model with the Naive Oversampling created the best geometric mean score of 67%. However, the Geometric Mean Score of the Logistic Regression Model using SMOTE was close to this with a score of 66%.


Ensemble 
Which model had the best balanced accuracy score?
The AdaBoost Classifier has the best balanced accuracy score of 68.8%

Which model had the best recall score?
Interestingly enough, both models had a total recall score of 1. However, the AdaBoost Classifier had a better recall score of 38% for high risk loans whereas the Random Forest Classifier had a recall score for high risk loans of 36%. While the AdaBoost was higher for high risk loans, neither scores are great and would likely not be used to predict loans. This is important because this means the recall for high risk loans (ones that lose money) is unreliable and could provide false indicators.

Which model had the best geometric mean score?
The AdaBoost Classifier had a higher geometric mean score of 61%. This was closely followed by the Random Forest Model score of 60%. 

What are the top three features?
The top three features are last payment amount, total recorded interest, and total recorded principal. I found this interest because intuitively, these features would not be ones I would have thought to be the highest weighted features. I would have thought features like annual income woudl be more predictive. To be fair though, none of the features were weighted over 8% and are all within a few percents of each other. This means that with slightly different data these feature weights could easily change. 