Down the Unity project:
https://osf.io/r37ae/

Download the executable:
https://osf.io/bgwhq/

Download the Unity project (Unity 2021):
https://osf.io/zyvwa

Download the executable (Unity 2021):
https://osf.io/ubdky

As a brief summary: In this little test, we display two rectangles, and participants have to tell us which of both "pops out" or seems closer. 
We display them at different depths, but keep the visual angles constant by changing the size of the object accordingly. That means they have to use 
disparity to tell the depths of the two rectangles apart. In the version I sent you, we aim to simulate a disparity of 200 arc seconds, 
but since VR is all kinds of weird, I don't think we can be sure that this is how the stimulus is perceived. 
It should be enough for a crude assessment though.

In this version we only tested 200 arcsec, since we only needed a very crude measure that participants weren't full-on stereoblind. 
It includes 20 2AFC trials ("Does left or right seem closer?") and participants had to get at least 16 right to pass our test.

The PDF explains the geometry behind the experiment.

The R script implements the maths on how to choose relative depths to obtain the desired disparity, as well as the maths 
on how to adapt the size of the test rectangle such that it occupies the same visual angle as the reference rectangle at 15m