clear all;

%Temperaturen
T11 = 60; %°C Eintrittstemperatut Warme Seite
T12 = 30; %°C
T21 = 15; %°C Grundwassertemperatur
T22 = 35; %°C
%Stoffströme 
mdot1 = 0.7; %m^3 /h
mdot2 = mdot1;
%spezifische Enthalpe der Fluide kJ/kg
h11 = 251.15;
h12 = 125.67;
h21 = 62.917; %Interpoliert nach Dampftabelle
h22 = 146.585;
%Spezifische Wärmekapazität kJ/kg*K
cp1 = (h11-h12)/(T11-T12);
cp2 = (h21-h22)/(T21-T22);


%Berechnungen
%Berechnung mittleres logarithmisches Tempereraturgefälle
deltaTG = T11-T21;
deltaTK = abs(T12-T22);
deltaTm = (deltaTG-deltaTK)/(log10(deltaTG/deltaTK)/log10(exp(1)));

%Berechnung Wärmestrom Qdot
Qdot1 = mdot1*cp1*(T11 - T12);
Qdot2 = mdot2*cp2*(T21 - T22);

%Berechnung dimensionslose Temperaturönderung
P1 = (T11-T12)/(T11-T21);
P2 = (T22-T21)/(T11-T21);

%Berechnung NTU-Werte;
NTU1 = (T11-T12)/deltaTm;
NTU2= (T22-T21)/deltaTm;

%Berechnung k*A
kA1 = mdot1*cp1*NTU1;
kA2 = mdot2*cp2*NTU2;


disp("Mittlere logarithmische Temperaturdifferenz:");
disp(deltaTm);
disp("Wärmestrom 1:");
disp(Qdot1);
disp("Wärmestrom 2:");
disp(Qdot2);
disp("Dimensionslose Temperaturänderung P1:");
disp(P1);
disp("Dimensionslose Temperaturänderung P2:");
disp(P2);
disp("NTU1:");
disp(NTU1);
disp("NTU2:");
disp(NTU2);
disp("k*A1:");
disp(kA1);
disp("k*A2:");
disp(kA2);
