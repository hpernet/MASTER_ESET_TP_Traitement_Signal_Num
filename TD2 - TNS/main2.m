close all; %ferme toutes les fenetres
clear all; %efface toutes les variables

fenetre = "hanning";

[y,n,fe]=signalfiltre();
[S,k]=spectre(y, fe, fenetre);



%%Synth�se du filtre
fc = 110/fe; %fr�quence de coupure r�duite
 
bt=20/fe; % bande de transition
 
N=round(2/bt) % ordre du filtre

rif=fir1(N-1, 2*fc, hamming(N)); % synthese r�ponse impulsionelle

yf = filter(rif, 1, y);
[Sf,k]=spectre(yf, fe, fenetre);

figure(1);
subplot(2,1,1);
plot(n/fe,y);
hold on;
plot(n/fe, yf, 'r');
subplot(2,1,2);
plot(k, S);
hold on;
plot(k, Sf);

