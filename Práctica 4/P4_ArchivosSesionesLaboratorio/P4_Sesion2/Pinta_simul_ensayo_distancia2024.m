% Cargar un ensayo
% Hacer una simulación, en principio con los mismos parámetros de control

close all

tsimu=10;
tensayo=10;
ajuste_tiempo=tsimu-tensayo;

Figure_Ensayo_d = figure(100);
subplot(3,1,1)
plot(ref_dn(:,1)+ajuste_tiempo,ref_dn(:,2),'k', distancia(:,1)+ajuste_tiempo,distancia(:,2), 'b', ref_dn_S(:,1),ref_dn_S(:,2),'--k', distancia_S(:,1),distancia_S(:,2), 'r')
    xlabel('Tiempo (s)')
    legend('Ref distancia', 'Distancia medida','Ref distancia simulada', 'Distancia simulada')
    grid
subplot(3,1,2)
plot(ref_angulo(:,1)+ajuste_tiempo,ref_angulo(:,2),'k', angulo(:,1)+ajuste_tiempo,angulo(:,2), 'b', ref_angulo_S(:,1),ref_angulo_S(:,2),'--k', angulo_S(:,1),angulo_S(:,2), 'r')
    xlabel('Tiempo (s)')
    title('Control en lazo cerrado')
    legend('Ref angulo', 'Ángulo medido', 'Ref angulo simulado', 'Ángulo simulado')
    grid
subplot(3,1,3)
plot(ud(:,1)+ajuste_tiempo,ud(:,2),'b',  ud_S(:,1),ud_S(:,2),'r',ud_S(:,1),ud_sin_limite(:,2),'--k')
    xlabel('Tiempo (s)')
    legend('Ud', 'Ud simulada', 'Ud simu sin límite')
    grid
all_ha = findobj(Figure_Ensayo_d, 'type', 'axes', 'tag', '' );
linkaxes( all_ha, 'x' );


% Figure_Ensayo_v = figure(101);
% subplot(2,1,1)
% plot(Ref_Vel(:,1),Ref_Vel(:,2),'k', Vel(:,1),Vel(:,2), 'b',Ref_Vel_S(:,1),Ref_Vel_S(:,2),'r', Vel_S(:,1),Vel_S(:,2),'r')
%     xlabel('Tiempo (s)')
%     title('Control en lazo cerrado')
%     legend('Ref velocidad', 'Velocidad medida', 'Velocidad simulada')
%     grid
% subplot(2,1,2)
% plot(uc(:,1),uc(:,2),'b', uc_S(:,1),uc_S(:,2),'r')
%     xlabel('Tiempo (s)')
%     legend('Uc medida','Uc simulada')
%     grid
% all_ha = findobj(Figure_Ensayo_v, 'type', 'axes', 'tag', '' );
% linkaxes( all_ha, 'x' );