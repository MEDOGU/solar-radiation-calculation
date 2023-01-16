clear
clc
close all

    n=287;                            
    lat = 36.9;
% ÇİFT EKSENLİ TAKİP SİSTEMİ

    fprintf('                               ÇİFT EKSEN SİSTEM                             \n');
    fprintf('    GÜNEŞ ZAMAN    |     Toplam Radyasyon    |   Direkt Radyasyon     |    Difuz Radyasyon     \n');

for GZ=8:1:17

    dec = 23.45*sind(360/365*(n + 284));                                            %Deklinasyon Açısı
    A = 1160 + 75*sind(360/365*(n - 275));                                          %Atmosfer dışı görünür radyasyon akısı
    k = 0.174 + 0.035*sind(360/365*(n - 100));                                      %Optik derinlik
    H = (12 - GZ)*15;
    beta =  asind(cosd(lat) * cosd(dec) * cosd(H) + sind(lat) * sind(dec));
    m = 1/sind(beta);
    Ib = A*exp((-1)*k*m);
    C = 0.095 + 0.04*sind(360/365*(n - 100));
    Idc = C*Ib*((1+cos(90-beta))/2);
    Ic = Ib + Idc;


     fprintf('    %d:00    |       %.2f W/m      |       %.2f W/m        |     %.2f W/m          \n',GZ,Ic,Ib,Idc);
    
    
end


  % TEK EKSENLİ TAKİP SİSTEMİ

    fprintf('\n                               TEK EKSEN SİSTEM                               \n');
    fprintf('    GÜNEŞ ZAMAN    |     Toplam Radyasyon    |   Direkt Radyasyon     |    Difuz Radyasyon     \n');

for GZ=8:1:17

    H = (12 - GZ)*15;
    beta =  asind(cosd(lat) * cosd(dec) * cosd(H) + sind(lat) * sind(dec));
    IBc = Ib*cosd(beta);
    IDc = C*IBc*((1+cosd(lat))/2);
    IC = IBc + IDc;

     fprintf('    %d:00    |       %.2f W/m      |       %.2f W/m        |        %.2f W/m       \n',GZ,IC,IBc,IDc);
 

end