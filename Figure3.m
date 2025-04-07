clear all

load('argo_nasa_chla_new.mat')
filepath = 'E:\zyx\小论文\Argo_Chla\selected_new1\';

argo_data1 = [argo_data1, zeros(691,1)];
for i = 1:length(argo_data1)
    file = strcat(filepath, dat_match1(i,:));
    [SID,date,lon,lat] = read_time_coord_from_dat(file);
    date0 = datestr(date{1}, 'yyyy-mm-dd HH:MM:SS');
    month = str2num(date0(6:7));

    if month >= 3 && month <= 5
        argo_data1(i,8) = 1;
    elseif month >= 6 && month <= 8
        argo_data1(i,8) = 2;
    elseif month >= 9 && month <= 11
        argo_data1(i,8) = 3;
    else
        argo_data1(i,8) = 4;

    end

end
lon = argo_data1(:,6);
lon(lon<0) = lon(lon<0) + 360;
lat = argo_data1(:,7);


ind = find(lon>180&lon<190&lat>32&lat<38);
lon(ind) = [];
lat(ind) = [];
argo_data1(ind,:) = [];
chlaL3_nasa(ind) = [];

ind = find(lon>165&lon<180&lat>27&lat<32);
lon(ind) = [];
lat(ind) = [];
argo_data1(ind,:) = [];
chlaL3_nasa(ind) = [];



%%
h1=figure;
set(h1,'units','normalized','position',[0.2,0.036,0.6,0.65])
gap =[0.02 -0.05]; %表示子图之间垂直方向和水平方向的间隔 此处对于仅有1张子图无作用效果
marg_h=[0.12 0.04]; %全部子图到figure下上边界的距离
marg_w=[0.05 0.05]; %全部子图到figure左右边界的距离
ha = tight_subplot(2,2,gap,marg_h,marg_w);
hold on
axes(ha(1));
hold on

%计算误差百分比
data1 = argo_data1(argo_data1(:,8)==1,:);
data1_nasa = chlaL3_nasa(argo_data1(:,8)==1);
error_ave10m1 = abs(data1(:,1)-data1_nasa)./(data1(:,1)).*100;
lon1 = data1(:,6);
lon1(lon1<0) = lon1(lon1<0) + 360;
lat1 = data1(:,7);

m_proj('mercator','lat',[9.5, 46],'long',[144 211]);

m_scatter(lon1,lat1,60,error_ave10m1,'filled')
% colormap("jet")
n = 128;
red_to_blue = zeros(n, 3);
for i = 1:n
    red_to_blue(i, 1) = 1 - (i-1)/(n-1); % Red component
    red_to_blue(i, 2) = (i-1)/(n-1);     % Green component
    red_to_blue(i, 3) = (i-1)/(n-1);     % Blue component
end
colormap(flipud(red_to_blue)); % RGB值分别对应红色和蓝色

caxis([0,400]);
% colorbar('YLim',[0 100],'YTick',[0 20 40 60 80 100],'YTickLabel',{'0','20','40','60','80','100'}, ...
%     'FontWeight','bold','FontSize',16,'FontName','Times New Roman')

% add coastline data to the figure
m_gshhs_i('patch',[.6 0.6 .6]);
m_gshhs_i('color','k');

%plotm(lat,lon,'Marker','.')   %使用scatterm和plotm均可绘制点位
xticks([145 210])%定义横轴标尺
xticklabels({'145E','210E'})%定义标尺标签内容
% title('10m内平均chla与Rrs反演得到的chla的误差图','LineWidth',1.5,'fontsize',12,'fontweight','bold')

m_grid('box','on','tickdir','in',...
    'fontsize',18,...
    'color','k',...
    'linestyle','none',...
    'linewidth', 2, ...
    'xticklabels',[' '; ' ';' ';'']);

annotation(gcf,'textbox',...
    [0.355 0.87 0.164062499999999 0.0682226261451202],...
    'String',{'(a) Spring'},...
    'FontWeight','bold',...
    'FontSize',20,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'LineStyle','none');




axes(ha(2));
hold on

%计算误差百分比
data2 = argo_data1(argo_data1(:,8)==2,:);
data2_nasa = chlaL3_nasa(argo_data1(:,8)==2);
error_ave10m2 = abs(data2(:,1)-data2_nasa)./(data2(:,1)).*100;
lon2 = data2(:,6);
lon2(lon2<0) = lon2(lon2<0) + 360;
lat2 = data2(:,7);

m_proj('mercator','lat',[9.5, 46],'long',[144 211]);

m_scatter(lon2,lat2,60,error_ave10m2,'filled')
% colormap("jet")
colormap(flipud(red_to_blue)); % RGB值分别对应红色和蓝色

caxis([0,400]);
% colorbar('YLim',[0 100],'YTick',[0 20 40 60 80 100],'YTickLabel',{'0','20','40','60','80','100'}, ...
%     'FontWeight','bold','FontSize',16,'FontName','Times New Roman')

