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
and engineered features. This was initially reduced to 45 through exploratory data analysis, 
and finally to 32 using Lasso Regression.

### Multiple Linear Regression



### Support Vector Machine




### Random Forest Regression



### Gradient Boosting


## Shiny App Development
