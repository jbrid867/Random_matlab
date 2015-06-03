% some examples of ode solvers

% function definition here

function dy = circles(t,y);
    dy = zeros(2,1);
    dy(1) = y(2); % x'= y
    dy(2) = -y(1); % y' = -x
   
