# project for course getting and cleaning data.
# getting the data from the web and reading it into R.

library(plyr)
setwd('C:\\courses\\clean.data')

zip.file.name = 'zipfile.zip'
if (!file.exists(zip.file.name)){
  URL='https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  download.file(URL,'zipfile.zip')
  unzip(zipfile = 'zipfile.zip')
}

activity.labels = read.table(file='C:\\courses\\clean.data\\UCI HAR Dataset\\activity_labels.txt'
                           ,stringsAsFactors=FALSE)
features = read.table(file = 'C:\\courses\\clean.data\\UCI HAR Dataset\\features.txt'
                    , stringsAsFactors = FALSE)

X_train = read.table(file = 'C:\\courses\\clean.data\\UCI HAR Dataset\\train\\X_train.txt')
y_train = read.table(file = 'C:\\courses\\clean.data\\UCI HAR Dataset\\train\\y_train.txt')
subject_train = read.table(file='C:\\courses\\clean.data\\UCI HAR Dataset\\train\\subject_train.txt')
train = cbind(subject_train,y_train,X_train)

X_test = read.table(file = 'C:\\courses\\clean.data\\UCI HAR Dataset\\test\\X_test.txt')
y_test = read.table(file = 'C:\\courses\\clean.data\\UCI HAR Dataset\\test\\y_test.txt')
subject_test = read.table(file = 'C:\\courses\\clean.data\\UCI HAR Dataset\\test\\subject_test.txt')
test = cbind(subject_test,y_test,X_test)

# Selecting features and assigning them to variable names.
selected.features.index = grep('mean|std',features[,2],value=FALSE)
X_train = X_train[,selected.features.index]
X_test = X_test[,selected.features.index]
names(X_train) = features[selected.features.index,2]
names(X_test) = features[selected.features.index,2]

# Assigning descriptive activity names.
y_train = mapvalues(as.matrix(y_train),from = activity.labels[,1],to = activity.labels[,2])
y_test = mapvalues(as.matrix(y_test), from = activity.labels[,1], to = activity.labels[,2])

# Merging the data sets.
subject=rbind(subject_train,subject_test)
y=rbind(y_train,y_test)
X=rbind(X_train,X_test)

merged.data=cbind(subject=subject[,1],activity=y[,1],X)

# Aggregating the data and getting the final data set.

