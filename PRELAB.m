R1=1*10^3;
R2=10*10^3;
R3=R2;
C1=1*10^(-6);
C2=0.1*10^(-6);
C3=10*10^(-6);

A=1/(R1*R2*R3*C1*C2*C3)
%B=(1/(C1*R1))+((R3+R2+R1)/(R2*R3*R1*C3))
B=((C3*R2*R3+C3*R1*R3+C1*R1*R2+C1*R1*R3)/(R2*R3*R1*C3*C1))
C=(1/(R2*R3*C2*C3))+((R3+R2+R1)/(R1*R2*R3*C1*C3))

G=tf(A,[1,B,C,A])

damp(G)
%figure(1)
%step(G)

%figure(2)
%pzmap(G)
%grid on 
%zplane(zero(G),pole(G))

%[b,a]=zp2tf(zero(G),pole(G),1)
%fvtool(b,a,'Analysis','polezero')
pidTuner(G, 'PIDF')

KP=virus.Kp

G_control=feedback(virus*G,1,-1)
