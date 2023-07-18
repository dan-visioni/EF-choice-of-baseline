clear all

load t_maps_gauss.mat

%%

loading=true;
if loading
    T1 = ncread('b.e21.BWma1850.f09_g17.release-cesm2.1.3.c20200918.cam.h0.TREFHT.011001-015912.nc','TREFHT');
    P1 =  ncread('b.e21.BWma1850.f09_g17.release-cesm2.1.3.c20200918.cam.h0.PRECC.011001-015912.nc','PRECC')+...
        ncread('b.e21.BWma1850.f09_g17.release-cesm2.1.3.c20200918.cam.h0.PRECL.011001-015912.nc','PRECL');
end

%T1 = reshape(T1,288,192,12,50);
T1 = squeeze(mean(T1,3));
P1 = squeeze(mean(P1,3));
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

T_MAe1(:,:,1:20) = T_MA2{1,1}(:,:,16:35); T_MAe1(:,:,21:40) = T_MA2{1,2}(:,:,16:35); T_MAe1(:,:,41:60) = T_MA2{1,3}(:,:,16:35);
T_MAe2(:,:,1:20) = T_MA2{2,1}(:,:,16:35); T_MAe2(:,:,21:40) = T_MA2{2,2}(:,:,16:35); T_MAe2(:,:,41:60) = T_MA2{2,3}(:,:,16:35);
T_MAe3(:,:,1:20) = T_MA2{3,1}(:,:,16:35); T_MAe3(:,:,21:40) = T_MA2{3,2}(:,:,16:35); T_MAe3(:,:,41:60) = T_MA2{3,3}(:,:,16:35);

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

load p_maps_gauss.mat

lats=lat; lons=lon;
ww = cos(lat/180*pi);

tfact = 86400*1e3;

P_MA{1} = (T_MA2{1,1}+T_MA2{1,2}+T_MA2{1,3})/3 * tfact;
P_MA{2} = (T_MA2{2,1}+T_MA2{2,2}+T_MA2{2,3})/3 * tfact;
P_MA{3} = (T_MA2{3,1}+T_MA2{3,2}(:,:,1:35)+T_MA2{3,3}(:,:,1:35))/3 * tfact;
P_BA = (T_base{1}(:,:,1:113) + T_base{2}(:,:,36:148) + T_base{3}(:,:,36:148))/3 * tfact;

P_SSP_1993_2012 = squeeze(mean(P_BA(:,:,7:26),3));
P_SSP_2008_2027 = squeeze(mean(P_BA(:,:,22:41),3));
P_SSP_2020_2039 = squeeze(mean(P_BA(:,:,34:53),3));
P_SSP_2051_2070 = squeeze(mean(P_BA(:,:,65:84),3));
P_MA_DE_2051_2070 = squeeze(mean(P_MA{1}(:,:,16:35),3));
P_MA_05_2051_2070 = squeeze(mean(P_MA{2}(:,:,16:35),3));
P_MA_10_2051_2070 = squeeze(mean(P_MA{3}(:,:,16:35),3));

P_MAe1(:,:,1:20) = T_MA2{1,1}(:,:,16:35); P_MAe1(:,:,21:40) = T_MA2{1,2}(:,:,16:35); P_MAe1(:,:,41:60) = T_MA2{1,3}(:,:,16:35);
P_MAe2(:,:,1:20) = T_MA2{2,1}(:,:,16:35); P_MAe2(:,:,21:40) = T_MA2{2,2}(:,:,16:35); P_MAe2(:,:,41:60) = T_MA2{2,3}(:,:,16:35);
P_MAe3(:,:,1:20) = T_MA2{3,1}(:,:,16:35); P_MAe3(:,:,21:40) = T_MA2{3,2}(:,:,16:35); P_MAe3(:,:,41:60) = T_MA2{3,3}(:,:,16:35);
P_BAe1(:,:,1:20) = T_base{1}(:,:,34:53); P_BAe1(:,:,21:40) = T_base{2}(:,:,69:88); P_BAe1(:,:,41:60) = T_base{3}(:,:,69:88);
P_BAe2(:,:,1:20) = T_base{1}(:,:,22:41); P_BAe2(:,:,21:40) = T_base{2}(:,:,57:76); P_BAe2(:,:,41:60) = T_base{3}(:,:,57:76);
P_BAe3(:,:,1:20) = T_base{1}(:,:, 7:26); P_BAe3(:,:,21:40) = T_base{2}(:,:,42:61); P_BAe3(:,:,41:60) = T_base{3}(:,:,42:61);
P_BAeE(:,:,1:20) = T_base{1}(:,:,65:84); P_BAeE(:,:,21:40) = T_base{2}(:,:,90:109); P_BAeE(:,:,41:60) = T_base{3}(:,:,90:109);

