%%
% This tutorial is going to briefly go over the basic operations in
% matlab.
% Everything behind %-sign is a comment. You can evaluate the areas marked 
% with %% (so called cells) by pressing ctrl-enter.
% Please click on the next cell called "Everything in Matlab is a matrix"
% and press ctrl-enter.

%% Everything in Matlab is a matrix
clear            % clear command wipes your workspace
a=5;             % Initialize a variable a
b=[1 2];         % Initialize a vector b
c=[1 2 3;4 5 6]; % Initialize a matrix c
% In your workspace you can see these variables now and their values. 
% You can click on the variables and edit their values. You can
% erase or save them to file by right-clicking on them in 
% your workspace. The clear command deletes all variables from your
% workspace. Please click on the next cell and press ctrl-enter.
%% Basic Operations
a+4              % is saved to ans
% You need to put ; behing every line of code if you dont want matlab to
% output the result in the command window. Since we havent saved this
% result to any variable, matlab saves it to a variable called ans (as you
% can see in your workspace)
a_plus_6    =   a+6;
% You can name variables the way you like but they have to start with a
% letter and are not allowed to have the same name as functions. 
% Matlab is going to output an error in red in the command window if
% anything went wrong.
a_minus_7   =	a-7;
a_times_3   =	a*3;
a_divide_3  =	a/3;

b_plus_a    =   b+a;
b_minus_a   =   b-a;
b_times_a   =	b*a;
b_divide_a  =	b/a;

c_plus_6    =   c+6;
c_minus_6   =   c-6;
c_times_3   =	c*3;
c_divide_3  =	c/3;

%% Element-wise Operations
clear
a=[1 2 3;4 5 6;...
    7 8 9];  % You can continue with a command in the next line by typing ...
b=2*ones(3,3); % 'ones' is a function that takes integers as input for the 
               % dimension of a matrix filled with ones that it outputs.
               % click on ones and press F1 to get information on this
               % function.
c_matrixMultiplication = b*a;   % Take a look at the variable c_matrixMultiplication            
c_ElementWise          = b.*a;  % Take a look at the variable c_ElementWise
                                % Matrixpultiplikations are done by typing
                                % '*'
                                % Elementwise operations are done by typing 
                                % '.' 
                                % between variable and operator
c_Elementwise_division = a./b;   

%% Functions
% Matlab has a lot of functions you can use, e.g. tangens, sinus ...
clear

x=1:4;      %Initialize vector x=[1 2 3 4];
y=1:0.5:2.5;  %Initialize vector from 1 to 2.5 in 0.5 steps

tangens = tan(x);    % 'tan' tangens function
sinus   = sin(y);    % 'sin' sinus function
figure               % Opens a figure window in which you can plot your function
%-------------first subplot
subplot(2,3,1)       % first subplot inside plot matrix [2 3](2 rows and 3 coloumns) 
                     % you can also type 231
plot(x,y,'rx')       % plot y values with corresponding x values with red crosses
                     % the comman 'rx' is optionally, by default matlab plots a
                     % blue line
hold on              % keep the plotted values 
plot(x,y)             
%-------------second subplot
subplot(232)
plot(x,sinus, 'go')  % plot sinus values with corresponding x with green 'g' 
                     % circles 'o'
%-------------sixth subplot
subplot(236)
plot(x,tangens)      % plot tangens

%%
clear
clf                  % clears the current (i.e. active) figure

x=-1.2:0.001:1.2;    % making it smoother
y=tanh(2*x)+1.1;     % apllying tangens hyperbolicus function 'tanh' to x values

plot(x,y)            % you dont need to use subplot
xlabel('x values')   % giving the axis names is usually a good idea
ylabel('y values')

y2=sin(10*x);
hold on              % keep the tanh plot and add sinh plot
plot(x,y2,'g')
legend ('tanh(2*x)+1.1','sin(10*x)') % adding a legend is best practice

%% Indexing 
% You can index the values of your variables very easily in Matlab
clear
clc                  % clears your command window
close all            % close all figures
a=rand(5,5)          %initialize 5x5 matrix with random numbers
% single entries
a(1,1)
a(2,3)
% rows
a(:,1) % : here means all rows
%columns
a(2,:) % : here means all columns
%you can also be more specific
a(2:4,1:5)
% or even 
a([1 3], [4 5])

%% Ok thats good for starters, now lets code...
open('matlab_tutorial_part2')
clc
disp('Congratulations! You have successfully completed part 1')
