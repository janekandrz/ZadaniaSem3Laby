data=readtable("data/data1.csv")
data2 = readtable("data/data2.csv")

figure
plot(data,"I","V",LineWidth=2)
hold on
plot(data2,"I__out_","V__out_",LineWidth=2)
hold on
grid on
title("Uwy=f(Iwy)")
xlabel("I[mA]")
ylabel("U[V]")