dpA{2} = P_SSP_2051_2070-P_SSP_2020_2039;
dpA{3} = P_SSP_2051_2070-P_SSP_2008_2027;
dpA{4} = P_SSP_2051_2070-P_SSP_1993_2012;

[h_re1_C,t_gr1,lon_Pgr{2},lat_Pgr{2}] = eval_ttest(P_BAeE,P_BAe1,3,0.05,lon,lat);
[h_re2_C,t_gr2,lon_Pgr{3},lat_Pgr{3}] = eval_ttest(P_BAeE,P_BAe2,3,0.05,lon,lat);
[h_re3_C,t_gr3,lon_Pgr{4},lat_Pgr{4}] = eval_ttest(P_BAeE,P_BAe3,3,0.05,lon,lat);

dpB{1} = P_MA_DE_2051_2070-P_SSP_2051_2070;
dpB{2} = P_MA_DE_2051_2070-P_SSP_2020_2039;
dpB{3} = P_MA_DE_2051_2070-P_SSP_2008_2027;
dpB{4} = P_MA_DE_2051_2070-P_SSP_1993_2012;

[h_15r_C,t_g1,lon_Pg{1},lat_Pg{1}] = eval_ttest(P_MAe1,P_BAeE,3,0.05,lon,lat);
[h_15_C,t_g2,lon_Pg{2},lat_Pg{2}] = eval_ttest(P_MAe1,P_BAe1,3,0.05,lon,lat);
[h_10_C,t_g3,lon_Pg{3},lat_Pg{3}] = eval_ttest(P_MAe1,P_BAe2,3,0.05,lon,lat);
[h_05_C,t_g4,lon_Pg{4},lat_Pg{4}] = eval_ttest(P_MAe1,P_BAe3,3,0.05,lon,lat);

dpC{1} = P_MA_05_2051_2070-P_SSP_2051_2070;
dpC{2} = P_MA_05_2051_2070-P_SSP_2020_2039;
dpC{3} = P_MA_05_2051_2070-P_SSP_2008_2027;
dpC{4} = P_MA_05_2051_2070-P_SSP_1993_2012;

[h_15r_C,t_g1,lon_Pg1{1},lat_Pg1{1}] = eval_ttest(P_MAe2,P_BAeE,3,0.05,lon,lat);
[h_15_C,t_g2,lon_Pg1{2},lat_Pg1{2}] = eval_ttest(P_MAe2,P_BAe1,3,0.05,lon,lat);
[h_10_C,t_g3,lon_Pg1{3},lat_Pg1{3}] = eval_ttest(P_MAe2,P_BAe2,3,0.05,lon,lat);
[h_05_C,t_g4,lon_Pg1{4},lat_Pg1{4}] = eval_ttest(P_MAe2,P_BAe3,3,0.05,lon,lat);

dpD{1} = P_MA_10_2051_2070-P_SSP_2051_2070;
dpD{2} = P_MA_10_2051_2070-P_SSP_2020_2039;
dpD{3} = P_MA_10_2051_2070-P_SSP_2008_2027;
dpD{4} = P_MA_10_2051_2070-P_SSP_1993_2012;

