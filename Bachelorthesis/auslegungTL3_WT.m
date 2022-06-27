%Durchgerechnet mit AlfaLaval TL3
clear all;


%Maße TL3
b=0.190; % m
l = 0.668; % m
%Abstand der Platten
s = 1.8 / 1000; % mm
d_h = s*2;

%viskosität Wasser
v_kyn = 0.5 / 1000000;
v_dyn = v_kyn * 997;

%Festlegung der Variablen
m_dot1 = (0.551*997)/3600; %  kg/s

%Temperaturen
T11 = 47; %°C Eintrittstemperatur Warme Seite
T12 = 30; %°C
T21 = 15; %°C Grundwassertemperatur
T22 = 32; %°C

%{
h11 = 199.35;
h12 = 125.67;
h21 = 62.917; %Interpoliert nach Dampftabelle
h22 = 136;
%}

cp1 = 4180; % J/kgK

%lokale mittlere Temperaturdifferenz
deltaTheta = (T11+T12)/2;
deltaTheta2 = (T21+T22)/2;
%Wärmeleitfähigkeit Wasser
lambda_h2o = (-1*(((40-deltaTheta)/5)*(0.6306-0.6233))+0.6306); % W/mK


%Reynoldszahl Prandtlzahl
w = (m_dot1/997)/(b*d_h);
Re = (w*d_h)/v_kyn;
Pr = (v_dyn*cp1)/lambda_h2o;


%Berechnung Nußeltzahl
Nu1 = 7.541; % Stoffspezifische Literaturgröße
Nu2 = 1.841*(Re*Pr*(d_h*l))^(1/3);

Nu = ((Nu1^3)*(Nu2^3))^(1/3);

%Berechnung des Wärmeübergangskoeffizienten
alpha1 = (Nu * lambda_h2o) / d_h; % W/m^2 K
alpha2 = alpha1;

%Berechnung des Wärmedurchgangskoeffizienten
k = ((1/alpha1)+(s/lambda_h2o)+(1/alpha2))^(-1); % W/m^2 K

%Berechnung zu übertragender Wärmestrom
Q_dot1 = m_dot1*cp1*(T11-T12);

%Berechnung des mittleren logarithmetischen Temperaturgefälle
deltaTG = T11-T21;
deltaTK = abs(T12-T22);
mltg = (deltaTG-deltaTK)/(log10(deltaTG/deltaTK)/log10(exp(1)));


%Berechnung der nötigen Fläche
A = Q_dot1/(mltg*k); % m^2
A_platte = l*b;

%Berechnung der Anzahl der nötigen Platte
n_platten = A/A_platte;




