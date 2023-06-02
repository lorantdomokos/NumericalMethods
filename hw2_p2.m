clear


step = 0.001;
time = 0:step:10;

dist_human = nan(size(time));
dist_human(1) = 40;
vel_human = 6;

dist_rapt = nan(size(time));
dist_rapt(1) = 0;
vel_rapt = 0;
a_rapt = 4;

for ii = 1:length(time)-1
    vel_rapt = a_rapt * time(ii);
    if vel_rapt > 25
        vel_rapt = 25;
    end

    dist_human(ii+1) = dist_human(ii) + vel_human * step;
    dist_rapt(ii+1) = dist_rapt(ii) + vel_rapt * step;
end

index = 1;
while dist_human(index) > dist_rapt(index)
    index = index + 1;
end

fprintf("You can get about %.4f meters away before you are devoured.\n", dist_human(index-1))

plot(time,dist_rapt)
hold on
plot(time,dist_human)
xlabel('Time (seconds)')
ylabel('Distance (meters)')