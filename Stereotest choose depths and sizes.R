require(ggplot2)
#15m distance to target
#0.065m interocular distance assumed
#offsets between 0.05 and 0m shown

################stereotest 2


DegreeToRadians <- function(degree){
  radians <- degree*0.01745
  radians
}

RadiansToDegree <- function(radians){
  degree <- radians/0.01745
  degree
}

depth_difference = seq(-3,3,0.1)

#here we compute the disparity elicited by the test rectangle:
#15 (m) is the depth of the rectangle in relation to the observer
#2 (m) is the offset of the stimulus to the left or right from the straight-ahead
#0.065 (m) is the generic assumed interocular distance
disparity_test = 180 - ((90 - RadiansToDegree(atan(2.065/(15+depth_difference)))) + (90 + RadiansToDegree(atan(1.935/(15+depth_difference)))))

#here we compute the disparity elicited by the reference rectangle:
disparity_zero = 180 - ((90 - RadiansToDegree(atan(2.065/15))) + (90 + RadiansToDegree(atan(1.935/15))))

#here we convert it into arcsec:
(disparity_test-disparity_zero)*3600

DF = data.frame(Disparity = (disparity_test-disparity_zero)*3600,
                DepthDifference = depth_difference)

#here we plot the difference in disparity in function of the difference in depth between test and reference rectangle: 
ggplot(DF, aes(DepthDifference, Disparity)) +
  geom_point()




#the following equation computes the  size that makes for the same visual angle when depth is changed. 15 meters is assumed as reference depth,
#and the reference size is 2 meters. So we compute how big a target has to be at different depths to occupy the same visual angle as the 2m reference
#target at 15 meters:

#0 = atan((2+0.5*size)/distance)-atan((2-0.5*size)/distance) + atan(1/15) - atan(3/15)

MinimizeThis = function(size,distance){
  abs(atan((2+0.5*size)/distance)-atan((2-0.5*size)/distance) + atan(1/15) - atan(3/15))
}

#find the optimal value to achieve a disparity of 200 arcsec:
optimize(MinimizeThis,c(0,3),tol = 0.0000001, distance = 13.5) #for test rectangle at 13.5m (corresponds roughly to 200 arcsec)
optimize(MinimizeThis,c(0,3),tol = 0.0000001, distance = 16.5) #for test rectangle at 16.5m (corresponds roughly to 175 arcsec)

optimize(MinimizeThis,c(0,3),tol = 0.0000001, distance = 12) #~400 arcsec
optimize(MinimizeThis,c(0,3),tol = 0.0000001, distance = 18) #~300 arcsec
