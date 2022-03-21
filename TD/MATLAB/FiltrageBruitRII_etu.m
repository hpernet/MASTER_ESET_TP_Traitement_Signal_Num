clear all;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 2 DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A DECOMMENTER ET A COMPLETER

% Chargement données audio  
 [EnrAudio, Fe]  = audioread('EnreAudioBruite16Bits_1BruitFaibleNew.wav');

 % Nombre de point ou d'échantillon de l'enregistrement audio
 NbPoint = length(EnrAudio); % A COMPLETER

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 3  DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% periode d'échantillonnage
Te = 1/Fe;  % A COMPLETER

%Vecteur temps pour le tracé dans le domaine temps
Temps = linspace(0, NbPoint*Te, NbPoint);

% tracé de l'enregistrement audio dans le domaine temps
figure(1);
plot(Temps,EnrAudio); % A COMPLETER
title('Enregistrement audio bruité');
xlabel('Temps (s)');
ylabel('Amplitude (V)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 4  DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%calcul de la TF de l'enregistrement audio bruité puis du module et de la phase
TF_audioBruite = fftshift(fft(EnrAudio, NbPoint));
Module_TF = abs(TF_audioBruite) / NbPoint;
Phase_TF  = (360/(2*pi)) * angle(TF_audioBruite);

% pas frequentiel
PasFreq = Fe / NbPoint; % A COMPLETER

%Vecteur Frequence pour le tracé dans le domaine Frequentiel
Frequence = [-(NbPoint-1)/2 : (NbPoint-1)/2] * PasFreq; % -Fe/2:PasFreq:Fe/2;

% Tracé de l'enregistrement audio dans le domaine fréquence
figure(2);
subplot(2,1,1)
   plot(Frequence, Module_TF)
   title('Module du spectre de l''enregistrement audio bruité');
   xlabel('Frequence (Hz)');
   ylabel('Amplitude (V)');
subplot(2,1,2)
   plot(Frequence, Phase_TF)
   title('Phase de la TF de l''enregistrement audio bruité');
   xlabel('Frequence (Hz)');
   ylabel('Phase (Degré)');   
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 6  DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

% Ordre du filtre. 
N = 10; % A COMPLETER

% Frequence de coupure
Fcut = 3200; % A COMPLETER

% Creation du filtre  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (voir sur internet le fonctionnement des filtres si
% l'aide de matlab ne le propose pas)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% BUTTER 
  [num_1, denum_1] = butter(N , Fcut/Fe, 'low'); %  A COMPLETER
 
% OU CHEBYSCHEV
%  OscInBand = 0.1;
%  [num_2, denum_2] = cheby1(N , 10, Fcut/Fe, 'low');   % A COMPLETER

% Tracé de la fonction de transfert du filtre
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (voir sur internet le fonctionnement de freqz si
% l'aide de matlab ne le propose pas)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 figure(3);
 freqz(num_1, denum_1, [], Fe);
 title('Filtre Passe Bas'); 

%  figure(3);
%  freqz(num_2, denum_2, [], Fe);
%  title('Filtre Passe Bas'); 

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 7  DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
 
% A DECOMMENTER ET A COMPLETER

% filtrage du signal audio bruité 
 son_filtre_1 = filter(num_1, denum_1, EnrAudio);% A COMPLETER
 
 % tracé de l'enregistrement audio filtré dans le domaine temps
 figure(4);
 plot(Temps, son_filtre_1); % A COMPLETER
  
 % calcul de la TF de l'enregistrement audio bruité puis du module et de la phase 
 TF_audioFiltre = fftshift(fft(son_filtre_1, NbPoint));
 Module_TFfiltre= abs(TF_audioFiltre) / NbPoint;
 Phase_TFfiltre = (360/(2*pi)) * angle(TF_audioFiltre);

 % tracé du spectre (Module et Phase) de l'enregistrement audio filtré dans le domaine Fréquentiel 
  figure(5);
 % A COMPLETER 
  subplot(2,1,1)
   plot(Frequence, Module_TFfiltre)
   title('Module du spectre de l''enregistrement audio filtré');
   xlabel('Frequence (Hz)');
   ylabel('Amplitude (V)');
  subplot(2,1,2)
   plot(Frequence, Phase_TFfiltre)
   title('Phase de la TF de l''enregistrement audio filtré');
   xlabel('Frequence (Hz)');
   ylabel('Phase (Degré)'); 
 
 %  autres commandes de votre choix si besoin ----------------------------
 
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 8  DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
 
% A DECOMMENTER ET A COMPLETER

%  %  autres commandes de votre choix si besoin ----------------------------

% % Sauvegarde de l'enregistrement audio filtré  dans un fichier .wav pour ecoute   
% audiowrite( ,  ,  , , );  % A COMPLETER
 
%  %  autres commandes de votre choix si besoin ----------------------------


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 9  DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A DECOMMENTER ET A COMPLETER

% % Sauvegarde des coefficients du filtre dans un fichier au format .h destiné au
% % developpement sur code composer studio de PRG pour DSP
% FCT_save_coefficient('Coeff_Filtre_Nume.h',  ,'N'); % A COMPLETER
% FCT_save_coefficient('Coeff_Filtre_Deno.h',   ,'D');% A COMPLETER






