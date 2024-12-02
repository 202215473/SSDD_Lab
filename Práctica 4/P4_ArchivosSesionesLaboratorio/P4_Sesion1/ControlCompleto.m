function [distancia, angulo, ref_angulo, ud] = ControlCompleto(DOMAIN_ID)

clc

%Definir aquí los parámetros del control de velocidad. 
%¡Muy importante poner los decimales en todos!

K = 137;
Ti = 0.0365;
Td = 0.0; %Td=0.0 si no se usa acción diferencial
b = 1.0; %b=1.0 si no se usa ponderación de la referencia
N = 3.0;
DS = 0.0; % DS=1 diferencial a la salida / DS=0 diferencial al error
K= K/30.3;  % Conversión de rad/s a m/s

%Definir aquí los parámetros del control de seguimiento de pared. 
%¡Muy importante poner los decimales en todos!

%Control interno
Kinterno = 100.0;  % <0 si avance con ruedas delante
Tiinterno = inf; %Ti=inf si no se usa acción integral
Tdinterno = 0.0; %Td=0.0 si no se usa acción diferencial
binterno = 1.0; %b=1.0 si no se usa ponderación de la referencia
Ninterno = 8.0;
DSinterno = 1.0; %DS=1 diferencial a la salida / DS=0 diferencial al error

% Control externo
Kexterno = 12.0;    
Tiexterno = 2; %Ti=inf si no se usa acción integral
Tdexterno = 0.0; %Td=0.0 si no se usa acción diferencial
bexterno = 0.8; %b=1.0 si no se usa ponderación de la referencia
Nexterno = 8.0;
DSexterno = 1.0; % DS=1 diferencial a la salida / DS=0 diferencial al error

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ip = char("192.168.0." + string(DOMAIN_ID));

[no_error, device] = ConexionControlInterno(ip, DOMAIN_ID);
if(no_error == 0)
    return
end

nodeParams.Kinterno = double(Kinterno);
nodeParams.Tiinterno = double(Tiinterno);
nodeParams.Tdinterno = double(Tdinterno);
nodeParams.binterno = double(binterno);
nodeParams.Ninterno = double(Ninterno);
nodeParams.DSinterno = double(DSinterno);
nodeParams.Kexterno = double(Kexterno);
nodeParams.Tiexterno = double(Tiexterno);
nodeParams.Tdexterno = double(Tdexterno);
nodeParams.bexterno = double(bexterno);
nodeParams.Nexterno = double(Nexterno);
nodeParams.DSexterno = double(DSexterno);

nodeParams.K = double(K);
nodeParams.Ti = double(Ti);
nodeParams.Td = double(Td);
nodeParams.b = double(b);
nodeParams.N = double(N);
nodeParams.DS = double(DS);

NodeList = ros2("node","list");
NodoControl = NodeList{find(contains(NodeList,'/ControlCombinadoNode'))};
ControlNode = ros2node(NodoControl,DOMAIN_ID,Parameters=nodeParams);

%Para cerrar todo correctamente en caso de ctrl+c y fin de ensayo normal
cleanupObj = onCleanup(@()cleanMeUp(device, ControlNode));

paramObj = ros2param('ControlCombinadoNode');

fprintf("Envío de parámetros\n")
pause(5);

set(paramObj, "Kinterno", double(Kinterno));
set(paramObj, "Tiinterno", double(Tiinterno));
set(paramObj, "Tdinterno", double(Tdinterno));
set(paramObj, "binterno", double(binterno));
set(paramObj, "Ninterno", double(Ninterno));
set(paramObj, "DSinterno", double(DSinterno));
set(paramObj, "Kexterno", double(Kexterno));
set(paramObj, "Tiexterno", double(Tiexterno));
set(paramObj, "Tdexterno", double(Tdexterno));
set(paramObj, "bexterno", double(bexterno));
set(paramObj, "Nexterno", double(Nexterno));
set(paramObj, "DSexterno", double(DSexterno));
set(paramObj, "K", double(K));
set(paramObj, "Ti", double(Ti));
set(paramObj, "Td", double(Td));
set(paramObj, "b", double(b));
set(paramObj, "N", double(N));
set(paramObj, "DS", double(DS));
pause(2);

fprintf("Inicio del ensayo:\n")
out = sim("Envio_referencia_completo");
% out = sim("Envio_referencia_competicion");
    distancia = get(out,"distancia");
    assignin("base","distancia",distancia);
    angulo = get(out,"angulo");
    assignin("base","angulo",angulo);
    ref_dn = get(out,"ref_dn");
    assignin("base","ref_dn",ref_dn);
    ref_angulo = get(out,"ref_angulo");
    assignin("base","ref_angulo",ref_angulo);
    ud = get(out,"ud");
    assignin("base","ud",ud);
    uc = get(out,"uc");
    assignin("base","uc",uc);
    Vel = get(out,"Vel");
    assignin("base","Vel",Vel);
    Ref_Vel = get(out,"Ref_Vel");
    assignin("base","Ref_Vel",Ref_Vel);
    
   
end