clear

%% argo 分四个季节
mkdir E:\zyx\小论文\Argo_Chla\seasonly_new\spring;  %3 4 5
mkdir E:\zyx\小论文\Argo_Chla\seasonly_new\summer;  %6 7 8
mkdir E:\zyx\小论文\Argo_Chla\seasonly_new\autumn;  %9 10 11
mkdir E:\zyx\小论文\Argo_Chla\seasonly_new\winter;  %12 1 2

filepath = 'E:\zyx\小论文\Argo_Chla\seasonly_new\'; %读取dat数据路径
list = dir(filepath);

for i = 3:length(list)
    if ~list(i).isdir
        file = strcat(filepath,list(i).name);
        [SID,date,lon,lat] = read_time_coord_from_dat(file);
        date0 = datestr(date{1}, 'mm/dd/yyyy');
        month = str2num(date0(1:2)); %年份
        if month >= 3 && month <= 5
            movefile(file,'E:\zyx\小论文\Argo_Chla\seasonly_new\spring');
        elseif month >= 6 && month <= 8
            movefile(file,'E:\zyx\小论文\Argo_Chla\seasonly_new\summer');
        elseif month >= 9 && month <= 11
            movefile(file,'E:\zyx\小论文\Argo_Chla\seasonly_new\autumn');
        else 
            movefile(file,'E:\zyx\小论文\Argo_Chla\seasonly_new\winter');
        end
        if rem(i-2,100) == 0
            disp(i-2);
        end
    end
end

%% argo 分3个区域
mkdir E:\zyx\小论文\Argo_Chla\seasonly_new\winter\1;
mkdir E:\zyx\小论文\Argo_Chla\seasonly_new\winter\2;
mkdir E:\zyx\小论文\Argo_Chla\seasonly_new\winter\3;

filepath = 'E:\zyx\小论文\Argo_Chla\seasonly_new\winter\'; %读取dat数据路径
list = dir(filepath);

for i = 3:length(list)
    if ~list(i).isdir
        file = strcat(filepath,list(i).name);
        [SID,date,lon,lat] = read_time_coord_from_dat(file);
        lon0 = str2double(lon{1});
        lat0 = str2double(lat{1});
        if lon0 >= -171 && lon0 <= -150
            movefile(file,'E:\zyx\小论文\Argo_Chla\seasonly_new\winter\1');
        elseif ((lon0 >= 145 && lon0 <= 180) || (lon0 >= -180 && lon0 <= -171)) && lat0 >= 27 && lat0 <= 45
            movefile(file,'E:\zyx\小论文\Argo_Chla\seasonly_new\winter\2');
        elseif ((lon0 >= 145 && lon0 <= 180) || (lon0 >= -180 && lon0 <= -171)) && lat0 < 27
            movefile(file,'E:\zyx\小论文\Argo_Chla\seasonly_new\winter\3');
        end
        if rem(i-2,100) == 0
            disp(i-2);
        end
    end
end

mkdir E:\zyx\小论文\Argo_Chla\seasonly_new\autumn\1;
mkdir E:\zyx\小论文\Argo_Chla\seasonly_new\autumn\2;
mkdir E:\zyx\小论文\Argo_Chla\seasonly_new\autumn\3;

filepath = 'E:\zyx\小论文\Argo_Chla\seasonly_new\autumn\'; %读取dat数据路径
list = dir(filepath);

for i = 3:length(list)
    if ~list(i).isdir
        file = strcat(filepath,list(i).name);
        [SID,date,lon,lat] = read_time_coord_from_dat(file);
        lon0 = str2double(lon{1});
        lat0 = str2double(lat{1});
        if lon0 >= -171 && lon0 <= -150
            movefile(file,'E:\zyx\小论文\Argo_Chla\seasonly_new\autumn\1');
        elseif ((lon0 >= 145 && lon0 <= 180) || (lon0 >= -180 && lon0 <= -171)) && lat0 >= 27 && lat0 <= 45
            movefile(file,'E:\zyx\小论文\Argo_Chla\seasonly_new\autumn\2');
        elseif ((lon0 >= 145 && lon0 <= 180) || (lon0 >= -180 && lon0 <= -171)) && lat0 < 27
            movefile(file,'E:\zyx\小论文\Argo_Chla\seasonly_new\autumn\3');
        end
        if rem(i-2,100) == 0
            disp(i-2);
        end
    end
