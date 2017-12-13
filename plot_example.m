function plot_example(ns)
    figure;    
    for i=1:length(ns)
        subplot(1,length(ns),i); approximation_pi(ns(i),true);  
end