
clear all;
clc;
%% 信号
fs = 2000;%%采样频率
len=500;
length =1:len;
x=sin(2*pi*10*length/fs)+sin(2*pi*1010*length/fs);%混合信号
y=zeros(1,len);

%% 用fdatool 生成的参数 biquard滤波器实现
Gain = 0.6778956368684;
B=[1 1 0];
A=[1 0.3557912737369  0];

%可以用注释这种方法
% w0=[0 0 0];
% w1=[0 0 0];
%  
% for i=1:len
%     w0(1)=x(i);
%     c=B(1)*w0(1)+B(2)*w0(2)+B(3)*w0(3);
%     y(i)=c*Gain-A(2)*w1(2)-A(3)*w1(3);
%     w1(1)=y(i);
%     w0(3)=w0(2);w0(2)=w0(1);
%     w1(3)=w1(2);w1(2)=w1(1);
% end



w0=[0 0 0];
for i=1:len
    w0(1)=A(1)*x(i)-A(2)*w0(2)-A(3)*w0(3);
    y(i)=(B(1)*w0(1)+B(2)*w0(2)+B(3)*w0(3))*Gain; 
    w0(3)=w0(2);
    w0(2)=w0(1);
end

%% 两种形式的C代码  matlab用的第二种
% B[0]=1;B[1]=1;B[2]=0;
% A[0]=1;A[1]=0.3557912737369;A[2]=0;
% Gain=0.6778956368684;
% w_x[0]=w_x[1]=w_x[2]=0;
% w_y[0]=w_y[1]=w_y[2]=0;
% for(int i=0;i<len;i++)
% {
% 	w_x[0]=x[i];
% 	w_y[0]=(B[0]*w_x[0]+B[1]*w_x[1]+B[2]*w_x[2])*Gain-w_y[1]*A[1]-w_y[2]*A[2];
% 	y[i]=w_y[0]/A[0];
% 	w_x[2]=w_x[1];w_x[1]=w_x[0];
% 	w_y[2]=w_y[1];w_y[1]=w_y[0];
% 	}



%    w[0]=w[1]=w[2]=0;
% 	for(int i=0;i<len;i++)
% 	{
% 		w[0]=A[0]*x[i]-A[1]*w[2]-A[2]*w[2];
% 		y[i]=(B[0]*w[0]+B[1]*w[1]+B[2]*w[2])*Gain;
% 		w[2]=w[1];w[1]=w[0];
% 	}





%% 画图
[fw1,db1,arg1]=fft_xjq(x,len,fs);
[fw,db2,arg2]=fft_xjq(y,len,fs);
figure(1)
subplot(221)
plot(x)
subplot(222)
plot(y)
subplot(223)
plot(fw,db1)
subplot(224)
plot(fw,db2)
save('y1.mat','y');








