function fib_maximum(a,b,eps)
% -------------------------------------------- 
if a> b 
   error ( ' "а" має бути менше "b"'); 
end
% -------------------------------------------- 
x=a:0.001:b;
y = f11 (x); 
plot (x, y, 'k', a, f11 (a), 'o', b, f11 (b), 'o');
text (a, f11 (a) + 5, 'f11 (a)', 'FontSize', 14);  
text (b, f11 (b) + 5, 'f11 (b)', 'FontSize', 14);
xlabel ( 'x'); ylabel ( 'f11 (x)'); 
grid on; hold on;
% -------------------------------------------- 
ratio = (b-a)/eps;
n=3;
% -------------------------------------------- 
f=[1 1];
disp(f(1))
disp(f(2))
% -------------------------------------------- 
while 1
    f(n)=f(n-1)+f(n-2);
    asd=f(n);
    disp(f(n))
    if asd>ratio
        break;
    end
    n=n+1;
end
N=n;
xL=a+(f(N-2)/f(N))*(b-a);
xR=a+(f(N-1)/f(N))*(b-a);
A= f11(xL);
B= f11(xR);
% -------------------------------------------- 
disp(fprintf ( '% f', 'Result prev'));
disp(fprintf ( '% f%d', 'N=',N));
disp(fprintf ( '% f%d', 'k=',1));
disp(fprintf ( '% f% .15f', 'xL=',(a+(f(N-2)/f(N))*(b-a))));
disp(fprintf ( '% f% .15f', 'xR=',(a+(f(N-1)/f(N))*(b-a))));
disp(fprintf ( '% f', ''));

% --------------------------------------------
for k=2:N-1
    if A<B
        a = xR;
        xR = xL; 
        B = A; 
        xL =a+(b-a)*( f(N-k) / f(N-k+1)); 
        A = f11 (xL);   
    else
         b = xL;
         xL = xR;
         A = B;
         xR = a+(b-a)*(f(N-k)/f(N-k+1));
         B = f11(xR);
    end
    x = (a+b)/2;
    disp(fprintf ( '% f%d', 'k=',k));
    disp(fprintf ( '% f% .15f', 'x_min =',x));
    disp(fprintf ( '% f% .15f', 'f11 =',f11(x)));
    plot(x,f11(x),'o');
end
% --------------------------------------------
text (x, f11 (x) -10, 'X_{min}', 'FontSize', 14); 
disp(fprintf ( '% f', ''));
disp(fprintf ( '% f', 'Межі інтервалу невизн.:')); 
disp(fprintf ( '% f%', ' a =', a)); 
disp(fprintf ( '% f%', ' b =', b)); 
disp(x);
disp(N);
hold off;







