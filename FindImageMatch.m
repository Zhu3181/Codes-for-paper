function chla_match = FindImageMatch(lon0, lat0, date)
%匹配argo数据和三级nc数据，获得匹配的chla  

year = date(1);
month = date(2);
day = date(3);
serial = dateToSerial(year, month, day);
if serial <= 9
    se = strcat('00', num2str(serial));
elseif serial >= 10 && serial <= 99
    se = strcat('0', num2str(serial));
else
    se = num2str(serial);
end

filename = strcat('E:\zyx\小论文\chla_L3\NOAA\V', num2str(year), se, '_D1_WW00_chlora.nc'); 

chla_match = nan; %kd初始值
if exist(filename, 'file')
   %读入L3数据的经纬度和chla
   Lon = ncread(filename, 'lon');
   Lat = ncread(filename, 'lat');
   chla = ncread(filename, 'chlor_a');
        
   %确定argo点在矩阵中的坐标，一般是在4个点之间，并且找到离它最近的点
   for p = 1 : length(Lon)-1
        if lon0 >= Lon(p) && lon0 <= Lon(p+1)
            if abs(lon0-Lon(p)) >= abs(lon0-Lon(p+1))
                row = p+1;
            else
                row = p;
            end
            break;
        end                
   end
   for q = 1 : length(Lat)-1
        if lat0 <= Lat(q) && lat0 >= Lat(q+1)
            if abs(lat0-Lat(q)) >= abs(lat0-Lat(q+1))
                col = q+1;
            else
                col = q;
            end
            break;
        end                
   end
   if lon0 <= Lon(1)
       row = 1;
   elseif lon0 >= Lon(end)
       row = length(Lon);
   end

   chla_match = chla(row,col);
%    if isnan(kd)
%        field = chla(row-1:row+1,col-1:col+1); %1
%        kd = mean(field(find(~isnan(field))));
%    end
%         
%    if isnan(kd)
%        field = chla(row-2:row+2,col-2:col+2); %3
%        kd = mean(field(find(~isnan(field))));
%    end
%    if isnan(kd)
%        field = Kd490(row-2:row+3,col-2:col+3); %5
%        kd = mean(field(find(~isnan(field))));
%    end
        
% elseif exist(filename1, 'file')
%    %读入L3数据的经纬度和Kd
%    Lon = ncread(filename1, 'lon');
%    Lat = ncread(filename1, 'lat');
%    Kd490 = ncread(filename1, 'Kd_490');
%         
%    %确定argo点在矩阵中的坐标，一般是在4个点之间，并且找到离它最近的点
%    for p = 1 : length(Lon)-1
%         if lon0 >= Lon(p) && lon0 <= Lon(p+1)
%             if abs(lon0-Lon(p)) >= abs(lon0-Lon(p+1))
%                 row = p+1;
%             else
%                 row = p;
%             end
%             break;
%         end                
%    end
%    for q = 1 : length(Lat)-1
%         if lat0 <= Lat(q) && lat0 >= Lat(q+1)
%             if abs(lat0-Lat(q)) >= abs(lat0-Lat(q+1))
%                 col = q+1;
%             else
%                 col = q;
%             end
%             break;
%         end                
%    end
%    kd = Kd490(row,col)
%    if isnan(kd)
%        field = Kd490(row-1:row+1,col-1:col+1); %1
%        kd = mean(field(find(~isnan(field))));
%    end
%         
%    if isnan(kd)
%        field = Kd490(row-2:row+2,col-2:col+2); %3
%        kd = mean(field(find(~isnan(field))));
%    end
end

