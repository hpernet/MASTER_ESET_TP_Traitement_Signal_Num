clear all;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 2 DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Chargement donn?es audio  
 [EnrAudio, Fe]  = audioread('EnreAudioBruite16Bits_1BruitFaibleNew.wav');

 % Nombre de point ou d'?chantillon de l'enregistrement audio
 NbPoint = length(EnrAudio); % A COMPLETER

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 3  DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% periode d'?chantillonnage
Te = 1/Fe;  % A COMPLETER

%Vecteur temps pour le trac? dans le domaine temps
Temps = linspace(0, NbPoint*Te, NbPoint);

% trac? de l'enregistrement audio dans le domaine temps
figure(1);
plot(Temps,EnrAudio); % A COMPLETER
title('Enregistrement audio bruit?');
xlabel('Temps (s)');
ylabel('Amplitude (V)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 4  DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%calcul de la TF de l'enregistrement audio bruit? puis du module et de la phase
TF_audioBruite = fftshift(fft(EnrAudio, NbPoint));
Module_TF = abs(TF_audioBruite) / NbPoint;
Phase_TF  = (360/(2*pi)) * angle(TF_audioBruite);

% pas frequentiel
PasFreq = Fe / NbPoint; % A COMPLETER

%Vecteur Frequence pour le trac? dans le domaine Frequentiel
Frequence = [-(NbPoint-1)/2 : (NbPoint-1)/2] * PasFreq; % -Fe/2:PasFreq:Fe/2;

% Trac? de l'enregistrement audio dans le domaine fr?quence
figure(2);
subplot(2,1,1)
   plot(Frequence, Module_TF)
   title('Module du spectre de l''enregistrement audio bruit?');
   xlabel('Frequence (Hz)');
   ylabel('Amplitude (V)');
subplot(2,1,2)
   plot(Frequence, Phase_TF)
   title('Phase de la TF de l''enregistrement audio bruit?');
   xlabel('Frequence (Hz)');
   ylabel('Phase (Degr?)');   
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 6  DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

% Ordre du filtre. 
N = 10; % A COMPLETER

% Frequence de coupure
Fcut = 600; % A COMPLETER

% Creation du filtre  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (voir sur internet le fonctionnement des filtres si
% l'aide de matlab ne le propose pas)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% BUTTER 
  [num_butter, denum_butter] = butter(N , 2*Fcut/Fe, 'low'); %  A COMPLETER
 
% OU CHEBYSCHEV
 OscInBand = 3;
 [num_cheby, denum_cheby] = cheby1(N , OscInBand, Fcut/Fe, 'low');   % A COMPLETER

% Trac? de la fonction de transfert du filtre
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (voir sur internet le fonctionnement de freqz si
% l'aide de matlab ne le propose pas)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 figure(3);
 freqz(num_butter, denum_butter, [], Fe);
 title('Filtre Passe Bas'); 

 figure(3);
 freqz(num_cheby, denum_cheby, [], Fe);
 title('Filtre Passe Bas'); 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 7  DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% filtrage du signal audio bruit? 
 son_filtre_butter = filter(num_butter, denum_butter, EnrAudio);% A COMPLETER
 son_filtre_cheby  = filter(num_cheby,  denum_cheby,  EnrAudio);% A COMPLETER

 % trac? de l'enregistrement audio filtr? dans le domaine temps
 figure(4);
 plot(Temps, son_filtre_butter); % A COMPLETER
  
 % calcul de la TF de l'enregistrement audio bruit? puis du module et de la phase 
 TF_audioFiltre = fftshift(fft(son_filtre_butter, NbPoint));
 Module_TFfiltre= abs(TF_audioFiltre) / NbPoint;
 Phase_TFfiltre = (360/(2*pi)) * angle(TF_audioFiltre);

 % trac? du spectre (Module et Phase) de l'enregistrement audio filtr? dans le domaine Fr?quentiel 
  figure(5);
 % A COMPLETER 
  subplot(2,1,1)
   plot(Frequence, Module_TFfiltre)
   title('Module du spectre de l''enregistrement audio filtr?');
   xlabel('Frequence (Hz)');
   ylabel('Amplitude (V)');
  subplot(2,1,2)
   plot(Frequence, Phase_TFfiltre)
   title('Phase de la TF de l''enregistrement audio filtr?');
   xlabel('Frequence (Hz)');
   ylabel('Phase (Degr?)');  
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 8  DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% Sauvegarde de l'enregistrement audio filtr?  dans un fichier .wav pour ecoute   
audiowrite('signal_filtree_440Hz.wav' ,  son_filtre_butter,  Fe);  % A COMPLETER

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 9  DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A DECOMMENTER ET A COMPLETER

% % Sauvegarde des coefficients du filtre dans un fichier au format .h destin? au
% % developpement sur code composer studio de PRG pour DSP
% FCT_save_coefficient('Coeff_Filtre_Nume.h',  ,'N'); % A COMPLETER
% FCT_save_coefficient('Coeff_Filtre_Deno.h',   ,'D');% A COMPLETER






