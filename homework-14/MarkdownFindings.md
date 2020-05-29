Deep Learning Markdown:

Which model has a lower loss?
The model which uses clogin prices in the training model show losses that are signficantly smaller than the fng model. They range from 0.0027 to 0.0037 whereas the fng model ranges from 0.027 to 0.057.

Which model tracks the actual values better over time?
The model which uses the closing prices has predictions much closer to the actual. The predictions in the fng model show more of a stagnant prediction that remains around a horizontal line highly dissimilar to the actual prices. The model using closing prices shows predictiions that follow the same shape as the actual prices. 

Which window size works best for the model?
I found that the window provided with the initial data of 160 days worked well for this model because it allowed you to view how the predictions look in both the near and far future. For example, if I had only used a window of 80 days, the fng model would have looked closer to the actual prices, however after 80 days, the prices differed dramatically. 