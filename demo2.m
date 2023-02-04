% ------------------------------------------------------------------------ 
%  Copyright (C)
%  LiXirong - Wuhan University, China
% 
%  LiXirong <634602068@qq.com> or <lixirong@whu.edu.cn>
%  2018.12.21
% ------------------------------------------------------------------------
%
% demo2.m - ANC demo��ʹ������Ӧ�˲��㷨��ANCdemo��
% Including LMS��NLMS��RLS algorithm
% Including��
%     1��audio + white noise ��Ƶ����������
%     2��single frequency signal + white noise ��Ƶ����������
% Parameters��
%     x     �� input signal      �����ź�
%     d     �� reference signal  �ο��ź�
%     y     �� output signal     ����ź�
%     e     �� error signal      ����ź�
%     mu    �� LMS stepsize      LMS�㷨����
%     mu2   �� NLMS stepsize     NLMS�㷨����
%     a     �� NLMS bias         NLMS�㷨ƫ�ò���
%     lamda �� RLS weight        RLS�㷨Ȩ��
%
%  System��
%    signal+noise_____________d(n)___________
%                                                                         +��
%    noise����x(n)����filter������y(n)�� - ��-O����e(n)����
%                                     ��_____________________|
%
% ------------------------------------------------------------------------

close all;clear;clc;

%% 1��audio + white noise����Ƶ+��������
[signal,fs] = audioread('handel.wav');
noise = wgn(length(signal), 1, -20); %������˹�������ĺ��� -20dBW
d = signal + noise;
x = sin(1./(1+exp(-noise)));
mu =  0.1;
mu2 = 0.5;
a = 0.01;
lamda = 0.999;
M = 20;

%% 2��single frequency signal + white noise����Ƶ+��������
% fs = 8000;
% t = 0:1/fs:4;
% signal = cos(2*pi*t*20)';
% noise = wgn(1,length(t),-20)';
% d = noise + signal;
% x = sin(1./(1+exp(-noise)));
% 
% mu =  0.1;
% mu2 = 0.8;
% a = 0.01;
% lamda = 0.9999;
% M = 20;

%% LMS\NLMS\RLS performance��LMS\NLMS\RLS���ܱȽϣ�


% run algorithm (�����㷨)
%����tic toc����¼ʱ��
tic
[e1, y1, w1] = myLMS(d, x, mu, M);
toc
tic
[e2, y2, w2] = myNLMS(d, x,mu2, M, a);
toc
tic
[e3, y3, w3] = myRLS(d, x,lamda,M);
toc

% ���������źš��ο��źš��˲���������
figure()
subplot(5,2,1)
plot((1:length(x))/fs,x);
xlabel('time');
title('x(n)');
subplot(5,2,2)
plot((1:length(d))/fs,d);
xlabel('time');
title('d(n)');
subplot(5,2,3)
plot((1:length(y1))/fs,y1);
xlabel('time');
title('LMS y(n)');
subplot(5,2,5)
plot((1:length(y2))/fs,y2);
xlabel('time');
title('NLMS y(n)');
subplot(5,2,7)
plot((1:length(y3))/fs,y3);
xlabel('time');
title('RLS y(n)');
subplot(5,2,4)
plot((1:length(e1))/fs,e1);
xlabel('time');
title('LMS e(n)');
subplot(5,2,6)
plot((1:length(e2))/fs,e2);
xlabel('time');
title('NLMS e(n)');
subplot(5,2,8)
plot((1:length(e3))/fs,e3);
xlabel('time');
title('RLS e(n)');

subplot(5,2,9)
plot((1:length(noise))/fs,noise);
xlabel('time');
title('noise');

% �����ο��ź����˲�����Ĳ�ֵ(ANC����ź�)
figure()
subplot(3,1,1)
plot(e1)
title('LMS ANC���')
subplot(3,1,2)
plot(e2)
title('NLMS ANC���')
subplot(3,1,3)
plot(e3)
title('RLS ANC���')

% �Ƚ��ȶ���������
% xx1 = clearspeech(length(x)-3000:length(x));
% ee1 = e1(length(x)-3000:length(x));
% ee2 = e2(length(x)-3000:length(x));
% ee3 = e3(length(x)-3000:length(x));
% yy1 = y1(length(x)-3000:length(x));
% yy2 = y2(length(x)-3000:length(x));
% yy3 = y3(length(x)-3000:length(x));
% SNR1 = snr(xx1,ee1)
% SNR2 = snr(xx1,ee2)
% SNR3 = snr(xx1,ee3)

%% ����RLS ANC����������RLSЧ����ã�
sound(e3,fs);
