function F = simscape_fitness(x)

    F = zeros(1,3);
    penalty=1e6;
    
    %exctract the ga vars
    l1 = x(1); l2 = x(2); R1 = x(3); R2 = x(4);
    
    %set the simulation
    simIn = Simulink.SimulationInput('x2dof_manipulator_sim');
    simIn = simIn.setVariable('l1', l1);
    simIn = simIn.setVariable('l2', l2);
    simIn = simIn.setVariable('R1', R1);
    simIn = simIn.setVariable('R2', R2);
   
    simIn = simIn.setVariable('thickness', 0.002);
    simIn = simIn.setVariable('M', 5.0);
    
    
    %start the simulation
    simOut = sim(simIn); 
    
    %extract the time from that
    simul_time_out = simOut.tout(end);
    
    if simul_time_out < 5.9 % check an unfeasible result
        F=[penalty, penalty, penalty];
        fprintf(' -> FAILED (maybe an unfeasible dynamic)\n');
    else
        DM_time_series = simOut.dyn_mnp; 
        LCI_time_series = simOut.local_CI;
        errorxz = simOut.errorxz;

        Task_DM = mean(DM_time_series); 
        Min_LCI = min(LCI_time_series);
        Min_errorxz = errorxz(end);
        
        %if Min_errorxz > 0.15
        %    F=[penalty, penalty, penalty];
        %else
        F(1) = -Task_DM; F(2) = -Min_LCI; F(3) = Min_errorxz;
        %end
      
        %fprintf(' -> DM=%.2f, LCI=%.2f, Errorxz=%.2f\n', Task_DM, Min_LCI, Min_errorxz);

    end
end