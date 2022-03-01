# Optimization Overview Matlab

You may not realize it, but optimization is a part of our daily lives. 
Take running errands, for example. There are many ways to get from your house to the grocery store, but how do you find the quickest route? 
Well, the GPS says this way looks good, but while you're driving, traffic develops. Now what's the fastest route?

Optimization problems all involve minimizing or maximizing something called an objective function, 
which represents the quantity that you'd like to optimize, but they can be hard to solve since they can have 
limitations placed on the allowable solutions.
## Approach 

1) Creating an optimization problem
    - Create an optimization problem named prob and add the description "Factory Location".
        
        prob = optimproblem("Description","Factory Location");

    - You can use the show function to display the contents of an optimization problem in an easy-to-read way.
        
        show(prob)

2) Defining relevant variables and the function upon which they depend

    - Define optimization variables using the optimvar function. 
Create a symbolic optimization variable x and y that represents the x-coordinate and y-coordinate of your factory. Name the variable "x" and "y".
       ![alt text](https://image.prntscr.com/image/ajXgmN4qS72U0hmfclQdCA.png)

        x = optimvar("x")
        y = optimvar("y")

3) Adding constraints to possible solutions and finding the optimal solution

    The x- and y-coordinates of the three stores have been stored in vectors X and Y for you.

Solving three realistic optimization problems, such as determining the best location for a factory that provides inventory to three stores


## License
[Mathworks](https://www.mathworks.com/videos/optimization-onramp-overview-1625638095164.html)