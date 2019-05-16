function [fw, H, phase] = fft_xjq(x, N, fs)

% 将时域脉冲信号x转换成频域声压级H（频率响应）
% x  时域信号
% N  fft点数
% fs 采样频率
% fw 进行fft后输出频率 s
% H  频域信号幅值
% phase 频域信号相位

% clear;
Ts = 1/fs;
Fs = fs / N;        % 频率分辨率（非常重要的参数！）

p_fft = fft(x, N) * 2 / N ;  % fft(X,N)*2/N 得到时域信号的幅值。但只有当信号的频率是频率分辨率的整数倍时，得到的才是真实的时域信号幅值和相位。否则，频率和相位都会偏移，要进行频谱校正才能得到比较准确的结果。具体的频谱校正应该有很多算法。

% fw = [ -N/2 : N/2-1 ] .* Fs  ;  % 频率转换。fft产生的是以pi为中心的频谱，即频谱范围为[0，2*pi]，但是习惯上使用[-pi，pi]之间的频谱，所以fftshift就是将频谱移位，得到以零为中心的频谱。这里有两种方法显示最后的fft结果。

fw = [ 0: N/2] .* Fs ;   % 从0到N/2 一共(N/2+1)个点

p_linear = abs(p_fft(1: N/2+1));
P_dB = 20 * log10( p_linear / 2e-5 );
 
H = P_dB;
phase = angle(p_fft(1: N/2+1));

% figure;
% semilogx(fw, P_dB, 'k', 'LineWidth',2);
% xlim([50 20e3])
% % ylim([-50 20])
%     ylabel('相对声压级 (dB)','fontweight','bold','fontsize',11);
%     xlabel('频率 (Hz)','fontweight','bold','fontsize',11);
%     set(gca,'fontweight','bold');
%     set(gca,'fontsize',11);
% grid on; 
