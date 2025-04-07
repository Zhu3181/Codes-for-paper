clear;

load('E:\zyx\小论文\chl_lonlat_time_forRrs.mat');
lon = chla_all(:,6);
lat = chla_all(:,7);
n1 = 0; n2 = 0; n3 = 0;
%划分三个区域
% for i = 1:length(lon)
%     if lon(i) >= -170 && lon(i) <= -150
%         n1 = n1 + 1;
%         lon1(n1) = lon(i);
%         lat1(n1) = lat(i);
%     elseif ((lon(i) >= 150 && lon(i) <= 180) || (lon(i) >= -180 && lon(i) <= -170)) && lat(i) >= 30 
%         n2 = n2 + 1;
%         lon2(n2) = lon(i);
%         lat2(n2) = lat(i);
%     elseif ((lon(i) >= 150 && lon(i) <= 180) || (lon(i) >= -180 && lon(i) <= -170)) && lat(i) < 30
%         n3 = n3 + 1;
%         lon3(n3) = lon(i);
%         lat3(n3) = lat(i);
%     end
% end
for i = 1:length(lon)
    if lon(i) >= -171 && lon(i) <= -150
        n1 = n1 + 1;
        lon1(n1) = lon(i);
        lat1(n1) = lat(i);
    elseif ((lon(i) >= 145 && lon(i) <= 180) || (lon(i) >= -180 && lon(i) <= -171)) && lat(i) >= 27 && lat(i) <= 45
        n2 = n2 + 1;
        lon2(n2) = lon(i);
        lat2(n2) = lat(i);
    elseif ((lon(i) >= 145 && lon(i) <= 180) || (lon(i) >= -180 && lon(i) <= -171)) && lat(i) < 27
        n3 = n3 + 1;
        lon3(n3) = lon(i);
        lat3(n3) = lat(i);
    end
end

lon1 = 360 + lon1;
lon2(lon2<0) = lon2(lon2<0) + 360;
lon3(lon3<0) = lon3(lon3<0) + 360;

step = 2;
lon1 = lon1(1:step:end);
lat1 = lat1(1:step:end);
lon2 = lon2(1:step:end);
lat2 = lat2(1:step:end);
lon3 = lon3(1:step:end);
lat3 = lat3(1:step:end);

ind = find(lon2>164&lat2<32);
lon2(ind) = [];
lat2(ind) = [];

lat2(lon2>185) = [];
lon2(lon2>185) = [];

%%
ind1 = find(lat1>20&lat1<26);
ind11 = ind1(1:3:end);
lon1(ind11) = [];
lat1(ind11) = [];

ind1 = find(lat1>20&lat1<26);
ind11 = ind1(1:3:end);
lon1(ind11) = [];
lat1(ind11) = [];

ind2 = find(lat2>38&lat2<45&lon2>146&lon2<166);
ind22 = ind2(1:2:end);
lon2(ind22) = [];
lat2(ind22) = [];

ind3 = find(lat3>10&lat3<16&lon3>150&lon3<168);
ind33 = ind3(1:2:end);
lon3(ind33) = [];
lat3(ind33) = [];

%%
chla(:,:,1) = ncread('E:\zyx\小论文\SNPP_VIIRS.20180101_20181231.L3m.YR.CHL.chlor_a.4km.nc','chlor_a');
chla(:,:,2) = ncread('E:\zyx\小论文\SNPP_VIIRS.20190101_20191231.L3m.YR.CHL.chlor_a.4km.nc','chlor_a');
chla(:,:,3) = ncread('E:\zyx\小论文\SNPP_VIIRS.20200101_20201231.L3m.YR.CHL.chlor_a.4km.nc','chlor_a');
chla(:,:,4) = ncread('E:\zyx\小论文\SNPP_VIIRS.20210101_20211231.L3m.YR.CHL.chlor_a.4km.nc','chlor_a');
chla(:,:,5) = ncread('E:\zyx\小论文\SNPP_VIIRS.20220101_20221231.L3m.YR.CHL.chlor_a.4km.nc','chlor_a');
lon0 = ncread('E:\zyx\小论文\SNPP_VIIRS.20230101_20231231.L3m.YR.CHL.chlor_a.4km.nc','lon');
lat0 = ncread('E:\zyx\小论文\SNPP_VIIRS.20230101_20231231.L3m.YR.CHL.chlor_a.4km.nc','lat');
chla = nanmean(chla, 3);

%%
%补lon = 180 chl
lon0 = [lon0; 180];
chla = [chla; chla(end,:)];
lon0 = [-180; lon0];
chla = [chla(1,:); chla];

order_lat = find(lat0 >= 9.5 & lat0 <= 46);
order_lon = find(lon0 >= -180 & lon0 <= -149);
order_lon1 = find(lon0 >= 144 & lon0 <= 180);
lon_p = lon0(order_lon);
lat_p = lat0(order_lat);
lon1_p = lon0(order_lon1);
[LAT,LON ] = meshgrid(lat_p,lon_p);
[LAT1,LON1] = meshgrid(lat_p,lon1_p);
chla_p = chla(order_lon, order_lat);
chla1_p = chla(order_lon1, order_lat);
LON(LON<0) = LON(LON<0) + 360;

