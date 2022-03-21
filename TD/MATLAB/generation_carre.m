clear all;
close all;

% Chargement d'un sinus de 440Hz  
[EnrAudio, Fe]  = audioread('signal_filtree_440Hz.wav');

% Nombre de point ou d'échantillon de l'enregistrement audio
NbPoint = length(EnrAudio);

% Initialise un vecteur d'une taille de NbPoint
signal_caree = 1:NbPoint;

% Check tous les points du signal 440Hz
for i = 1:NbPoint
    % Compare sa valeur par rapport a 0 pour generer un signal carre 
    if (EnrAudio(i) < 0)
        signal_caree(i) = 0;
    else
        signal_caree(i) = 1;
    end
end

% Affiche le signale carree 
figure(1)
plot(signal_caree)




