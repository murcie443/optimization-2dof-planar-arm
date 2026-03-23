clear;clc;close all;

manip_parameters;

% decision vars: x = [L1, L2, R1, R2]
nvars = 4; % number of variables

% lower bounds from the paper (l1, l2, R1, R2)
lb = [166.67/1000, 333.33/1000, 0.01, 0.01];

% upper bounds
ub = [666.67/1000, 833.33/1000, 0.05, 0.05];

% constraint for the opt: l1+l2= 1 [m] 
Aeq= [1 1 0 0];
beq=[1];

% options_gamultiobj:
% every set of vars is simulated automatically and can take a lot of time
% this is the final script with 100 popsize and 50 maxgen, for debug use
% lower numbers. 
% options_paretosearch:
% has almost the same syntax as the genetic algorithm;
% Converges to the Pareto front with far fewer iterations.

% I suggest to disable the "Open mechanincs explorer on
% model update or simulation" flag in the simulink file, 
% for a lot of iterations.

options_gamultiobj = optimoptions('gamultiobj', ...
    'Display', 'iter',...
    'PopulationSize', 60, ...       % number for configuration per iteration
    'MaxGenerations', 50);            % number of iterations 
   
    %'Display', 'iter', ...          % trace the current iteration
    % 'PlotFcn', @gaplotpareto, ...   % show the pareto front in real time


options_paretosearch = optimoptions('paretosearch', ...
    'Display', 'iter',...
    'ParetoSetSize', 20, ...        % Number of points to keep on the Pareto front
    'MaxIterations', 50);           % Maximum number of iterations    


fprintf('\nThe optimization is starting. This takes time.\n\n\n');

% In a loop: 

tic; % start to trace the time for a check later



%[x_pareto, fval, exitflag] = gamultiobj(fun, nvars, A, b, Aeq, beq, lb, ub, nonlcon, options)
[x_pareto, fval_pareto, exitflag] = gamultiobj(@simscape_fitness, nvars, [], [], Aeq, beq, lb, ub, [], options_gamultiobj);

% Syntax: [x, fval, exitflag] = paretosearch(fun, nvars, A, b, Aeq, beq, lb, ub, nonlcon, options)
%[x_pareto, fval_pareto, exitflag] = paretosearch(@simscape_fitness, nvars, [], [], Aeq, beq, lb, ub, [], options_paretosearch);




total_time = toc;

% end loop

fprintf('\nOptimization Completed in %.2f s.\n', total_time);

%save the data 
save('pareto_results_backup.mat', 'x_pareto', 'fval_pareto');

Task_DM = -fval_pareto(:, 1); %maximization fun
LCI = -fval_pareto(:, 2);  %maximization fun
Min_errorxz = fval_pareto(:,3); %min fun

%commands to prevent the UI from freezing
pause(1);   
drawnow;    


%plot the pareto front 
figure('Name', 'Pareto Front 3D', 'Color', 'w');
scatter3(Task_DM, LCI, Min_errorxz, 60, LCI, 'filled', 'MarkerEdgeColor', 'k');
colormap(jet);
cb = colorbar;
cb.Label.String = 'LCI Min ';
title('Pareto Front: Trade-off Performance Measures');
xlabel('Dynamic Manipulability');
ylabel('LCI');
zlabel('Error XZ');
grid on; view(45, 30);


fprintf('\n [MAX_DM, MAX_LCI, Min_Errorxz]: \n')
disp(' ------------------------------------');
disp(fval_pareto);

fprintf('\n            [L1, L2, R1, R2] (m) \n');
disp('   --------------------------------------');
disp(x_pareto);