end

mkdir E:\zyx\小论文\Argo_Chla\seasonly_new\summer\1;
mkdir E:\zyx\小论文\Argo_Chla\seasonly_new\summer\2;
mkdir E:\zyx\小论文\Argo_Chla\seasonly_new\summer\3;

filepath = 'E:\zyx\小论文\Argo_Chla\seasonly_new\summer\'; %读取dat数据路径
list = dir(filepath);

for i = 3:length(list)
    if ~list(i).isdir
        file = strcat(filepath,list(i).name);
        [SID,date,lon,lat] = read_time_coord_from_dat(file);
        lon0 = str2double(lon{1});
        lat0 = str2double(lat{1});
        if lon0 >= -171 && lon0 <= -150
            movefile(file,'E:\zyx\小论文\Argo_Chla\seasonly_new\summer\1');
        elseif ((lon0 >= 145 && lon0 <= 180) || (lon0 >= -180 && lon0 <= -171)) && lat0 >= 27 && lat0 <= 45
            movefile(file,'E:\zyx\小论文\Argo_Chla\seasonly_new\summer\2');
        elseif ((lon0 >= 145 && lon0 <= 180) || (lon0 >= -180 && lon0 <= -171)) && lat0 < 27
            movefile(file,'E:\zyx\小论文\Argo_Chla\seasonly_new\summer\3');
        end
        if rem(i-2,100) == 0
            disp(i-2);
        end
    end
end


mkdir E:\zyx\小论文\Argo_Chla\seasonly_new\spring\1;
mkdir E:\zyx\小论文\Argo_Chla\seasonly_new\spring\2;
mkdir E:\zyx\小论文\Argo_Chla\seasonly_new\spring\3;

filepath = 'E:\zyx\小论文\Argo_Chla\seasonly_new\spring\'; %读取dat数据路径
list = dir(filepath);

for i = 3:length(list)
    if ~list(i).isdir
        file = strcat(filepath,list(i).name);
        [SID,date,lon,lat] = read_time_coord_from_dat(file);
        lon0 = str2double(lon{1});
        lat0 = str2double(lat{1});
        if lon0 >= -171 && lon0 <= -150
            movefile(file,'E:\zyx\小论文\Argo_Chla\seasonly_new\spring\1');
        elseif ((lon0 >= 145 && lon0 <= 180) || (lon0 >= -180 && lon0 <= -171)) && lat0 >= 27 && lat0 <= 45
            movefile(file,'E:\zyx\小论文\Argo_Chla\seasonly_new\spring\2');
        elseif ((lon0 >= 145 && lon0 <= 180) || (lon0 >= -180 && lon0 <= -171)) && lat0 < 27
            movefile(file,'E:\zyx\小论文\Argo_Chla\seasonly_new\spring\3');
        end
        if rem(i-2,100) == 0
            disp(i-2);
        end
    end
end



%% 读取一个季节，一个区域的数据
clear

filepath = 'E:\zyx\小论文\Argo_Chla\seasonly\spring\1\'; %读取dat数据路径
list = dir(filepath);

pres = cell(length(list)-2,1);
chla = cell(length(list)-2,1);
for i = 3:length(list)
    if ~list(i).isdir
        file = strcat(filepath,list(i).name);
        datas = importdata(file,' ',32); 
        pre0 = datas.data(:,1);
        chla0 = datas.data(:,4);

        [unique_pres, ~, idx] = unique(pre0, 'stable');
        if length(unique_pres) ~= length(pre0)
            for j = 1:length(unique_pres)
                chla{i-2}(j,1) = mean(chla0(idx==j));
            end
            pres{i-2} = unique_pres;
        else
            chla{i-2} = chla0;
            pres{i-2} = pre0;
        end        
    end
