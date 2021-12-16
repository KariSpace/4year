function history = runfmincon0(x0)
% Set up shared variables with OUTFUN
history.x = [];
history.fval = [];
% call optimization
A=[3 1;-1 1];b=[8;3];
[X,Y]=meshgrid(0:0.02:3.5,0:0.02:6);Z=primfun_g(X,Y);
[c,h]=contour(X,Y,Z,[0.007 0.025 0.1 0.5 2 5 10 15 ...
20 27 35 45],'blue');
clabel(c,h,[0.5 5 15 27],'FontSize',7);
hold on;plot([8/3 1.25],[0 4.25],'g-','linewidth',2.3);
plot([0 1.25],[3 4.25],'g-','linewidth',2);
text(1,1.8,'The feasible region');
xlabel('x1'); ylabel('x2'); text(x0(1),x0(2)+0.2,'x0');
title('Minimization by fmincon');
options = optimset('outputfcn',@outfun,'display',...
'off','Algorithm','sqp');
[x,fval,exitflag,output]=fmincon(@primfun,x0,A,b,...
[],[],[],[],[],options)
y=history.x(:,1);z=history.x(:,2);
hold on;plot(y,z,'b.',y,z,'r-');
    function stop = outfun(x,optimValues,state)
stop = false;
switch state
case 'init'
hold on
case 'iter'
% Concatenate current point and objective
% function
history.fval = [history.fval;...
optimValues.fval];
history.x = [history.x; x];
end
end
end