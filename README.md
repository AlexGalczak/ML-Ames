# Price Prediction Model Exploration: Improving Client Experience and Increasing Operational Efficiency


## Background and Motivation

This is a proof of concept data analysis project aimed at demonstrating how Machine 
Learning can predict the sale price of homes. The data used for this proof of concept 
are the data from 2,571 house sales in Ames Iowa between December 2006 and July 2010. 

Initial meetings with real estate clients often involves a reality check around price 
expectations. For example, a buyer comes in expecting they can get much more for their 
money than is reasonable given the market. Or a seller comes assuming they can get a 
price much higher than is typical due to anecdotal evidence that the market is much 
hotter than it actually is. These meetings, depending on the severity of the disconnect,
can be tense and time consuming as they are less likely to end in a transaction.

We will demonstrate how house price prediction using Machine Learning can be leveraged 
to engage with the public at scale by means of a web application. Using this application 
prospective clients can explore the predictive power of these models in a paired down version. 
This allows the prospective client to level set expectations around pricing without 
consuming an excessive amount of agent time. In addition to building credibility with the
client by offering insights other firms do not. This paired down version can also be used as 
an example while advertising the complete model that is offered to clients of your firm. 
The use of these cutting edge techniques that are used and trusted across a variety of sectors
can set a realty group apart from the pack. Demonstrating a reliance on data-based
insights adds to a firms credibility and allows agents to answer common consumer questions 
with less manual effort. The end result is a higher proportion of leads that have 
realistic expectations and are more likely to choose your firm to represent them in 
their real estate transaction.

## Exploratory Data Analysis

Exploratory data analysis consisted of the examination of the distributions of the continuous
variables. Specifically looking for normality or interesting patterns. The variables were
plotted in scatter plots compared to the target variable of sale price to assess any 
existing relationships. Categorical variables were examined for completeness and their
distribution across the data set.

## Data Cleaning

Data cleaning for this data set was fairly straight forward. The majority of the missing
values were imputed with zeroes or NAs depending on the standard set forth in the data 
dictionary. For example, the area of the exterior represented by masonary was set to zero
when the value was missing and the masonary type was set to None indicating no masonary 
area was present. Variables related to basement quality when blank were set to NA (not 
applicable) and confirmed by noting the total basement square feet was zero.

Lot frontage was imputed based on the value of lot area when it was missing. We assumed
there was a relationship between the lot size (area) and the number of linear feet of 
the street the house held. The simplest way to estimate this was to assume all lots are 
rectangular. Area of a rectangle is length * width. For those houses with lot frontage 
data present in the data set the length of the lot was calculated by dividing lot area 
by lot frontage (assumed to represent width). The median length of each lot configuration
type (e.g. inside lot, corner lot, etc.) was computed and used to estimate the lot 
frontage for the houses with missing values.

Area = L * W

W = Lot frontage

L = Area/W

W (lot frontage) = area/median(L)

## Feature Engineering

Feature engineering consisted of combining or replacing data in meaningful ways to allow
for a more understandable or powerful predictive model. The features we created from the 
data included:

Outdoor Space - a sum of the square feet of all types of outdoor structures meant to 
extend living space (e.g. wooden decks, screened porches, etc.)

Age of House - year sold - year built/remodeled

Percent of Square Feet in First Floor - based on an informational interview it was learned
that master bedrooms on the first floor are more desireable - ground floor may be more 
important in house price than others

House Footprint - the percent of the lot area consumed by the house and garage, this can
also be regarded as a proxy for privacy or housing concentration

Approximate Room Size - total rooms above grade / square feet above grade

Overall Quality * Square Feet Above Grade - giving square feet more weight/value in houses
of higher quality 

Overall Condition * Square Feet Above Grade - giving square feet more weight/value in 
houses given a higher score for condition

Geographic Value - a replacement for neighborhood constructed by taking the average of the
distance to key points around town

## Machine Learning Algorithms

We began with 145 features including the original data, one hot encoded categorical features,
and engineered features. This was initially reduced to 45 through exploratory data analysis.
And finally to the features were reduced to 32 using Lasso Regression. The data were then 
split into train (70%) and test groups without stratification. 

### Multiple Linear Regression

Lasso and Ridge regression were trained on the training data. Grid search with cross 
validation (3 folds) identified lambda of 0.0032 to be the best and returned an R-squared
of 0.900.

### Support Vector Regressor

A support vector regressor model using a radial basis function kernel and epsilon 
set to 0.1 and gamma set to 0.01 returned an R-squared of 0.918. Grid search and cross 
validation with 5 folds returned epsilon of 0.01, gamma unchanged, and C of 1 and a score 
(R-squared) of 0.916.

### Random Forest Regression

Random forest regression returned an R-squared of 0.898 with 1,000 trees and 7 max 
features per tree. Grid search with cross validation (5 folds) returned 500 trees, 8 max
features, and minimum samples per leaf of 1 and 2 per split (R-squared=0.899). Top 
features in this model were overall quality, exterior quality, 1st floor square feet, 
garage cars, and number of baths.

### Gradient Boosting

Gradient boosting with 5,000 trees, a learning rate of 0.01, and 7 max features returned 
an R-squared of 0.922. While extreme gradient boost with 5,000 trees, a learning rate of 
0.01, 7 max features, gamma of 0.01, subsample of 0.8, and column sample of 0.8 returned an
R-squared of 0.923. Top features in this model were overall quality, garage cars, 1st floor
square feet, kitchen quality, and basement quality.


## Shiny App Development

A web-based [application](https://alex-galczak.shinyapps.io/shiny-dash-AG/) was produced 
using Shiny in R studio. The application provides the user with an interactive interface to
explore house prices in Ames by adjusting various characteristics of the house including 
number of bedrooms, number of bathrooms, square feet, and neighborhood. Descriptive 
visualizations on the exploratory tab allow users to examine the distribution of price points
given key characteristics. While the prediction tab allows a price prediction to be returned
with visual representation of the prediction with the variation represented by other houses
of similar sizes and characteristics. This demonstrates the functionality and value 
provided by a paired down house price prediction model.
