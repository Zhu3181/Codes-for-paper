clear all;
%把argo数据和3级数据进行匹配
% load('E:\argo\par\India_par\else_select\argo_India_kd.mat'); %导入argo数据
% datas = xlsread('D:\toZHUYIXIAN\SPM_seabass.xlsx',5);
% load('E:\zyx\小论文\argo_chla_max_select.mat');
% lon_lat_date_data = lon_lat_date_chla;
% [mm,nn] = size(lon_lat_date_data);

load('E:\zyx\小论文\chl_lonlat_time_forRrs.mat');
[mm,nn] = size(chla_all);

num = 1;
for i = 1:mm %一共多少实测数据
    %确定argo影像对应的tiff图像 时间对应
%     year = lon_lat_date_data(i,3);
%     month = lon_lat_date_data(i,4);
%     day = lon_lat_date_data(i,5);
%     date = datetime(year, month, day); %转成日期格式
%     date_str = datestr(date,'yyyymmdd'); %转成字符串格式   
%     lon0 = lon_lat_date_data(i,1); %argo数据对应的经纬度
%     lat0 = lon_lat_date_data(i,2);
    date_str = dat_time(i,:); %time 字符串格式 
    year = str2num(date_str(1:4));
    month = str2num(date_str(5:6));
    day = str2num(date_str(7:8));
    lon0 = chla_all(i,6); %argo数据对应的经纬度
    lat0 = chla_all(i,7);
    
    
    if (lon0 < 145 && lon0 > -150) || lat0 < 10 || lat0 > 45  %限制范围
        continue
    end

%     chla = FindImageMatch2(lon0, lat0, date_str);
    chla = FindImageMatch(lon0, lat0, [year,month,day]);

%     %spm
%     lat0 = datas(i,2);
%     lon0 = datas(i,3);
%     date_str = num2str(datas(i,1));
%     date = datetime(date_str, 'InputFormat', 'yyyyMMdd');    
%     kd = FindImageMatch2(lon0, lat0, date_str, '486', '2015'); %运行函数，得到第一次匹配的结果
%     kd1 = FindImageMatch2(lon0, lat0, date_str, '551', '2015');
%     kd2 = FindImageMatch2(lon0, lat0, date_str, '671', '2015');
    
    %如果匹配失败，扩大时间区间
%     if isnan(kd) %|| isnan(kd1) || isnan(kd2)
%         date1 = date + 1; %在之后一天中找
%         date_str1 = datestr(date1,'yyyymmdd');
%         kd = FindImageMatch2(lon0, lat0, date_str1);
% %         kd = FindImageMatch2(lon0, lat0, date_str1, '486', '2015'); %运行函数，得到第一次匹配的结果
% %         kd1 = FindImageMatch2(lon0, lat0, date_str1, '551', '2015');
% %         kd2 = FindImageMatch2(lon0, lat0, date_str1, '671', '2015');
%     end
%     if isnan(kd) %|| isnan(kd1) || isnan(kd2)
%         date2 = date - 1; %在之前一天中找
%         date_str2 = datestr(date2,'yyyymmdd');
%         kd = FindImageMatch2(lon0, lat0, date_str2); 
% %         kd = FindImageMatch2(lon0, lat0, date_str2, '486', '2015'); %运行函数，得到第一次匹配的结果
% %         kd1 = FindImageMatch2(lon0, lat0, date_str2, '551', '2015');
% %         kd2 = FindImageMatch2(lon0, lat0, date_str2, '671', '2015');
%     end
% %     if isnan(kd) || isnan(kd1) || isnan(kd2)
% %         date3 = date - 2; %在之前2天中找
% %         date_str3 = datestr(date3,'yyyymmdd');
% %         kd = FindImageMatch2(lon0, lat0, date_str3, '488', '2013'); %运行函数，得到第一次匹配的结果
% %         kd1 = FindImageMatch2(lon0, lat0, date_str3, '547', '2013');
% %         kd2 = FindImageMatch2(lon0, lat0, date_str3, '667', '2013');
% %     end
% %     if isnan(kd) || isnan(kd1) || isnan(kd2)
% %         date4 = date + 2; %在之后2天中找
% %         date_str4 = datestr(date4,'yyyymmdd');
% %         kd = FindImageMatch2(lon0, lat0, date_str4, '488', '2013'); %运行函数，得到第一次匹配的结果
% %         kd1 = FindImageMatch2(lon0, lat0, date_str4, '547', '2013');
% %         kd2 = FindImageMatch2(lon0, lat0, date_str4, '667', '2013');
% %     end
    
    if isnan(chla) %|| isnan(kd1) || isnan(kd2)%give up
        continue;
    end
%     argo_tiff(num,1) = lon_lat_date_data(i,6); %argo chla
%     argo_tiff(num,2) = chla; %L3 chla
%     argo_tiff(num,3) = lon0;
%     argo_tiff(num,4) = lat0;
% 
%     filename_match(num,:) = filename_chla{i}; 
    
    argo_data1(num,:) = chla_all(i,:); %argo data
    chlaL3_noaa(num,:) = chla; %L3 Rrs
    dat_match1(num,:) = dat_name(i,:); 
    num = num + 1;
end

save('E:\zyx\小论文\argo_noaa_chla_new.mat','argo_data1','chlaL3_noaa','dat_match1'); 


