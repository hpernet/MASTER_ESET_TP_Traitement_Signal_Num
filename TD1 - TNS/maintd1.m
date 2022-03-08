close all; %ferme toutes les fenetres
clear all; %efface toutes les variables

load consoelq.mat;
n = length(ce);
% fe = 1; %cycles par heure
% fe = 24 * 7; %cycles par semaine
fe = 24*365; %cycles par années

fenetre = "hanning";

[S,k]=spectre(ce(1,:), fe, fenetre);
figure(1);
subplot(2,1,1);
plot(ce);
subplot(2,1,2);
plot(k,20*log10(S));


% [x,n,fe]=signalanalyse();
%
% [S,k]=spectre(x, fe, fenetre);
% 
% figure(1);
% subplot(2,1,1);
% plot(n,x);
% subplot(2,1,2);
% plot(k,S);
