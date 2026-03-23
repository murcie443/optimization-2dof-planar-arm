clear;clc;close all;


%structure parameters:

M=5; %weight payload

R1=0.0102; %radius link1 [m]
R2=0.0101; %radius link2 [m]

thickness=2/1000; % r_est - r_int [m]

%0.6658    0.3342    0.0102    0.0101


l1 = 0.6658; % length link 1 (m)
l2 = 0.3342; % length link 2 (m)





%general pid parameters set to an high value for the worst case
%configuration :

Kp=10; 
Kd=3;





% trajectory parameters

simtime=6; % trajectory time + time to let the system to be asyntotically stable 

% Range X-Z
% X=[-l1-l2, +l1+l2] , l1+l2=0.999
% Z=[0, l1+l2]

%equilibrium pose
X0=l1; %(m)
Z0=(l1^2+l2^2)^(1/2);


%target end-effector pose
Xf=0.1;
Zf=0.5;
tf=simtime/2; %simulation time/2
