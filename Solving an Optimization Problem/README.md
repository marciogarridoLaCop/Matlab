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
       
        x = optimvar("x")
        y = optimvar("y")

3) Adding constraints to possible solutions and finding the optimal solution

    The x- and y-coordinates of the three stores have been stored in vectors X and Y for you.

        X = [5 40 70];
        Y = [20 50 15];
    
    The distance between the factory and the three stores is calculated using the following equation:
    
       ![formula](https://render.githubusercontent.com/render/math?math=%20d=\sqrt{(x-X)^2%20%2B%20(y-Y)^2})
   
    Where x and y are your symbolic optimization variables, and X and Y are the coordinates of the stores.
    Create an optimization expression for the distance between the factory location (x,y) and the location of each of the stores (X,Y). 
    Make sure to use element-wise exponentiation (.^) when squaring the differences between the x- and y-coordinates and store the result in a variable d.
    
        d = sqrt((x-X).^2 + (y-Y).^2)

    Variable d is a 1-by-3 optimization expression array. Each element represents the distance to one of the three stores.
     
    
    Store the total shipping distance dTotal in the Objective field of the optimization problem prob.
        
        dTotal = sum(d)

    You can store optimization expressions in the Objective field of your optimization problem using dot notation.

        prob.Objective = dTotal

    Use the show function to display the current optimization problem.

        show(prob)

4) Solving three realistic optimization problems, such as determining the best location for a factory that provides inventory to three stores

    Different types of optimization problems require different kinds of solvers to be used. 
    In this problem, your objective function is nonlinear so you need to use a solver that is suitable for such a function. 
    Define an initial guess structure named initialGuess for your optimization variables x and y.   

        initialGuess.x = 14;
        initialGuess.y = 34; 

    After defining an initial guess, you can solve the optimization problem using the solve function.
    This function takes the optimization problem prob and your initial guess x0 as inputs and returns the solution structure sol, which contains the values of the optimization variables that yield the minimum of the objective function. 
    It also returns the value of the objective at the solution optval.
    
        [sol,optval] = solve(prob,initialGuess)

    The optimal values of your optimization variables are stored in the solution structure sol, and can be accessed using dot notation sol.varName1, sol.varName2, and so on. 
    
        xOpt = sol.x 
        yOpt = sol.y
    
    You can display the optimal location of your factory using the scatter function. 
    To plot it in the existing figure, use the hold on and hold off commands.

        hold on
        scatter(xOpt,yOpt)
        hold off


## License
[Mathworks](https://www.mathworks.com/videos/optimization-onramp-overview-1625638095164.html)