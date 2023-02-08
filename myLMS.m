% ------------------------------------------------------------------------ 
%  Copyright (C)
%  LiXirong - Wuhan University, China
% 
%  LiXirong <634602068@qq.com> or <lixirong@whu.edu.cn>
%  2018.10.15
% ------------------------------------------------------------------------
% myLMS.m - least mean squares algorithm
%
% Usage: [e, y, w] = myLMS(d, x, mu, M)
%
% Inputs:
% d  - the vector of desired signal samples of size Ns, �ο��ź�
% x  - the vector of input signal samples of size Ns, �����ź�
% mu - the stepsize parameter, ����
% M  - the number of taps. �˲�������/��ͷ��
%
% Outputs:
% e - the output error vector of size Ns
% y  = output coefficients
% w - filter parameters
%
% ------------------------------------------------------------------------
function [e, y, w] = myLMS(d, x, mu, M)

Ns = length(d);
if (Ns <= M)  
    print('error: �źų���С���˲���������');
    return; 
end
if (Ns ~= length(x))  
    print('error: �����źźͲο��źų��Ȳ�ͬ��');
    return; 
end

xx = zeros(M,1);
w1 = zeros(M,1);
y = zeros(Ns,1);
e = zeros(Ns,1);

for n = 1:Ns
    xx = [xx(2:M);x(n)];  %xx(2:M)��ʾ�ӵڶ���Ԫ�ص���M��Ԫ��  ������������;
    y(n) = w1' * xx;   %W1'��ʾW1��ת�þ���1,M��* ��M,1��
    e(n) = d(n) - y(n);%e(n)��ʾ��ԭ����Ƶ����
    w1 = w1 + mu * e(n) * xx; %���ϸ���Ȩ������

    w(:,n) = w1;%�˲����Ĳ���  û��ʵ�������һ��
end

end