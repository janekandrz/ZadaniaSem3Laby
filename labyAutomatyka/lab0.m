close all

t = 0:0.05:20;

y1 = sin(t);

y2 = sin(t*2) + sin(t*3);

model = tf(5, [6 2 1]);

P = 1 ;
I = 1 ;
D = 4 ;

figure;
step(model)

figure;
impulse(model)

figure;
lsim(model, y1, t);


input.time = t';
input.signals.values = y1';
input.signals.dimensions = 1;


