Figure_Ensayo_d = figure(1);
subplot(3,1,1)
plot(ref_dn(:,1),ref_dn(:,2),'-r', distancia(:,1),distancia(:,2), 'b')
    xlabel('Tiempo (s)')
    legend('Ref distancia', 'Distancia medida')
    grid
subplot(3,1,2)
plot(ref_angulo(:,1),ref_angulo(:,2),'-r', angulo(:,1),angulo(:,2), 'b')
    xlabel('Tiempo (s)')
    title('Control en lazo cerrado')
    legend('Ref angulo', 'Ángulo medido')
    grid
subplot(3,1,3)
plot(ud(:,1),ud(:,2),'-r')
    xlabel('Tiempo (s)')
    legend('Ud')
    grid
all_ha = findobj(Figure_Ensayo_d, 'type', 'axes', 'tag', '' );
linkaxes( all_ha, 'x' );

Figure_Ensayo_v = figure(2);
subplot(2,1,1)
plot(Ref_Vel(:,1),Ref_Vel(:,2),'-r', Vel(:,1),Vel(:,2), 'b')
    xlabel('Tiempo (s)')
    title('Control en lazo cerrado')
    legend('Ref velocidad', 'Velocidad medida')
    grid
subplot(2,1,2)
plot(uc(:,1),uc(:,2),'-r')
    xlabel('Tiempo (s)')
    legend('Uc')
    grid
all_ha = findobj(Figure_Ensayo_v, 'type', 'axes', 'tag', '' );
linkaxes( all_ha, 'x' );