Fs = 100;
dt = 1/Fs;
StartTime = -5;
StopTime = 15;
t1 = StartTime:dt:StopTime-dt; %setting universal time interval
ut = t1 >0; %u(t)
ut_1 = t1 >1; %u(t-1)
x1= (t1 .* ut)-(t1 .* ut_1); %x1(t)
plot(x1)

x2= 10* exp(-5.*t1) .* ut; %x2(t)
plot(x2)

plot(conv(x1, x2))

x_hand = (2+237.86*exp(-5.*t1))ut
plot(x_hand)

H_System = zpk([-5],[-6 -5-15i -5+15i],1000)
[H_System,t] = impulse(H);
plot([H_System,t])

in_1 = zpk([],[0],12)
sys1 = in_1*H_System
[sys1,t] = impulse(sys1)
plot([sys1,t])

in_2 = tf([20],[1 0 0 0])
sys2 = in_2*H_System
[sys2,t] = impulse(sys2)
plot([sys2,t])

in_3 = tf([100 0],[1 0 40000*pi*pi])
sys3 = in_3*H_System
[sys3,t] = impulse(sys3)
plot([sys3,t])

bode(H_System)


