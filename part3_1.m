figure(2)
t=2;
p=t/3;
k=-20:1:20;
yk = (p/t)*sinc(k*p/t);
stem(k,yk);
grid;
title('Furier Series coefficient for k=-20 to k =20');
xlabel('k');
ylabel('V[k]');
disp(yk); 



