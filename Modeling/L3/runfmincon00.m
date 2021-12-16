function history = runfmincon00(x0)
history.x = [];
history.fval = [];
[X,Y]=meshgrid(0:0.02:3.5,0:0.02:6);Z=primfun_g(X,Y);
contour(X,Y,Z,[ 0.007 0.025 0.1 0.5 2 5 10 15 20 27 ...
35 45],'blue');
x=1.5:0.01:2.17; y=-1.25*(x-3.5).^2+5; hold on;
plot(x,y,'g-','linewidth',2.3); x=2.17:0.01:3.5;
y=1.5*sqrt(2*x)-0.75./x;hold on;plot(x,y,...
'g-','linewidth',2);
text(2.5,2,'The feasible region');
xlabel('x1'); ylabel('x2');
title('Minimization by fmincon');
options = optimset('outputfcn',@outfun,'display',...
'off', 'Algorithm', 'sqp');
[x,fval,exitflag,output]=fmincon(@primfun,x0,[],[],...
[],[],[],[],@primcon,options)
y=history.x(:,1);z=history.x(:,2);
hold on;plot(y,z,'b.',y,z,'r-');
function stop = outfun(x,optimValues,state)
stop = false;
switch state
case 'init'
hold on
case 'iter'
history.fval = [history.fval;...
optimValues.fval];
history.x = [history.x; x];
end
end
end