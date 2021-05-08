function [root, iter, converge] = biseccion(f, xi, xs, tol, iter_max)

    %indep = linspace(-15,15,200);
    errorap = 100;
    fxr=0;
    fxi = f(xi);
    fxs = f(xs);
 %%   lineaax = ones(200);
 %%   lineaax = lineaax.*a;
 %%   lineaay = linspace(-1000,1000,200);
 %   lineabx = ones(200);
 %   lineabx = lineabx.*b;
 %   lineaby = linspace(-1000,1000,200);
 %   figure(1);
 %   hold off;
 %   plot(indep,f(indep),'b');
 %   axis([-5 5 -200 200])
 %   input('continuar..');
 %   hold on;
    if fxi * fxs > 0
        error('Error: No hay cambio de signo por lo que no se puede operar.');
    end
    
    
    for iter = 0:iter_max
        
        xr = (xi + xs) / 2;
        fxr = f(xr);
        
        fprintf('iter: %.3d\t xi: %.4f\t fxi: %.4f\t xs: %.4f\t fxs: %.4f\t xr: %.4f\t fxr: %.4f\t E.Aprox: %.4f\n', iter, xi, fxi, xs, fxs, xr, fxr, errorap);
        
        if errorap <= tol && abs(fxr) <= tol
            break;
        end

        if fxi * fxr > 0
            xi = xr;
            fxi = fxr;
        else
            xs = xr;
        end
    if(iter > 1)
       errorap = ((abs(xs - xi)) / xs)*100;
    end

    root = xr;

    
    end
   if errorap <= tol && abs(fxr) <= tol
        converge = 1;
    else
        warning('Advertencia: el metodo no converge.');
        converge = 0;
   end
end