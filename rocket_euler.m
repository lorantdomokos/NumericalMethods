

function [time, vel, mass] = rocket_euler(simend, delt, params)
    
    c = params.c;
    m0 = params.m0;
    mdot = params.mdot;
    
    g = 9.81;
    
    time = 0:delt:simend;
    
    mass = nan(size(time));
    mass(1) = m0;
    
    vel = nan(size(time));
    vel(1) = 0;

    for ii = 1:length(time) -1
        mass(ii+1) = mass(ii) + mdot * delt;

        dvdt = - g - c * mdot / mass(ii+1);
        vel(ii+1) = vel(ii) + dvdt * delt;

    end
    
    disp(vel)
    %plot(time,mass)
    %legend('Vel','mass')