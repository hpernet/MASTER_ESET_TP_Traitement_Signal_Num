
function [Rx_signal]=canal_radar(Tx_signal)
d_1_ln=log((sqrt(pi)*124^2/log(450)-exp(7))/pi-71);
d_2_ln=log(((sqrt(pi)*124^2/log(450)-exp(7))/pi)^0.5*28-16.29);
tmax=5e-6; % canal 
Signal=Tx_signal.Tx_signal;
t=Tx_signal.time_scale; 
fc=Tx_signal.fc; 
Z=Tx_signal.Z;
resolution=t(2)-t(1);
t=[0:resolution:tmax];
N=length(t);
delai_1=exp(d_1_ln)/3e8;   % s 
if delai_1>tmax error('Le vehicule est trop éloigné pour détecter!'); end; 
att_propag_dB_1=147.6-20*log10(exp(d_1_ln))-20*log10(fc);
%
canal_1=zeros(1,N);
delai_index_1=round(delai_1/resolution);
canal_1(delai_index_1)=10^(att_propag_dB_1/20);
% p_RF_Tx_2=sqrt(Z)*sqrt(E)*p_test;
Reponse_1=conv(Signal,canal_1);
delai_2=exp(d_2_ln)/3e8;   % s 
if delai_2>tmax error('Le vehicule est trop éloigné pour détecter!'); end; 
att_propag_dB_2=147.6-20*log10(exp(d_2_ln))-20*log10(fc);
%
canal_2=zeros(1,N);
delai_index_2=round(delai_2/resolution);
canal_2(delai_index_2)=10^(att_propag_dB_2/20);
% p_RF_Tx_2=sqrt(Z)*sqrt(E)*p_test;
Reponse_2=conv(Signal,canal_2);
N=length(Reponse_2);
t=[0:N-1]*resolution; 
Bw_bruit=1/(2*resolution)
N0_dBJ=-204;
N0_lin=10^(N0_dBJ/10);
noise_0=sqrt(Z)*sqrt(N0_lin*Bw_bruit)* randn(1,N);
noise_1=sqrt(Z)*sqrt(N0_lin*Bw_bruit)* randn(1,N);
noise_2=sqrt(Z)*sqrt(N0_lin*Bw_bruit)* randn(1,N);
Rx_signal.N=N;
Rx_signal.t=t;
Rx_signal.Reponse_1=Reponse_1;%+noise_1;
Rx_signal.Reponse_2=Reponse_2;%+noise_2;
Rx_signal.No_signal=noise_0;
