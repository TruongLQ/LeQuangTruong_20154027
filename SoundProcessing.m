%Bai tap Da phuong tien
%___________________________________%

clear all;
clc;
%Tao file melody.wav
fs = 44100;
t = 0 : 1/fs : 0.5;
f1 = 300;
f2 = 2*f1;
f3 = 3*f1;
f4 = 4*f1;
f5 = 5*f1;
f6 = 6*f1;
f7 = 7*f1;
f8 = 8*f1;

A1 = .5;
A2 = A1/2;
A3 = A1/3;
A4 = A1/4;
A5 = A1/5;
A6 = A1/6;
A7 = A1/7;
A8 = A1/8;

w = 0;
y1 = A1*sin(2*pi*f1*t+w);
y2 = A2*sin(2*pi*f2*t+w);
y3 = A3*sin(2*pi*f3*t+w);
y4 = A4*sin(2*pi*f4*t+w);
y5 = A5*sin(2*pi*f5*t+w);
y6 = A6*sin(2*pi*f6*t+w);
y7 = A7*sin(2*pi*f7*t+w);
y8 = A8*sin(2*pi*f8*t+w);
y = [y1 y4 y6 y3 y8 y5 y7 y2 y1 y4 y6 y3 y8 y5 y7 y2]
data = audioread('orig_input.wav');
x = data';
data_new = y + (x(1:length(y)));
audiowrite('melody.wav',data_new,44100);
sound(data_new,44100);

%Thuc hien bien doi FFT cho file medoly.wav
Y = fft(data_new);
plot(abs(Y));
N = length(data_new);
transform = fft(data_new,N)/N;
magTransform = abs(transform);
faxis = linspace(-N/2, N/2, N);
plot(faxis,fftshift(magTransform))
xlabel('Frequency (Hz)')
win = 128;
hop = win/2;
nfft = win;
spectrogram(data_new,win,hop,nfft,fs,'yaxis')
yt = get(gca, 'YTick');
set(gca,'YTickLabel',sprintf('%.0f|',yt))
title('Spectrogram of file medoly.wav');




