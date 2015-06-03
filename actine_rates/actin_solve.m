options = odeset('RelTol', 1, 'AbsTol', [1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4]); % this can be played with
% setting the relative tolerance to 1e-4 and absolute tolerance to 1e-4
% making these smaller will decrease error but will increase time
% for simple things, this is not necessary, for your system it may

ICs=[10,0,0,0,0,0,100,0,0,0,10,0,0,0,0,0,0,0]; % 18 initial conditions


[T,Y] = ode23s(@system,[0,7200],ICs); % medium order, runge-kutta. 7200s = 2hrs



%plot
%plot(T,Y(:,7),'-'); 
plot(T,Y(:,3),'-',T,Y(:,5),'--',T,Y(:,12),'-',T,Y(:,14),'--')





%ICs = [however many you need]

% solve using any of these. comment/uncomment to change solver


%%%%% non-stiff solvers
%[T,Y] = ode45(@circles,[0,2*pi],ICs,options); % medium order, runge-kutta


%[T,Y] = ode23(@circles,[0,2*pi],ICs,options); % RK2
%[T,Y] = ode113(@circles,[0,2*pi],ICs,options); % RK2 

%%%%% stiff system solvers (generally have an "s" in the function name)

