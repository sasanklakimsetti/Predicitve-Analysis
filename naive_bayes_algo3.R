# Load the dataset
iris_raw <- iris
View(iris_raw)

# Check structure of dataset (optional)
str(iris_raw)

# Ensure species column is a factor (it already is in the iris dataset)
# Just to be sure:
iris_raw$Species <- as.factor(iris_raw$Species)

# Randomly shuffle the dataset to avoid biased partitioning
set.seed(123)  # For reproducibility
random_indices <- sample(1:nrow(iris_raw))

# Shuffle the dataset
iris_raw <- iris_raw[random_indices, ]
iris_raw
# Split into training (70%) and testing (30%) datasets
train_size <- floor(0.7 * nrow(iris_raw))  # 70% of the data

iris_train <- iris_raw[1:train_size, ]
iris_test <- iris_raw[(train_size + 1):nrow(iris_raw), ]

# Extract labels
iris_train_labels <- iris_train$Species
iris_test_labels <- iris_test$Species

# Remove the label column from training and test sets to use only features for the model
iris_train <- iris_train[, -5]  # Remove 'Species' column
iris_test <- iris_test[, -5]    # Remove 'Species' column

# Load the Naive Bayes package
library(e1071)

# Train the model
iris_classifier <- naiveBayes(iris_train, iris_train_labels)

# Make predictions on the test data
iris_test_pred <- predict(iris_classifier, iris_test)

# Create a confusion matrix
a <- table(iris_test_pred, iris_test_labels)
print(a)

# Create a cross table to compare actual vs predicted values
library(gmodels)
CrossTable(iris_test_pred, iris_test_labels, prop.chisq = FALSE, prop.t = FALSE, dnn = c('predicted', 'actual'))

# Generate detailed performance metrics using caret's confusionMatrix function
library(caret)
confusionMatrix(a)


# compared to the previous code, it is better in terms of accuracy because the data is randomized and the training will be done on all species and testing on all species.