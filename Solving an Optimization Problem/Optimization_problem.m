% Different types of optimization problems require different kinds of solvers to be used. 
% In this problem, your objective function is nonlinear so you need to use a solver that is suitable for such a function. 
%% You can use the optimproblem function to create an optimization problem.
% prob = optimproblem("Description","My Optimization Problem");
%% 
prob = optimproblem("Description","Factory Location");
x = optimvar("x");
y = optimvar("y");
X = [5 40 70];
Y = [20 50 15];
d = sqrt((x-X).^2 + (y-Y).^2);
dTotal = sum(d);
prob.Objective = dTotal;
show(prob);
initialGuess.x = 0;
initialGuess.y = 0; 
[sol,optval] = solve(prob,initialGuess);
xOpt = sol.x;
yOpt = sol.y;
plotstores(X,Y);
hold on
scatter(xOpt,yOpt)
hold off
