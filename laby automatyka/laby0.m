t = 0;0.05;20;

y1= sin(t);

y2 = sin(t*2) + sin(t*3);

model = tf(5, [6 2 1]);

step(model)

impulse(model)

y = lsim(model, y2', t);

figure 
plot(y)