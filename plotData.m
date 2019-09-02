function plotData(x, y)
%PLOTDATA Plots the data points x and y into a new figure 
%   PLOTDATA(x,y) plots the data points and gives the figure axes labels of

figure; % open a new figure window
plot (x,y, 'rx', 'MarkerSize', 10); 
axis([1 1.6 80 140]);

%axis labels
xlabel('WHIP'); 
ylabel('ERA+');


end
