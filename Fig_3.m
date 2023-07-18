clear all
fc1 = brewermap(4,'Pastel2');
fc2 = brighten(fc1,-.7);
col = [fc2(1,:);fc2(2,:);fc2(3,:);fc2(4,:)];
lw = [4,2,2,2];
vol = '/Volumes/D_Visioni2/CESM2_MA/MA_GAUSS/';
var = 'TREFHT';

loading=false;
if loading

nam = ['b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-DEFAULT.001.cam.h0.TREFHT.203501-206912.nc'];
AOD = ncread([vol nam],var);
T_MA2{1,1}=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

nam = ['b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-DEFAULT.002.cam.h0.TREFHT.203501-206912.nc'];
AOD = ncread([vol nam],var);
T_MA2{1,2}=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

nam = ['b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-DEFAULT.003.cam.h0.TREFHT.203501-206912.nc'];
AOD = ncread([vol nam],var);
T_MA2{1,3}=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));



lat = ncread([vol nam],'lat');
lon = ncread([vol nam],'lon');
ww = cos(lat/180*pi);

nam = ['b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-LOWER-0.5.001.cam.h0.TREFHT.203501-206912.nc'];
AOD = ncread([vol nam],var);
T_MA2{2,1}=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

nam = ['b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-LOWER-0.5.002.cam.h0.TREFHT.203501-206912.nc'];
AOD = ncread([vol nam],var);
T_MA2{2,2}=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

nam = ['b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-LOWER-0.5.003.cam.h0.TREFHT.203501-206912.nc'];
AOD = ncread([vol nam],var);
T_MA2{2,3}=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));


nam = ['b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-LOWER-1.0.001.cam.h0.TREFHT.203501-206912.nc'];
AOD = ncread([vol nam],var);
T_MA2{3,1}=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

nam = ['b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-LOWER-1.0.002.cam.h0.TREFHT.203501-207012.nc'];
AOD = ncread([vol nam],var);
T_MA2{3,2}=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

nam = ['b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-LOWER-1.0.003.cam.h0.TREFHT.203501-207012.nc'];
AOD = ncread([vol nam],var);
T_MA2{3,3}=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

vol = '/Volumes/D_Visioni2/CESM2_MA/';
nam = ['b.e21.BWmaHIST.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.001.cam.h0.TREFHT.198601-201412.nc'];
AOD = ncread([vol nam],var);
T_1=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

nam = ['b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.001.cam.h0.TREFHT.201501-206412.nc'];
AOD = ncread([vol nam],var);
T_2=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

nam = ['b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.001.cam.h0.TREFHT.206501-209912.nc'];
AOD = ncread([vol nam],var);
T_3=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

T_base{1} = cat(3,T_1,T_2,T_3);

nam = ['b.e21.BWmaHIST.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.002.cam.h0.TREFHT.195001-199912.nc'];
AOD = ncread([vol nam],var);
T_1=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

nam = ['b.e21.BWmaHIST.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.002.cam.h0.TREFHT.200001-201412.nc'];
AOD = ncread([vol nam],var);
T_2=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

nam = ['b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.002.cam.h0.TREFHT.201501-206412.nc'];
AOD = ncread([vol nam],var);
T_3=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

nam = ['b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.002.cam.h0.TREFHT.206501-209812.nc'];
AOD = ncread([vol nam],var);
T_4=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

T_base{2} = cat(3,T_1,T_2,T_3,T_4);

nam = ['b.e21.BWmaHIST.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.003.cam.h0.TREFHT.195001-199912.nc'];
AOD = ncread([vol nam],var);
T_1=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

nam = ['b.e21.BWmaHIST.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.003.cam.h0.TREFHT.200001-201412.nc'];
AOD = ncread([vol nam],var);
T_2=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

nam = ['b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.003.cam.h0.TREFHT.201501-201912.nc'];
AOD = ncread([vol nam],var);
T_3=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

nam = ['b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.003.cam.h0.TREFHT.202001-206912.nc'];
AOD = ncread([vol nam],var);
T_4=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

nam = ['b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.003.cam.h0.TREFHT.207001-209912.nc'];
AOD = ncread([vol nam],var);
T_5=squeeze(mean(reshape(AOD,288,192,12,size(AOD,3)/12),3));

