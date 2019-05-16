
clear all;
clc;
load('y1.mat','y');
y1=y;
load('y1.mat','y');
y2=y;
plot(y1,y2);
if eq(y1,y2)
    disp("两结果完全相等");
end