%%
h1=figure;
set(h1,'units','normalized','position',[0.2,0.036,0.5,0.5])
gap =[1 0.05]; %表示子图之间垂直方向和水平方向的间隔 此处对于仅有1张子图无作用效果
marg_h=[0.12 0.04]; %全部子图到figure下上边界的距离
marg_w=[0.05 0.05]; %全部子图到figure左右边界的距离
ha = tight_subplot(1,1,gap,marg_h,marg_w);
hold on
axes(ha(1));
hold on

m_proj('mercator','lat',[9.5, 46],'long',[144 211]); %155 210
% image
m_pcolor(LON,LAT,log(chla_p));
hold on
m_pcolor(LON1,LAT1,log(chla1_p));
% load rainbob
shading flat;
% colormap(colorbarChl/255);
colormap('jet')
set(gca,'CLim',log([0.01 3]));

hold on
%s1 = m_plot(lon1,lat1,'o','color',[239/255 118/255 122/255],'LineWidth',1,'MarkerSize',10);
s1 = m_plot(lon2,lat2,'o',...
    'LineWidth',1,...
    'MarkerSize',8,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor','c');%[115/255 186/255 214/255]
% s1 = m_scatter(lon2, lat2, 60, 'filled', 'MarkerFaceAlpha', 0.5, 'MarkerEdgeAlpha', 0.5);

hold on
% s2 = m_plot(lon2,lat2,'o','color',[21/255 59/255 73/255],'LineWidth',1,'MarkerSize',10);
s2 = m_plot(lon3,lat3,'o',...
    'LineWidth',1,...
    'MarkerSize',8,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[255/255, 23/255, 13/255]);%[239/255 65/255 67/255],[123/255,217/255,245/255]
% s2 = m_scatter(lon3, lat3, 60, 'filled', 'MarkerFaceAlpha', 0.5, 'MarkerEdgeAlpha', 0.5);

hold on
% s3 = m_plot(lon3,lat3,'o','color',[238/255 205/255 118/255],'LineWidth',1,'MarkerSize',10);
s3 = m_plot(lon1,lat1,'o',...
    'LineWidth',1,...
    'MarkerSize',8,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0/255 255/255 0/255]);
% s3 = m_scatter(lon1, lat1, 60, 'filled', 'MarkerFaceAlpha', 0.5, 'MarkerEdgeAlpha', 0.5);

% add coastline data to the figure
m_gshhs_i('patch',[.6 0.6 .6]);
m_gshhs_i('color','k');

%plotm(lat,lon,'Marker','.')   %使用scatterm和plotm均可绘制点位
% xticks([145 150])%定义横轴标尺
% xticklabels({'145E','210E'})%定义标尺标签内容
% title('2018.7-2021.6 Argo数据在东太地区的分布图','LineWidth',1.5,'fontsize',12,'fontweight','bold')

m_grid('box','on','tickdir','in',...
    'fontsize',14,...
    'color','k',...
    'linestyle','none',...
    'linewidth', 1.5);

legend1 = legend([s1,s2,s3],{'Region A','Region B','Region C'},'Location','southoutside','fontsize',16, ...
    'fontname','New Times Roman','NumColumns',3)
set(legend1,'Position',[0.313020835987602 0.023209877702189 0.337499994691461 0.0462962951373171]);

% legend('boxoff')

colorbar('YLim',log([0.01 3]),'YTick',log([0.01 0.10 1.00 3.00]),'YTickLabel',{'0.01','0.10','1.00','3.00'}, ...
    'FontWeight','bold','FontSize',14,'FontName','Times New Roman')
% colorbar('peer',gca,...
%     [0.879340277777776 0.0416666666666667 0.0231481481481481 0.930555555555555],...
%     'YLim',log([0.1 30]),...
%     'YTick',log([0.1 1 2 5 10 20 30]),...
%     'YTickLabel',{'0','1','2','5','10','20' ,'30'},...
%     'FontWeight','bold',...
%     'FontSize',18,...
%     'FontName','Times New Roman');

% annotation(gcf,'textbox',...
%     [0.891111111111073 0.906387121280738 0.164062499999999 0.0682226261451202],...
%     'String',{'   Chl',' (mg/m^3)'},...
%     'FontWeight','bold',...
%     'FontSize',14,...
%     'FontName','Times New Roman',...
%     'FitBoxToText','off',...
%     'LineStyle','none');

annotation(gcf,'textbox',...
    [0.0395833333333333 0.911962964287511 0.0713541648505877 0.0629629616384151],...
    'String',{'45°N'},...
    'FontSize',14,...
    'FitBoxToText','off',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.0395833333333329 0.100851853176401 0.0713541648505877 0.0629629616384153],...
    'String',{'10°N'},...
    'FontSize',14,...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.80625 0.0656666679912154 0.0869791643849264 0.0629629616384153],...
    'String',{'150°W'},...
    'FontSize',14,...
    'EdgeColor','none');