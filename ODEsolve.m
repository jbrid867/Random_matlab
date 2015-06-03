options = odeset('RelTol', 1e-4,'AbsTol', [1e-4 1e-4]); % this can be played with
% setting the relative tolerance to 1e-4 and absolute tolerance to 1e-4
% making these smaller will decrease error but will increase time
% for simple things, this is not necessary, for your system it may

ICs=[1,0]; % initial conditions for x and y
%ICs = [however many you need]

% solve using any of these. comment/uncomment to change solver


%%%%% non-stiff solvers
%[T,Y] = ode45(@circles,[0,2*pi],ICs,options); % medium order, runge-kutta
[T,Y] = ode23(@circles,[0,2*pi],ICs,options); % RK2
%[T,Y] = ode113(@circles,[0,2*pi],ICs,options); % RK2 

%%%%% stiff system solvers (generally have an "s" in the function name)
%[T,Y] = ode15s(@circles,[0,2*pi],ICs,options); % medium order, runge-kutta



%plot
plot(T,Y(:,1),'-',T,Y(:,2),'.'); 
figure
plot (Y(:,1),Y(:,2));