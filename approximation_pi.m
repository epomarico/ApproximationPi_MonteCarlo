%   The function 'approximation_pi' generates randomly n points in the area [0, 1] x [0, 1]
%   The value of pi is obtained from the ratio between the number of points
%   in the circle with centre (0.5,0.5) and radius 0.5, and the number n

function pi_approx = approximation_pi(n,print_graph)
    % Inputs: n: number of random points to generate (default value 1e6)
    %         print_graph: logical variable for choosing to print the graph 
    %
    % Output: pi_approx: approximated value of pi
     
    
    % Check that n is larger than 1
    if n < 1
       n = 1e6;
    end
    
    % Generate points with x and y coordinates uniformly distributed in 
    %[0, 1] x [0, 1]. Therefore, points is a matrix n x 2
    points = rand(n, 2); 
    
    %Print a graph of the square with the random points if print_graph is
    %true
    if print_graph == true     
        plot_square(points);
    end
    
    % Compute the distance d of the points from the centre (0.5, 0.5).
    %d is a vector n x 1
    d = sqrt((points(:,1)-0.5).^2+(points(:,2)-0.5).^2); 

    % Count fraction of points within 1/2 unit of (0.5, 0.5)
    frac = sum(d <= 0.5)/n; 
    
    % Since square has side 1, circle has radius (1/2) 
    % and should have area of pi*(1/2)^2
    % frac is approximately pi/4, so pi is approximately 4*frac
    pi_approx = 4*frac;
    
end

%   The function 'plot_square' plots the points generated in the squared 
%   area [0, 1] x [0, 1] and drwas the the circle with centre (0.5,0.5) 
%   and radius 0.5 

function plot_square(points)
    % Plot the points
    sz=4;
    scatter(points(:,1),points(:,2),sz,'filled')
    hold on
    
    % Plot the circle
    ang=0:0.01:2*pi; 
    xp=0.5+0.5*cos(ang);
    yp=0.5+0.5*sin(ang);
    plot(xp,yp,'r','LineWidth',2);
    xlabel('\fontsize{16} x'); ylabel('\fontsize{16} y');
    
    L=length(points)
    title(strcat('M=',num2str(L)));
end


