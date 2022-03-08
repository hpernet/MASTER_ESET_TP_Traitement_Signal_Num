close all
clear all


 [y,n,fe]=signalfiltre();

 %% En temporel
 figure('Name','TD2');
 plot(n/fe,y);
 axis([0 0.3 -2 2]);
 grid;
 title(" Signal temporel à filtrer")
 xlabel(" temps (s) ")
 
 %% Analyse spectrale
 [S,fr]= spectre4(y,fe);
 figure(2);
 plot(fr,S);
 axis([90 150 0 1]);
 grid;
 title("Spectre du signal à filtrer");
 xlabel("Fréquence (Hz)");
 figure(3);
 plot(fr,20*log10(S));
 axis([90 150 -150 0]);
 grid;
 title("Spectre signal à filtrer en dB");
 xlabel("Fréquence (Hz)");
 
 %133 Hz et 100 Hz en composantes
 
 %%Synthèse du filtre
 fc = 110/fe; %fréquence de coupure réduite
 % ne pas oublier: normaliser par fe
 bt=20/fe; % bande de transition
 
 N=round(2/bt); % ordre du filtre
 %copyrirht by Benoit: veuillez donner 2 euros pour m'exam
 rif=fir1(N-1, 2*fc, hamming(N)); % synthese réponse impulsionelle
 
 %fonction de transfert
 [H, fr]=freqz(rif,1,512,fe);
 %affichage
 figure(4);
 plot((0:N-1)/fe,rif);
 grid;
 axis([0 0.1 -0.05 0.25]);
 title(" Réponse impulsionelle passe-bas");
 xlabel("temps(s)");
 figure(5);
 plot(fr,abs(H));
 grid;
 title("Module fonction de transfert");
 xlabel("Fréquence (Hz)");
 
 % Filtrage passe-bas
 
 yf=filter(rif,1,y);
 
 %Filtrage passe bas: afficha résultats
 
 figure(6);
 plot(n/fe, y, 'b', n/fe, yf, 'r');
 legend(' Signal de base ', ' signal filtré passe-bas ');
 title("Résultats filtrage: allure temporelle");
 grid;
 axis([0 0.2 -2 2])
 xlabel ("Temps(s)");
 %Spectre
[S,fr]=spectre4(y,fe);
[Sf, fr]=spectre4(yf,fe);
figure(7);

plot(fr,Sf);
 