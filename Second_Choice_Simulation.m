clear all
close all
%simple simulation of two bidders 
% t1(t11 t12) t2(t21 t22) bids
% r lowest bar for the selller
%revenue in the second choice 
%p21  p22
%p11  p12   
%pi=[p11,p12,p21,p22]
% uniformly distributed
%test for the simple case r either equal 1/3 and 2/3
%test for the simple symmetric case t1 t2 in [1/3,2/3]
%%first test simple case of r is a fixed number

syms p11 p12 p21 p22
t1=zeros(1,2);
t2=zeros(1,2);
% p11+p12+0  +0  =1/2;
% 0  +0  +p21+p22=1/2;
% 0  +p12+0  +p22=1/2;
%%solve for linear underdetermined system
%A=[1 1 0 0;0 0 1 1;0 1 0 1];
%b=[1/2;1/2;1/2]
%x=lsqnonneg(A,b)
%n=null(A);
%0<x+c*n<1

%simple case
t1(1)=1/3;t1(2)=2/3;
t2(1)=1/3;t2(2)=2/3;
n=100                                %generate r n times
R=zeros(1,n);
%test for simple case for given system

p11=1/3;p12=1/6;p21=1/6;p22=1/3;
  
R_max=0

for j=1:10
    figure
for i =1:n  
     r=rand;
    R(i)=p11*simrevenue(t1(1),t2(1),r)+p12*simrevenue(t1(2),t2(1),r)+p21*simrevenue(t1(1),t2(2),r)+p22*simrevenue(t1(2),t2(2),r);
    if i>1&&R(i)>R_max
        R_max=R(i);
        r_max=r;
        
    end
    
    hold on
    plot(r,R(i),'k.')
    
end

txt=['r =' num2str(r_max) ' R=' num2str(R_max) ];
text(r_max,R_max,txt)
xlim([0,1])
end
R_max
r_max

%syms p11 p12 p22 p21
% p11+p12=1/2;
% p21+p22=1/2;
% p12+p22=1/2;
% p11+p12+p21+p22=1;
% 
% x=rand                       % r random distributed
% if x<a                       % a: probability to for r to be r1  ; else: (1-a) r to be r2
%   r=r1;
% else
%   r=r2;
% end
% 
% 
% t1=*1/3+p12*2/3 ;
% t2=p21; r=1/3
%lsqlin(A,b,'','','','',[0;0;0;0],[1;1;1;1],options)

%R=0*(t1<r&&t2<r)+min(t1,t2)*(t1>=r&&t2>=r)+r*(min(t1,t1)<r);
