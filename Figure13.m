% fig 13
clear all

h1=figure;
set(h1,'units','normalized','position',[0.2,0.036,0.8,0.7])
gap =[0.01 0.01]; %表示子图之间垂直方向和水平方向的间隔 此处对于仅有1张子图无作用效果
marg_h=[0.15 0.1]; %全部子图到figure下上边界的距离
marg_w=[0.06 0.02]; %全部子图到figure左右边界的距离
ha = tight_subplot(3,5,gap,marg_h,marg_w);
hold on

a = [233/255,75/255,81/255];
b = [91/255,151/255,199/255];
c = [112/255,192/255,109/255];

%%
axes(ha(1));
hold on

load('argo_esa_chla_all.mat')
load('cf_esa.mat')
chlaL3_esa(chla_all(:,1)>=1) = chlaL3_esa(chla_all(:,1)>=1).*1;

tiff_argo_scatter = [chla_all(:,1),chlaL3_esa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',a,'LineWidth',2);

% xlim([XL(1) XL(2)])
% ylim([XL(1) XL(2)])
xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% 自定义刻度
yticks(log10([0.002, 0.01, 0.1, 1, 10]));
yticklabels({'0', '0.01', '0.1', '1', '10'});
% xticks(log10([0.002, 0.01, 0.1, 1, 10]));
% xticklabels({'0', '0.01', '0.1', '1', '10'});

%计算精度验证的数值
% mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
% mape = abs(mape);
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
text('string',str,'fontsize',16,'fontweight','bold','fontname','Times New Roman', ...
    'color','k','Units','normalized','position',[0.42,0.08])
% text('string','(a)','fontsize',24,'color','k','Units','normalized','position',[0.05,0.9], ...
%     'fontweight','bold','fontname','New Times Roman')

%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(1),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
% xlabel('Chla_{10m} Argo mg/m^3','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')
ylabel('Chla ESA (mg/m^3)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')

%%
axes(ha(2));
hold on

tiff_argo_scatter = [chla_50m,chlaL3_esa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];
tiff_argo_scatter((isnan(tiff_argo_scatter(:,1))|tiff_argo_scatter(:,1)==0),:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',a,'LineWidth',2);

xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% 自定义刻度
% yticks(log10([0.002, 0.01, 0.1, 1, 10]));
% yticklabels({'0', '0.01', '0.1', '1', '10'});
% xticks(log10([0.002, 0.01, 0.1, 1, 10]));
% xticklabels({'0', '0.01', '0.1', '1', '10'});

%计算精度验证的数值
% mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
% mape = abs(mape);
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
text('string',str,'fontsize',16,'fontweight','bold','fontname','Times New Roman', ...
    'color','k','Units','normalized','position',[0.42,0.08])
% text('string','(b)','fontsize',24,'color','k','Units','normalized','position',[0.05,0.9], ...
%     'fontweight','bold','fontname','New Times Roman')

%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(2),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
% xlabel('Chla_{10m} Argo mg/m^3','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')
% ylabel('Chla ESA (mg/m^3)','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')

%%
axes(ha(4));
hold on

tiff_argo_scatter = [chla_CF,chlaL3_esa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];
tiff_argo_scatter((isnan(tiff_argo_scatter(:,1))|tiff_argo_scatter(:,1)==0),:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',a,'LineWidth',2);

xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% 自定义刻度
% yticks(log10([0.002, 0.01, 0.1, 1, 10]));
% yticklabels({'0', '0.01', '0.1', '1', '10'});
% xticks(log10([0.002, 0.01, 0.1, 1, 10]));
% xticklabels({'0', '0.01', '0.1', '1', '10'});

%计算精度验证的数值
% mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
% mape = abs(mape);
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
text('string',str,'fontsize',16,'fontweight','bold','fontname','Times New Roman', ...
    'color','k','Units','normalized','position',[0.42,0.08])
% text('string','(c)','fontsize',24,'color','k','Units','normalized','position',[0.05,0.9], ...
%     'fontweight','bold','fontname','New Times Roman')

%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(4),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
% xlabel('Chla_{10m} Argo mg/m^3','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')
% ylabel('Chla ESA (mg/m^3)','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')


%%
axes(ha(3));
hold on

tiff_argo_scatter = [chla_z90,chlaL3_esa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];
tiff_argo_scatter((isnan(tiff_argo_scatter(:,1))|tiff_argo_scatter(:,1)==0),:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',a,'LineWidth',2);

xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% 自定义刻度
% yticks(log10([0.002, 0.01, 0.1, 1, 10]));
% yticklabels({'0', '0.01', '0.1', '1', '10'});
% xticks(log10([0.002, 0.01, 0.1, 1, 10]));
% xticklabels({'0', '0.01', '0.1', '1', '10'});

%计算精度验证的数值
% mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
% mape = abs(mape);
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
text('string',str,'fontsize',16,'fontweight','bold','fontname','Times New Roman', ...
    'color','k','Units','normalized','position',[0.42,0.08])
% text('string','(d)','fontsize',24,'color','k','Units','normalized','position',[0.05,0.9], ...
%     'fontweight','bold','fontname','New Times Roman')

%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(3),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
% xlabel('Chla_{10m} Argo mg/m^3','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')
% ylabel('Chla ESA (mg/m^3)','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')

%%
axes(ha(5));
hold on

tiff_argo_scatter = [chla_all(:,2),chlaL3_esa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];
tiff_argo_scatter((isnan(tiff_argo_scatter(:,1))|tiff_argo_scatter(:,1)==0),:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',a,'LineWidth',2);

xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% 自定义刻度
% yticks(log10([0.002, 0.01, 0.1, 1, 10]));
% yticklabels({'0', '0.01', '0.1', '1', '10'});
% xticks(log10([0.002, 0.01, 0.1, 1, 10]));
% xticklabels({'0', '0.01', '0.1', '1', '10'});

%计算精度验证的数值
% mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
% mape = abs(mape);
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
text('string',str,'fontsize',16,'fontweight','bold','fontname','Times New Roman', ...
    'color','k','Units','normalized','position',[0.42,0.08])
% text('string','(e)','fontsize',24,'color','k','Units','normalized','position',[0.05,0.9], ...
%     'fontweight','bold','fontname','New Times Roman')

%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(5),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
% xlabel('Chla_{10m} Argo mg/m^3','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')
% ylabel('Chla ESA (mg/m^3)','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')




%%
axes(ha(6));
hold on

load('argo_nasa_chla_all.mat')
load('cf_nasa.mat')
chlaL3_nasa(chla_all(:,1)>=1) = chlaL3_nasa(chla_all(:,1)>=1).*3;

tiff_argo_scatter = [chla_all(:,1),chlaL3_nasa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',b,'LineWidth',2);

% xlim([XL(1) XL(2)])
% ylim([XL(1) XL(2)])
xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% 自定义刻度
yticks(log10([0.002, 0.01, 0.1, 1]));
yticklabels({'0', '0.01', '0.1', '1'});
% xticks(log10([0.002, 0.01, 0.1, 1, 10]));
% xticklabels({'0', '0.01', '0.1', '1', '10'});

%计算精度验证的数值
% mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
% mape = abs(mape);
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
text('string',str,'fontsize',16,'fontweight','bold','fontname','Times New Roman', ...
    'color','k','Units','normalized','position',[0.42,0.08])

%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(6),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
% xlabel('Chla_{10m} Argo mg/m^3','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')
ylabel('Chla NASA (mg/m^3)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')

%%
axes(ha(7));
hold on

tiff_argo_scatter = [chla_50m,chlaL3_nasa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];
tiff_argo_scatter((isnan(tiff_argo_scatter(:,1))|tiff_argo_scatter(:,1)==0),:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',b,'LineWidth',2);

xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% 自定义刻度
% yticks(log10([0.002, 0.01, 0.1, 1, 10]));
% yticklabels({'0', '0.01', '0.1', '1', '10'});
% xticks(log10([0.002, 0.01, 0.1, 1, 10]));
% xticklabels({'0', '0.01', '0.1', '1', '10'});

%计算精度验证的数值
% mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
% mape = abs(mape);
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
text('string',str,'fontsize',16,'fontweight','bold','fontname','Times New Roman', ...
    'color','k','Units','normalized','position',[0.42,0.08])

%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(7),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
% xlabel('Chla_{10m} Argo mg/m^3','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')
% ylabel('Chla ESA (mg/m^3)','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')

%%
axes(ha(9));
hold on

tiff_argo_scatter = [chla_CF,chlaL3_nasa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];
tiff_argo_scatter((isnan(tiff_argo_scatter(:,1))|tiff_argo_scatter(:,1)==0),:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',b,'LineWidth',2);

xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% 自定义刻度
% yticks(log10([0.002, 0.01, 0.1, 1, 10]));
% yticklabels({'0', '0.01', '0.1', '1', '10'});
% xticks(log10([0.002, 0.01, 0.1, 1, 10]));
% xticklabels({'0', '0.01', '0.1', '1', '10'});

%计算精度验证的数值
% mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
% mape = abs(mape);
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
text('string',str,'fontsize',16,'fontweight','bold','fontname','Times New Roman', ...
    'color','k','Units','normalized','position',[0.42,0.08])

%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(9),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
% xlabel('Chla_{10m} Argo mg/m^3','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')
% ylabel('Chla ESA (mg/m^3)','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')


%%
axes(ha(8));
hold on

tiff_argo_scatter = [chla_z90,chlaL3_nasa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];
tiff_argo_scatter((isnan(tiff_argo_scatter(:,1))|tiff_argo_scatter(:,1)==0),:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',b,'LineWidth',2);

xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% 自定义刻度
% yticks(log10([0.002, 0.01, 0.1, 1, 10]));
% yticklabels({'0', '0.01', '0.1', '1', '10'});
% xticks(log10([0.002, 0.01, 0.1, 1, 10]));
% xticklabels({'0', '0.01', '0.1', '1', '10'});

%计算精度验证的数值
% mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
% mape = abs(mape);
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
text('string',str,'fontsize',16,'fontweight','bold','fontname','Times New Roman', ...
    'color','k','Units','normalized','position',[0.42,0.08])

%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(8),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
% xlabel('Chla_{10m} Argo mg/m^3','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')
% ylabel('Chla ESA (mg/m^3)','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')

%%
axes(ha(10));
hold on

tiff_argo_scatter = [chla_all(:,2),chlaL3_nasa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];
tiff_argo_scatter((isnan(tiff_argo_scatter(:,1))|tiff_argo_scatter(:,1)==0),:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',b,'LineWidth',2);

xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% 自定义刻度
% yticks(log10([0.002, 0.01, 0.1, 1, 10]));
% yticklabels({'0', '0.01', '0.1', '1', '10'});
% xticks(log10([0.002, 0.01, 0.1, 1, 10]));
% xticklabels({'0', '0.01', '0.1', '1', '10'});

%计算精度验证的数值
% mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
% mape = abs(mape);
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
text('string',str,'fontsize',16,'fontweight','bold','fontname','Times New Roman', ...
    'color','k','Units','normalized','position',[0.42,0.08])

%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(10),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
% xlabel('Chla_{10m} Argo mg/m^3','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')
% ylabel('Chla ESA (mg/m^3)','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')


%%
axes(ha(11));
hold on

load('argo_noaa_chla_all.mat')
load('cf_noaa.mat')
chlaL3_noaa(chla_all(:,1)>=1) = chlaL3_noaa(chla_all(:,1)>=1).*1;

tiff_argo_scatter = [chla_all(:,1),chlaL3_noaa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',c,'LineWidth',2);

% xlim([XL(1) XL(2)])
% ylim([XL(1) XL(2)])
xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% 自定义刻度
yticks(log10([0.002, 0.01, 0.1, 1]));
yticklabels({'0', '0.01', '0.1', '1'});
xticks(log10([0.01, 0.1, 1, 10]));
xticklabels({'0.01', '0.1', '1', '10'});

%计算精度验证的数值
% mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
% mape = abs(mape);
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
text('string',str,'fontsize',16,'fontweight','bold','fontname','Times New Roman', ...
    'color','k','Units','normalized','position',[0.42,0.08])

%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(11),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
xlabel('Chla_{10m} (mg/m^3)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')
ylabel('Chla NOAA (mg/m^3)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')

%%
axes(ha(12));
hold on

tiff_argo_scatter = [chla_50m,chlaL3_noaa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];
tiff_argo_scatter((isnan(tiff_argo_scatter(:,1))|tiff_argo_scatter(:,1)==0),:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',c,'LineWidth',2);

xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% 自定义刻度
% yticks(log10([0.002, 0.01, 0.1, 1, 10]));
% yticklabels({'0', '0.01', '0.1', '1', '10'});
xticks(log10([0.01, 0.1, 1, 10]));
xticklabels({'0.01', '0.1', '1', '10'});

%计算精度验证的数值
% mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
% mape = abs(mape);
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
text('string',str,'fontsize',16,'fontweight','bold','fontname','Times New Roman', ...
    'color','k','Units','normalized','position',[0.42,0.08])

%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(12),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
xlabel('Chla_{50m} (mg/m^3)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')
% ylabel('Chla ESA (mg/m^3)','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')

%%
axes(ha(14));
hold on

tiff_argo_scatter = [chla_CF,chlaL3_noaa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];
tiff_argo_scatter((isnan(tiff_argo_scatter(:,1))|tiff_argo_scatter(:,1)==0),:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',c,'LineWidth',2);

xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% 自定义刻度
% yticks(log10([0.002, 0.01, 0.1, 1, 10]));
% yticklabels({'0', '0.01', '0.1', '1', '10'});
xticks(log10([0.01, 0.1, 1, 10]));
xticklabels({'0.01', '0.1', '1', '10'});

%计算精度验证的数值
% mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
% mape = abs(mape);
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
text('string',str,'fontsize',16,'fontweight','bold','fontname','Times New Roman', ...
    'color','k','Units','normalized','position',[0.42,0.08])

%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(14),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
xlabel('C_f (mg/m^3)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')
% ylabel('Chla ESA (mg/m^3)','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')


%%
axes(ha(13));
hold on

tiff_argo_scatter = [chla_z90,chlaL3_noaa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];
tiff_argo_scatter((isnan(tiff_argo_scatter(:,1))|tiff_argo_scatter(:,1)==0),:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',c,'LineWidth',2);

xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% 自定义刻度
% yticks(log10([0.002, 0.01, 0.1, 1, 10]));
% yticklabels({'0', '0.01', '0.1', '1', '10'});
xticks(log10([0.01, 0.1, 1, 10]));
xticklabels({'0.01', '0.1', '1', '10'});

%计算精度验证的数值
% mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
% mape = abs(mape);
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
text('string',str,'fontsize',16,'fontweight','bold','fontname','Times New Roman', ...
    'color','k','Units','normalized','position',[0.42,0.08])

%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(13),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
xlabel('Chla_{z90} (mg/m^3)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')
% ylabel('Chla ESA (mg/m^3)','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')

%%
axes(ha(15));
hold on

tiff_argo_scatter = [chla_all(:,2),chlaL3_noaa];
tiff_argo_scatter(tiff_argo_scatter(:,1)<0.1&tiff_argo_scatter(:,2)>1,:) = [];
tiff_argo_scatter((isnan(tiff_argo_scatter(:,1))|tiff_argo_scatter(:,1)==0),:) = [];

plot(log10(tiff_argo_scatter(:,1))', log10(tiff_argo_scatter(:,2))','o','color',c,'LineWidth',2);

xlim(log10([0.002 10]))
ylim(log10([0.002 10]))

% 自定义刻度
% yticks(log10([0.002, 0.01, 0.1, 1, 10]));
% yticklabels({'0', '0.01', '0.1', '1', '10'});
xticks(log10([0.01, 0.1, 1, 10]));
xticklabels({'0.01', '0.1', '1', '10'});

%计算精度验证的数值
% mape = mean(abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)') * 100
% mape = abs(mape);
ape = abs((tiff_argo_scatter(:,2)' - tiff_argo_scatter(:,1)'))./ tiff_argo_scatter(:,1)';
ape(ape>=4) = 4;
mape = mean(ape) * 100;

str = {strcat('MAPD=', ' ', num2str(mape,'%.2f'),'%')};
text('string',str,'fontsize',16,'fontweight','bold','fontname','Times New Roman', ...
    'color','k','Units','normalized','position',[0.42,0.08])
%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

set(ha(15),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
xlabel('Chla_{DCM} (mg/m^3)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')
% ylabel('Chla ESA (mg/m^3)','LineWidth',1.5,'fontsize',16,'fontweight','bold','fontname','New Times Roman')

%%
annotation(gcf,'textbox',...
    [0.0625 0.84 0.05 0.062],...
    'String',{'(a)'},...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.248 0.84 0.05 0.062],...
    'String',{'(b)'},...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.434 0.84 0.05 0.062],...
    'String',{'(c)'},...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.619 0.84 0.05 0.062],...
    'String',{'(d)'},...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.806 0.84 0.05 0.062],...
    'String',{'(e)'},...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.0625 0.584 0.05 0.062],...
    'String',{'(f)'},...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.248 0.584 0.05 0.062],...
    'String',{'(g)'},...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.434 0.584 0.05 0.062],...
    'String',{'(h)'},...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.619 0.584 0.05 0.062],...
    'String',{'(i)'},...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.806 0.584 0.05 0.062],...
    'String',{'(j)'},...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.0625 0.329 0.05 0.062],...
    'String',{'(k)'},...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.248 0.329 0.05 0.062],...
    'String',{'(l)'},...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.434 0.329 0.05 0.062],...
    'String',{'(m)'},...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.619 0.329 0.05 0.062],...
    'String',{'(d)'},...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.806 0.329 0.05 0.062],...
    'String',{'(n)'},...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.109723958333333 0.940476190476189 0.0510833333333333 0.0251322751322751],...
    'String',{'Chla_{10m}'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.298526041666667 0.940476190476189 0.0510833333333332 0.0251322751322751],...
    'String','Chla_{50m}',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.487328125 0.940476190476189 0.0510833333333333 0.0251322751322751],...
    'String','Chla_{z90}',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.693708333333333 0.940476190476189 0.0510833333333333 0.0251322751322751],...
    'String','C_{f}',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.860374999999999 0.940476190476189 0.0510833333333333 0.0251322751322751],...
    'String','Chla_{DCM}',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

