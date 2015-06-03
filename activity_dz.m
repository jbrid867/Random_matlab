function [ gamma ] = activity_dz(phi,r,rc)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
R=r/rc;
gamma = 1./(1-phi*(1+3*R+3*R^2+R^3));

end

