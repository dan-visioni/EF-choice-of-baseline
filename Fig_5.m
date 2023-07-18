clear all

load p_maps_gauss.mat


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

for i=1:107
    P_all(i) = latmean(T_base{1}(:,:,i+6),lat,-90,90) * tfact;
    P_all(i+107) = latmean(T_base{2}(:,:,i+41),lat,-90,90) * tfact;
    P_all(i+107+107) = latmean(T_base{3}(:,:,i+41),lat,-90,90) * tfact;
end

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

load t_maps_gauss.mat

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

c_1m = T_MA_DE_2051_2070-T_SSP_2020_2039; c_1 = mean(c_1m,1); c_1 = sum(c_1.*ww')/sum(ww'); % this run didn't really hit the target

T_MAe1(:,:,1:20) = T_MA2{1,1}(:,:,16:35); T_MAe1(:,:,21:40) = T_MA2{1,2}(:,:,16:35); T_MAe1(:,:,41:60) = T_MA2{1,3}(:,:,16:35);
T_MAe2(:,:,1:20) = T_MA2{2,1}(:,:,16:35); T_MAe2(:,:,21:40) = T_MA2{2,2}(:,:,16:35); T_MAe2(:,:,41:60) = T_MA2{2,3}(:,:,16:35);
T_MAe3(:,:,1:20) = T_MA2{3,1}(:,:,16:35); T_MAe3(:,:,21:40) = T_MA2{3,2}(:,:,16:35); T_MAe3(:,:,41:60) = T_MA2{3,3}(:,:,16:35);
% T_MAe1 = T_MAe1 - c_1;
T_BAe1(:,:,1:20) = T_base{1}(:,:,34:53); T_BAe1(:,:,21:40) = T_base{2}(:,:,69:88); T_BAe1(:,:,41:60) = T_base{3}(:,:,69:88);
T_BAe2(:,:,1:20) = T_base{1}(:,:,22:41); T_BAe2(:,:,21:40) = T_base{2}(:,:,57:76); T_BAe2(:,:,41:60) = T_base{3}(:,:,57:76);
T_BAe3(:,:,1:20) = T_base{1}(:,:, 7:26); T_BAe3(:,:,21:40) = T_base{2}(:,:,42:61); T_BAe3(:,:,41:60) = T_base{3}(:,:,42:61);
T_BAeE(:,:,1:20) = T_base{1}(:,:,65:84); T_BAeE(:,:,21:40) = T_base{2}(:,:,90:109); T_BAeE(:,:,41:60) = T_base{3}(:,:,90:109);

for i=1:107
    T_all(i) = latmean(T_base{1}(:,:,i+6),lat,-90,90);
    T_all(i+107) = latmean(T_base{2}(:,:,i+41),lat,-90,90);
    T_all(i+107+107) = latmean(T_base{3}(:,:,i+41),lat,-90,90);
end

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


figure(10)
set(gcf, 'Position',  [200, 200, 1800, 1000])
T_MAe1z = squeeze(mean(T_MAe1)); T_MAe2z = squeeze(mean(T_MAe2)); T_MAe3z = squeeze(mean(T_MAe3));
T_BAe1z = squeeze(mean(T_BAe1)); T_BAe2z = squeeze(mean(T_BAe2)); T_BAe3z = squeeze(mean(T_BAe3));

P_MAe1z = squeeze(mean(P_MAe1)); P_MAe2z = squeeze(mean(P_MAe2)); P_MAe3z = squeeze(mean(P_MAe3));
P_BAe1z = squeeze(mean(P_BAe1)); P_BAe2z = squeeze(mean(P_BAe2)); P_BAe3z = squeeze(mean(P_BAe3));

