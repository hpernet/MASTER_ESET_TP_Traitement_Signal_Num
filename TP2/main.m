clear all 
close all

% Definition des codes 
codeWH1 = [ 1  1  1  1  -1 -1 -1 -1 ];
codeWH2 = [ 1 -1 -1  1  -1  1  1 -1 ];
codeWH3 = [ 1 -1  1 -1  -1  1 -1  1 ];
codeWH4 = [ 1  1 -1 -1  -1 -1  1  1 ];

codeWH5 = [ 1  1  1  1   1  1  1  1   1  1  1  1  1  1  1  1 ];
codeWH6 = [ 1 -1  1 -1   1 -1  1 -1   1 -1  1 -1  1 -1  1 -1 ];
codeWH7 = [ 1  1 -1 -1   1  1 -1 -1   1  1 -1 -1  1  1 -1 -1 ];
codeWH8 = [ 1 -1 -1  1  -1  1  1 -1  -1  1  1 -1  1 -1 -1  1 ];

codeBK  = [ 1 1 1 -1 -1 1 -1 0 ];

% Variables declaration
ChipTime = 0.002;
Fe = 8000;
Te = 1/Fe;
Amplitude = 1;

% Création des symboles
[Symbol_WH1, NbPt_Symbol_WH1 , Fech_WH1] = FCT_CODE_WH(codeWH1,ChipTime,Fe,Amplitude);
[Symbol_WH2, NbPt_Symbol_WH2 , Fech_WH2] = FCT_CODE_WH(codeWH2,ChipTime,Fe,Amplitude);
[Symbol_WH3, NbPt_Symbol_WH3 , Fech_WH3] = FCT_CODE_WH(codeWH3,ChipTime,Fe,Amplitude);
[Symbol_WH4, NbPt_Symbol_WH4 , Fech_WH4] = FCT_CODE_WH(codeWH4,ChipTime,Fe,Amplitude);
[Symbol_WH5, NbPt_Symbol_WH5 , Fech_WH5] = FCT_CODE_WH(codeWH5,ChipTime,Fe,Amplitude);
[Symbol_WH6, NbPt_Symbol_WH6 , Fech_WH6] = FCT_CODE_WH(codeWH6,ChipTime,Fe,Amplitude);
[Symbol_WH7, NbPt_Symbol_WH7 , Fech_WH7] = FCT_CODE_WH(codeWH7,ChipTime,Fe,Amplitude);
[Symbol_WH8, NbPt_Symbol_WH8 , Fech_WH8] = FCT_CODE_WH(codeWH8,ChipTime,Fe,Amplitude);

% Affichage des symboles
absice_pts   = linspace(0, NbPt_Symbol_WH1, NbPt_Symbol_WH1);
absice_temps = linspace(0, ChipTime, NbPt_Symbol_WH1);

% AFFICHAGE PAR POINT 
% figure(21)
% plot(absice_pts, Symbol_WH1)
% axis([0 NbPt_Symbol_WH1 -1.5 1.5])
% figure(22)
% plot(absice_pts, Symbol_WH2)
% axis([0 NbPt_Symbol_WH1 -1.5 1.5])
% figure(23)
% plot(absice_pts, Symbol_WH3)
% axis([0 NbPt_Symbol_WH1 -1.5 1.5])
% figure(24)
% plot(absice_pts, Symbol_WH4)
% axis([0 NbPt_Symbol_WH1 -1.5 1.5])

% AFFICHAGE TEMPS
figure(21)
plot(absice_temps, Symbol_WH1)
axis([0 ChipTime -1.5 1.5])
figure(22)
plot(absice_temps, Symbol_WH2)
axis([0 ChipTime -1.5 1.5])
figure(23)
plot(absice_temps, Symbol_WH3)
axis([0 ChipTime -1.5 1.5])
figure(24)
plot(absice_temps, Symbol_WH4)
axis([0 ChipTime -1.5 1.5])

% Correlation 
[autocorr_WH1,lags_WH1] = xcorr(Symbol_WH1,Symbol_WH1);
[autocorr_WH2,lags_WH2] = xcorr(Symbol_WH2,Symbol_WH2);
[autocorr_WH3,lags_WH3] = xcorr(Symbol_WH3,Symbol_WH3);
[autocorr_WH4,lags_WH4] = xcorr(Symbol_WH4,Symbol_WH4);

[autocorr_WH5,lags_WH5] = xcorr(Symbol_WH5,Symbol_WH5);
[autocorr_WH6,lags_WH6] = xcorr(Symbol_WH6,Symbol_WH6);
[autocorr_WH7,lags_WH7] = xcorr(Symbol_WH7,Symbol_WH7);
[autocorr_WH8,lags_WH8] = xcorr(Symbol_WH8,Symbol_WH8);

NbPt_AutoCorr = length(autocorr_WH1);
absice_AutoCorr   = [-(NbPt_AutoCorr - 1) / 2 : (NbPt_AutoCorr - 1)/2] * Te;

% AFFICHAGE AUTOCORR
figure(31)
plot(absice_AutoCorr, autocorr_WH1)
figure(32)
plot(absice_AutoCorr, autocorr_WH2)
figure(33)
plot(absice_AutoCorr, autocorr_WH3)
figure(34)
plot(absice_AutoCorr, autocorr_WH4)

% CODE A 16 CHIP
NbPt_AutoCorr16 = length(autocorr_WH5);
absice_AutoCorr16   = [-(NbPt_AutoCorr16 - 1) / 2 : (NbPt_AutoCorr16 - 1)/2] * Te;

figure(35)
plot(absice_AutoCorr16, autocorr_WH5)
figure(36)
plot(absice_AutoCorr16, autocorr_WH6)
figure(37)
plot(absice_AutoCorr16, autocorr_WH7)
figure(38)
plot(absice_AutoCorr16, autocorr_WH8)

% INTERCORR

