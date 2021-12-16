function gs_maximum (a,b,exp)
      
if a> b 
   error ( ' "а" має бути менше "b"'); 
end
% -------------------------------------------- 
% Побудова графіка  
x=a:0.001:b;
y = f11 (x); 
plot (x, y, 'k', a, f11 (a), 'o', b, f11 (b), 'o');
text (a, f11 (a) + 5, 'f11 (a)', 'FontSize', 14);  
text (b, f11 (b) + 5, 'f11 (b)', 'FontSize', 14);
xlabel ( 'x'); ylabel ( 'f11 (x)'); 
grid on; hold on;
% -------------------------------------------- 
% Виконання ітерацій  
n = 0; 
% Кількість ітерацій  
z = (sqrt (5) -1) / 2; 
xL = z * a + (1-z) * b;
xR = (1-z) * a + z * b; 
A = f11 (xL); B = f11 (xR);  
while 1 
    if b-a <eps 
        break;
    else
        if A < B 
             a = xR;
            xR = xL; B = A; xL = z * a + (1-z) * b; A = f11 (xL);
        else
            b = xL;
            xL = xR;
            A = B;
            xR = (1-z) * a + z * b; B = f11(xR);
        end
    end
    x = (a + b) / 2;
    fprintf ( '% f% .15f\n', 'x_max =', x);
    fprintf ( '% f% .15f\n', 'f11 =', f11 (x));
    plot (x, f11 (x), 'o');  
    n = n + 1;
end
text (x, f11 (x) -10, 'X_ {max}', 'FontSize', 14); 
disp(fprintf ( '% f\n', ''));
disp(fprintf ( '% f\n', 'Межі інтервалу невизн .:')); 
disp(fprintf ( '% f% .15f\n', 'a =', a));  
disp(fprintf ( '% f% .15f\n', 'b =', b));  
disp(fprintf ( '% f\n', ''));  
disp(fprintf ( '% f% d\n', 'n =', n));   
disp(x);
disp(n);
hold off;