% add coastline data to the figure
m_gshhs_i('patch',[.6 0.6 .6]);
m_gshhs_i('color','k');

%plotm(lat,lon,'Marker','.')   %使用scatterm和plotm均可绘制点位
xticks([145 210])%定义横轴标尺
xticklabels({'145E','210E'})%定义标尺标签内容
% title('10m内平均chla与Rrs反演得到的chla的误差图','LineWidth',1.5,'fontsize',12,'fontweight','bold')

m_grid('box','on','tickdir','in',...
    'fontsize',18,...
    'color','k',...
    'linestyle','none',...
    'linewidth', 2, ...
    'xticklabels',[' '; ' ';' ';''],'yticklabels',[' '; ' ';' ';'']);

annotation(gcf,'textbox',...
    [0.78 0.87 0.164062499999999 0.0682226261451202],...
    'String',{'(b) Summer'},...
    'FontWeight','bold',...
    'FontSize',20,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'LineStyle','none');


axes(ha(3));
hold on

%计算误差百分比
data3 = argo_data1(argo_data1(:,8)==3,:);
data3_nasa = chlaL3_nasa(argo_data1(:,8)==3);
error_ave10m3 = abs(data3(:,1)-data3_nasa)./(data3(:,1)).*100;
lon3 = data3(:,6);
lon3(lon3<0) = lon3(lon3<0) + 360;
lat3 = data3(:,7);

m_proj('mercator','lat',[9.5, 46],'long',[144 211]);

m_scatter(lon3,lat3,60,error_ave10m3,'filled')
% colormap("jet")
colormap(flipud(red_to_blue)); % RGB值分别对应红色和蓝色

caxis([0,400]);
% colorbar('YLim',[0 100],'YTick',[0 20 40 60 80 100],'YTickLabel',{'0','20','40','60','80','100'}, ...
%     'FontWeight','bold','FontSize',16,'FontName','Times New Roman')

% add coastline data to the figure
m_gshhs_i('patch',[.6 0.6 .6]);
m_gshhs_i('color','k');

%plotm(lat,lon,'Marker','.')   %使用scatterm和plotm均可绘制点位
xticks([145 210])%定义横轴标尺
xticklabels({'145E','210E'})%定义标尺标签内容
% title('10m内平均chla与Rrs反演得到的chla的误差图','LineWidth',1.5,'fontsize',12,'fontweight','bold')

m_grid('box','on','tickdir','in',...
    'fontsize',18,...
    'color','k',...
    'linestyle','none',...
    'linewidth', 2);

annotation(gcf,'textbox',...
    [0.355 0.43 0.164062499999999 0.0682226261451202],...
    'String',{'(c) Autumn'},...
    'FontWeight','bold',...
    'FontSize',20,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'LineStyle','none');


axes(ha(4));
hold on

%计算误差百分比
data4 = argo_data1(argo_data1(:,8)==4,:);
data4_nasa = chlaL3_nasa(argo_data1(:,8)==4);
error_ave10m4 = abs(data4(:,1)-data4_nasa)./(data4(:,1)).*100;
lon4 = data4(:,6);
lon4(lon4<0) = lon4(lon4<0) + 360;
lat4 = data4(:,7);

m_proj('mercator','lat',[9.5, 46],'long',[144 211]);

m_scatter(lon4,lat4,60,error_ave10m4,'filled')
% colormap("jet")
colormap(flipud(red_to_blue)); % RGB值分别对应红色和蓝色

caxis([0,400]);
% colorbar('YLim',[0 100],'YTick',[0 20 40 60 80 100],'YTickLabel',{'0','20','40','60','80','100'}, ...
%     'FontWeight','bold','FontSize',16,'FontName','Times New Roman')

% add coastline data to the figure
m_gshhs_i('patch',[.6 0.6 .6]);
m_gshhs_i('color','k');

%plotm(lat,lon,'Marker','.')   %使用scatterm和plotm均可绘制点位
xticks([145 210])%定义横轴标尺
xticklabels({'145E','210E'})%定义标尺标签内容
% title('10m内平均chla与Rrs反演得到的chla的误差图','LineWidth',1.5,'fontsize',12,'fontweight','bold')

m_grid('box','on','tickdir','in',...
    'fontsize',18,...
    'color','k',...
    'linestyle','none',...
    'linewidth', 2,...
    'yticklabels',[' '; ' ';' ';'']);

annotation(gcf,'textbox',...
    [0.78 0.43 0.164062499999999 0.0682226261451202],...
    'String',{'(d) Winter'},...
    'FontWeight','bold',...
    'FontSize',20,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'LineStyle','none');

colorbar('YLim',[0 400],'YTick',[0 100 200 300 400],'YTickLabel',{'0','100','200','300','400'}, ...
    'FontWeight','bold','FontSize',16,'FontName','Times New Roman', ...
    'Position', [0.922048611111109 0.122507122507122 0.0241319444444468 0.83732193732194])
