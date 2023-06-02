clear


step_sizes = [60,30,15,5];
colors = ["r","g","b","m"];
markers = ["o","x","s","d"];

t_end = 120;

pars = struct('c',4000,'m0',3000000,'mdot',-12500);

for ii = 1:length(step_sizes)

    [time, vel, mass] = rocket_euler(t_end,step_sizes(ii),pars);

    plot(time, vel, 'Marker', markers(ii), 'Color', colors(ii))
    hold on

end

smooth_time = linspace(0, t_end, 500);
true_vel = -9.81 .* smooth_time - pars.c .* log((pars.m0 + smooth_time .* ...
    pars.mdot) ./ pars.m0);
plot(smooth_time,true_vel, 'Color', 'k')

xlabel('Time (Seconds)')
ylabel('Velocity (m/s)')
legend('60 second step size','30 second step size', '15 second step size',...
    '5 second step size', 'Analytical Solution', 'Location', 'northwest')
title("Euler's method and step size" )