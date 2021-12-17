clear 
clc 
%-------- Створення і навчання мережі при відсутності шуму ------------ 
p = [-1:0.1:1]; %вхідний вектор мережі
N=[-12:25/21:12];
t = 0.5 * (N).^2-4.8*(N)+3.5;
 % вихідний вектор мережі 
net = newff(minmax(p), [30,1], {'tansig', 'purelin'}, 'trainbfg'); %створення 
net.trainParam.epochs = 500; % завдання кількості циклів навчання 
net.trainParam.show = 50; %кількість циклів для показу проміжних 
net.trainParam.goal = 1e-3; %цільова помилка навчання 
[net, tr] = train(net, p, t); 
netn = net;% ініціалізація мережі 
netn.trainParam.epochs = 500; % завдання кількості циклів навчання 
netn.trainParam.show = 50; % кількість циклів для показу проміжних 
netn.trainParam.goal = 1e-3; % цільова помилка навчання 
t1 =  [sin(N.*p) sin(N.*p)]; %вихідний вектор мережі 
p1 = [p, (p+randn (size (p))*0.02)]; %вхідний вектор мережі з шумом 
[netn, tr]=train(netn, p1, t1); % навчання мережі за наявності шуму
%-------- Повторне навчання мережі при відсутності шуму --------- 
netn.trainParam.goal=1e-3; % цільова помилка навчання 
[netn, tr] = train (netn, p, t); % повторне навчання мережі при відсутності шуму 
%----- Оцінка ефективності функціонування системи ------ 
tic % встановлюємо таймер 
noise = 0:0.01:0.1; % різні рівні шуму 
test = 20; % кількість ітерацій 
network1 = []; 
network2 = []; 
t=sin(N.*p); %вихідний вектор 
for noiselevel = noise % організуємо цикл 
errors1 = 0; % початкове значення сумарної помилки мережі net 
errors2 = 0; % початкове значення сумарної помилки мережі netn 
for i=1:test 
P = p + randn (size(p))*noiselevel;  %вхідний вектор 
A = sim(net, P); %використання мережі net 
errors1 = errors1 + sum(sum(abs(A-t)))/2; %сумарна помилка  мережі net 
An = sim(netn, P); % використання мережі netn 
errors2 = errors2+sum(sum(abs(An-t)))/2;% сумарна помилка  мережі 
netn; 
echo off  % включає повтор команд 
end 
network1 = [network1 errors1/41/20]; 
network2 = [network2 errors2/41/20]; 
end 
network1 ;
network2; 
toc 
figure(1) 
plot (noise, network1*100, '--b', noise, network2*100, ':r', 'LineWidth', 1.5); 
% графіки 
% залежності відсотка помилки від рівня шуму 
legend('відсоток помилки мережі net', 'відсоток помилки мережі netn'); 
%легенда 
xlabel ('Рівень шума','FontSize',12); 
ylabel ('Відсоток помилки','FontSize',12); 
title('Залежність відсотка помилки від рівня вхідного шуму', 'FontSize', 12, 'FontWeight', 'bold'); 
grid on 
%--------------- Використання нейронної мережі ------------------------ 
p2=randn (size (p))*0.03 + p; % вхідний вектор з шумом 
[an,E]=sim(net, p2); % використання нейронної мережі
figure(2); 
plot (p2, t, '+', p2, an, '-', p, t, ':', 'LineWidth', 1.5) % графіки 
legend('вход', 'выход', 'sin (N*t)'); %легенда 
title ('Апроксимація функції y=sin(N*t) двохшаровою нейронною мережею', 'FontSize', 11.5, 'FontWeight', 'bold'); %заголовок 
grid on %координатна сітка 
E=mse (an-t) % середньоквадратична помилка використання нейронної мережі 
gensim (net) % структурна схема нейронної мережі 