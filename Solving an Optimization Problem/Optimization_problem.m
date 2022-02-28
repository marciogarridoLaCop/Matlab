% Different types of optimization problems require different kinds of solvers to be used. 
% In this problem, your objective function is nonlinear so you need to use a solver that is suitable for such a function. 
%% 
% You can use the optimproblem function to create an optimization problem.
% prob = optimproblem("Description",...
% "My Optimization Problem");
%% 
prob = optimproblem("Description","Factory Location");
