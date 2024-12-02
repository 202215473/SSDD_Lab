% CONTROL PROPORCIONAL - P
clear all
%% 
%Planta
K1 = 0.027962000000000;
D = 0.146320000000000;

%Tm = 0.0278;
Kint = 100;
Ti = inf;% 0.05;
Td = 0.0; %Td=0.0 si no se usa acción diferencial
b = 1.0; %b=1.0 si no se usa ponderación de la referencia
N = 3.0;
DS = 0.0; % DS=1 diferencial a la salida / DS=0 diferencial al error
%K= K/30.3;  % Conversión de rad/s a m/s

sim('lazo_int_v2.slx')
maximo = max(sal_sim);
sobrepaso = (maximo(2)-sal_sim(end))/(sal_sim(end))*100

figure
subplot(211)
plot(ref_sim(:,1), ref_sim(:,2))
hold on
plot(sal_sim(:,1), sal_sim(:,2))
grid
subplot(212)
plot(u_sim(:,1), u_sim(:,2))
grid
%% 
maximo = max(sal_sim);
sobrepaso = (maximo(2)-sal_sim(end))/(sal_sim(end))*100;
disp(sobrepaso)

Figure_Simulacion_P = figure(1);
subplot(2,1,1)
plot(ref_sim(:,1),ref_sim(:,2),'-r', sal_sim(:,1),sal_sim(:,2),'b')
    xlabel('Tiempo (s)')
    legend('Referencia', 'Salida')
    grid
subplot(2,1,2)
plot(u_sim(:,1), u_sim(:,2),'-r')
    xlabel('Tiempo (s)')
    legend('Mando')
    grid
all_ha = findobj(Figure_Simulacion_P, 'type', 'axes', 'tag', '' );
linkaxes( all_ha, 'x' );


