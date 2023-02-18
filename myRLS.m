% ------------------------------------------------------------------------ 
%  Copyright (C)
%  LiXirong - Wuhan University, China
% 
%  LiXirong <634602068@qq.com> or <lixirong@whu.edu.cn>
%  2018.10.15
% ------------------------------------------------------------------------
% myRLS.m - least mean squares algorithm
%
% Usage: [e, y, w] = myRLS(d, x, lamda, M)
%
% Inputs:
% d  - the vector of desired signal samples of size Ns, 参考信号
% x  - the vector of input signal samples of size Ns, 输入信号
% lamda - the weight parameter, 权重
% M  - the number of taps. 滤波器阶数
%
% Outputs:
% e - the output error vector of size Ns
% y - output coefficients
% w - filter parameters
%
% ------------------------------------------------------------------------
function [e, y] = myRLS(d, x,lamda,M)
%function [e, y, w] = myRLS(d, x,lamda,M)

Ns = length(d); %信号长度
% if (Ns <= M)  
%     %print('error: 信号长度小于滤波器阶数！');
%     return; 
% end
% if (Ns ~= length(x))
%     %print('error: 输入信号和参考信号长度不同！');
%     return;
% end


I = eye(M);%M为滤波器阶数 创建一个M阶的单位方阵
a = 0.01; %a为M阶方阵的系数
p = a * I;

%x = x; %在输入信号x前补上M-1个0，使输出y与输入具有相同长度
w1 = zeros(M,1);%zeros创建全0矩阵
y = zeros(Ns, 1);
e = zeros(Ns, 1);
xx = zeros(M,1);

for n = 1:Ns  %在c代码中直接改为单个数据输入即可，可以去掉一个for循环
    xx = [x(n); xx(1:M-1)];  %将xx的M个元素放置在X向量的尾部
    k = (p * xx) ./ (lamda + xx' * p * xx);  %实际上只用到了第一列
    y(n) = xx'*w1;  %xx'表示xx的转置矩阵
    e(n) = d(n) - y(n);   %最终的e(n)即是还原后的信号
    w1 = w1 + k * e(n);
    p = (p - k * xx' * p) ./ lamda;
    %w(:,n) = w1; %表示矩阵的第n列
end

end