[h_15r_C,t_g1,lon_Pg2{1},lat_Pg2{1}] = eval_ttest(P_MAe3,P_BAeE,3,0.05,lon,lat);
[h_15_C,t_g2,lon_Pg2{2},lat_Pg2{2}] = eval_ttest(P_MAe3,P_BAe1,3,0.05,lon,lat);
[h_10_C,t_g3,lon_Pg2{3},lat_Pg2{3}] = eval_ttest(P_MAe3,P_BAe2,3,0.05,lon,lat);
[h_05_C,t_g4,lon_Pg2{4},lat_Pg2{4}] = eval_ttest(P_MAe3,P_BAe3,3,0.05,lon,lat);

[h_re15_C,t_gre1,lon_Pgre1,lat_Pgre1] = eval_ttest(P_MAe1,P_BAe1,3,0.05,lon,lat);
[h_re10_C,t_gre2,lon_Pgre2,lat_Pgre2] = eval_ttest(P_MAe2,P_BAe2,3,0.05,lon,lat);
[h_re05_C,t_gre3,lon_Pgre3,lat_Pgre3] = eval_ttest(P_MAe3,P_BAe3,3,0.05,lon,lat);

%%

ww = cos(lat/180*pi);
PI=13.85;
T_B_gm = squeeze(mean(T_BA,1));
T_B_gm = squeeze(sum(T_B_gm.*ww)/sum(ww))-273.15-PI;
T_B_gm(2,:) = T_B_gm;
for i=1:3
    T_MAgm = squeeze(mean(T_MA{i},1));
    T_MA_gm(:,i) = squeeze(sum(T_MAgm.*ww)/sum(ww))-273.15-PI;
end

