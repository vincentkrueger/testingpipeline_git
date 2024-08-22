clc;
close;
clear;
addpath(genpath('functions'));
addpath(genpath('data'));
strct = load("plotStructTest.mat");

datastrct = strct.plotStruct.KneeMean.mm;
xmpl  = strct.plotStruct.KneeMean.mm.DataSummary.mean;
xmpl_sd  = strct.plotStruct.KneeMean.mm.DataSummary.sd;

xmpl2 = strct.plotStruct.KneeMean.moderate.DataSummary.mean;
datastrct2 = strct.plotStruct.KneeMean.moderate;

xmpl3 = strct.plotStruct.KneeMean.off.DataSummary.mean;
datastrct3 = strct.plotStruct.KneeMean.off;

xmpl4 = strct.plotStruct.KneeMean.light.DataSummary.mean;
datastrct4 = strct.plotStruct.KneeMean.light;

% upperCurve = integral(xmpl+xmpl_sd);
% lowerCurve = integral(xmpl-xmpl_sd);


upperCurve = xmpl+xmpl_sd;
lowerCurve = xmpl-xmpl_sd;

x = (0:1:100)';

x2 = [x, fliplr(x)];

% inBetween = [upperCurve, fliplr(lowerCurve)];
% xd )= Visualizer_CreatePlot_ShadedSeries_Test




figure; 
ax = subplot(3,2,1);
    elementPropz.LineColors = 'g';
    % plot(xmpl);
    % hold on;
    % [elementHandle, prob,err] = Visualizer_CreatePlot_ShadedSeries_Test(ax,datastrct,'Shaded (2SD)',elementPropz,"123","err");
    % elementPropz.LineColors = 'r';
    % plot(xmpl2);
    % [elementHandle, prob,err] = Visualizer_CreatePlot_ShadedSeries_Test(ax,datastrct2,'Shaded (2SD)',elementPropz,"123","err");
    % elementPropz.LineColors = 'c';
    % plot(xmpl3);
    % [elementHandle, prob,err] = Visualizer_CreatePlot_ShadedSeries_Test(ax,datastrct3,'Shaded (2SD)',elementPropz,"123","err");
    % elementPropz.LineColors = 'y';
    % plot(xmpl4);
    % [elementHandle, prob,err] = Visualizer_CreatePlot_ShadedSeries_Test(ax,datastrct4,'Shaded (2SD)',elementPropz,"123","err");
    
    posVals1 = sqrt(xmpl.^2);
    posVals2 = sqrt(xmpl2.^2);
    posVals3 = sqrt(xmpl3.^2);
    posVals4 = sqrt(xmpl4.^2);
    
    error = posVals2 - posVals1;
    error2 = posVals3 - posVals1;
    error3 = posVals4 - posVals1;
    % error4 = posVals3 - posVals1;
    %plots with options as errors
    errorbar(x,xmpl,error,"-s","MarkerSize",5,...
        "MarkerEdgeColor","blue","MarkerFaceColor",[0.65 0.85 0.90]);
hold on;
    errorbar(x,xmpl,error2,"-s","MarkerSize",5,...
        "MarkerEdgeColor","red","MarkerFaceColor",[0.65 0.85 0.90]);
    % errorbar(x,xmpl,error3,"-s","MarkerSize",5,...
    %     "MarkerEdgeColor","green","MarkerFaceColor",[0.65 0.85 0.90]);
hold off;
% hold on;
% % errorbar(x,xmpl,error2);
% % errorbar(x,xmpl,error3);
% hold off;
% patch([x fliplr(x)], [upperCurve fliplr(lowerCurve)], 'g');
% fill(x2,inBetween,'g');
% plot(upperCurve-lowerCurve);
% area((xmpl + xmpl_sd)-(xmpl - xmpl_sd));
% area(xmpl - xmpl_sd);
% hold off;
ax2 = subplot(3,2,2); %plots with mm as "error"
    errorbar(x,xmpl2,error,"-s","MarkerSize",5,...
        "MarkerEdgeColor","blue","MarkerFaceColor",[0.65 0.85 0.90]);
hold on;
    errorbar(x,xmpl3,error2,"-s","MarkerSize",5,...
        "MarkerEdgeColor","red","MarkerFaceColor",[0.65 0.85 0.90]);
    errorbar(x,xmpl4,error3,"-s","MarkerSize",5,...
        "MarkerEdgeColor","red","MarkerFaceColor",[0.65 0.85 0.90]);
hold off;

subplot(3,2,3);
subplot(3,2,4);
subplot(3,2,5);
subplot(3,2,6);