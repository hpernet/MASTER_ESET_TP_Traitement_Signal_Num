close all;
clear all;

load consoelq.mat;
n = length(ce);
% fe = 1; %cycles par heure
% fe = 24 * 7; %cycles par semaine
fe = 24*365; %cycles par ann�es

 %% En temporel
 figure('Name','TD2');
 plot(ce);
 
 %% Analyse spectrale
 [S,fr]= spectre4(ce(1,:),fe);
 figure(2);
 plot(fr,S);
 grid;
 title("Spectre du signal � filtrer");
 xlabel("Fr�quence (Hz)");
 figure(3);
 plot(fr,20*log10(S));
 grid;
 title("Spectre signal � filtrer en dB");
 xlabel("Fr�quence (Hz)");
 
 %133 Hz et 100 Hz en composantes
 
 %%Synth�se du filtre
 fc = 110/fe; %fr�quence de coupure r�duite
 % ne pas oublier: normaliser par fe
 bt=20/fe; % bande de transition
 
 N=round(2/bt); % ordre du filtre
 %copyrirht by Benoit: veuillez donner 2 euros pour m'exam
 rif=fir1(N-1, 2*fc, hamming(N)); % synthese r�ponse impulsionelle
 
 %fonction de transfert
 [H, fr]=freqz(rif,1,512,fe);
 %affichage
 figure(4);
 plot((0:N-1)/fe,rif);
 grid;
 title(" R�ponse impulsionelle passe-bas");
 xlabel("temps(s)");
 figure(5);
 plot(fr,abs(H));
 grid;
 title("Module fonction de transfert");
 xlabel("Fr�quence (Hz)");
 
 % Filtrage passe-bas
 
 yf=filter(rif,1,ce(1,:));
 
 %Filtrage passe bas: afficha r�sultats
 
 figure(6);
 plot(n/fe, ce(1,:), 'b');
 hold on
 plot(n/fe, yf, 'r');
 legend(' Signal de base ', ' signal filtr� passe-bas ');
 title("R�sultats filtrage: allure temporelle");
 grid;
 xlabel ("Temps(s)");
 %Spectre
[S,fr]=spectre4(ce(1,:),fe);
[Sf, fr]=spectre4(yf,fe);
figure(7);

plot(fr,Sf);
 