tfact = 86400*1e3;
P1_gm = squeeze(mean(P1,1))*tfact;
P1_gm = squeeze(sum(P1_gm'.*ww)/sum(ww));

P1_gm = ncread('b.e21.BWmaHIST.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.001.cam.h0.globavg.nc','PRECC')+...
    ncread('b.e21.BWmaHIST.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.001.cam.h0.globavg.nc','PRECL');
P1_gm = mean(P1_gm(116:150))*tfact;
P_B_gm = squeeze(mean(P_BA,1));
P_B_gm = squeeze(sum(P_B_gm.*ww)/sum(ww));
P_B_gm(2,:) = P_B_gm;
for i=1:3
    P_MAgm = squeeze(mean(P_MA{i},1));
    P_MA_gm(:,i) = squeeze(sum(P_MAgm.*ww)/sum(ww));
end

%%

load borderdata.mat
load Nations.mat
c=0;
for i=[209 175 30]
    c=c+1;
    t_pi_nat(c) = nanmean(T1(ind{i}))-273.15;
    for j=1:35
        for k=1:3
            TT = squeeze(T_MA{k}(:,:,j));
            t_sai_nat(j,k,c) = nanmean(TT(ind{i}))-273.15-t_pi_nat(c);
        end
    end
    for j=1:113
            TT = squeeze(T_BA(:,:,j));
            t_b_nat(j,c) = nanmean(TT(ind{i}))-273.15-t_pi_nat(c);
    end
end

l_colb = 40;

mmin=0;
mmax=3;
v = mmin:(mmax-mmin)/l_colb:mmax;
v2 = mmin:(mmax-mmin)/(l_colb/4):mmax;

fc = brewermap(l_colb,'YlOrRd');
t = 1986:2098; t2 = 2035:2069;

figure(1)
set(gcf, 'Position',  [200, 200,1600,1200])

subplot(2,10,1)
contourf(1:2,t,T_B_gm',v,'Linestyle','none')
hold on
plot([1 2],[2060 2060],'k','Linewidth',2)
text(01,2062,[num2str(mean(T_B_gm(73:92))+1.5,'%.1f') ' above PI'],'FontSize',12)
plot([1 2],[2030 2030],'k','Linewidth',2)
text(01,2032,'1.5 above PI','FontSize',12)
plot([1 2],[2018 2018],'k','Linewidth',2)
text(01,2020,'1.0 above PI','FontSize',12)
plot([1 2],[2002 2002],'k','Linewidth',2)
text(01,2004,'0.5 above PI','FontSize',12)
colormap(fc)
caxis([mmin mmax])
axis([1 2 1990 2069])
set(gca,'XColor', 'none','YColor','none')
title('SSP2-4.5')
hl = colorbar('FontSize',16,'YTick',(v2),'Linewidth',2,'Location','westoutside');
ylabel(hl, 'Temperature increase (K)')
hl.Position(3) = hl.Position(3)*2;
hl.Position(1) = hl.Position(1)-.08;
nm_sai = {'SAI-1.5','SAI-1.0','SAI-0.5'};

for i=1:3
    subplot(2,10,i+1)
    contourf(1:2,t2,[T_MA_gm(:,i) T_MA_gm(:,i)],v,'Linestyle','none')
    colormap(fc)
    hold on
    caxis([mmin mmax])
    axis([1 2 1990 2069])
    set(gca,'XColor', 'none','YColor','none')
    title(nm_sai{i})
    plot([1 2],[2060 2060],'k','Linewidth',2)
    text(01,2062,[num2str(mean(T_MA_gm(16:35,i)),'%.1f') ' above PI'],'FontSize',12)
    if i==1
        text(1,1985,'         Global average','FontSize',16)
    end
end

subplot(2,10,6)
contourf(1:2,t,[t_b_nat(:,1) t_b_nat(:,1)],v,'Linestyle','none')
hold on
plot([1 2],[2060 2060],'k','Linewidth',2)
text(01,2062,[num2str(mean(t_b_nat(73:92,1)),'%.1f') ' above PI'],'FontSize',12)
plot([1 2],[2030 2030],'k','Linewidth',2)
text(01,2032,[num2str(mean(t_b_nat(32:51,1)),'%.1f') ' above PI'],'FontSize',12)
plot([1 2],[2018 2018],'k','Linewidth',2)
text(01,2020,[num2str(mean(t_b_nat(17:36,1)),'%.1f') ' above PI'],'FontSize',12)
plot([1 2],[2002 2002],'k','Linewidth',2)
text(01,2004,[num2str(mean(t_b_nat(7:26,1)),'%.1f') ' above PI'],'FontSize',12)
colormap(fc)
caxis([mmin mmax])
axis([1 2 1990 2069])
set(gca,'XColor', 'none','YColor','none')
title('SSP2-4.5')


for i=1:3
    subplot(2,10,i+6)
    contourf(1:2,t2,[squeeze(t_sai_nat(:,i,1)) squeeze(t_sai_nat(:,i,1))],v,'Linestyle','none')
    colormap(fc)
    hold on
    caxis([mmin mmax])
    axis([1 2 1990 2069])
    set(gca,'XColor', 'none','YColor','none')
    title(nm_sai{i})
    plot([1 2],[2060 2060],'k','Linewidth',2)
    text(01,2062,[num2str(mean(t_sai_nat(16:35,i,1)),'%.1f') ' above PI'],'FontSize',12)
    if i==1
        text(1,1985,'         CONUS average','FontSize',16)
    end
end

subplot(2,10,11)
contourf(1:2,t,[t_b_nat(:,2) t_b_nat(:,2)],v,'Linestyle','none')
hold on
plot([1 2],[2060 2060],'k','Linewidth',2)
text(01,2062,[num2str(mean(t_b_nat(73:92,2)),'%.1f') ' above PI'],'FontSize',12)
plot([1 2],[2030 2030],'k','Linewidth',2)
text(01,2032,[num2str(mean(t_b_nat(32:51,2)),'%.1f') ' above PI'],'FontSize',12)
plot([1 2],[2018 2018],'k','Linewidth',2)
text(01,2020,[num2str(mean(t_b_nat(17:36,2)),'%.1f') ' above PI'],'FontSize',12)
plot([1 2],[2002 2002],'k','Linewidth',2)
text(01,2004,[num2str(mean(t_b_nat(7:26,2)),'%.1f') ' above PI'],'FontSize',12)
colormap(fc)
caxis([mmin mmax])
axis([1 2 1990 2069])
set(gca,'XColor', 'none','YColor','none')
title('SSP2-4.5')


for i=1:3
    subplot(2,10,i+11)
    contourf(1:2,t2,[squeeze(t_sai_nat(:,i,2)) squeeze(t_sai_nat(:,i,2))],v,'Linestyle','none')
    colormap(fc)
    hold on
    caxis([mmin mmax])
    axis([1 2 1990 2069])
    set(gca,'XColor', 'none','YColor','none')
    title(nm_sai{i})
        plot([1 2],[2060 2060],'k','Linewidth',2)
    text(01,2062,[num2str(mean(t_sai_nat(16:35,i,2)),'%.1f') ' above PI'],'FontSize',12)
    if i==1
        text(1,1985,'         Russia average','FontSize',16)
    end
end

subplot(2,10,16)
contourf(1:2,t,[t_b_nat(:,3) t_b_nat(:,3)],v,'Linestyle','none')
hold on
plot([1 2],[2060 2060],'k','Linewidth',2)
text(01,2062,[num2str(mean(t_b_nat(73:92,3)),'%.1f') ' above PI'],'FontSize',12)
plot([1 2],[2030 2030],'k','Linewidth',2)
text(01,2032,[num2str(mean(t_b_nat(32:51,3)),'%.1f') ' above PI'],'FontSize',12)
plot([1 2],[2018 2018],'k','Linewidth',2)
text(01,2020,[num2str(mean(t_b_nat(17:36,3)),'%.1f') ' above PI'],'FontSize',12)
plot([1 2],[2002 2002],'k','Linewidth',2)
text(01,2004,[num2str(mean(t_b_nat(7:26,3)),'%.1f') ' above PI'],'FontSize',12)
colormap(fc)
caxis([mmin mmax])
axis([1 2 1990 2069])
set(gca,'XColor', 'none','YColor','none')
title('SSP2-4.5')

for i=1:3
    subplot(2,10,i+16)
    contourf(1:2,t2,[squeeze(t_sai_nat(:,i,3)) squeeze(t_sai_nat(:,i,3))],v,'Linestyle','none')
    colormap(fc)
    hold on
    caxis([mmin mmax])
    axis([1 2 1990 2069])
    set(gca,'XColor', 'none','YColor','none')
    title(nm_sai{i})
        plot([1 2],[2060 2060],'k','Linewidth',2)
    text(01,2062,[num2str(mean(t_sai_nat(16:35,i,3)),'%.1f') ' above PI'],'FontSize',12)
    if i==1
        text(1,1985,'         China average','FontSize',16)
    end
end

set(gcf,'renderer','painters')
print(gcf,'-depsc2',['amber_diagram.eps'])
%%


figure(2)

mmin=0;
mmax=3;
v = mmin:(mmax-mmin)/l_colb:mmax;
v2 = mmin:(mmax-mmin)/(l_colb/4):mmax;

fc = brewermap(l_colb,'YlOrRd');

set(gcf, 'Position',  [200, 200,1600,1200])

subplot(2,10,1)
contourf(1:2,t,T_B_gm',v,'Linestyle','none')
hold on
plot([1 2],[2060 2060],'k','Linewidth',2)
text(01,2062,[num2str(mean(T_B_gm(73:92))+1.5,'%.1f') ' above PI'],'FontSize',12)
plot([1 2],[2030 2030],'k','Linewidth',2)
text(01,2032,'1.5 above PI','FontSize',12)
plot([1 2],[2018 2018],'k','Linewidth',2)
text(01,2020,'1.0 above PI','FontSize',12)
plot([1 2],[2002 2002],'k','Linewidth',2)
text(01,2004,'0.5 above PI','FontSize',12)
colormap(fc)
caxis([mmin mmax])
axis([1 2 1990 2069])
set(gca,'XColor', 'none','YColor','none')
title('SSP2-4.5')
hl = colorbar('FontSize',16,'YTick',(v2),'Linewidth',2,'Location','westoutside');
ylabel(hl, 'Temperature increase (K)')
hl.Position(3) = hl.Position(3)*2;
hl.Position(1) = hl.Position(1)-.04;
nm_sai = {'SAI-1.5','SAI-1.0','SAI-0.5'};


for i=1:3
    subplot(2,10,i+1)
    contourf(1:2,t2,[T_MA_gm(:,i) T_MA_gm(:,i)],v,'Linestyle','none')
    colormap(fc)
    hold on
    caxis([mmin mmax])
    axis([1 2 1990 2069])
    set(gca,'XColor', 'none','YColor','none')
    title(nm_sai{i})
    plot([1 2],[2060 2060],'k','Linewidth',2)
    text(01,2062,[num2str(mean(T_MA_gm(16:35,i)),'%.1f') ' above PI'],'FontSize',12)
    if i==1
        text(1,1985,'Global average for surface air temperatures','FontSize',16)
    end
    if i==3
        text(2.,2000.5,'- 2000','FontSize',12)
        text(2.,2035.5,'- 2035','FontSize',12)
        text(2.,2069,'- 2070','FontSize',12)
    end
end

mmin=-5;
mmax=5;
v = mmin:(mmax-mmin)/l_colb:mmax;
v2 = mmin:(mmax-mmin)/(l_colb/4):mmax;

fc2 = brewermap(l_colb,'BrBG');

% subplot(2,10,6)
% P = (P_B_gm'-P1_gm)/P1_gm*100;
% contourf(1:2,t,P,v,'Linestyle','none')
% hold on
% plot([1 2],[2060 2060],'k','Linewidth',2)
% text(01,2062,[num2str(mean(P(73:92)),'%.1f') ' above PI'],'FontSize',12)
% plot([1 2],[2030 2030],'k','Linewidth',2)
% text(01,2032,[num2str(mean(P(32:51)),'%.1f') ' above PI'],'FontSize',12)
% plot([1 2],[2018 2018],'k','Linewidth',2)
% text(01,2020,[num2str(mean(P(17:36)),'%.1f') ' above PI'],'FontSize',12)
% plot([1 2],[2002 2002],'k','Linewidth',2)
% text(01,2004,[num2str(mean(P(7:36)),'%.1f') ' above PI'],'FontSize',12)
% colormap(gca,fc2)
% caxis([mmin mmax])
% axis([1 2 1990 2069])
% set(gca,'XColor', 'none','YColor','none')
% title('SSP2-4.5')
% hl = colorbar('FontSize',16,'YTick',(v2),'Linewidth',2,'Location','westoutside');
% ylabel(hl, 'Precipitation change (%)')
% hl.Position(3) = hl.Position(3)*2;
% hl.Position(1) = hl.Position(1)-.04;
% 
% for i=1:3
%     subplot(2,10,i+6)
%     P = (P_MA_gm(:,i)'-P1_gm)/P1_gm*100;
%     contourf(1:2,t2,[P' P'],v,'Linestyle','none')
%     colormap(gca,fc2)
%     hold on
%     caxis([mmin mmax])
%     axis([1 2 1990 2069])
%     set(gca,'XColor', 'none','YColor','none')
%     title(nm_sai{i})
%     plot([1 2],[2060 2060],'k','Linewidth',2)
%     text(01,2062,[num2str(mean(P(16:35)),'%.1f') ' above PI'],'FontSize',12)
%     if i==1
%         text(1,1985,'         Global average','FontSize',16)
%     end
% end

set(gcf,'renderer','painters')
print(gcf,'-depsc2',['strips_global.eps'])