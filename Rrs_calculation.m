function Rrs = Rrs_calculation(chla, depth)
% clear all

% load('D:\toZHUYIXIAN\chla垂向分布\z90.mat')
kd_para = readmatrix('.\kd_para.xlsx');
aw0 = readmatrix('.\aw.xlsx');
A0 = readmatrix('.\A.xlsx');
bw0 = readmatrix('.\bw.xlsx');
wave_length = (400:5:700)';
% chla0 = 0.2;
% zmax = 30;
% Z = 0:1:100;
% 
% phi0 = phi;
% hh = h;

%波长插值
aw = interp1(aw0(:,1), aw0(:,2),wave_length,'linear');
% aw(1:6) = aw(7);
A = interp1(A0(:,1), A0(:,2),wave_length,'linear');
% A(1:10) = A(11);
bw = interp1(bw0(:,1), bw0(:,2),wave_length,'linear');

%计算Rs
for i = 1:length(wave_length)
    Y = exp(-0.014*(wave_length(i) - 440));
    bwi = bw(i);
    awi = aw(i);
    Ai = A(i);
    step = 1; %步长
    z90i = depth; %用实测深度代替z90
    
    up = 0; %分子
    down = 0; %分母
    
    %分子&分母
    for j = 2:length(z90i)
        zi = z90i(j);
        
        %X
        chl = chla(j);
        bp550 = 0.416 * chl ^0.766;
        if chl >= 0.02 && chl <= 2
            v = 0.5 * (log10(chl)-0.3);
        elseif chl > 2
            v = 0;
        else
            v = 0;
%             continue
        end
        bbp = bp550 * (0.002 + 0.01 * (0.5 - 0.25*(log10(chl))) * (wave_length(i)/550)^v);
        bb = 0.5 * bwi + bbp;
        a = (awi + 0.06 * Ai * (chl^0.65)) * (1 + 0.2 * Y);
        X = bb / (a + bb);
        
        %f
        zz = z90i(1):step:zi;
        kd = kd_para(i,2) + kd_para(i,4) .* chla(1:j) .^ kd_para(i,3);
        q = trapz(zz,kd); %梯形积分
        f = exp(-2 * q);
        
        up = up + X * f * step; 
        down = down + f * step;
    end
    
    Xs = up / down;
    P = 0.0001 + 0.3244 * Xs + 0.1425 * Xs^2 + 0.1308 * Xs^3;
    Rs(i) = P;
end

rrs = Rs ./ 3.25;
Rrs = 0.518 .* rrs ./ (1 - 1.562 .* rrs);