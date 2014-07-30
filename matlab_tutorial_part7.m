clear       % clearworkspcae
close all   % close all figures
clc         % clear commands
% In this tutorial you are going to implement a very helpful function to
% check on the correctness of your neural network implementation: 
% numerical gradient check.
% As we have already dicussed training a neural network is all about
% gradients. In order to find the gradients for the weights we are deriving
% our cost function with respect to the weights. These gradients can also
% be calculated in a different way, i.e. nunmerically. Before checking our
% neural network we will test our numerical gradient check on a function
% for which we know the derivatives:
fcn=@(x1,x2) 0.3*x1.^2+0.05*x2.^2+sin(x2)+x1+0.5*x2;  % function
dfcn_wrt_x1=@(x1) 0.6*x1+1;                           % derivative wrt x1
dfcn_wrt_x2=@(x2) 0.1*x2+cos(x2)+0.5;              	  % derivative wrt x2

x1=-2*pi:0.3:2*pi; 
x2=-2*pi:0.3:2*pi;

[xm,ym]=meshgrid(x1,x2);    % this produces the 2D grid with the x1 and x2 
                            % values necessary for a surf plot
figure(1)
set(1,'position',[ 1          41        1920        1084])
subplot(131)
surf(x1,x2,fcn(xm,ym))
xlabel('x1')
ylabel('x2')
title('function')
shading interp;
axis equal

subplot(132)
plot(x1,dfcn_wrt_x1(x1))
title('function wrt x1')
xlabel('x1')
axis equal

subplot(133)
plot(x1,dfcn_wrt_x2(x2))
title('function wrt x2')
xlabel('x2')
axis equal

%% Numerical Gradient Check
[numgrad1,numgrad2]=numericalGradientCheck(fcn,x1,x2);

subplot(132)
hold on
plot(x1,numgrad1,'-.r')
legend('analytical gradient','numerical gradient')

subplot(133)
hold on
plot(x2,numgrad2,'-.r')
legend('analytical gradient','numerical gradient')

% The numerical gradient should look just the same as the analytical.
% They can't be exactly the same because of roundoff errors, here is the
% difference:
disp('difference between numerical and analytical gradient wrt x1')
disp(norm(numgrad1-dfcn_wrt_x1(x1))/norm(numgrad1+dfcn_wrt_x1(x1)))
disp('difference between numerical and analytical gradient wrt x2')
disp(norm(numgrad2-dfcn_wrt_x2(x2))/norm(numgrad2+dfcn_wrt_x2(x2)))

if norm(numgrad1-dfcn_wrt_x1(x1))/norm(numgrad1+dfcn_wrt_x1(x1))<1e-9 && norm(numgrad2-dfcn_wrt_x2(x2))/norm(numgrad2+dfcn_wrt_x2(x2))<1e-9
    disp('Congratulations! Your numerical gradient is very very close to the analytical gradient')
else
    error('the difference between analytical and numerical gradient is too big, check on you calculation again')
end

