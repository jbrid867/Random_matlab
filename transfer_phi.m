%% makes 1000 transfer matrices for phi=0 -> 0.4 and calculates eigenvalues

N=10000;
lambda=zeros(3,N);
Np=zeros(1,N-1);
logLam=zeros(1,N);
z=zeros(1,N);
alpha=exp(-2);
k=exp(1);
sigma=exp(-2);
s=exp(1);

phi=linspace(0.01,0.4,N);
for i=1:N
    [T,z(i)]=transfer_3x3(alpha,sigma,k,s,N,phi(i));
    lambda(:,i)=eig(T);
    logLam(i)=N*log(lambda(3,i))*(1+(lambda(2,i)/lambda(3,i))^N + (lambda(1,i)/lambda(3,i))^N);
    
end

dLam=diff(logLam);
dz=diff(z);
midz=zeros(1,N-1);
for i=1:N-1
    midz(i)=(z(i)+z(i+1))/2;
    midphi(i)=(phi(i)+phi(i+1))/2;
end

for i=1:N-1
    Np(i)=midz(i)*dLam(i)/dz(i);
end

plot(midphi,Np./N)
figure
plot(log(midz),Np./N)