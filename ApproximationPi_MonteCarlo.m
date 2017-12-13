%% APPROXIMATION OF PI WITH A MONTE CARLO SIMULATION
%
% This program shows the application of a Monte Carlo method to determine an approximate 
% value for pi by using the function 'approximation_pi'.
% This function generate points with random x and y coordinates in a square
% and estimates the value of pi as the ratio between the number of points
% in a circle contained by the square and the total number of points. 

% Initialize random number generator
rand('state',1000)

% Calculate pi with a number N of trials. 
% The larger N, the better the approximation

N=10^4;
print_graph=false; %This is to print a graph with the Montecarlo simulation on the square with N number of trials
pi_approx=approximation_pi(N,print_graph);
sprintf('%5f',pi_approx) %print the value of pi

% Plot a graph of the MonteCarlo simulation for three 
% different values of trials. Make the variable plot_square true if you
% want to make the plot

plot_square = false;
if plot_square == true
    M=[10^2,10^3,10^4];
    plot_example(M);
end
    
% Plot error of the Monte Carlo simulation, i. e. the error between the 
% numerical solution and the exact solution 
%Keep false the second argument in function approximation_pi

n= logspace(2,8,100);% 2,8,100
error=zeros(1,length(n));

for i=1:length(n)
    error(i)=abs(approximation_pi(n(i),false)-pi);
end

%Fit the error values and print the slope of the fitting line
a=polyfit(log10(n),log10(error),1);
slope=a(1)

%Plotting
close all
figure;
loglog(n,error); hold on;
loglog(n,0.01*ones(1,length(n)),'--','Color','green');hold on; % line at error = 1%
loglog(n,n.^(-0.5),'r--'), hold off % reference line with slope -0.5
axis([1e2 1e8 1e-5 1e0])
xlabel('\fontsize{16}M'); ylabel('\fontsize{16}Error');
title('\fontsize{14}Approximation of \pi with a Monte Carlo simulation');
legend('\fontsize{16}Error','\fontsize{16}1% Error','\fontsize{14}ref. slope -1/2','Location','Northeast')
legend('boxoff')  


