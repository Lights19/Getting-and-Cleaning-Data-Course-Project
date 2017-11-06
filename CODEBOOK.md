**Function of Code in nutshell**

Data file were downloaded, read, column names were assigned. Then training and test data were merged following extraction of desired data. Descriptive names were given to activity and variable. independent tidy set with the average of each variable for each activity and each subject was created using function in ‘dplyr’ package and finally tidy data were saved.

Subjecttest and subjecttrain - subject identifier from 1 to 30 for test and training data
Activity- Six activities including Walking, Walking upstairs, Walking downstairs, Sitting, Standing and Laying.
Features/Measurements- They are in two different domain; time and frequency domain represented and prefixed as ‘timedomain ‘and  ‘frequencydomain’ respectively. Both variables are in 3- axial linear and angular direction X,Y,Z.
1.	Average time-domain body acceleration in the X, Y and Z directions:
 timeDomainBodyAccelerometerMeanX- in X-direction
 timeDomainBodyAccelerometerMeanY-in Y direction and 
 timeDomainBodyAccelerometerMeanZ-in Zdirection
Similarly, standard deviation time domain body acceleration are labelled in similar way
2.	Standard deviation of the time-domain body acceleration in the X, Y and Z directions:

timeDomainBodyAccelerometerStandardDeviationX
timeDomainBodyAccelerometerStandardDeviationY
timeDomainBodyAccelerometerStandardDeviationZ
similar pattern follows for rest of the measurements.
3.	Average time-domain gravity acceleration in the X, Y and Z directions:
4.	Standard deviation of the time-domain gravity acceleration in the X, Y and Z directions:
5.	Average time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:
6.	Standard deviation of the time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:
7.	Average time-domain body angular velocity in the X, Y and Z directions:
8.	Standard deviation of the time-domain body angular velocity in the X, Y and Z directions:
9.	Average time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions
10.	Standard deviation of the time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions:
11.	Average and standard deviation of the time-domain magnitude of body acceleration:
12.	Average and standard deviation of the time-domain magnitude of gravity acceleration:
13.	Average and standard deviation of the time-domain magnitude of body acceleration jerk (derivation of the acceleration in time):
14.	Average and standard deviation of the time-domain magnitude of body angular velocity
15.	Average and standard deviation of the time-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time):
The pattern follows in similar order for frequency domain magnitude.

Transformation used in code
Approximate transformation in the code is done as follows
Mean by Mean
std$ by sd
t by time
Acc by Accelerometer
[Gg]ravity by Gravity
[Gg]yro by Gyro
AccMag by AccMagnitude
[Bb]odyaccjerkmag by BodyAccJerkMagnitude
JerkMag by JerkMagnitude
