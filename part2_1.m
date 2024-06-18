
t1= -2: 0.005 : 0;
x1= linspace(0,0,length(t1));

t2= 0: 0.005 : 1;
x2= linspace(1,1,length(t2));

t3= 1: 0.005 : 2;
x3= linspace(1,0,length(t3));

t4= 2: 0.005 : 3;
x4= linspace(0,0,length(t4));

t = [t1 t2 t3 t4];
x = [x1 x2 x3 x4];

subplot(6,1,1)
plot(t,x);
grid;
axis([-3 4 -.5 1.5])
xlabel('t')
ylabel('X(t)')
title('Graph of X(t) vs Time')

subplot(6,1,2)
plot(t-1,x);
grid;
axis([-3 4 -.5 1.5])
xlabel('t')
ylabel('X(t+1)')
title('Graph of X(t+1) vs Time')

subplot(6,1,3)
plot(t+1,x);
grid;
axis([-3 4 -.5 1.5])
xlabel('t')
ylabel('X(t-1)')
title('Graph of X(t-1) vs Time')

subplot(6,1,4)
plot(-t,x);
grid;
axis([-3 4 -.5 1.5])
xlabel('t')
ylabel('X(-t)')
title('Graph of X(-t) vs Time')

subplot(6,1,5)
plot(t/2,x);
grid;
axis([-3 4 -.5 1.5])
xlabel('t')
ylabel('X(2t)')
title('Graph of X(2t) vs Time')

subplot(6,1,6)
plot(t*2,x);
grid;
axis([-3 4 -.5 1.5])
xlabel('t')
ylabel('X(t/2)')
title('Graph of X(t/2) vs Time')