h=0.01;
t=0:h:300000;  
nn=length(t);
DDD=[0.005 0.0075 0.01 0.0125 0.015 0.0175 0.02 0.0225 0.025]; % set the noise D value that you want to calculate

M=[10,10]; M1=M(1,1); M2=M(1,2); %Starting point for a stochastic trajectory

x(1,1)=M1;
y(1,1)=M2;
a1= 0.85;
b1= 0.15;
c = 5;
n = 0.25;
G = 0.315;
B = 1.4;
a = 0.028;
q = 0.02;
g = 1;
v = 0.25;
T = 0.0001;
k = 0.2;
I1= 0.0285;
I2= 0.0285;
A = 0.025;
b = 0.25;
J = 2;
f = 0.625; %delta_f

for D = DDD
    x=zeros(1,nn);
    x(1,1)=M1;
    y=zeros(1,nn);
    y(1,1)=M2;
    ACC=zeros(1,60000001);
    kk=1;
    while kk<=75  
        for i=1:nn-1
            y(1,i+1) = y(1,i) + (((a1-b1*tanh(y-4-c))/ ... 
               (1+exp(((G*(1+tanh(B*(1+tanh(g-a*log(1+(f/v))*(x(1,i)+y(1,i)-8))) ...
               -q*(1+tanh(g+B*(1+tanh(g-a*log(1+(f/v))*(x(1,i)+y(1,i)-8))))) ...
               -log(1+(f/v))*J*(x(1,i)-4))) ...
               +G*(1+tanh(B*(1+tanh(g-a*log(1+(f/v))*(x(1,i)+y(1,i)-8))) ...
               -q*(1+tanh(g+B*(1+tanh(g-a*log(1+(f/v))*(x(1,i)+y(1,i)-8))))) ...
               -J*log(1+(f/v))*(y(1,i)-4))))+n*(y(1,i)-4)-T)/k))) ...
               -I1*log(1+(f/v))*(x(1,i)-4)-A*(y(1,i)-4)+b)*h + sqrt(2*D*h)*randn();
            x(1,i+1) = x(1,i) + ((((a1-b1*tanh(x-4-c))/ ...
               (1+exp(((G*(1+tanh(B*(1+tanh(g-a*log(1+(f/v))*(x(1,i)+y(1,i)-8))) ...
               -q*(1+tanh(g+B*(1+tanh(g-a*log(1+(f/v))*(x(1,i)+y(1,i)-8))))) ...
               -log(1+(f/v))*J*(x(1,i)-4))) ...
               +G*(1+tanh(B*(1+tanh(g-a*log(1+(f/v))*(x(1,i)+y(1,i)-8))) ...
               -q*(1+tanh(g+B*(1+tanh(g-a*log(1+(f/v))*(x(1,i)+y(1,i)-8))))) ...
               -J*log(1+(f/v))*(y(1,i)-4))))+n*(x(1,i)-4)-T)/k))) ...
               -I2*log(1+(f/v))*(y(1,i)-4)-A*(x(1,i)-4)+b)*h + sqrt(2*D*h)*randn();
            if x(1,i+1)<0
                x(1,i+1)=x(1,i);
            end
            if y(1,i+1)<0
                y(1,i+1)=y(1,i);
            end
        end 
        ACC(1,:) = ACC(1,:) + xcov(x,y,'coeff');
        x=zeros(1,nn);
        x(1,1)=M1;
        y=zeros(1,nn);
        y(1,1)=M2;
        kk=kk+1;
    end
    ACC0=(ACC(1,30000001:60000001)-fliplr(ACC(1:30000001)))/75;
    disp(['D=',num2str(D),' xcov=',num2str(sum(abs(ACC0(1,:)))/30000001)])  
end