clear ; close all; clc

training_data = load('master 2008 to 2017.txt');

X = training_data(:, 1); 
y = training_data(:, 2);
m = length(y); % number of training examples
plotData(X, y); %plot the data

X = [ones(m, 1), training_data(:,1)]; % Add a column of ones to x
theta = zeros(2, 1); % initialize fitting parameters
%set learning rate (alpha) and number of iterations
iterations = 200000;
alpha = 0.1;

theta = gradientDescent(X, y, theta, alpha, iterations);

fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
legend('Training Data', 'Trend Line')
hold off % don't overlay any more plots on this figure

team = textread('2018team.txt', "%s"); %load team names
data = csvread('2018.csv');
x2018 = data(:,2); %load 2018 WHIP
m = length(x2018); 
x2018 =  [ones(m,1), x2018]; %add a column of 1s for matrix operation 
era_a = data(:,1); %actual ERA+
era_a(1) = 113;
era = x2018*theta; %predicted era+

fprintf('Team|Predicted ERA+|Actual ERA+\n')
for i = 1:m
  if i == 14
    fprintf(" %s|   %d     |%d\n", team{i}, era(i), era_a(i))
    
   
	else
    fprintf(" %s|   %d    |%d\n", team{i}, era(i), era_a(i))
   endif
endfor
corr(era,era_a);
r_21 = corr(era,era_a)^2;

fprintf("Coefficient of Determination is %d\n", r_21)
r_2_a1 = 1-(((300-1)/(300-1-1))*((1-r_21)^2));
fprintf("Adjusted Coefficient of Determination is %d\n", r_2_a1)
plotData(x2018(:,2), era_a);
hold on;
plot(x2018(:,2), era,'-');
legend('Actual Data', 'Trend Line')
hold off;
era1 = era;

training_data = csvread('master 2008 to 2017m.csv');
X = training_data(:, 1:2);
X(1,1) = 1.29;
y = training_data(:, 3);
m = length(y);

X = [ones(m, 1) X];
theta = normalEqn(X,y)

team = textread('2018team.txt', "%s"); %load team names
data = csvread('2018m.csv');
m = length(team);
x2018 = data(:,2:3); 
x2018 =  [ones(m,1), x2018]; 

era_a=data(:,1); %actual ERA+
era_a(1) = 113 ;
era = x2018*theta; %predicted ERA+
diff1 = era_a-era1;
diff=era_a-era;

fprintf('Team|Predicted ERA+|Actual ERA+\n')
for i = 1:m
   if (i==10)
     fprintf(" %s|    %d    |%d\n", team{i}, era(i), era_a(i))
   elseif (i==21)
     fprintf(" %s|    %d    |%d\n", team{i}, era(i), era_a(i))
   elseif (i==23)
     fprintf(" %s|    %d    |%d\n", team{i}, era(i), era_a(i))
   elseif (i==26)
     fprintf(" %s|    %d    |%d\n", team{i}, era(i), era_a(i))
   elseif (i==30)
     fprintf(" %s|    %d    |%d\n", team{i}, era(i), era_a(i))
   else
     fprintf(" %s|   %d    |%d\n", team{i}, era(i), era_a(i))
   endif
endfor
corr(era,era_a);
r_2 = corr(era,era_a)^2;
fprintf("Coefficient of Determination is %d\n", r_2)
r_2_a = 1-(((300-1)/(300-2-1))*((1-r_2)^2));
fprintf("Adjusted Coefficient of Determination is %d\n", r_2_a)

%summary table

fprintf('Team|P-ERA+ 1Var|Variance |P-ERA+ 2Var|Variance |Actual ERA+\n')

for i = 1:m
  
   fprintf(" %s    %d    %d    %d    %d   %d\n", team{i},era1(i),diff1(i) ,era(i),diff(i), era_a(i))
   
endfor


