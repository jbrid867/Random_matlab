options = odeset('RelTol', 1, 'AbsTol', [1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4 1e-4]); % this can be played with
% setting the relative tolerance to 1e-4 and absolute tolerance to 1e-4
% making these smaller will decrease error but will increase time
% for simple things, this is not necessary, for your system it may

N=25; % N+8 initial conditions

ICs=zeros(N+8,1);
ICs(3)=200; % initial actin
ICs(8)=100; %initial profilin
ICs(9)=20; %initial cofilin


[T,Y] = ode23s(@system_new,[0,1000],ICs); % medium order, runge-kutta. 7200s = 2hrs



%plot
%plot(T,Y(:,7),'-'); 
plot(T,Y(:,3),'r');
figure
plot(T,Y(:,10), 'b');
figure
plot(T,Y(:,11),'-');


y1=zeros(size(T));
for i=10:N+8
    y1(:)=y1+Y(:,i)*(i-8);
end
y1=y1+Y(:,1)+Y(:,2)+Y(:,3)+Y(:,4)+Y(:,5)+Y(:,6)+Y(:,7);


%ICs = [however many you need]

% solve using any of these. comment/uncomment to change solver


%%%%% non-stiff solvers
%[T,Y] = ode45(@circles,[0,2*pi],ICs,options); % medium order, runge-kutta


%[T,Y] = ode23(@circles,[0,2*pi],ICs,options); % RK2
%[T,Y] = ode113(@circles,[0,2*pi],ICs,options); % RK2 

%%%%% stiff system solvers (generally have an "s" in the function name)

