function z90 = z90Calculate(chla, z)


kd_para = readmatrix('.\kd_para.xlsx');
aw0 = readmatrix('.\aw.xlsx');
A0 = readmatrix('.\A.xlsx');
bw0 = readmatrix('.\bw.xlsx');
wave_length = (400:5:700)';


%波长插值
aw = interp1(aw0(:,1), aw0(:,2),wave_length,'linear');
% aw(1:6) = aw(7);
A = interp1(A0(:,1), A0(:,2),wave_length,'linear');
% A(1:10) = A(11);
bw = interp1(bw0(:,1), bw0(:,2),wave_length,'linear');

%chl插值，至多插到300米深
if max(z) >= 300
    z_interp = (round(min(z))+1:1:300)';
else
    z_interp = (round(min(z))+1:1:round(max(z)))';
end
chla_interp = interp1(z,chla,z_interp);

for i = 1:length(wave_length)
    z_fix = 0; %初始
    dis_min = 100; %离1的距离
    for j = 2:length(z_interp)
        zz = z_interp(1):1:z_interp(j);
        kd = kd_para(i,2) + kd_para(i,4) .* chla_interp(1:j) .^ kd_para(i,3);
        q = trapz(zz,kd); %梯形积分
        dis = abs(q-1);
        if dis < dis_min
            z_fix = z_interp(j);
            dis_min = dis;
        end
    end
    z90(i) = z_fix;
end
% for i = 1:length(wave_length)
%     zz = 0:1:z_unave(i);
%     chla_total = chla0 + hh .* exp(-(zz-zmax).^2./(2.*phi0.*phi0))./(phi0.*sqrt(2.*pi));
%     chl = mean(chla_total);
%     kd_unave(i) = kd_para(i,2) + kd_para(i,4) * chl ^ kd_para(i,3);
% end
% z90 = 1./kd_unave;