for i=1:60
    T_15(:,i) = latmean(T_MAe1z(:,i)',lat,-90,90);
    T_10(:,i) = latmean(T_MAe2z(:,i)',lat,-90,90);
    T_05(:,i) = latmean(T_MAe3z(:,i)',lat,-90,90);
    T_c15(:,i) = latmean(T_BAe1z(:,i)',lat,-90,90);
    T_c10(:,i) = latmean(T_BAe2z(:,i)',lat,-90,90);
    T_c05(:,i) = latmean(T_BAe3z(:,i)',lat,-90,90);
    P_15(:,i) = latmean(P_MAe1z(:,i)',lat,-90,90) * tfact;
    P_10(:,i) = latmean(P_MAe2z(:,i)',lat,-90,90) * tfact;
    P_05(:,i) = latmean(P_MAe3z(:,i)',lat,-90,90) * tfact; 
    P_c15(:,i) = latmean(P_BAe1z(:,i)',lat,-90,90);
    P_c10(:,i) = latmean(P_BAe2z(:,i)',lat,-90,90);
    P_c05(:,i) = latmean(P_BAe3z(:,i)',lat,-90,90);
end

fc1 = brewermap(4,'Set2');
fc1 = brighten(fc1,.7);
fc2 = brighten(fc1,-.7);
col = [fc2(1,:);fc2(2,:);fc2(3,:);fc2(4,:)];

sz=300;

subplot(2,2,2)

hold on
box on


ftz = 12;
plot([-15 10],[0 0],'k')
plot([0 0],[-5 5],'k')

a = latmean(dtA{2},lat,-90,90); b =  latmean(dpA{2},lat,-90,90)./latmean(P_SSP_2020_2039,lat,-90,90)*100;
plot([a a],[b b-.5],':k')
text(a-.1,b-1,{'SSP2-4.5';'[2050-2069]-';'[2020-2039]'},'Fontsize',ftz)
scatter(a,b,sz,col(1,:),'filled','Markeredgecolor','r')
a1=a; b1=b;
a = latmean(dtA{3},lat,-90,90); b =  latmean(dpA{3},lat,-90,90)./latmean(P_SSP_2020_2039,lat,-90,90)*100;
plot([a a],[b b-.5],':k')
text(a-.1,b-1,{'SSP2-4.5';'[2050-2069]-';'[2008-2027]'},'Fontsize',ftz)
scatter(a,b,sz,col(2,:),'filled','Markeredgecolor','r')
a2=a; b2=b;
a = latmean(dtA{4},lat,-90,90); b =  latmean(dpA{4},lat,-90,90)./latmean(P_SSP_2020_2039,lat,-90,90)*100;
plot([a a],[b b-.5],':k')
text(a-.1,b-1,{'SSP2-4.5';'[2050-2069]-';'[1993-2012]'},'Fontsize',ftz)
scatter(a,b,sz,col(3,:),'filled','Markeredgecolor','r')
a3=a; b3=b;
[P,S] = polyfit([0 a1 a2 a3],[0 b1 b2 b3],1);
    
yfit = P(1)*[-1 0 a1 a2 a3]+P(2);
plot([-1 0 a1 a2 a3],yfit,'Color','r','Linewidth',2,'Linestyle','--');

% scatter(latmean(dtA{3},lat,-90,90),latmean(dpA{3}./...
%     latmean(P_SSP_2008_2027,lat,-90,90)*100,lat,-90,90),sz,col(2,:),'filled','Markeredgecolor','k')
% scatter(latmean(dtA{4},lat,-90,90),latmean(dpA{4}./...
%     latmean(P_SSP_1993_2012,lat,-90,90)*100,lat,-90,90),sz,col(3,:),'filled','Markeredgecolor','k')

a = latmean(dtB{2},lat,-90,90); b =  latmean(dpB{2},lat,-90,90)./latmean(P_SSP_2020_2039,lat,-90,90)*100;
plot([a a],[b b+.5],':k')
text(a-.1,b+1.,{'SAI-1.5';'[2050-2069]-';'[2020-2039]'},'Fontsize',ftz)
scatter(a,b,sz,col(1,:),'filled','Markeredgecolor','b')
a1=a; b1=b;
a = latmean(dtC{2},lat,-90,90); b =  latmean(dpC{2},lat,-90,90)./latmean(P_SSP_2020_2039,lat,-90,90)*100;
plot([a a],[b b-.5],':k')
text(a-.1,b-1,{'SAI-1.0';'[2050-2069]-';'[2020-2039]'},'Fontsize',ftz)
scatter(a,b,sz,col(2,:),'filled','Markeredgecolor','b')
a2=a; b2=b;
a = latmean(dtD{2},lat,-90,90); b =  latmean(dpD{2},lat,-90,90)./latmean(P_SSP_2020_2039,lat,-90,90)*100;
plot([a a],[b b-.5],':k')
text(a-.1,b-1,{'SAI-0.5';'[2050-2069]-';'[2020-2039]'},'Fontsize',ftz)
scatter(a,b,sz,col(3,:),'filled','Markeredgecolor','b')
a3=a; b3=b;

[P,S] = polyfit([a1 a2 a3],[b1 b2 b3],1);
    
yfit = P(1)*[a1 a2 a3 2]+P(2);
plot([a1 a2 a3 2],yfit,'Color','b','Linewidth',2,'Linestyle',':');

% scatter(latmean(dtB{2},lat,-90,90),latmean(dpB{2}./...
%     latmean(P_SSP_2020_2039,lat,-90,90)*100,lat,-90,90),sz,col(1,:),'filled','Markeredgecolor','k')
% scatter(latmean(dtC{2},lat,-90,90),latmean(dpC{2}./...
%     latmean(P_SSP_2020_2039,lat,-90,90)*100,lat,-90,90),sz,col(2,:),'filled','Markeredgecolor','k')
% scatter(latmean(dtD{2},lat,-90,90),latmean(dpD{2}./...
%     latmean(P_SSP_2020_2039,lat,-90,90)*100,lat,-90,90),sz,col(3,:),'filled','Markeredgecolor','k')

a = latmean(dtC{3},lat,-90,90); b =  latmean(dpC{3},lat,-90,90)./latmean(P_SSP_2020_2039,lat,-90,90)*100;
plot([a a+.5],[b b],':k')
text(a+.5,b,{'SAI-1.0';'[2050-2069]-';'[2008-2027]'},'Fontsize',ftz)
scatter(a,b,sz,col(2,:),'filled','Markeredgecolor','w')

a = latmean(dtD{4},lat,-90,90); b =  latmean(dpD{4},lat,-90,90)./latmean(P_SSP_2020_2039,lat,-90,90)*100;
plot([a a+1],[b b],':k')
text(a+1,b,{'SAI-0.5';'[2050-2069]-';'[1993-2012]'},'Fontsize',ftz)
scatter(a,b,sz,col(3,:),'filled','Markeredgecolor','w')

%annotation('textarrow',[.235 .235],[.5 .4],'String',' Growth ','FontSize',13,'Linewidth',2)

% scatter(latmean(dtB{2},lat,-90,90),latmean(dpB{2}./...
%     latmean(P_SSP_2020_2039,lat,-90,90)*100,lat,-90,90),sz,col(1,:),'filled','Markeredgecolor','k')
% scatter(latmean(dtC{3},lat,-90,90),latmean(dpC{3}./...
%     latmean(P_SSP_2008_2027,lat,-90,90)*100,lat,-90,90),sz,col(2,:),'filled','Markeredgecolor','k')
% scatter(latmean(dtD{4},lat,-90,90),latmean(dpD{4}./...
%     latmean(P_SSP_1993_2012,lat,-90,90)*100,lat,-90,90),sz,col(3,:),'filled','Markeredgecolor','k')


set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)
set(gca,'YTick',[-10:1:10])
axis([-1 2.1 -5 5])
ylabel('\DeltaP (%)')
xlabel('\DeltaT (K)')
title('Global mean changes in 2050-2069 in SSP2-4.5 and SAI simulations')

% set(gcf,'renderer','painters')
% print(gcf,'-depsc2',['dp0_dt0.eps'])

% figure(11)
% set(gcf, 'Position',  [200, 200, 1800, 1000])

sz=300;

fc1 = brewermap(4,'Set2');
fc1 = brighten(fc1,.7);
fc2 = brighten(fc1,-.7);
col = [fc2(1,:);fc2(2,:);fc2(3,:);fc2(4,:)];

subplot(2,2,1)

hold on
box on

dtAi{2} = T_SSP_2051_2070-T_SSP_1993_2012;
dtAi{3} = T_SSP_2020_2039-T_SSP_1993_2012;
dtAi{4} = T_SSP_2008_2027-T_SSP_1993_2012;

dpAi{2} = P_SSP_2051_2070-P_SSP_1993_2012;
dpAi{3} = P_SSP_2020_2039-P_SSP_1993_2012;
dpAi{4} = P_SSP_2008_2027-P_SSP_1993_2012;

plot([-15 10],[0 0],'k')
plot([0 0],[-5 5],'k')


scatter(T_all-latmean(T_SSP_1993_2012,lat,-90,90),...
    (P_all./latmean(P_SSP_1993_2012,lat,-90,90)-1)*100,30,fc1(4,:),'filled','Markeredgecolor','none')

scatter(T_15-latmean(T_SSP_1993_2012,lat,-90,90),...
    (P_15./latmean(P_SSP_1993_2012,lat,-90,90)-1)*100,30,fc1(1,:),'filled','Markeredgecolor','none')

scatter(T_10-latmean(T_SSP_1993_2012,lat,-90,90),...
    (P_10./latmean(P_SSP_1993_2012,lat,-90,90)-1)*100,30,fc1(1,:),'filled','Markeredgecolor','none')

scatter(T_05-latmean(T_SSP_1993_2012,lat,-90,90),...
    (P_05./latmean(P_SSP_1993_2012,lat,-90,90)-1)*100,30,fc1(1,:),'filled','Markeredgecolor','none')


a = latmean(dtAi{2},lat,-90,90); b =  latmean(dpAi{2},lat,-90,90)./latmean(P_SSP_1993_2012,lat,-90,90)*100;
%plot([a a],[b b-.5],':k')
text(a-.1,b+1,{'SSP2-4.5';'2050-2069'},'Fontsize',ftz)
scatter(a,b,sz,col(4,:),'filled','Markeredgecolor','k')
a1=a; b1=b;
a = latmean(dtAi{3},lat,-90,90); b =  latmean(dpAi{3},lat,-90,90)./latmean(P_SSP_1993_2012,lat,-90,90)*100;
%plot([a a],[b b-.5],':k')
text(a-.1,b+1,{'SSP2-4.5';'2020-2039'},'Fontsize',ftz)
scatter(a,b,sz,col(4,:),'filled','Markeredgecolor','k')
a2=a; b2=b;
a = latmean(dtAi{4},lat,-90,90); b =  latmean(dpAi{4},lat,-90,90)./latmean(P_SSP_1993_2012,lat,-90,90)*100;
%plot([a a],[b b-.5],':k')
text(a-.1,b+.8,{'SSP2-4.5';'2008-2027'},'Fontsize',ftz)
scatter(a,b,sz,col(4,:),'filled','Markeredgecolor','k')
text(0-.1,0+1,{'1993-2012'},'Fontsize',ftz)
scatter(0,0,sz,col(4,:),'filled','Markeredgecolor','k')
a3=a; b3=b;
[P,S] = polyfitZero([0 a1 a2 a3],[0 b1 b2 b3],1);

yfit = P(1)*[0 a1 a2 a3];
plot([0 a1 a2 a3],yfit,'Color','k','Linewidth',2,'Linestyle','--');

dtAi{2} = T_MA_DE_2051_2070-T_SSP_1993_2012;
dtAi{3} = T_MA_05_2051_2070-T_SSP_1993_2012;
dtAi{4} = T_MA_10_2051_2070-T_SSP_1993_2012;

dpAi{2} = P_MA_DE_2051_2070-P_SSP_1993_2012;
dpAi{3} = P_MA_05_2051_2070-P_SSP_1993_2012;
dpAi{4} = P_MA_10_2051_2070-P_SSP_1993_2012;

a = latmean(dtAi{2},lat,-90,90); b =  latmean(dpAi{2},lat,-90,90)./latmean(P_SSP_1993_2012,lat,-90,90)*100;
%plot([a a],[b b+.5],':k')
text(a+.1,b,{'SAI-1.5';'2050-2069'},'Fontsize',ftz)
scatter(a,b,sz,col(1,:),'filled','Markeredgecolor','r')
a1=a; b1=b;
a = latmean(dtAi{3},lat,-90,90); b =  latmean(dpAi{3},lat,-90,90)./latmean(P_SSP_1993_2012,lat,-90,90)*100;
%plot([a a],[b b-.5],':k')
text(a+.1,b,{'SAI-1.0';'2050-2069'},'Fontsize',ftz)
scatter(a,b,sz,col(1,:),'filled','Markeredgecolor','r')
a2=a; b2=b;
a = latmean(dtAi{4},lat,-90,90); b =  latmean(dpAi{4},lat,-90,90)./latmean(P_SSP_1993_2012,lat,-90,90)*100;
%plot([a a],[b b-.5],':k')
text(a+.1,b,{'SAI-0.5';'2050-2069'},'Fontsize',ftz)
scatter(a,b,sz,col(1,:),'filled','Markeredgecolor','r')
a3=a; b3=b;

[P,S] = polyfit([a1 a2 a3],[b1 b2 b3],1);
    
yfit = P(1)*[a1 a2 a3 1.5]+P(2);
plot([a1 a2 a3 1.5],yfit,'Color','r','Linewidth',2,'Linestyle','--');

a = latmean(dtC{3},lat,-90,90); b =  latmean(dpC{3},lat,-90,90)./latmean(P_SSP_2020_2039,lat,-90,90)*100;

set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)
set(gca,'YTick',[-10:1:10])
axis([-.5 2.2 -3 5.3])
ylabel('\DeltaP (%)')
xlabel('\DeltaT (K)')
title('Global mean changes compared to 1993-2012 [0.5^{\circ}C above model PI]')

set(gcf,'renderer','painters')
print(gcf,'-depsc2',['dp0_dt02.eps'])

% %%
% 
% figure(1)
% set(gcf, 'Position',  [200, 200,2000,1600])
% 
% load LANDFRAC.mat
% LANDFRAC2=1-LANDFRAC;
% LANDFRAC2(LANDFRAC2<1)=NaN;
% LANDFRAC(LANDFRAC<1)=NaN;
% fc1 = brewermap(6,'*RdBu');
% fc1 = brighten(fc1,.7);
% fc2 = brighten(fc1,-.7);
% col = [fc2(1,:);fc2(2,:);fc2(3,:);fc2(4,:);fc2(5,:);fc2(6,:)];
% 
% lm_m = [-90,-90,-60,-30,30,60];
% lM_m = [90,-60,-30,30,60,90];
% syms = {'o','<','d','^','s','p'};
% nms = {'Global','90S-60S','60S-30S','30S-30N','30N-60N','60N-90N'};
% 
% subplot(3,2,3)
% 
% 
% hold on
% box on
% 
% for j=1:length(lm_m)
% lm=lm_m(j); lM=lM_m(j); cmp=1; sz=100;
% if j==1, sz=250; end
% t_g = [latmean(dtB{cmp},lat,lm,lM),latmean(dtC{cmp},lat,lm,lM),latmean(dtD{cmp},lat,lm,lM)];
% p_g = [latmean(dpB{cmp},lat,lm,lM),latmean(dpC{cmp},lat,lm,lM),latmean(dpD{cmp},lat,lm,lM)]...
%     /latmean(P_SSP_2051_2070,lat,lm,lM)*100;
% 
% t_g2 = [latmean(dtA{2},lat,lm,lM),latmean(dtA{3},lat,lm,lM),latmean(dtA{4},lat,lm,lM)];
% p_g2 = [latmean(dpA{2},lat,lm,lM),latmean(dpA{3},lat,lm,lM),latmean(dpA{4},lat,lm,lM)]...
%     /latmean(P_SSP_2051_2070,lat,lm,lM)*100;
% for i=1:3
% scatter(p_g(i),t_g(i),sz,col(4-i,:),syms{j},'filled','Markeredgecolor','k')
% scatter(p_g2(i),t_g2(i),sz,col(i+3,:),syms{j},'filled','Markeredgecolor','k')
% end
% end
% 
% set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)
% for i=1:length(syms)
%     p(i)=scatter(-90,90,350,syms{i},'filled','MarkerFaceColor','k');
% end
% 
% plot([-15 10],[0 0],'k')
% plot([0 0],[-4 4],'k')
% xlabel('\DeltaP (%)')
% ylabel('\DeltaT (K)')
% 
% legend(p,nms,'Location','Eastoutside')
% 
% axis([-11 10 -4 4])
% 
% fc_t = brewermap(40,'*RdBu');
% dtt = reshape(dtB{cmp},288*192,1);
% v = -3.9:.2:3.9; v2=-3.6:.8:3.6;
% 
% for i=1:length(dtt)
%     for j=1:length(v)-1
%         if dtt(i)>=v(j) && dtt(i)<v(j+1), d_col(i,:) = fc_t(j,:);
%         end
%     end
% end
% 
% dtt = reshape(dtA{2},288*192,1);
% 
% for i=1:length(dtt)
%     for j=1:length(v)-1
%         if dtt(i)>=v(j) && dtt(i)<v(j+1), d_col2(i,:) = fc_t(j,:);
%         end
%     end
% end
% 
% subplot(3,2,2)
% hold on
% box on
% colormap(gca,fc_t)
% scatter(reshape(P_SSP_2020_2039,288*192,1),reshape(dpB{cmp},288*192,1),10,d_col,'filled')
% scatter(-reshape(P_SSP_2020_2039,288*192,1),reshape(dpA{2},288*192,1),10,d_col2,'filled')
% scatter(latmean(P_SSP_2020_2039,lat,-90,90),latmean(dpB{cmp},lat,-90,90),250,fc_t(11,:),'filled','Markeredgecolor','k')
% scatter(-latmean(P_SSP_2020_2039,lat,-90,90),latmean(dpA{2},lat,-90,90),250,fc_t(30,:),'filled','Markeredgecolor','k')
% set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16,'XTick',-20:5:20)
% YT={'20','15','10','5','0','5','10','15','20'};
% xticklabels(YT)
% axis([-20 20 -3 3])
% plot([-20 20],[0 0],'k')
% plot([0 0],[-4 4],'k')
% xlabel('Baseline P (mm/day, mirrored)')
% ylabel('\DeltaP (mm/day)')
% 
% 
% 
% dtt = reshape(dtC{cmp},288*192,1);
% 
% for i=1:length(dtt)
%     for j=1:length(v)-1
%         if dtt(i)>=v(j) && dtt(i)<v(j+1), d_col(i,:) = fc_t(j,:);
%         end
%     end
% end
% 
% dtt = reshape(dtA{3},288*192,1);
% 
% for i=1:length(dtt)
%     for j=1:length(v)-1
%         if dtt(i)>=v(j) && dtt(i)<v(j+1), d_col2(i,:) = fc_t(j,:);
%         end
%     end
% end
% 
% subplot(3,2,4)
% hold on
% box on
% colormap(gca,fc_t)
% scatter(reshape(P_SSP_2020_2039,288*192,1),reshape(dpC{cmp},288*192,1),10,d_col,'filled')
% scatter(-reshape(P_SSP_2020_2039,288*192,1),reshape(dpA{3},288*192,1),10,d_col2,'filled')
% scatter(latmean(P_SSP_2020_2039,lat,-90,90),latmean(dpC{cmp},lat,-90,90),250,fc_t(8,:),'filled','Markeredgecolor','k')
% scatter(-latmean(P_SSP_2020_2039,lat,-90,90),latmean(dpA{3},lat,-90,90),250,fc_t(32,:),'filled','Markeredgecolor','k')
% hl = colorbar('FontSize',16,'YTick',(v2),'Linewidth',2,'Location','eastoutside');
% hl.Position(1) = hl.Position(1)+.03;
% ylabel(hl, '\Delta T (K)')
% caxis([-4 4])
% set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)
% axis([-20 20 -3 3])
% set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16,'XTick',-20:5:20)
% xticklabels(YT)
% plot([-20 20],[0 0],'k')
% plot([0 0],[-4 4],'k')
% xlabel('Baseline P (mm/day, mirrored)')
% ylabel('\DeltaP (mm/day)')
% 
% dtt = reshape(dtD{cmp},288*192,1);
% 
% for i=1:length(dtt)
%     for j=1:length(v)-1
%         if dtt(i)>=v(j) && dtt(i)<v(j+1), d_col(i,:) = fc_t(j,:);
%         end
%     end
% end
% 
% dtt = reshape(dtA{4},288*192,1);
% 
% for i=1:length(dtt)
%     for j=1:length(v)-1
%         if dtt(i)>=v(j) && dtt(i)<v(j+1), d_col2(i,:) = fc_t(j,:);
%         end
%     end
% end
% 
% subplot(3,2,6)
% hold on
% box on
% colormap(gca,fc_t)
% 
% scatter(reshape(P_SSP_2020_2039,288*192,1),reshape(dpD{cmp},288*192,1),10,d_col,'filled')
% scatter(-reshape(P_SSP_2020_2039,288*192,1),reshape(dpA{4},288*192,1),10,d_col2,'filled')
% scatter(latmean(P_SSP_2020_2039,lat,-90,90),latmean(dpD{cmp},lat,-90,90),250,fc_t(5,:),'filled','Markeredgecolor','k')
% scatter(-latmean(P_SSP_2020_2039,lat,-90,90),latmean(dpA{4},lat,-90,90),250,fc_t(34,:),'filled','Markeredgecolor','k')
% axis([-20 20 -3 3])
% plot([-20 20],[0 0],'k')
% plot([0 0],[-4 4],'k')
% xlabel('Baseline P (mm/day, mirrored)')
% ylabel('\DeltaP (mm/day)')
% set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16,'XTick',-20:5:20)
% xticklabels(YT)
% % scatter(dpC{cmp},dpA{3},sz,col(1,:),'filled')
% % scatter(dpB{cmp},dpA{2},sz,col(1,:),'filled')
% 
% % subplot(3,2,2)
% % 
% % hold on
% % box on
% % for i=1:192
% % scatter(dpD{cmp}(:,i).*LANDFRAC(:,i),dtD{cmp}(:,i).*LANDFRAC(:,i),sz,col(1,:),'filled')
% % scatter(dpC{cmp}(:,i).*LANDFRAC(:,i),dtC{cmp}(:,i).*LANDFRAC(:,i),sz,col(2,:),'filled')
% % scatter(dpB{cmp}(:,i).*LANDFRAC(:,i),dtB{cmp}(:,i).*LANDFRAC(:,i),sz,col(3,:),'filled')
% % scatter(dpA{4}(:,i).*LANDFRAC(:,i),dtA{4}(:,i).*LANDFRAC(:,i),sz,col(6,:),'filled')
% % scatter(dpA{3}(:,i).*LANDFRAC(:,i),dtA{3}(:,i).*LANDFRAC(:,i),sz,col(5,:),'filled')
% % scatter(dpA{2}(:,i).*LANDFRAC(:,i),dtA{2}(:,i).*LANDFRAC(:,i),sz,col(4,:),'filled')
% % end
% % xlabel('\DeltaP (mm/day)')
% % ylabel('\DeltaT (K)')
% % axis([-Inf Inf -Inf Inf])
% % set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)
% % 
% % subplot(3,2,4)
% % 
% % hold on
% % box on
% % for i=1:192
% % scatter(dpD{cmp}(:,i).*LANDFRAC2(:,i),dtD{cmp}(:,i).*LANDFRAC2(:,i),sz,col(1,:),'filled')
% % scatter(dpB{cmp}(:,i).*LANDFRAC2(:,i),dtB{cmp}(:,i).*LANDFRAC2(:,i),sz,col(3,:),'filled')
% % scatter(dpC{cmp}(:,i).*LANDFRAC2(:,i),dtC{cmp}(:,i).*LANDFRAC2(:,i),sz,col(2,:),'filled')
% % scatter(dpA{4}(:,i).*LANDFRAC2(:,i),dtA{4}(:,i).*LANDFRAC2(:,i),sz,col(6,:),'filled')
% % scatter(dpA{3}(:,i).*LANDFRAC2(:,i),dtA{3}(:,i).*LANDFRAC2(:,i),sz,col(5,:),'filled')
% % scatter(dpA{2}(:,i).*LANDFRAC2(:,i),dtA{2}(:,i).*LANDFRAC2(:,i),sz,col(4,:),'filled')
% % end
% % 
% % xlabel('\DeltaP (mm/day)')
% % ylabel('\DeltaT (K)')
% % axis([-Inf Inf -Inf Inf])
% set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)
% 
% set(gcf,'renderer','painters')
% print(gcf,'-depsc2',['precip_temperature.eps'])
% %%
% % 
% % dtB{1} = T_MA_DE_2051_2070-T_SSP_2051_2070;
% % dtB{2} = T_MA_DE_2051_2070-T_SSP_2020_2039;
% % dtB{3} = T_MA_DE_2051_2070-T_SSP_2008_2027;
% % dtB{4} = T_MA_DE_2051_2070-T_SSP_1993_2012;
% % T_BA = (T_base{1}(:,:,1:113) + T_base{2}(:,:,36:148) + T_base{3}(:,:,36:148))/3;
% 
% % T_BAe1(:,:,1:20) = T_base{1}(:,:,34:53); T_BAe1(:,:,21:40) = T_base{2}(:,:,69:88); T_BAe1(:,:,41:60) = T_base{3}(:,:,69:88);
% % T_BAe2(:,:,1:20) = T_base{1}(:,:,22:41); T_BAe2(:,:,21:40) = T_base{2}(:,:,57:76); T_BAe2(:,:,41:60) = T_base{3}(:,:,57:76);
% % T_BAe3(:,:,1:20) = T_base{1}(:,:, 7:26); T_BAe3(:,:,21:40) = T_base{2}(:,:,42:61); T_BAe3(:,:,41:60) = T_base{3}(:,:,42:61);
% % T_BAeE(:,:,1:20) = T_base{1}(:,:,65:84); T_BAeE(:,:,21:40) = T_base{2}(:,:,90:109); T_BAeE(:,:,41:60) = T_base{3}(:,:,90:109);
% 
% latmean(dtB{1},lat,-90,90)