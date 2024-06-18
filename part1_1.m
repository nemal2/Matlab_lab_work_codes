x=1;
f=1;
t=0:0.005:1;
figure(1)
y = cos(2*pi*f*t);

plot(t,y);
xlabel('Time');
ylabel('y');
title('y vs time');