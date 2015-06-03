%% makes 1000 transfer matrices for phi=0 -> 0.4 and calculates eigenvalues
clear
N=10000;
lambda=zeros(2,N);
Np=zeros(1,N-1);
logLam=zeros(1,N);
z=zeros(1,N);
alpha=exp(1);
k=exp(-5);
sigma=exp(-2);
s=exp(1);

phi=linspace(0.01,0.4,N);
Q = phi./(1-phi);
lng = (-log(1-phi) + 7.*Q +(15/2).*Q.^2 + 2.*Q.^3);


z=exp(lng);

lambda=transfer_2x2(alpha, k, z);

for i=1:length(lambda(1,:))
    if(lambda(1,i)>lambda(2,i))
        logLam(i)=N*log(lambda(1,i))*(1+(lambda(2,i)/lambda(1,i))^N);
    else
        logLam(i)=N*log(lambda(2,i))*(1+(lambda(1,i)/lambda(2,i))^N);
    end
end
dLam=diff(logLam);
dz=diff(z);
for i=1:N-1
    midz(i)=(z(i)+z(i+1))/2;
    midphi(i)=(phi(i)+phi(i+1))/2;
end
for i=1:N-1
    Np(i)=midz(i)*dLam(i)/dz(i);
end
plot(midphi,Np)
figure
plot(log(midz),Np)
        