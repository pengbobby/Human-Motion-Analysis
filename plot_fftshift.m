function [signal_fft,frequency_bins]=plot_fftshift(signal,frequency)
% see plot_fft.m
signal_fft=abs(fftshift(fft(signal)));
frequency_bins=-frequency/2:frequency/(length(signal)-1):frequency/2;
plot(frequency_bins,signal_fft);
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('{\bf 0-Centered Spectrum}')