T_base{3} = cat(3,T_1,T_2,T_3,T_4,T_5);

save('t_maps_gauss.mat','T_MA2','T_base','lat','lon')
end

%%

load t_maps_gauss.mat

%%
T_MA{1} = (T_MA2{1,1}+T_MA2{1,2}+T_MA2{1,3})/3;
T_MA{2} = (T_MA2{2,1}+T_MA2{2,2}+T_MA2{2,3})/3;
T_MA{3} = (T_MA2{3,1}+T_MA2{3,2}(:,:,1:35)+T_MA2{3,3}(:,:,1:35))/3;
T_BA = (T_base{1}(:,:,1:113) + T_base{2}(:,:,36:148) + T_base{3}(:,:,36:148))/3;

T_SSP_1993_2012 = squeeze(mean(T_BA(:,:,7:26),3));
T_SSP_2008_2027 = squeeze(mean(T_BA(:,:,22:41),3));
T_SSP_2020_2039 = squeeze(mean(T_BA(:,:,34:53),3));
T_SSP_2051_2070 = squeeze(mean(T_BA(:,:,65:84),3));
T_MA_DE_2051_2070 = squeeze(mean(T_MA{1}(:,:,16:35),3));
T_MA_05_2051_2070 = squeeze(mean(T_MA{2}(:,:,16:35),3));
T_MA_10_2051_2070 = squeeze(mean(T_MA{3}(:,:,16:35),3));

ww = cos(lat/180*pi);
c_1m = T_MA_DE_2051_2070-T_SSP_2020_2039; c_1 = mean(c_1m,1); c_1 = sum(c_1.*ww')/sum(ww'); % this run didn't really hit the target

T_MAe1(:,:,1:20) = T_MA2{1,1}(:,:,16:35); T_MAe1(:,:,21:40) = T_MA2{1,2}(:,:,16:35); T_MAe1(:,:,41:60) = T_MA2{1,3}(:,:,16:35);
T_MAe2(:,:,1:20) = T_MA2{2,1}(:,:,16:35); T_MAe2(:,:,21:40) = T_MA2{2,2}(:,:,16:35); T_MAe2(:,:,41:60) = T_MA2{2,3}(:,:,16:35);
T_MAe3(:,:,1:20) = T_MA2{3,1}(:,:,16:35); T_MAe3(:,:,21:40) = T_MA2{3,2}(:,:,16:35); T_MAe3(:,:,41:60) = T_MA2{3,3}(:,:,16:35);
T_MAe1 = T_MAe1 - c_1;
T_BAe1(:,:,1:20) = T_base{1}(:,:,34:53); T_BAe1(:,:,21:40) = T_base{2}(:,:,69:88); T_BAe1(:,:,41:60) = T_base{3}(:,:,69:88);
T_BAe2(:,:,1:20) = T_base{1}(:,:,22:41); T_BAe2(:,:,21:40) = T_base{2}(:,:,57:76); T_BAe2(:,:,41:60) = T_base{3}(:,:,57:76);
T_BAe3(:,:,1:20) = T_base{1}(:,:, 7:26); T_BAe3(:,:,21:40) = T_base{2}(:,:,42:61); T_BAe3(:,:,41:60) = T_base{3}(:,:,42:61);
T_BAeE(:,:,1:20) = T_base{1}(:,:,65:84); T_BAeE(:,:,21:40) = T_base{2}(:,:,90:109); T_BAeE(:,:,41:60) = T_base{3}(:,:,90:109);

dtA{2} = T_SSP_2051_2070-T_SSP_2020_2039;
dtA{3} = T_SSP_2051_2070-T_SSP_2008_2027;
dtA{4} = T_SSP_2051_2070-T_SSP_1993_2012;

[h_re1_C,t_gr1,lon_Tgr{2},lat_Tgr{2}] = eval_ttest(T_BAeE,T_BAe1,3,0.05,lon,lat);
[h_re2_C,t_gr2,lon_Tgr{3},lat_Tgr{3}] = eval_ttest(T_BAeE,T_BAe2,3,0.05,lon,lat);
[h_re3_C,t_gr3,lon_Tgr{4},lat_Tgr{4}] = eval_ttest(T_BAeE,T_BAe3,3,0.05,lon,lat);