end

%插值 pre
pre_log = log(10):0.05:log(300);
pre = exp(pre_log)';

chla_interp = zeros(length(pre), length(pres));
for i = 1:length(pres)
    chla_interp(:,i) = interp1(pres{i}, chla{i}, pre);
end

chla_interp(chla_interp<=0) = nan; %chla>0

%统计 均值
chla_min = min(chla_interp, [], 2);
chla_max = max(chla_interp, [], 2);
chla_mean = mean(chla_interp, 2, 'omitnan');
chla_std = std(chla_interp, 0, 2, 'omitnan');

chla_min5 = zeros(length(pre),1);
chla_max5 = zeros(length(pre),1);
lower_bound = zeros(length(pre),1);
upper_bound = zeros(length(pre),1);
lowerBound90 = zeros(length(pre),1);
upperBound90 = zeros(length(pre),1);
for i = 1:length(pre)
    chl_i = chla_interp(i,:);
    chl_i = chl_i(~isnan(chl_i));
    chl_i = sort(chl_i);
    if length(chl_i) < 8 %统计数量至少8个
        continue
    end
    chla_min5(i) = chl_i(4);
    chla_max5(i) = chl_i(end-3);

    % 计算置信区间 95%
    confidence_interval = tinv(0.975, length(chl_i) - 1) * (std(chl_i) / sqrt(length(chl_i)));
    lower_bound(i) = mean(chl_i) - confidence_interval;
    upper_bound(i) = mean(chl_i) + confidence_interval;

    % 计算90%置信区间的边界
    z_alpha = norminv(0.1, mean(chl_i), std(chl_i)/sqrt(length(chl_i)));
    lowerBound90(i) = mean(chl_i) - 1.645 * z_alpha;
    upperBound90(i) = mean(chl_i) + 1.645 * z_alpha;

end

% filepath = 'E:\zyx\小论文\Argo_Chla\seasonly\spring\1\';
% [chla_mean, pre, upperBound90, lowerBound90] = Chla_account(filepath, 300);

figure
plot(chla_mean, -pre)
hold on
plot(chla_mean-chla_std, -pre)
hold on
plot(chla_mean+chla_std, -pre)
legend



%% 组合图 4*3
% 图窗设置
hf1=figure;
set(hf1,'units','normalized','position',[0.1,0.05,0.37,0.85])
gap =[0.01 0.02]; 
marg_h=[0.1 0.06]; 
marg_w=[0.1 0.1]; 
ha = tight_subplot(4,3,gap,marg_h,marg_w);
hold on

axes(ha(1))
hold on
filepath = 'E:\zyx\小论文\Argo_Chla\seasonly_new\spring\2\';
[chla_mean, pre, chla_std] = Chla_account(filepath, 300);

plot(chla_mean, pre, 'k', 'linewidth', 2)
hold on
% plot(upperBound90, pre, 'k', 'linewidth', 2)
v = [chla_mean+chla_std, pre];
v = [v; chla_mean-chla_std, pre];
f = [1:73, 146:-1:74];
patch('Faces',f,'Vertices',v,'FaceColor','red','EdgeColor', 'none','FaceAlpha',.2);

ylim([pre(1),pre(end)]);
xlim([0,3]);
set(ha(1),'YDir','reverse'); %将y轴方向设置为反向(从上到下递增)。
yticks([8, 50, 100, 150, 200, 250, 300])
yticklabels({'0', '50', '100', '150', '200', '250', '300'});
xticks([0, 0.6, 1.2, 1.8, 2.4, 3])
set(ha(1),'box','on','FontName','Times New Roman','FontSize',12,'linewidth',1.5,'FontWeight','bold');
ylabel('Depth (m)','fontsize',14,'FontWeight','bold')

