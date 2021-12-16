function gs_minimum (a,b,exp)
 %--------------------------------------------
% Вывод сообщения об ошибке
if a>b
 error('"а" должно быть меньше "b"');
end
%--------------------------------------------
% Построение графикач
x=a:0.001:b; y=f11(x);
plot(x,y,'k',a,f11(a),'o',b,f11(b),'o');
text(a,f11(a)+5,'f11(a)','FontSize',14);
text(b,f11(b)+5,'f11(b)','FontSize',14);
xlabel('x'); ylabel('f11(x)');
grid on; hold on;
%--------------------------------------------
% Выполнение итераций
n=0; % Количество итераций
z=(sqrt(5)-1)/2;
xL=z*a+(1-z)*b; xR=(1-z)*a+z*b;
A=f11(xL); B=f11(xR);
while 1
if b-a<eps 
    break;
else
 if A<=B %%%
 b=xR;
 xR=xL; B=A; xL=z*a+(1-z)*b; A=f11(xL);
 else
 a=xL;
 xL=xR; A=B; xR=(1-z)*a+z*b; B=f11(xR);
 end
end
x=(a+b)/2;
fprintf('%s %.15f\n', 'x_min=',x) ;
fprintf('%s %.15f\n', 'f11=',f11(x)) ;
plot(x, f11(x),'o');
n=n+1;
end
%--------------------------------------------
% Вывод результатов
plot(x,f11(x),'or');
text(x,f11(x)-10,'X_{min}','FontSize',14);
fprintf('%s\n', ' ') ;
fprintf('%s\n', 'Границы интервала неопр.:');
fprintf('%s %.15f\n', 'a=',a) ;
fprintf('%s %.15f\n', 'b=',b) ;
fprintf('%s\n', ' ') ;
fprintf('%s %d\n', 'n=', n) ;
hold off;