dtB{1} = T_MA_DE_2051_2070-T_SSP_2051_2070;
dtB{2} = T_MA_DE_2051_2070-T_SSP_2020_2039;
dtB{3} = T_MA_DE_2051_2070-T_SSP_2008_2027;
dtB{4} = T_MA_DE_2051_2070-T_SSP_1993_2012;

[h_15r_C,t_g1,lon_Tg{1},lat_Tg{1}] = eval_ttest(T_MAe1,T_BAeE,3,0.05,lon,lat);
[h_15_C,t_g2,lon_Tg{2},lat_Tg{2}] = eval_ttest(T_MAe1,T_BAe1,3,0.05,lon,lat);
[h_10_C,t_g3,lon_Tg{3},lat_Tg{3}] = eval_ttest(T_MAe1,T_BAe2,3,0.05,lon,lat);
[h_05_C,t_g4,lon_Tg{4},lat_Tg{4}] = eval_ttest(T_MAe1,T_BAe3,3,0.05,lon,lat);

dtC{1} = T_MA_05_2051_2070-T_SSP_2051_2070;
dtC{2} = T_MA_05_2051_2070-T_SSP_2020_2039;
dtC{3} = T_MA_05_2051_2070-T_SSP_2008_2027;
dtC{4} = T_MA_05_2051_2070-T_SSP_1993_2012;

[h_15r_C,t_g1,lon_Tg1{1},lat_Tg1{1}] = eval_ttest(T_MAe2,T_BAeE,3,0.05,lon,lat);
[h_15_C,t_g2,lon_Tg1{2},lat_Tg1{2}] = eval_ttest(T_MAe2,T_BAe1,3,0.05,lon,lat);
[h_10_C,t_g3,lon_Tg1{3},lat_Tg1{3}] = eval_ttest(T_MAe2,T_BAe2,3,0.05,lon,lat);
[h_05_C,t_g4,lon_Tg1{4},lat_Tg1{4}] = eval_ttest(T_MAe2,T_BAe3,3,0.05,lon,lat);

dtD{1} = T_MA_10_2051_2070-T_SSP_2051_2070;
dtD{2} = T_MA_10_2051_2070-T_SSP_2020_2039;
dtD{3} = T_MA_10_2051_2070-T_SSP_2008_2027;
dtD{4} = T_MA_10_2051_2070-T_SSP_1993_2012;

[h_15r_C,t_g1,lon_Tg2{1},lat_Tg2{1}] = eval_ttest(T_MAe3,T_BAeE,3,0.05,lon,lat);
[h_15_C,t_g2,lon_Tg2{2},lat_Tg2{2}] = eval_ttest(T_MAe3,T_BAe1,3,0.05,lon,lat);
[h_10_C,t_g3,lon_Tg2{3},lat_Tg2{3}] = eval_ttest(T_MAe3,T_BAe2,3,0.05,lon,lat);
[h_05_C,t_g4,lon_Tg2{4},lat_Tg2{4}] = eval_ttest(T_MAe3,T_BAe3,3,0.05,lon,lat);

[h_re15_C,t_gre1,lon_Tgre1,lat_Tgre1] = eval_ttest(T_MAe1,T_BAe1,3,0.05,lon,lat);
[h_re10_C,t_gre2,lon_Tgre2,lat_Tgre2] = eval_ttest(T_MAe2,T_BAe2,3,0.05,lon,lat);
[h_re05_C,t_gre3,lon_Tgre3,lat_Tgre3] = eval_ttest(T_MAe3,T_BAe3,3,0.05,lon,lat);

%%

l_colb = 20;

mmin=-5;
mmax=5;
v = mmin:(mmax-mmin)/l_colb:mmax;
v2 = mmin:(mmax-mmin)/(l_colb/2):mmax;

fc = brewermap(l_colb,'*RdBu');
fc = brighten(fc,-.5);
fc2 = brighten(fc,.5);

fc(10,:)=fc2(10,:); fc(11,:)=fc2(11,:);

figure(1)
set(gcf, 'Position',  [200, 200,2000,1600])


