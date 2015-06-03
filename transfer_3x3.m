function [T,z] = transfer_3x3( alpha, sigma, k, s, N, phi )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%phi=linspace(0,0.4,1000);
Q = phi./(1-phi);
lng = -log(1-phi) + 7.*Q +(15/2).*Q.^2 + 2.*Q.^3;
T=zeros(3,3);

z=exp(lng);


T(1,1)=1;
T(1,2)=sqrt(alpha);
T(1,3)=sqrt(alpha*sigma);
T(2,1)=sqrt(alpha)*z;
T(2,2)=k*z;
T(2,3)=k*sqrt(sigma)*z;
T(3,1)=sqrt(alpha*sigma)*z;
T(3,2)=k*s*sqrt(sigma)*z;
T(3,3)=s*k*z;

end

