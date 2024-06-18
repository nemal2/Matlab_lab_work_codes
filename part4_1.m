figure(4)
d_t=0.01;
t1=0:d_t:2;
x1=ones(size(t1));
subplot(3,1,1);
plot(t1,x1);
xlabel('time');
ylabel('x1(t)');
axis([0 2 0 2]);
title('The Graph of x1(t) Wave');

%Wav 2
t2 = 0:d_t:1;                            
h1 = t2;                         
subplot(3,1,2);                       
plot(t2,h1);                      
xlabel('time');               
ylabel('h1(t)');                       	
axis([0 1 0 1]);                        
title('The Graph of h1(t) Wave');

%con.
t3 = 0:d_t:3;                           
y = conv(x1, h1)*d_t;                  
subplot(3,1,3);                         
plot(t3, y);                          
xlabel('time');              
ylabel('Y1(t)');                       
axis([0 3 0 1]);                        
title('The Graph of Convolution of X1(t) and h1(t)');