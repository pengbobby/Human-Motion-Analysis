function [signal_fft,frequencyRange]=plot_fft(signal,frequency)
% this function plots the FFT with corresponding frequency of the input
% signal, and at the same time return the FFT and frequency bins.

transformLength=pow2(nextpow2(length(signal)));
signal_fft=abs(fft(signal,transformLength));
frequencyRange=(0:transformLength-1)*(frequency/transformLength);
plot(frequencyRange,signal_fft);
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('{\bf Spectrum}')