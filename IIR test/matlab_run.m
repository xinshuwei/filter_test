clear all;
clc;
fs = 2000;%%采样频率
len=500;
length =1:len;
x=sin(2*pi*10*length/fs)+sin(2*pi*1010*length/fs);%混合信号
%y=zeros(1,len);



Wp=40/(fs/2);Ap=1;%apass freq and db
Ws=900/(fs/2);As=10;%astop freq and db
[N,wc]=buttord(Wp,Ws,Ap,As);
[b,a]=butter(N,wc);
y=filter(b,a,x);
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
save('y2.mat','y');
