Angulo=[ref_angulo angulo(:,2) ud(:,2)];
figure(10)
plot(Angulo(:,2:3))
grid
disp('Hacer zoom en la zona de interés de la figura')
disp('Después, pulsar cualquier tecla')
pause
[aux1,aux2]=ginput(2);
aux1=round(aux1);
time=Angulo(aux1(1):aux1(2),1)-Angulo(aux1(1),1);

ent=Angulo(aux1(1):aux1(2),2)*pi/180;
%ent=ent-ent(1);
ent=ent-mean(ent(1:150));

sal=Angulo(aux1(1):aux1(2),3)*pi/180;
%sal=sal-sal(1);
sal=sal-mean(sal(1:150));

%alfaini = mean(sal(1:30))
alfaini=0;
plot(time,[ent sal])
xlabel('Tiempo (s)')
ylabel('u(t) y y(t)')
legend('Ref', 'Angulo')
grid
  