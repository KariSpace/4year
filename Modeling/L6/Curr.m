function y2013=Curr(y)
targetSeries = tonndata(y,true,false);
feedbackDelays = 2:3;%минимум 2 года в линию задержек так как на 2 года вперёд будет прогноз
hiddenLayerSize = 2;%если взять больше нейронов, то получится что параметров сети больше чем данных
net = narnet(feedbackDelays,hiddenLayerSize);
net.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
[inputs,inputStates,layerStates,targets] = preparets(net,{},{},targetSeries);
net.divideFcn = ''; % нечего тут делить и так данных мало
net.trainFcn = 'trainbr';  
net.performFcn = 'mse';  % среднеквадратическая ошибка
net.plotFcns = {'plotperform','plottrainstate','plotresponse', ...
  'ploterrcorr', 'plotinerrcorr'};
outputs = net(inputs,inputStates,layerStates);
errors = gsubtract(targets,outputs);
performance = perform(net,targets,outputs)
view(net)
nets = removedelay(net,2);
[xs,xis,ais,ts] = preparets(nets,{},{},targetSeries);
ys = nets(xs,xis,ais);
y2013=ys{end}
view(nets)
end