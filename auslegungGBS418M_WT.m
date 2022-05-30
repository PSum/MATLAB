%Durchgerechnet mit GBS 418M-14 der Firma Kelvion
clear all;

dichte = 993.69;
%Maße TL3
b=0.127; % m
l = 0.282; % m
%Abstand der Platten

d_h = (1.536)/1000;
s = d_h / 2; % mm

%viskosität Wasser
v_kyn = 0.5 / 1000000;
%v_dyn = v_kyn * dichte;
v_dyn = (0.000575+0.00089)/2;

%Festlegung der Variablen
m_dot1 = (0.5*dichte)/3600; %  kg/s

%Temperaturen
T11 = 47; %°C Eintrittstemperatur Warme Seite
T12 = 25; %°C
T21 = 15; %°C Grundwassertemperatur
T22 = 37; %°C

%{
h11 = 199.35;
h12 = 125.67;
h21 = 62.917; %Interpoliert nach Dampftabelle
h22 = 136;
%}

cp1 = 4183; % J/kgK

%lokale mittlere Temperaturdifferenz
deltaT = (T11+T12)/2;
deltaT2 = (T21+T22)/2;
%Wärmeleitfähigkeit Wasser
Waermeleitfaeigkeit = (-1*(((40-deltaT)/5)*(0.6306-0.6233))+0.6306); % W/mK
Waermeleitfaeigkeit2 = (-1*(((40-deltaT2)/5)*(0.6306-0.6233))+0.6306); % W/mK

%Reynoldszahl Prandtlzahl
w = (m_dot1/dichte)/(b*d_h);
Re = (w*d_h)/v_kyn;
Pr = (v_dyn*cp1)/Waermeleitfaeigkeit;
Pr2 = (v_dyn*cp1)/Waermeleitfaeigkeit2;

%Berechnung Nußeltzahl
Nu1 = 7.541; % Stoffspezifische Literaturgröße
Nu2 = 1.841*(Re*Pr*(d_h*l))^(1/3);
Nu22 = 1.841*(Re*Pr2*(d_h*l))^(1/3);

Nufluid1 = ((Nu1^3)*(Nu2^3))^(1/3);
Nufluid2 = ((Nu1^3)*(Nu22^3))^(1/3);


%Berechnung des Wärmeübergangskoeffizienten
alpha1 = (Nufluid1 * Waermeleitfaeigkeit) / d_h; % W/m^2 K
alpha2 = (Nufluid2 * Waermeleitfaeigkeit2) / d_h; % W/m^2 K

%Berechnung des Wärmedurchgangskoeffizienten
k = ((1/alpha1)+(s/Waermeleitfaeigkeit)+(1/alpha2))^(-1); % W/m^2 K
k2 = ((1/alpha1)+(s/Waermeleitfaeigkeit2)+(1/alpha2))^(-1); % W/m^2 K
%k=963;

%Berechnung zu übertragender Wärmestrom
Q_dot1 = m_dot1*cp1*(T11-T12); %J/s

%Berechnung des mittleren logarithmetischen Temperaturgefälle
deltaTG = T11-T21;
deltaTK = abs(T12-T22);
mltg = (deltaTG-deltaTK)/(log10(deltaTG/deltaTK)/log10(exp(1)));


%Berechnung der nötigen Fläche
A = Q_dot1/(mltg*k); % m^2
A_platte = l*b;

%Berechnung der Anzahl der nötigen Platte
n_platten = A/A_platte;