axes(ha(2))
hold on
filepath = 'E:\zyx\小论文\Argo_Chla\seasonly_new\spring\3\';
[chla_mean, pre, chla_std] = Chla_account(filepath,300);

plot(chla_mean, pre, 'k', 'linewidth', 2)
hold on
% plot(upperBound90, pre, 'k', 'linewidth', 2)
v = [chla_mean+chla_std, pre];
v = [v; chla_mean-chla_std, pre];
f = [1:73, 146:-1:74];
patch('Faces',f,'Vertices',v,'FaceColor','red','EdgeColor', 'none','FaceAlpha',.2);

ylim([pre(1),pre(end)]);
xlim([0,0.6]);
set(ha(2),'box','on','FontName','Times New Roman','FontSize',12,'linewidth',1.5);
% set(gca,'XAxisLocation','top'); %将x轴的位置设置在顶部。
set(ha(2),'YDir','reverse'); %将y轴方向设置为反向(从上到下递增)。
% xlabel('Chla (mg/m^3)','fontsize',12)
% ylabel('Pressure (dbar)','fontsize',14)


axes(ha(3))
hold on
filepath = 'E:\zyx\小论文\Argo_Chla\seasonly_new\spring\1\';
[chla_mean, pre, chla_std] = Chla_account(filepath,300);
% chla_std(32) = chla_std(31);

plot(chla_mean, pre, 'k', 'linewidth', 2)
hold on
% plot(upperBound90, pre, 'k', 'linewidth', 2)
v = [chla_mean+chla_std, pre];
v = [v; chla_mean-chla_std, pre];
f = [1:73, 146:-1:74];
patch('Faces',f,'Vertices',v,'FaceColor','red','EdgeColor', 'none','FaceAlpha',.2);

ylim([pre(1),pre(end)]);
xlim([0,0.6]);
set(ha(3),'box','on','FontName','Times New Roman','FontSize',12,'linewidth',1.5);
% set(gca,'XAxisLocation','top'); %将x轴的位置设置在顶部。
set(ha(3),'YDir','reverse'); %将y轴方向设置为反向(从上到下递增)。
% xlabel('Chla (mg/m^3)','fontsize',12)
% ylabel('Pressure (dbar)','fontsize',14)
ylabel('Spring', 'fontsize', 16, 'FontWeight', 'bold', 'Rotation', -90);
set(ha(3),'yaxislocation','right');


axes(ha(4))
hold on
filepath = 'E:\zyx\小论文\Argo_Chla\seasonly_new\summer\2\';
[chla_mean, pre, chla_std] = Chla_account(filepath,300);

plot(chla_mean, pre, 'k', 'linewidth', 2)
hold on
% plot(upperBound90, pre, 'k', 'linewidth', 2)
v = [chla_mean+chla_std, pre];
v = [v; chla_mean-chla_std, pre];
f = [1:73, 146:-1:74];
patch('Faces',f,'Vertices',v,'FaceColor','red','EdgeColor', 'none','FaceAlpha',.2);

ylim([pre(1),pre(end)]);
xlim([0,3]);
set(ha(4),'YDir','reverse'); %将y轴方向设置为反向(从上到下递增)。
yticks([8, 50, 100, 150, 200, 250, 300])
yticklabels({'0', '50', '100', '150', '200', '250', '300'});
xticks([0, 0.6, 1.2, 1.8, 2.4, 3])
set(ha(4),'box','on','FontName','Times New Roman','FontSize',12,'linewidth',1.5,'FontWeight','bold');
ylabel('Depth (m)','fontsize',14,'FontWeight','bold')

axes(ha(5))
hold on
filepath = 'E:\zyx\小论文\Argo_Chla\seasonly_new\summer\3\';
[chla_mean, pre, chla_std] = Chla_account(filepath,300);
chla_std(42) = chla_std(41);