nm_ssp = {'SSP2-4.5 [2050-2069]','SSP2-4.5 [2020-2039]','SSP2-4.5 [2008-2027]','hist [1993-2012]'};
nm_sai = {'SAI-1.5 [2050-2069]','SAI-1.0 [2050-2069]','SAI-0.5 [2050-2069]'};

for i=2:4

hc1{i}=subplot(4,4,i);

lon2 = lon;
lon2(length(lon)+1)=360;

dt=dtA{i};

dt(289,:) = dt(1,:);
colormap(fc)
worldmap([-90 90],[-180 180])
box on
hold on
contourfm(lat,lon2,dt',v,'LineStyle','none')
load coastlines
geoshow(coastlat,coastlon,'Color','k')
scatterm(lat_Tgr{i},lon_Tgr{i},.4,'k','filled')
caxis([mmin mmax])
set(gca,'Linewidth',2)
title({nm_ssp{1};['- ' nm_ssp{i}]},'FontSize',14)

if i>1
    hc1{i}.Position(1)=hc1{i}.Position(1)-.04*(i-1);
end
mlabel off; plabel off; gridm off
end

for i=1:4

hc2{i}=subplot(4,4,i+4);

lon2 = lon;
lon2(length(lon)+1)=360;

dt=dtB{i};

dt(289,:) = dt(1,:);

colormap(fc)
worldmap([-90 90],[-180 180])
box on
hold on
contourfm(lat,lon2,dt',v,'LineStyle','none')
load coastlines
geoshow(coastlat,coastlon,'Color','k')
scatterm(lat_Tg{i},lon_Tg{i},.4,'k','filled')
caxis([mmin mmax])
set(gca,'Linewidth',2)
title({nm_sai{1};['- ' nm_ssp{i}]},'FontSize',14)

hc2{i}.Position(2)=hc2{i}.Position(2)+.04;
if i>1
    hc2{i}.Position(1)=hc2{i}.Position(1)-.04*(i-1);
end
mlabel off; plabel off; gridm off
end

for i=1:4

hc2{i}=subplot(4,4,i+8);

lon2 = lon;
lon2(length(lon)+1)=360;

dt=dtC{i};

dt(289,:) = dt(1,:);

colormap(fc)
worldmap([-90 90],[-180 180])
box on
hold on
contourfm(lat,lon2,dt',v,'LineStyle','none')
load coastlines
geoshow(coastlat,coastlon,'Color','k')
scatterm(lat_Tg1{i},lon_Tg1{i},.4,'k','filled')
caxis([mmin mmax])
set(gca,'Linewidth',2)
title({nm_sai{2};['- ' nm_ssp{i}]},'FontSize',14)

hc2{i}.Position(2)=hc2{i}.Position(2)+.04*2;
if i>1
    hc2{i}.Position(1)=hc2{i}.Position(1)-.04*(i-1);
end
mlabel off; plabel off; gridm off
end

for i=1:4

hc2{i}=subplot(4,4,i+12);

lon2 = lon;
lon2(length(lon)+1)=360;

dt=dtD{i};

dt(289,:) = dt(1,:);

colormap(fc)
worldmap([-90 90],[-180 180])
box on
hold on
contourfm(lat,lon2,dt',v,'LineStyle','none')
load coastlines
geoshow(coastlat,coastlon,'Color','k')
scatterm(lat_Tg2{i},lon_Tg2{i},.4,'k','filled')
caxis([mmin mmax])
set(gca,'Linewidth',2)
title({nm_sai{3};['- ' nm_ssp{i}]},'FontSize',14)

hc2{i}.Position(2)=hc2{i}.Position(2)+.04*3;
if i>1
    hc2{i}.Position(1)=hc2{i}.Position(1)-.04*(i-1);
end

if i==2

hl = colorbar('FontSize',16,'YTick',(v2),'Linewidth',2,'Location','southoutside');
hl.Position(2) = hl.Position(2)-.06;
hl.Position(3) = hl.Position(3)*2.5;
hl.Position(4) = hl.Position(4)*1.5;
%hl.Position(1) = hl.Position(1)-.3;
ylabel(hl, '\Delta T (K)')
end
mlabel off; plabel off; gridm off
end

set(gcf,'renderer','painters')
print(gcf,'-depsc2',['tsurf_maps.eps'])

