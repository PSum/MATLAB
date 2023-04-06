clear all;
clc;
% x = v0 * cosd(alpha)
% y = h0 + v_y0 * t - 0.5 * g * t^2

g = 9.81;           % m/s^2     Erdbeschleunigung
h0 = 2;             % m         Starthoehe
v0 = 13.7;          % m/s       Startgeschwindigkeit
t = [0 : 0.1 : 3];  %           Zeitfenster von 0 bis 3 Sekunden in 0,1 Sekunden Schritten

% alpha = input("Abwurfwinkel in Grad: \n");
% 
% vx0 = v0 * cosd(alpha);
% vy0 = v0 * sind(alpha);
% 
% x = vx0 *t;
% y = h0 +vy0 *t -0.5 *g *t.^2;
% 
% plot(x,y);
% grid on;




% for alpha = 0:5:90
%     vx0 = v0 * cosd(alpha);
%     vy0 = v0 * sind(alpha);
%     
%     x = vx0 *t;
%     y = h0 +vy0 *t -0.5 *g *t.^2;
% 
%     plot(x,y);
%     grid on;
%     axis([0 25 0 15]);
%     hold on; 
% end


% % Erkennen des Aufschlags
% 
% alpha = 30;
% t = [-0.5:0.1:2]';
% 
% vx0 = v0 * cosd(alpha);
% vy0 = v0 * sind(alpha);
% 
% x = vx0 *t;
% y = h0 +vy0 *t -0.5 *g *t.^2;
% 
% plot(x,y, "red");
% grid on;
% 
% Nullstelle1= ((-vy0 + sqrt((vy0.^2)- (4*-g/2 *h0)))/(2*-g/2));
% Nullstelle2= ((-vy0 - sqrt((vy0.^2)- 4*-g/2 *h0))/(2*-g/2));
% 
% Flugzeit = Nullstelle2;
% 
% Wurfweite = vx0 * Nullstelle2