plot(chla_mean, pre, 'k', 'linewidth', 2)
hold on
% plot(upperBound90, pre, 'k', 'linewidth', 2)
v = [chla_mean+chla_std, pre];
v = [v; chla_mean-chla_std, pre];
f = [1:73, 146:-1:74];
patch('Faces',f,'Vertices',v,'FaceColor','red','EdgeColor', 'none','FaceAlpha',.2);

ylim([pre(1),pre(end)]);
xlim([0,0.6]);
set(ha(5),'box','on','FontName','Times New Roman','FontSize',9,'linewidth',1.5);
% set(gca,'XAxisLocation','top'); %将x轴的位置设置在顶部。
set(ha(5),'YDir','reverse'); %将y轴方向设置为反向(从上到下递增)。
% xlabel('Chla (mg/m^3)','fontsize',12)
% ylabel('Pressure (dbar)','fontsize',14)


axes(ha(6))
hold on
filepath = 'E:\zyx\小论文\Argo_Chla\seasonly_new\summer\1\';
[chla_mean, pre, chla_std] = Chla_account(filepath,300);
% chla_std(42) = chla_std(41);

plot(chla_mean, pre, 'k', 'linewidth', 2)
hold on
% plot(upperBound90, pre, 'k', 'linewidth', 2)
v = [chla_mean+chla_std, pre];
v = [v; chla_mean-chla_std, pre];
f = [1:73, 146:-1:74];
patch('Faces',f,'Vertices',v,'FaceColor','red','EdgeColor', 'none','FaceAlpha',.2);

ylim([pre(1),pre(end)]);
xlim([0,0.6]);
set(ha(6),'box','on','FontName','Times New Roman','FontSize',9,'linewidth',1.5);
% set(gca,'XAxisLocation','top'); %将x轴的位置设置在顶部。
set(ha(6),'YDir','reverse'); %将y轴方向设置为反向(从上到下递增)。
% xlabel('Chla (mg/m^3)','fontsize',12)
% ylabel('Pressure (dbar)','fontsize',14)
ylabel('Summer', 'fontsize', 16, 'FontWeight', 'bold', 'Rotation', -90);
set(ha(6),'yaxislocation','right');


axes(ha(7))
hold on
filepath = 'E:\zyx\小论文\Argo_Chla\seasonly_new\autumn\2\';
[chla_mean, pre, chla_std] = Chla_account(filepath,300);

plot(chla_mean, pre, 'k', 'linewidth', 2)
hold on
% plot(upperBound90, pre, 'k', 'linewidth', 2)
v = [chla_mean+chla_std, pre];
v = [v; chla_mean-chla_std, pre];
f = [1:73, 146:-1:74];
patch('Faces',f,'Vertices',v,'FaceColor','red','EdgeColor', 'none','FaceAlpha',.2);

ylim([pre(1),pre(end)]);
xlim([0,3]);
set(ha(7),'YDir','reverse'); %将y轴方向设置为反向(从上到下递增)。
yticks([8, 50, 100, 150, 200, 250, 300])
yticklabels({'0', '50', '100', '150', '200', '250', '300'});
xticks([0, 0.6, 1.2, 1.8, 2.4, 3])
set(ha(7),'box','on','FontName','Times New Roman','FontSize',12,'linewidth',1.5,'FontWeight','bold');
ylabel('Depth (m)','fontsize',14,'FontWeight','bold')


axes(ha(8))
hold on
filepath = 'E:\zyx\小论文\Argo_Chla\seasonly_new\autumn\3\';
[chla_mean, pre, chla_std] = Chla_account(filepath,300);

plot(chla_mean, pre, 'k', 'linewidth', 2)
hold on
% plot(upperBound90, pre, 'k', 'linewidth', 2)
v = [chla_mean+chla_std, pre];
v = [v; chla_mean-chla_std, pre];
f = [1:73, 146:-1:74];
patch('Faces',f,'Vertices',v,'FaceColor','red','EdgeColor', 'none','FaceAlpha',.2);

