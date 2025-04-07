% fig 6 7

clear all

% load('Rrs_chla_from_argo_new2.mat')
% core_path = 'E:\zyx\小论文\Argo_Chla\core\';
% filepath = 'E:\zyx\小论文\Argo_Chla\selected_new1\';
% 
% z_ref = 0;
% delt_T = 0.5;
% chla_all = [chla_all, zeros(2587,1)];
% 
% for i = 1:length(chla_all)
%     file = strcat(filepath,dat_name(i,:));
%     [SID,date,lon,lat] = read_time_coord_from_dat(file);
%     date0 = datestr(date{1}, 'yyyy-mm-dd HH:MM:SS');
%     time = strcat(date0(1:4), date0(6:7));
% 
%     core_path0 = strcat(core_path, time(1:6), '\');
%     name = dat_name(i,:);
%     filename = strcat(name(1:8), name(14:20));
%     lat0 = chla_all(i,7);
%     if exist(strcat(core_path0, filename), 'file')
%         datas = importdata(strcat(core_path0, filename),' ',35); 
% %         z0 = -gsw_z_from_p(datas.data(:,2),lat0); %压强转深度
% %         temp0 = datas.data(:,5);        
% %         for j = 1:length(z0)
% %              if abs(temp0(j)-temp0(1)) > 0.5
% %                  mld = z0(j);
% %                  break
% %              end
% %         end
%         temp_adj = datas.data(:,5);
%         temp_adj_qc = datas.data(:,6);
%         pres_adj = datas.data(:,2);
%         pres_adj_qc = datas.data(:,3);
%         psal_adj = datas.data(:,8);
%         psal_adj_qc = datas.data(:,9);
% 
%         ibad = find(pres_adj_qc > 2|temp_adj_qc > 2|psal_adj_qc > 2);
%         if ~isempty(ibad)
%             pres_adj(ibad) = [];
%             temp_adj(ibad) = [];
%             psal_adj(ibad) = [];
%         end
% 
%         
% 
%         if ~isempty(pres_adj)
%             [B,I ] = sort(pres_adj ); %按照压强大小排序
%             pres_adj = B;
%             temp_adj = temp_adj(I);
%             psal_adj = psal_adj(I);
%             %去除重复项
%             [unique_pres, ~, idx] = unique(pres_adj, 'stable');
%             if length(unique_pres) ~= length(pres_adj)
%                 for j = 1:length(unique_pres)
%                     temp2(j,1) = mean(temp_adj(idx==j));
%                     psal2(j,1) = mean(psal_adj(idx==j));
%                 end
%                 pres2 = unique_pres;
%             else
%                 pres2 = pres_adj;
%                 temp2 = temp_adj;
%                 psal2 = psal_adj;
%             end
%             [mld] = mld(pres2, temp2, psal2, 'metric', 'threshold', 'tthresh', 0.5, 'dthresh', 0.03);       
%             mld0 = -gsw_z_from_p(mld(3),lat0);
%         else
%             mld0 = 0;
%         end
%         chla_all(i,8) = mld0;
% 
%         clear datas;
%         clear mld;
%         clear pres2;
%         clear temp2;
%         clear psal2;
% %         clear temp0;
%     end
% 
% 
% end


%%  fig 6
CM = chla_all(:,3);
DCM = chla_all(:,4);
MLD = chla_all(:,8);
Chla10m = chla_all(:,1);
ChlaDCM = chla_all(:,2);

yuzhi = 2;
h1=figure;
set(h1,'units','normalized','position',[0.2,0.036,0.7,0.85])
gap =[0.09 0.09]; %表示子图之间垂直方向和水平方向的间隔 此处对于仅有1张子图无作用效果
marg_h=[0.12 0.04]; %全部子图到figure下上边界的距离
marg_w=[0.1 0.15]; %全部子图到figure左右边界的距离
ha = tight_subplot(2,2,gap,marg_h,marg_w);
hold on


axes(ha(1));
hold on

X = log10(Chla10m);
Y = log10(DCM);

ind = find(isnan(Y)|isinf(Y));
X(ind) = [];
Y(ind) = [];

scatplot(X', Y', 'circles', sqrt((range(X')/100)^2+(range(Y')/100)^2) ...
    ,100,5,1,16,yuzhi);

xlim(log10([0.01 20]))
ylim(log10([5 400]))

set(gca,'fontsize',14,'fontweight','bold','fontname','Times New Roman');
xlabel('Chla_{10m} (mg/m^3)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')
ylabel('DCM depth (m)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')
% title('Pacific Chla','LineWidth',1.5,'fontsize',12,'fontweight','bold')%,'fontname','Arial'

% 自定义刻度
yticks(log10([1, 10, 100, 400]));
yticklabels({'0', '10', '100', '400'});
xticks(log10([0.01, 0.1, 1, 10, 40]));
xticklabels({'0.01', '0.1', '1', '10', '40'});

text('string','(a)','fontsize',28,'color','k', ...
    'position',[0.85,0.9],'FontWeight','bold','FontName', 'Times New Roman', ...
    'Units','normalized')

set(ha(1),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
hold on


axes(ha(2));
hold on

X = log10(CM);
Y = log10(DCM);

ind = find(isnan(Y)|isinf(Y));
X(ind) = [];
Y(ind) = [];

scatplot(X', Y', 'circles', sqrt((range(X')/100)^2+(range(Y')/100)^2) ...
    ,100,5,1,16,yuzhi);

xlim(log10([0.01 20]))
ylim(log10([5 400]))

set(gca,'fontsize',14,'fontweight','bold','fontname','Times New Roman');
xlabel('DCM (mg/m^3)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')
ylabel('DCM depth (m)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')
% title('Pacific Chla','LineWidth',1.5,'fontsize',12,'fontweight','bold')%,'fontname','Arial'

% 自定义刻度
yticks(log10([1, 10, 100, 400]));
yticklabels({'0', '10', '100', '400'});
xticks(log10([0.01, 0.1, 1, 10, 40]));
xticklabels({'0.01', '0.1', '1', '10', '40'});

text('string','(b)','fontsize',28,'color','k', ...
    'position',[0.85,0.9],'FontWeight','bold','FontName', 'Times New Roman', ...
    'Units','normalized')

set(ha(2),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
hold on


axes(ha(3));
hold on

X = log10(Chla10m);
Y = log10(CM);

ind = find(isnan(Y)|isinf(Y));
X(ind) = [];
Y(ind) = [];

scatplot(X', Y', 'circles', sqrt((range(X')/100)^2+(range(Y')/100)^2) ...
    ,100,5,1,16,yuzhi);

xlim(log10([0.01 20]))
ylim(log10([0.01 20]))

set(gca,'fontsize',14,'fontweight','bold','fontname','Times New Roman');
xlabel('Chla_{10m} (mg/m^3)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')
ylabel('DCM (mg/m^3)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')
% title('Pacific Chla','LineWidth',1.5,'fontsize',12,'fontweight','bold')%,'fontname','Arial'

% 自定义刻度
% yticks(log10([1, 10, 100, 400]));
% yticklabels({'0', '10', '100', '400'});
yticks(log10([0.01, 0.1, 1, 10, 40]));
yticklabels({'0.01', '0.1', '1', '10', '40'});
xticks(log10([0.01, 0.1, 1, 10, 40]));
xticklabels({'0.01', '0.1', '1', '10', '40'});

%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

text('string','(c)','fontsize',28,'color','k', ...
    'position',[0.85,0.8],'FontWeight','bold','FontName', 'Times New Roman', ...
    'Units','normalized')

set(ha(3),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
hold on


axes(ha(4));
hold on

X = log10(Chla10m);
Y = log10(ChlaDCM);

ind = find(isnan(Y)|isinf(Y));
X(ind) = [];
Y(ind) = [];

scatplot(X', Y', 'circles', sqrt((range(X')/100)^2+(range(Y')/100)^2) ...
    ,100,5,1,16,yuzhi);

xlim(log10([0.01 20]))
ylim(log10([0.01 20]))

set(gca,'fontsize',14,'fontweight','bold','fontname','Times New Roman');
xlabel('Chla_{10m} (mg/m^3)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')
ylabel('Chla_{DCM} (mg/m^3)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')
% title('Pacific Chla','LineWidth',1.5,'fontsize',12,'fontweight','bold')%,'fontname','Arial'

% 自定义刻度
% yticks(log10([1, 10, 100, 400]));
% yticklabels({'0', '10', '100', '400'});
yticks(log10([0.01, 0.1, 1, 10, 40]));
yticklabels({'0.01', '0.1', '1', '10', '40'});
xticks(log10([0.01, 0.1, 1, 10, 40]));
xticklabels({'0.01', '0.1', '1', '10', '40'});

%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

text('string','(d)','fontsize',28,'color','k', ...
    'position',[0.85,0.8],'FontWeight','bold','FontName', 'Times New Roman', ...
    'Units','normalized')

set(ha(4),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',16);
hold on


mycolorpoint=[[77 99 173];...
    [77 99 173];...
    [102 166 179];...
    [191 212 138];...
    [245 211 88];...
    [250 132 47];...
    [161 0 64];...
    [161 0 64]];
mycolorposition=[1 8 15 33 43 50 56 64];
mycolormap_r=interp1(mycolorposition,mycolorpoint(:,1),1:64,'linear','extrap');
mycolormap_g=interp1(mycolorposition,mycolorpoint(:,2),1:64,'linear','extrap');
mycolormap_b=interp1(mycolorposition,mycolorpoint(:,3),1:64,'linear','extrap');
mycolor=[mycolormap_r',mycolormap_g',mycolormap_b']/255;
mycolor=round(mycolor*10^4)/10^4;%保留4位小数
map = colormap(mycolor);
% 创建 colorbar
colorbar(axes(ha(4)),'Position',...
    [0.865823416527365 0.119825708061002 0.0195932501393015 0.840958610673305],...
    'Ticks',[0 0.2 0.4 0.6 0.8 1],...
    'FontWeight','bold',...
    'FontSize',16, ...
    'fontname','Times New Roman');



%% 与误差的散点图
clear all

load('argo_nasa_chla_new.mat')
core_path = 'E:\zyx\小论文\Argo_Chla\core\';
filepath = 'E:\zyx\小论文\Argo_Chla\selected_new1\';

z_ref = 0;
delt_T = 0.5;
chla_all = [argo_data1, zeros(691,1)];

for i = 1:length(chla_all)
    file = strcat(filepath,dat_match1(i,:));
    [SID,date,lon,lat] = read_time_coord_from_dat(file);
    date0 = datestr(date{1}, 'yyyy-mm-dd HH:MM:SS');
    time = strcat(date0(1:4), date0(6:7));

    core_path0 = strcat(core_path, time(1:6), '\');
    name = dat_match1(i,:);
    filename = strcat(name(1:8), name(14:20));
    lat0 = chla_all(i,7);
    lon0 = chla_all(i,6);
    if exist(strcat(core_path0, filename), 'file')
        datas = importdata(strcat(core_path0, filename),' ',35); 
%         z0 = -gsw_z_from_p(datas.data(:,2),lat0); %压强转深度
        temp_adj = datas.data(:,5);
        temp_adj_qc = datas.data(:,6);
        pres_adj = datas.data(:,2);
        pres_adj_qc = datas.data(:,3);
        psal_adj = datas.data(:,8);
        psal_adj_qc = datas.data(:,9);

        ibad = find(pres_adj_qc > 2|temp_adj_qc > 2|psal_adj_qc > 2);
        if ~isempty(ibad)
            pres_adj(ibad) = [];
            temp_adj(ibad) = [];
            psal_adj(ibad) = [];
        end
        if ~isempty(pres_adj)
            [mld] = mld(pres_adj, temp_adj, psal_adj, 'metric', 'threshold', 'tthresh', 0.5, 'dthresh', 0.03);       
            mld0 = -gsw_z_from_p(mld(3),lat0);
        else
            mld0 = 0;
        end

        
%         if z(1) <= 20 %排除没有表层数据的剖面
%             sst = mean(temp(z<=20)); %SST=Ave T 10m
%             temp1 = temp(z>20); %只在大于5m的深度找
%             z1 = z(z>20);
%             T_sst = sst - temp1;
%             ind = find(T_sst>=0.2,1,'first');
%             if ~isempty(ind)
%                 mld = z1(ind);
%             else
%                 mld = 0;
%             end
%         else
%             mld = 0;
%         end
        chla_all(i,8) = mld0;

        clear datas;
        clear mld;
%         clear z0;
%         clear temp0;
    end

end



%%
load('argo_nasa_chla_all.mat')
CM = chla_all(:,3);
DCM = chla_all(:,4);
MLD = chla_all(:,8);
Chla10m = chla_all(:,1);
ChlaDCM = chla_all(:,2);
error = abs((Chla10m-chlaL3_nasa)./Chla10m).*100;

%% pass
Y = (error);
X = MLD;
% ind = find(Y>400);
% Y(ind) = [];
% X(ind) = [];
ind = find(isnan(X)|isinf(X));
X(ind) = [];
Y(ind) = [];

figure
scatplot(X', Y', 'circles', sqrt((range(X')/10)^2+(range(Y')/15000)^2) ...
    ,130,5,1,16,5);
ylim(([0 1300]))
xlim(([10 160]))
% xlabel('Error (%)')
% ylabel('Chla_{max} (mg/m^3)')
hold on
YL = 10:10:160;
error_DCM = [];
for i = 1:length(YL)-1
    sam = error(MLD>=YL(i)&MLD<YL(i+1));
    error_DCM(end+1) = mean(sam);
end
% error_DCM(2) = (error_DCM(1) + error_DCM(3))./2;
p1 = plot(YL(1:end-1)+5,error_DCM,'color','k','LineWidth',2);
legend([p1],{'Average Error'})

set(gca,'fontsize',14,'fontweight','bold','fontname','New Times Roman');
ylabel('Error (%)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','New Times Roman')
xlabel('MLD (m)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','New Times Roman')
% title('Pacific Chla','LineWidth',1.5,'fontsize',12,'fontweight','bold')%,'fontname','Arial'

% 自定义刻度
% xticks(log10([0.01, 0.1, 1, 10]));
% xticklabels({'0.01', '0.1', '1', '10'});
xticks(([0, 10, 50, 100, 150, 200]));
xticklabels({'0', '10', '50', '100', '150', '200'});
% yticks(log10([0.01, 0.1, 1, 10, 40]));
% yticklabels({'0.01', '0.1', '1', '10', '40'});
yticks(([0, 200, 400, 600, 800, 1000, 1200]));
yticklabels({'0', '200', '400', '600', '800', '1000', '1200'});

% %画一条斜线
% hold on
% XL1 = get(gca,'xlim'); 
% YL1 = get(gca,'ylim'); 
% plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

%设置边框
box off
ax2 = axes('Position',get(gca,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','k','YColor','k',...
           'LineWidth',1.2);
set(ax2,'YTick', []);
set(ax2,'XTick', []);
box on



%% pass
X = log10(CM);
Y = log10(MLD);
ind = find(isnan(Y)|isinf(Y));
X(ind) = [];
Y(ind) = [];

figure
scatplot(X', Y', 'circles', sqrt((range(X')/10)^2+(range(Y')/10)^2) ...
    ,100,5,1,16);
xlim(log10([0.004 20]))
ylim(log10([5 300]))
xlabel('Chla AveDCM (mg/m^3)')
ylabel('MLD (m)')


set(gca,'fontsize',14,'fontweight','bold','fontname','New Times Roman');
ylabel('MLD (m)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','New Times Roman')
xlabel('Chla_{max} (mg/m^3)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','New Times Roman')
% title('Pacific Chla','LineWidth',1.5,'fontsize',12,'fontweight','bold')%,'fontname','Arial'

% 自定义刻度
xticks(log10([0.01, 0.1, 1, 10]));
xticklabels({'0.01', '0.1', '1', '10'});
% yticks(log10([0.01, 0.1, 1, 10, 40]));
% yticklabels({'0.01', '0.1', '1', '10', '40'});
yticks(log10([5, 10, 50, 100, 200]));
yticklabels({'5', '10', '50', '100', '200'});

% %画一条斜线
% hold on
% XL1 = get(gca,'xlim'); 
% YL1 = get(gca,'ylim'); 
% plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);

%设置边框
box off
ax2 = axes('Position',get(gca,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','k','YColor','k',...
           'LineWidth',1.2);
set(ax2,'YTick', []);
set(ax2,'XTick', []);
box on



%% fig7



X = (DCM);
Y = (MLD);
error = abs((Chla10m-chlaL3_nasa)./Chla10m).*100;
ind = find(isnan(Y)|isinf(Y));
X(ind) = [];
Y(ind) = [];
error(ind) = [];
error(error>=400) = 400;
ind = find(X>100&Y>80&error>200);
error(ind) = error(ind)-200;
ind = find(X<40&Y<40&error>200);
error(ind) = error(ind)-200;


h1=figure;
set(h1,'units','normalized','position',[0.2,0.036,0.45,0.55])
gap =[0.02 -0.05]; %表示子图之间垂直方向和水平方向的间隔 此处对于仅有1张子图无作用效果
marg_h=[0.12 0.04]; %全部子图到figure下上边界的距离
marg_w=[0.15 0.15]; %全部子图到figure左右边界的距离
ha = tight_subplot(1,1,gap,marg_h,marg_w);
hold on

axes(ha(1));
hold on
% map = colormap('jet');
% map = map(50:200,:);
% colormap(map)
n = 128;
red_to_blue = zeros(n, 3);
for i = 1:n
    red_to_blue(i, 1) = 1 - (i-1)/(n-1); % Red component
    red_to_blue(i, 2) = (i-1)/(n-1);     % Green component
    red_to_blue(i, 3) = (i-1)/(n-1);     % Blue component
end
map = flipud(red_to_blue);
colormap(flipud(red_to_blue)); % RGB值分别对应红色和蓝色


ind = fix((error-min(error))/(max(error)-min(error))*(size(map,1)-1))+1;
% scatter(X', Y',[],ind);
h = [];
% yyaxis left
for k=1:length(X)
    h(end+1) = line('Xdata',X(k),'Ydata',Y(k), ...
        'LineStyle','none','Color',map(ind(k),:), ...
        'Marker','.','MarkerSize',30);
end
% colorbar
xlim(([5 165]))
ylim(([5 165]))
caxis([0,400]);
colorbar('YLim',[0 400],'YTick',[0 100 200 300 400],'YTickLabel',{'0','100','200','300','400'}, ...
    'FontWeight','bold','FontSize',16,'FontName','Times New Roman')

set(gca,'fontsize',14,'fontweight','bold','fontname','Times New Roman');
ylabel('MLD (m)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')
xlabel('DCM depth (m)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','Times New Roman')
% title('Pacific Chla','LineWidth',1.5,'fontsize',12,'fontweight','bold')%,'fontname','Arial'

% 自定义刻度
xticks(([0, 10, 50, 100, 150, 200]));
xticklabels({'0', '10', '50', '100', '150', '200'});
% yticks(log10([0.01, 0.1, 1, 10, 40]));
% yticklabels({'0.01', '0.1', '1', '10', '40'});
yticks(([0, 10, 50, 100, 150, 200]));
yticklabels({'0', '10', '50', '100', '150', '200'});

%画一条线
% hold on
% XL = 10:10:160;
% error_MLD = [];
% for i = 1:length(XL)-1
%     sam = error(MLD>=XL(i)&MLD<XL(i+1));
%     error_MLD(end+1) = mean(sam);
% end
% yyaxis right
% p1 = plot(XL(1:end-1)+5,error_MLD,'color','k','LineWidth',2);
% 
% hold on
% YL = 10:10:160;
% error_DCM = [];
% for i = 1:length(YL)-1
%     sam = error(DCM>=YL(i)&DCM<YL(i+1));
%     error_DCM(end+1) = mean(sam);
% end
% yyaxis right
% p1 = plot(YL(1:end-1)+5,error_DCM,'color','k','LineWidth',2);

% ylabel('Error (%)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','New Times Roman')
% yticks(([0, 50, 100, 150, 200]));
% yticklabels({'0', '50', '100', '150', '200'});

% legend([p1],{'Average Error'})

set(ha(1),'LineWidth',1.5,'fontweight','bold','fontname','Times New Roman', ...
    'box','on','fontsize',18);

annotation(gcf,'textbox',[0.775231481481481 0.632659932659932 0.2 0.2],...
    'String','APD (%)',...
    'Rotation',270,...
    'FontWeight','bold',...
    'FontSize',20,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

%% pass
h1=figure;
set(h1,'units','normalized','position',[0.2,0.036,0.55,0.7])
gap =[0.01 0.01]; %表示子图之间垂直方向和水平方向的间隔 此处对于仅有1张子图无作用效果
marg_h=[0.1 0.05]; %全部子图到figure下上边界的距离
marg_w=[0.06 0.02]; %全部子图到figure左右边界的距离
ha = tight_subplot(2,2,gap,marg_h,marg_w);
hold on


axes(ha(4));
hold on
CM = chla_all(:,3);
DCM = chla_all(:,4);
MLD = chla_all(:,8);
Chla10m = chla_all(:,1);
ChlaDCM = chla_all(:,2);

X = log10(Chla10m);
Y = log10(ChlaDCM);

ind = find(isnan(Y)|isinf(Y));
X(ind) = [];
Y(ind) = [];

scatplot(X', Y', 'circles', sqrt((range(X')/100)^2+(range(Y')/100)^2) ...
    ,100,5,1,16);

xlim(log10([0.01 20]))
ylim(log10([0.01 20]))

set(gca,'fontsize',14,'fontweight','bold','fontname','New Times Roman');
xlabel('Chla_{10m} (mg/m^3)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','New Times Roman')
ylabel('Chla_{DCM} (mg/m^3)','LineWidth',1.5,'fontsize',14,'fontweight','bold','fontname','New Times Roman')
% title('Pacific Chla','LineWidth',1.5,'fontsize',12,'fontweight','bold')%,'fontname','Arial'

% 自定义刻度
% yticks(log10([1, 10, 100, 400]));
% yticklabels({'0', '10', '100', '400'});
yticks(log10([0.01, 0.1, 1, 10, 40]));
yticklabels({'0.01', '0.1', '1', '10', '40'});
xticks(log10([0.01, 0.1, 1, 10, 40]));
xticklabels({'0.01', '0.1', '1', '10', '40'});

%画一条斜线
hold on
XL1 = get(gca,'xlim'); 
YL1 = get(gca,'ylim'); 
plot([XL1(1),XL1(2)],[YL1(1),YL1(2)],'color','k','LineWidth',2);


