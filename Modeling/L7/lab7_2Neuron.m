%задамо множину значень кластерів
y1=0+rand(1,30);
x1=22+rand(1,30);
y2=0+rand(1,30);
x2=-22+rand(1,30);
y3=22+rand(1,30);
x3=0+rand(1,30);
x4=0+rand(1,30);
y4=-22+rand(1,30);
%виведемо множину вхідних значень на графік командою figure(1)
figure(1) 
hold on 
plot(x1,y1,'+k')
plot(x2,y2,'sb')
plot(x3,y3,'r*')
plot(x4,y4,'ok') 
grid on 
hold off
%задаємо назви чотирьох кластерів,значення які буде видавати нейронна мережа при симуляції
T1(1:30)=1; 
T2(1:30)=2; 
T3(1:30)=3; 
T4(1:30)=4;
%з'єднаємо всі назви кластерів
T(1:30)=T1; 
T(31:60)=T2; 
T(61:90)=T3; 
T(91:120)=T4;
%з'єднаємо всі вхідні значення в одну матрицю
x(1:30)=x1; 
x(31:60)=x2; 
x(61:90)=x3; 
x(91:120)=x4; 
y(1:30)=y1; 
y(31:60)=y2; 
y(61:90)=y3; 
y(91:120)=y4;
%вектори х та у з'єднаємо в z
z(1,1:120)=x; 
z(2,1:120)=y;
%створимо структуру нейронної мережі прямого поширення
net = newff(z,T,[10,2],{'logsig','logsig'});
%навчимо створену мережу командою
net = train(net,z,T);