ylim([pre(1),pre(end)]);
xlim([0,0.6]);
set(ha(8),'box','on','FontName','Times New Roman','FontSize',9,'linewidth',1.5);
% set(gca,'XAxisLocation','top'); %将x轴的位置设置在顶部。
set(ha(8),'YDir','reverse'); %将y轴方向设置为反向(从上到下递增)。
% xlabel('Chla (mg/m^3)','fontsize',12)
% ylabel('Pressure (dbar)','fontsize',14)


axes(ha(9))
hold on
filepath = 'E:\zyx\小论文\Argo_Chla\seasonly_new\autumn\1\';
[chla_mean, pre, chla_std] = Chla_account(filepath,300);

plot(chla_mean, pre, 'k', 'linewidth', 2)
hold on
% plot(upperBound90, pre, 'k', 'linewidth', 2)
v = [chla_mean+chla_std, pre];
v = [v; chla_mean-chla_std, pre];
f = [1:73, 146:-1:74];
patch('Faces',f,'Vertices',v,'FaceColor','red','EdgeColor', 'none','FaceAlpha',.2);

ylim([pre(1),pre(end)]);
xlim([0,0.6]);
set(ha(9),'box','on','FontName','Times New Roman','FontSize',9,'linewidth',1.5);
% set(gca,'XAxisLocation','top'); %将x轴的位置设置在顶部。
set(ha(9),'YDir','reverse'); %将y轴方向设置为反向(从上到下递增)。
% xlabel('Chla (mg/m^3)','fontsize',12)
% ylabel('Pressure (dbar)','fontsize',14)
ylabel('Autumn', 'fontsize', 16, 'FontWeight', 'bold', 'Rotation', -90);
set(ha(9),'yaxislocation','right');


axes(ha(10))
hold on
filepath = 'E:\zyx\小论文\Argo_Chla\seasonly_new\winter\2\';
[chla_mean, pre, chla_std] = Chla_account(filepath,300);

plot(chla_mean, pre, 'k', 'linewidth', 2)
hold on
% plot(upperBound90, pre, 'k', 'linewidth', 2)
v = [chla_mean+chla_std, pre];
v = [v; chla_mean-chla_std, pre];
f = [1:73, 146:-1:74];
patch('Faces',f,'Vertices',v,'FaceColor','red','EdgeColor', 'none','FaceAlpha',.2);

ylim([pre(1),pre(end)]);
xlim([0,3]);
set(ha(10),'YDir','reverse'); %将y轴方向设置为反向(从上到下递增)。
yticks([8, 50, 100, 150, 200, 250, 300])
yticklabels({'0', '50', '100', '150', '200', '250', '300'});
xticks([0, 0.6, 1.2, 1.8, 2.4, 3])
xticklabels({'0', '0.6', '1.2', '1.8', '2.4', '3'});
set(ha(10),'box','on','FontName','Times New Roman','FontSize',12,'linewidth',1.5,'FontWeight','bold');
ylabel('Depth (m)','fontsize',14,'FontWeight','bold')
xlabel('Chla (mg/m^3)','fontsize',14,'FontWeight','bold')


axes(ha(11))
hold on
filepath = 'E:\zyx\小论文\Argo_Chla\seasonly_new\winter\3\';
[chla_mean, pre, chla_std] = Chla_account(filepath,300);

plot(chla_mean, pre, 'k', 'linewidth', 2)
hold on
% plot(upperBound90, pre, 'k', 'linewidth', 2)
v = [chla_mean+chla_std, pre];
v = [v; chla_mean-chla_std, pre];
f = [1:73, 146:-1:74];
patch('Faces',f,'Vertices',v,'FaceColor','red','EdgeColor', 'none','FaceAlpha',.2);

ylim([pre(1),pre(end)]);
xlim([0,0.6]);
set(ha(11),'YDir','reverse'); %将y轴方向设置为反向(从上到下递增)。
xticks([ 0.2, 0.4, 0.6])
xticklabels({'0.2', '0.4', '0.6'});
set(ha(11),'box','on','FontName','Times New Roman','FontSize',12,'linewidth',1.5,'FontWeight','bold');
xlabel('Chla (mg/m^3)','fontsize',14,'FontWeight','bold')

