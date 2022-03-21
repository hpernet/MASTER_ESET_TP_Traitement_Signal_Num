clear all;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 2 DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A DECOMMENTER ET A COMPLETER

% % Chargement données audio  
%  [EnrAudio, ]  = audioread('');% A COMPLETER
% 
% 
%  % Nombre de point ou d'échantillon de l'enregistrement audio
%  NbPoint = ; % A COMPLETER
% 
%  %  autres commandes de votre choix si besoin ----------------------------


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 3  DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A DECOMMENTER ET A COMPLETER

% % periode d'échantillonnage
% Te = ;  % A COMPLETER
% 
% %Vecteur temps pour le tracé dans le domaine temps
% Temps =;  % A COMPLETER
% 
% % tracé de l'enregistrement audio dans le domaine temps
% figure(1);
% plot(Temps,); % A COMPLETER
% title('Enregistrement audio bruité');
% xlabel('Temps (s)');
% ylabel('Amplitude (V)');
% 
% %  autres commandes de votre choix si besoin ----------------------------



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 4  DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A DECOMMENTER ET A COMPLETER

% %calcul de la TF de l'enregistrement audio bruité puis du module et de la phase
% TF_audioBruite = ; % A COMPLETER
% Module_TF= ;% A COMPLETER
% Phase_TF = ; % A COMPLETER
% 
% % pas frequentiel
% PasFreq = ; % A COMPLETER
% 
% %Vecteur Frequence pour le tracé dans le domaine Frequentiel
% Frequence =; % A COMPLETER
% 
% % Tracé de l'enregistrement audio dans le domaine fréquence
% figure(2);
% subplot(2,1,1)
%    plot(Frequence,) % A COMPLETER
%    title('Module du spectre de l''enregistrement audio bruité');
%    xlabel('Frequence (Hz)');
%    ylabel('Amplitude (V)');
% subplot(2,1,2)
%    plot(Frequence,) % A COMPLETER
%    title('Phase de la TF de l''enregistrement audio bruité');
%    xlabel('Frequence (Hz)');
%    ylabel('Phase (Degré)');
% 
% %  autres commandes de votre choix si besoin ----------------------------
   
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 6  DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

% A DECOMMENTER ET A COMPLETER

% % Ordre du filtre. 
% N = ; % A COMPLETER
% 
% % Frequence de coupure
% Fcut = ; % A COMPLETER
% 
% % Creation du filtre  
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % (voir sur internet le fonctionnement des filtres si
% % l'aide de matlab ne le propose pas)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % BUTTER 
%  [num_1, ]=butter(  , ); %  A COMPLETER
%  
%  % OU CHEBYSCHEV
% %  OscInBand = 0.1;
% %  [num_1, ] = cheby1( , , );   % A COMPLETER


% % Tracé de la fonction de transfert du filtre
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % (voir sur internet le fonctionnement de freqz si
% % l'aide de matlab ne le propose pas)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  figure(3);
%  freqz(    ,   ,  ,  ); % A COMPLETER
%  title('Filtre Passe Bas'); 

% %  autres commandes de votre choix si besoin ----------------------------

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACTIVITE 7  DU TP1 - PARTIE 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
 
% A DECOMMENTER ET A COMPLETER

% % filtrage du signal audio bruité 
%  son_filtre_1=filter( , ,  );% A COMPLETER
%  
%  % tracé de l'enregistrement audio filtré dans le domaine temps
%  figure(4);
%  % A COMPLETER
%   
%  
%  % calcul de la TF de l'enregistrement audio bruité puis du module et de la phase 
% TF_audioFiltre = ; % A COMPLETER
% Module_TFfiltre= ; % A COMPLETER
% Phase_TFfiltre = ; % A COMPLETER 
%  
%  % tracé du spectre (Module et Phase) de l'enregistrement audio filtré dans le domaine Fréquentiel 
%   figure(5);
%  % A COMPLETER 
%   
%  
%  %  autres commandes de votre choix si besoin ----------------------------
%  
 
 
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






