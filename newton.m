function [raiz, iteraciones, error] = newton(f, x0, tol, iter_max)
%Donde:
 
% f: Funcion f(x), anonima
 
% x0: Variable Inicial
% tol: Tolerancia
% iter_max: Maximo numero de iteraciones
% Salidas:
% raiz: valor de la raiz encontrada
% iteraciones: iteraciones en las que se encontro la raiz
% error: Error relativo porcentual
 
x = x0;
fx = f(x);
syms x
fprima = diff(f,x);
df = matlabFunction(fprima);
x=x0;
dfx = df(x);
error=100; 
iteraciones = 0;
i(iteraciones+1,1) = iteraciones;
x_i(iteraciones+1,1) = x;
E_a(iteraciones+1,1) = error;
%disp('----------------------------------------------------------------------------')
%fprintf('iteracion \t\t xi \t\t dfx \t\t\t fx \n');
%disp('----------------------------------------------------------------------------')
%fprintf('   %.3d\t\t\t %.4f\t %.4f\t %.4f\n', iteraciones, x, dfx, fx); 
for iteraciones = 1:iter_max
   deltaX = - fx / dfx;
    xanterior = x;
    x = x + deltaX;
    fx = f(x);
    dfx = df(x);
    error = (abs((x - xanterior)/x))*100;
    %fprintf('iteracion: %.3d\t x: %.4f\t dfx: %.4f\t fx: %.4f\t deltaX: %.4f\t  error: %.4f\n', iteraciones, x, dfx, fx, deltaX, error);
    i(iteraciones+1,1) = iteraciones;
    x_i(iteraciones+1,1) = x;
    E_a(iteraciones+1,1) = error;
   if (error <= tol) 
     break;
   end
end
 
raiz = x;
Resultados= table(i,x_i,E_a);
if abs(deltaX) <= tol && abs(fx) <= tol
  error= 1; 
  disp(Resultados)
else
warning('No es posible encontrar la raiz.');
  error= -1;
end

end