axes(ha(12))
hold on
filepath = 'E:\zyx\小论文\Argo_Chla\seasonly_new\winter\1\';
[chla_mean, pre, chla_std] = Chla_account(filepath,300);

plot(chla_mean, pre, 'k', 'linewidth', 2)
hold on
% plot(upperBound90, pre, 'k', 'linewidth', 2)
v = [chla_mean+chla_std, pre];
v = [v; chla_mean-chla_std, pre];
f = [1:73, 146:-1:74];
patch('Faces',f,'Vertices',v,'FaceColor','red','EdgeColor', 'none','FaceAlpha',.2);

ylim([pre(1),pre(end)]);
xlim([0,0.6]);
set(ha(12),'YDir','reverse'); %将y轴方向设置为反向(从上到下递增)。
xticks([ 0.2, 0.4, 0.6])
xticklabels({'0.2', '0.4', '0.6'});
set(ha(12),'box','on','FontName','Times New Roman','FontSize',12,'linewidth',1.5,'FontWeight','bold');
xlabel('Chla (mg/m^3)','fontsize',14,'FontWeight','bold')
ylabel('Winter', 'fontsize', 16, 'FontWeight', 'bold', 'Rotation', -90);
set(ha(12),'yaxislocation','right');

legend('Average Chla', 'Average Chla ± σ', 'NumColumns', 2, 'FontName','Times New Roman','FontSize',14,'linewidth',1.5, ...
    'FontWeight','bold','Position',[0.339952643155826 0.0111056768180091 0.346740631885238 0.0250544656141131])

%
annotation(gcf,'textbox',...
    [0.160296752738654 0.949 0.148153951486698 0.025462962962963],...
    'String',{'Region A'},...
    'FontWeight','bold',...
    'FontSize',16,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(gcf,'textbox',...
    [0.437781103286385 0.949 0.142500586854461 0.0254629629629629],...
    'String','Region B',...
    'FontWeight','bold',...
    'FontSize',16,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(gcf,'textbox',...
    [0.715145148669795 0.949 0.152460485133022 0.0254629629629629],...
    'String','Region C',...
    'FontWeight','bold',...
    'FontSize',16,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

annotation(gcf,'textbox',...
    [0.2870 0.7425 0.0684444444444453 0.0358796296296294],...
    'String','(a)',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(gcf,'textbox',...
    [0.5618 0.7425 0.0684444444444453 0.0358796296296294],...
    'String','(b)',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(gcf,'textbox',...
    [0.8351 0.7425 0.0684444444444446 0.0358796296296294],...
    'String','(c)',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(gcf,'textbox',...
    [0.2870 0.5290 0.0684444444444453 0.0358796296296294],...
    'String','(d)',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(gcf,'textbox',...
    [0.5618 0.5290 0.0684444444444453 0.0358796296296294],...
    'String','(e)',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(gcf,'textbox',...
    [0.8351 0.5290 0.0684444444444453 0.0358796296296294],...
    'String','(f)',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(gcf,'textbox',...
    [0.2870 0.3167 0.0684444444444451 0.0358796296296292],...
    'String','(g)',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(gcf,'textbox',...
    [0.5618 0.3167 0.0684444444444451 0.0358796296296292],...
    'String','(h)',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(gcf,'textbox',...
    [0.8351 0.3167 0.0684444444444451 0.0358796296296292],...
    'String','(i)',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(gcf,'textbox',...
    [0.2870 0.1042 0.0684444444444454 0.0358796296296291],...
    'String','(j)',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(gcf,'textbox',...
    [0.5618 0.1042 0.0684444444444454 0.0358796296296291],...
    'String','(k)',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(gcf,'textbox',...
    [0.8351 0.1042 0.0684444444444454 0.0358796296296291],...
    'String','(l)',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

