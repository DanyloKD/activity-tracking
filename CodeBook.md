Code book
---
subject: ID of the person who tooked part in study   
activity: studied activity ID.
-   1 WALKING
-   2 WALKING_UPSTAIRS
-   3 WALKING_DOWNSTAIRS
-   4 SITTING
-   5 STANDING
-   6 LAYING

Measurements come from the accelerometer and gyroscope 3-axial raw signals t\_acc:xyz and t\_gyro:xyz. These time domain signals have prefix 't' to denote time 
The acceleration signal was then separated into body and gravity acceleration signals (t\_body\_acc:xyz and t\_gravity\_acc:xyz) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals: t\_body\_acc\_jerk:xyz and t\_body\_gyro\_jerk:xyz). 

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm:
-   t\_body\_acc\_mag
-   t\_gravity\_acc\_mag
-   t\_body\_acc\_jerk\_mag
-   t\_body\_gyro\_mag
-   t\_body\_gyro\_jerk\_mag 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals. Prefix 'f' usedto indicate frequency domain signals.
-   f\_body\_acc:xyz
-   f\_body\_acc\_jerk:xyz
-   f\_body\_gyro:xyz
-   f\_body\_acc\_jerk\_mag
-   f\_body\_gyro\_mag
-   f\_body\_gyro\_jerk\_mag.

These signals were used to estimate variables of the feature vector for each pattern: 
":xzy" is used to denote 3-axial signals in the X, Y and Z directions.
-   t\_body\_acc:xyz
-   t\_gravity\_acc:xyz
-   t\_body\_acc\_jerk:xyz
-   t\_body\_gyro:xyz
-   t\_body\_gyro\_jerk:xyz
-   t\_body\_acc\_mag
-   t\_gravity\_acc\_mag
-   t\_body\_acc\_jerk\_mag
-   t\_body\_gyro\_mag
-   t\_body\_gyro\_jerk\_mag
-   f\_body\_acc:xyz
-   f\_body\_acc\_jerk:xyz
-   f\_body\_gyro:xyz
-   f\_body\_acc\_mag
-   f\_body\_acc\_jerk\_mag
-   f\_body\_gyro\_mag
-   f\_body\_gyro\_jerk\_mag

The set of variables that were estimated from these signals. 
- mean: Mean value
- std: Standard deviation
- mad: Median absolute deviation 
- max: Largest value in array
- min: Smallest value in array
- sma: Signal magnitude area
- energy: Energy measure. Sum of the squares divided by the number of values. 
- iqr: Interquartile range  
- entropy: Signal entropy
- ar\_coeff: Autorregresion coefficients with Burg order equal to 4
- correlation: correlation coefficient between two signals
- max\_inds: index of the frequency component with largest magnitude
- mean\_freq: Weighted average of the frequency components to obtain a mean frequency
- skewness: skewness of the frequency domain signal 
- kurtosis: kurtosis of the frequency domain signal 
- bands\_energy: Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle: Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable.
- gravity\_mean
- t\_body\_acc\_mean
- t\_body\_acc\_jerk\_mean
- t\_body\_gyro\_mean
- t\_body\_gyro\_jerk\_mean
