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
% d  - the vector of desired signal samples of size Ns, �ο��ź�
% x  - the vector of input signal samples of size Ns, �����ź�
% lamda - the weight parameter, Ȩ��
% M  - the number of taps. �˲�������
%
% Outputs:
% e - the output error vector of size Ns
% y - output coefficients
% w - filter parameters
%
% ------------------------------------------------------------------------
function [e, y] = myRLS(d, x,lamda,M)
%function [e, y, w] = myRLS(d, x,lamda,M)

Ns = length(d); %�źų���
% if (Ns <= M)  
%     %print('error: �źų���С���˲���������');
%     return; 
% end
% if (Ns ~= length(x))
%     %print('error: �����źźͲο��źų��Ȳ�ͬ��');
%     return;
% end


I = eye(M);%MΪ�˲������� ����һ��M�׵ĵ�λ����
a = 0.01; %aΪM�׷����ϵ��
p = a * I;

%x = x; %�������ź�xǰ����M-1��0��ʹ���y�����������ͬ����
w1 = zeros(M,1);%zeros����ȫ0����
y = zeros(Ns, 1);
e = zeros(Ns, 1);
xx = zeros(M,1);

for n = 1:Ns  %��c������ֱ�Ӹ�Ϊ�����������뼴�ɣ�����ȥ��һ��forѭ��
    xx = [x(n); xx(1:M-1)];  %��xx��M��Ԫ�ط�����X������β��
    k = (p * xx) ./ (lamda + xx' * p * xx);  %ʵ����ֻ�õ��˵�һ��
    y(n) = xx'*w1;  %xx'��ʾxx��ת�þ���
    e(n) = d(n) - y(n);   %���յ�e(n)���ǻ�ԭ����ź�
    w1 = w1 + k * e(n);
    p = (p - k * xx' * p) ./ lamda;
    %w(:,n) = w1; %��ʾ����ĵ�n��
end

end