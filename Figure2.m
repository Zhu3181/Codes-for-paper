% fig 2
clear all

h1=figure;
set(h1,'units','normalized','position',[0.2,0.036,0.8,0.45])
gap =[0.1 0.01]; %表示子图之间垂直方向和水平方向的间隔 此处对于仅有1张子图无作用效果
marg_h=[0.2 0.05]; %全部子图到figure下上边界的距离
marg_w=[0.06 0.02]; %全部子图到figure左右边界的距离
ha = tight_subplot(1,3,gap,marg_h,marg_w);
hold on

a = [233/255,75/255,81/255];
b = [91/255,151/255,199/255];
c = [112/255,192/255,109/255];


%%
axes(ha(1));
hold on

load('argo_esa_chla_new.mat')
chlaL3_esa(argo_data1(:,1)>=1) = chlaL3_esa(argo_data1(:,1)>=1).*3;

tiff_argo_scatter = [argo_data1(:,1),chlaL3_esa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',a,'LineWidth',2);

XL = get(gca,'xlim'); 
YL = get(gca,'ylim'); 
% 
% xlim([XL(1) XL(2)])
% ylim([XL(1) XL(2)])
xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% title('Pacific Chla','LineWidth',1.5,'fontsize',12,'fontweight','bold')%,'fontname','Arial'

% 自定义刻度
yticks(log10([0.002, 0.01, 0.1, 1, 10]));
yticklabels({'0', '0.01', '0.1', '1', '10'});
xticks(log10([0.002, 0.01, 0.1, 1, 10]));
xticklabels({'0', '0.01', '0.1', '1', '10'});

%计算精度验证的数值
mrpe_log = mean((log10(tiff_argo_scatter(:,2)') - log10(tiff_argo_scatter(:,1)'))./ log10(tiff_argo_scatter(:,1)')) * 100
mape_log = mean(abs((log10(tiff_argo_scatter(:,2)') - log10(tiff_argo_scatter(:,1)')))./ log10(tiff_argo_scatter(:,1)')) * 100
mrpe = mean((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)')./ tiff_argo_scatter(:,1)') * 100

%mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

lowdata = tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1,:);
% mapelow = mean(abs((lowdata(:,2)' - lowdata(:,1)'))./ lowdata(:,1)') * 100
apelow = abs((lowdata(:,2)' - lowdata(:,1)'))./ lowdata(:,1)';
apelow(apelow>=4) = 4;
mapelow = mean(apelow) * 100
[r2 rmse] = rsquare(tiff_argo_scatter(:,1)',tiff_argo_scatter(:,2)');

% mrpe = 43.18;
mape = abs(mape);


%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(1),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
xlabel('Chla_{10m} (mg/m^3)','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','Times New Roman')
ylabel('Chla_{sat} (mg/m^3)','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','Times New Roman')

%把数值显示在图上
str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
annotation(gcf,'textbox',...
    [0.191788194444405 0.230913870251936 0.25633680555595 0.07822262614512],...
    'String',str,...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'LineStyle','none');

annotation(gcf,'textbox',...
    [0.0599270833333329 0.862551440329227 0.0815625000000005 0.0782226261451205],...
    'String','(a) ESA',...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'LineStyle','none');


%%
axes(ha(2));
hold on

load('argo_nasa_chla_new.mat')
chlaL3_nasa(argo_data1(:,1)>=1) = chlaL3_nasa(argo_data1(:,1)>=1).*3;
tiff_argo_scatter = [argo_data1(:,1),chlaL3_nasa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',b,'LineWidth',2);

XL = get(gca,'xlim'); 
YL = get(gca,'ylim'); 
% 
% xlim([XL(1) XL(2)])
% ylim([XL(1) XL(2)])
xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% title('Pacific Chla','LineWidth',1.5,'fontsize',12,'fontweight','bold')%,'fontname','Arial'

% 自定义刻度
yticks(log10([0.001, 0.01, 0.1, 1, 10]));
yticklabels({'0', '0.01', '0.1', '1', '10'});
xticks(log10([0.001, 0.01, 0.1, 1, 10]));
xticklabels({'0', '0.01', '0.1', '1', '10'});

%计算精度验证的数值
mrpe_log = mean((log10(tiff_argo_scatter(:,2)') - log10(tiff_argo_scatter(:,1)'))./ log10(tiff_argo_scatter(:,1)')) * 100
mape_log = mean(abs((log10(tiff_argo_scatter(:,2)') - log10(tiff_argo_scatter(:,1)')))./ log10(tiff_argo_scatter(:,1)')) * 100
mrpe = mean((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)')./ tiff_argo_scatter(:,1)') * 100

%mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

lowdata = tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1,:);
%mapelow = mean(abs((lowdata(:,2)' - lowdata(:,1)'))./ lowdata(:,1)') * 100
apelow = abs((lowdata(:,2)' - lowdata(:,1)'))./ lowdata(:,1)';
apelow(apelow>=4) = 4;
mapelow = mean(apelow) * 100
[r2 rmse] = rsquare(tiff_argo_scatter(:,1)',tiff_argo_scatter(:,2)');

% mrpe = 43.18;
mape = abs(mape);


%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(2),'fontsize',16,'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','yticklabel',[ ]);
xlabel('Chla_{10m} (mg/m^3)','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','Times New Roman')
% ylabel('Chla Satellite mg/m^3','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','New Times Roman')

%把数值显示在图上
str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
annotation(gcf,'textbox',...
    [0.501788194444405 0.230913870251936 0.235633680555595 0.07822262614512],...
    'String',str,...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'LineStyle','none');

annotation(gcf,'textbox',...
    [0.3699270833333329 0.862551440329227 0.1815625000000005 0.0782226261451205],...
    'String','(b) NASA',...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'LineStyle','none');

%%
axes(ha(3));
hold on

load('argo_noaa_chla_new.mat')
chlaL3_noaa(argo_data1(:,1)>=1) = chlaL3_noaa(argo_data1(:,1)>=1).*3;
tiff_argo_scatter = [argo_data1(:,1),chlaL3_noaa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',c,'LineWidth',2);

XL = get(gca,'xlim'); 
YL = get(gca,'ylim'); 
% 
% xlim([XL(1) XL(2)])
% ylim([XL(1) XL(2)])
xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% title('Pacific Chla','LineWidth',1.5,'fontsize',12,'fontweight','bold')%,'fontname','Arial'

% 自定义刻度
yticks(log10([0.001, 0.01, 0.1, 1, 10]));
yticklabels({'0', '0.01', '0.1', '1', '10'});
xticks(log10([0.001, 0.01, 0.1, 1, 10]));
xticklabels({'0', '0.01', '0.1', '1', '10'});

%计算精度验证的数值
mrpe_log = mean((log10(tiff_argo_scatter(:,2)') - log10(tiff_argo_scatter(:,1)'))./ log10(tiff_argo_scatter(:,1)')) * 100
mape_log = mean(abs((log10(tiff_argo_scatter(:,2)') - log10(tiff_argo_scatter(:,1)')))./ log10(tiff_argo_scatter(:,1)')) * 100
mrpe = mean((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)')./ tiff_argo_scatter(:,1)') * 100

% mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

lowdata = tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1,:);
%mapelow = mean(abs((lowdata(:,2)' - lowdata(:,1)'))./ lowdata(:,1)') * 100
apelow = abs((lowdata(:,2)' - lowdata(:,1)'))./ lowdata(:,1)';
apelow(apelow>=4) = 4;
mapelow = mean(apelow) * 100
[r2 rmse] = rsquare(tiff_argo_scatter(:,1)',tiff_argo_scatter(:,2)');

% mrpe = 43.18;
mape = abs(mape);


%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(3),'fontsize',16,'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','yticklabel',[ ]);
xlabel('Chla_{10m} (mg/m^3)','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','Times New Roman')
% ylabel('Chla Satellite mg/m^3','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','New Times Roman')

%把数值显示在图上
str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
annotation(gcf,'textbox',...
    [0.811788194444405 0.230913870251936 0.235633680555595 0.07822262614512],...
    'String',str,...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'LineStyle','none');

annotation(gcf,'textbox',...
    [0.6809270833333329 0.862551440329227 0.1815625000000005 0.0782226261451205],...
    'String','(c) NOAA',...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'LineStyle','none');

% 创建 rectangle
annotation(gcf,'rectangle',...
    [0.0765208333333333 0.374485596707819 0.118791666666667 0.286008230452675],...
    'LineWidth',2,...
    'LineStyle','--');
annotation(gcf,'rectangle',...
    [0.387718749999999 0.374485596707819 0.118791666666665 0.286008230452672],...
    'LineWidth',2,...
    'LineStyle','--');
annotation(gcf,'rectangle',...
    [0.696963541666663 0.374485596707819 0.118791666666665 0.286008230452672],...
    'LineWidth',2,...
    'LineStyle','--');
annotation(gcf,'textbox',...
    [0.0768229166666665 0.6677 0.134440100354065 0.0761316855871138],...
    'String',{'MAPD=249.46%'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'EdgeColor','none');
annotation(gcf,'textbox',...
    [0.38671875 0.6677 0.134440100354065 0.0761316855871138],...
    'String',{'MAPD=201.27%'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'EdgeColor','none');
annotation(gcf,'textbox',...
    [0.696614583333332 0.6677 0.134440100354065 0.0761316855871138],...
    'String',{'MAPD=201.77%'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'EdgeColor','none');

