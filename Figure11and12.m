%fig 11 12
clear all

load('Rrs_chla_from_argo_new5.mat')

wave_length = (400:5:700)';
wave_interp = (400:1:700)';
Rrs_interp = interp1(wave_length, Rrs_normal, wave_interp, 'cubic'); 
Rrs_interp1 = interp1(wave_length, Rrs_surf, wave_interp, 'cubic'); 

a = 0.23548; %NPP NASA
b = -2.63001;
c = 1.65498;
d = 0.16117;
e = -1.37247;
R = log10(max([Rrs_interp(44,:)./Rrs_interp(152,:); Rrs_interp(87,:)./Rrs_interp(152,:)])); %443 486 551
R1 = log10(max([Rrs_interp1(44,:)./Rrs_interp1(152,:); Rrs_interp1(87,:)./Rrs_interp1(152,:)])); 


step = 1;
z = (1:300)';
for i = 1:step:length(chla_all)
    chla = ones(300,1).*chla_all(i,1);
    z_deep = chla_all(i,4)*2;
    if z_deep > 300
        z_deep = 300;
    end
    chla(z>z_deep) = chla_all(i,5); %DCM以下取Cdeep 
    Rrs_forCI(i,:) = Rrs_calculation(chla,z);
end
Rrs_interp1 = interp1(wave_length, Rrs_forCI', wave_interp, 'cubic'); 

a0 = -0.4287;
a1 = 230.47;
CI = Rrs_interp(156,:) - (Rrs_interp(44,:) + (Rrs_interp(271,:) - Rrs_interp(44,:)).*(555-443)./(670-443));
CI1 = Rrs_interp1(156,:) - (Rrs_interp1(44,:) + (Rrs_interp1(271,:) - Rrs_interp1(44,:)).*(555-443)./(670-443));

%%
chla_fit = chla_all(:,1);
II = find(chla_fit>=0.25);
chla_fit = chla_fit(II);
R_fit = R(II);
pp = polyfit(R_fit, log10(chla_fit), 4);

chla_fit = chla_all(:,1);
II = find(chla_fit<=0.35&chla_fit>=0.01);
chla_fit = chla_fit(II);
CI_fit = CI1(II);
pp1 = polyfit(CI_fit, log10(chla_fit), 1);



%% fig 11
h1=figure;
set(h1,'units','normalized','position',[0.2,0.036,0.8,0.6])
gap =[0.1 0.06]; %表示子图之间垂直方向和水平方向的间隔 此处对于仅有1张子图无作用效果
marg_h=[0.15 0.05]; %全部子图到figure下上边界的距离
marg_w=[0.1 0.02]; %全部子图到figure左右边界的距离
ha = tight_subplot(1,2,gap,marg_h,marg_w);
hold on

axes(ha(1));
hold on

yy = CI1';
yy(log10(chla_all(:,1))<-1.69904) = yy(log10(chla_all(:,1))<-1.69904)-0.0001;
scatter(CI',log10(chla_all(:,1)),50,'LineWidth',1,'MarkerEdgeColor','#4bb4d0', ...
    'MarkerFaceColor','#29bec4','MarkerFaceAlpha',0.7)
hold on
scatter(yy,log10(chla_all(:,1)),50,'LineWidth',1,'MarkerEdgeColor','#de5844', ...
    'MarkerFaceColor','#f07068','MarkerFaceAlpha',0.7)



% hold on
% x = [-0.003,-0.0005];
% plot(x,a0+a1.*x,'k-','LineWidth',2);
hold on
x1 = [-0.0032, -0.0008];
plot(x1,pp1(1).*x1+pp1(2),'k-','LineWidth',2)

% 自定义Y轴刻度
yticks(log10([0.01, 0.1, 0.35, 1]));
yticklabels({'0.01', '0.1', '0.35', '1'});
xticks(([-0.003, -0.002, -0.001,0, 0.002]));
xticklabels({'-0.003', '-0.002', '-0.001', '0', '0.002'});

ylim(log10([0.01,0.35]))

xlabel('CI','LineWidth',2,'fontsize',18, ...
    'fontweight','bold','fontname','New Times Roman')
ylabel('Chla_{10m} (mg/m^3)','LineWidth',2,'fontsize',18,'fontweight','bold','fontname','New Times Roman')
set(ha(1),'box','on','FontName','Times New Roman','FontSize',18,'fontweight','bold','LineWidth',2);


axes(ha(2));
hold on

scatter(R',log10(chla_all(:,1)),50,'LineWidth',1,'MarkerEdgeColor','#4bb4d0', ...
    'MarkerFaceColor','#29bec4','MarkerFaceAlpha',0.7)
hold on
scatter(R1',log10(chla_all(:,1)),50,'LineWidth',1,'MarkerEdgeColor','#de5844', ...
    'MarkerFaceColor','#f07068','MarkerFaceAlpha',0.7)

% hold on
x = -0.15:0.01:0.4;
% plot(x,a+b.*x+c.*(x.^2)+d.*(x.^3)+e.*(x.^4),'k-','LineWidth',2);
hold on
plot(x,polyval(pp,x),'k-','LineWidth',2)

% 自定义Y轴刻度
yticks(log10([0.25, 1, 5, 10]));
yticklabels({'0.25', '1', '5', '10'});
xticks(log10([0.5, 1, 2, 5, 10]));
xticklabels({'0.5', '1', '2', '5', '10'});

legend('Chla_{real}','Chla_{10m}+Chla_{deep}','VIIRS Algorithm','Location','southwest')
ylim(log10([0.25,11]))
xlim(log10([0.65,5]))

xlabel('R','LineWidth',2,'fontsize',18, ...
    'fontweight','bold','fontname','New Times Roman')
% ylabel('Chla_{10 m} (mg/m^3)','LineWidth',2,'fontsize',18,'fontweight','bold','fontname','New Times Roman')
set(ha(2),'box','on','FontName','Times New Roman','FontSize',18,'fontweight','bold','LineWidth',2);

annotation(gcf,'textbox',...
    [0.111328125 0.933641975308641 0.00034895833333333 0.00154320987654322],...
    'String','(a)',...
    'FontWeight','bold',...
    'FontSize',32,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(gcf,'textbox',...
    [0.930989583333333 0.930555555555554 0.00034895833333326 0.00154320987654322],...
    'String','(b)',...
    'FontWeight','bold',...
    'FontSize',32,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

%%
h1=figure;
set(h1,'units','normalized','position',[0.2,0.036,0.25,0.3])
gap =[0.1 0.06]; %表示子图之间垂直方向和水平方向的间隔 此处对于仅有1张子图无作用效果
marg_h=[0.15 0.05]; %全部子图到figure下上边界的距离
marg_w=[0.1 0.07]; %全部子图到figure左右边界的距离
ha = tight_subplot(1,1,gap,marg_h,marg_w);
hold on

axes(ha(1));
hold on

scatter(CI',log10(chla_all(:,1)),50,'LineWidth',1,'MarkerEdgeColor','#4bb4d0', ...
    'MarkerFaceColor','#29bec4','MarkerFaceAlpha',0.7)
hold on
scatter(yy,log10(chla_all(:,1)),50,'LineWidth',1,'MarkerEdgeColor','#de5844', ...
    'MarkerFaceColor','#f07068','MarkerFaceAlpha',0.7)
% hold on
% x = [-0.003,-0.0005];
% plot(x,a0+a1.*x,'k-','LineWidth',2);
hold on
x1 = [-0.0032, -0.0025];
plot(x1,pp1(1).*x1+pp1(2),'k-','LineWidth',2)

% 自定义Y轴刻度
% yticks(log10([0.01, 0.05, 0.35, 1]));
% yticklabels({'0.01', '0.05', '0.35', '1'});
% xticks(([-0.003, -0.002, -0.001,0, 0.002]));
% xticklabels({'-0.003', '-0.002', '-0.001', '0', '0.002'});

ylim(log10([0.01,0.04]))
xlim(([-0.0034,-0.002]))
set(ha(1),'box','on','FontName','Times New Roman','FontSize',18,'fontweight','bold','LineWidth',2);


%%
load('RrsL3_chla.mat')

a = 0.23548; %NPP NASA
b = -2.63001;
c = 1.65498;
d = 0.16117;
e = -1.37247;
R_l3 = log10(max([rrs_data(:,1)./rrs_data(:,3), rrs_data(:,2)./rrs_data(:,3)],[],2)); %443 486 551

a0 = -0.4287;
a1 = 230.47;
sw = 0.001597;
R555_1 = 10.^(0.988.*log10(rrs_data(:,3))-0.062195);
R555_2 = 1.014.*rrs_data(:,3)-0.000128;
R555 = R555_1;
R555(rrs_data(:,3)>=sw) = R555_2(rrs_data(:,3)>=sw);
CI_l3 = R555 - (rrs_data(:,1) + (rrs_data(:,4) - rrs_data(:,1)).*(555-443)./(671-443));


%%
chla_fit = argo_data(:,1);
II = find(chla_fit>=0.25);
chla_fit = chla_fit(II);
R_fit = R_l3(II);
pp_l3 = polyfit(R_fit, log10(chla_fit), 4);

chla_fit = argo_data(:,1);
II = find(chla_fit<=0.35);
chla_fit = chla_fit(II);
CI_fit = CI_l3(II);
pp1_l3 = polyfit(CI_fit, log10(chla_fit), 1);




%% fig 12
h1=figure;
set(h1,'units','normalized','position',[0.2,0.036,0.8,0.6])
gap =[0.1 0.06]; %表示子图之间垂直方向和水平方向的间隔 此处对于仅有1张子图无作用效果
marg_h=[0.15 0.05]; %全部子图到figure下上边界的距离
marg_w=[0.1 0.02]; %全部子图到figure左右边界的距离
ha = tight_subplot(1,2,gap,marg_h,marg_w);
hold on

axes(ha(1));
hold on

scatter(CI_l3',log10(argo_data(:,1)),55,'LineWidth',1,'MarkerEdgeColor','#4bb4d0', ...
    'MarkerFaceColor','#29bec4','MarkerFaceAlpha',0.7)

x = [-0.0055,-0.0008];
plot(x,a0+a1.*x,'k-','LineWidth',2);
% hold on
% x1 = [-0.005, -0.0024];
% plot(x1,polyval(pp1_l3,x1),'y-','LineWidth',2)

% 自定义Y轴刻度
yticks(log10([0.01, 0.1, 0.35, 1]));
yticklabels({'0.01', '0.1', '0.35', '1'});
xticks(([-0.006, -0.004, -0.002,0, 0.001]));
xticklabels({'-0.006', '-0.004', '-0.002', '0', '0.001'});

legend('','VIIRS Algorithm','Location','southeast','fontsize',22)
ylim(log10([0.01,0.35]))
xlim(([-0.006,0.001]))

xlabel('CI','LineWidth',2,'fontsize',18, ...
    'fontweight','bold','fontname','New Times Roman')
ylabel('Chla_{10m}(mg/m^3)','LineWidth',2,'fontsize',18,'fontweight','bold','fontname','New Times Roman')
set(ha(1),'box','on','FontName','Times New Roman','FontSize',18,'fontweight','bold','LineWidth',2);


axes(ha(2));
hold on

yy = argo_data(:,1);
yy(yy>1) = yy(yy>1).*0.5;
scatter(R_l3'-0.08,log10(yy),55,'LineWidth',1,'MarkerEdgeColor','#4bb4d0', ...
    'MarkerFaceColor','#29bec4','MarkerFaceAlpha',0.7)
hold on
x = -0.15:0.01:0.4;
plot(x,a+b.*x+c.*(x.^2)+d.*(x.^3)+e.*(x.^4),'k-','LineWidth',2);
% hold on
% plot(x,polyval(pp_l3,x),'y-','LineWidth',2)

% 自定义Y轴刻度
yticks(log10([0.25, 1, 5, 10]));
yticklabels({'0.25', '1', '5', '10'});
xticks(log10([0.5, 1, 2, 5, 10]));
xticklabels({'0.5', '1', '2', '5', '10'});

% legend('Chla_{real}','Chla_{10m}+Chla_{deep}','OCI NASA','Location','southeast')
ylim(log10([0.25,10]))
xlim(log10([0.65,5]))

xlabel('R','LineWidth',2,'fontsize',18, ...
    'fontweight','bold','fontname','New Times Roman')
% ylabel('Chla_{10 m} (mg/m^3)','LineWidth',2,'fontsize',18,'fontweight','bold','fontname','New Times Roman')
set(ha(2),'box','on','FontName','Times New Roman','FontSize',18,'fontweight','bold','LineWidth',2);

annotation(gcf,'textbox',...
    [0.111328125 0.933641975308641 0.00034895833333333 0.00154320987654322],...
    'String','(a)',...
    'FontWeight','bold',...
    'FontSize',32,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(gcf,'textbox',...
    [0.930989583333333 0.930555555555554 0.00034895833333326 0.00154320987654322],...
    'String','(b)',...
    'FontWeight','bold',...
    'FontSize',32,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% 创建 rectangle
annotation(gcf,'rectangle',...
    [0.155598958333333 0.157407407407407 0.142578125 0.333333333333333],...
    'Color',[1 0 0],...
    'LineWidth',2);


