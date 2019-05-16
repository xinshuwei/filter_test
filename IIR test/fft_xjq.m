function [fw, H, phase] = fft_xjq(x, N, fs)

% ��ʱ�������ź�xת����Ƶ����ѹ��H��Ƶ����Ӧ��
% x  ʱ���ź�
% N  fft����
% fs ����Ƶ��
% fw ����fft�����Ƶ�� s
% H  Ƶ���źŷ�ֵ
% phase Ƶ���ź���λ

% clear;
Ts = 1/fs;
Fs = fs / N;        % Ƶ�ʷֱ��ʣ��ǳ���Ҫ�Ĳ�������

p_fft = fft(x, N) * 2 / N ;  % fft(X,N)*2/N �õ�ʱ���źŵķ�ֵ����ֻ�е��źŵ�Ƶ����Ƶ�ʷֱ��ʵ�������ʱ���õ��Ĳ�����ʵ��ʱ���źŷ�ֵ����λ������Ƶ�ʺ���λ����ƫ�ƣ�Ҫ����Ƶ��У�����ܵõ��Ƚ�׼ȷ�Ľ���������Ƶ��У��Ӧ���кܶ��㷨��

% fw = [ -N/2 : N/2-1 ] .* Fs  ;  % Ƶ��ת����fft����������piΪ���ĵ�Ƶ�ף���Ƶ�׷�ΧΪ[0��2*pi]������ϰ����ʹ��[-pi��pi]֮���Ƶ�ף�����fftshift���ǽ�Ƶ����λ���õ�����Ϊ���ĵ�Ƶ�ס����������ַ�����ʾ����fft�����

fw = [ 0: N/2] .* Fs ;   % ��0��N/2 һ��(N/2+1)����

p_linear = abs(p_fft(1: N/2+1));
P_dB = 20 * log10( p_linear / 2e-5 );
 
H = P_dB;
phase = angle(p_fft(1: N/2+1));

% figure;
% semilogx(fw, P_dB, 'k', 'LineWidth',2);
% xlim([50 20e3])
% % ylim([-50 20])
%     ylabel('�����ѹ�� (dB)','fontweight','bold','fontsize',11);
%     xlabel('Ƶ�� (Hz)','fontweight','bold','fontsize',11);
%     set(gca,'fontweight','bold');
%     set(gca,'fontsize',11);
% grid on; 
