clear all
fold = '/Volumes/D_Visioni2/CESM2_TSMLT/so4/';
nm{1} = 'b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-DEFAULT.';
nm{2} = 'b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-LOWER-0.5.';
nm{3} = 'b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-LOWER-1.0.';
nm_b = 'b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.';
name={'SAI-1.5','SAI-1.0','SAI-0.5'};
panels={'a)','b)','c)'};

sm = {'001','002','003'};

so4_a1conc_g = zeros(3,192,70,420,length(sm));
so4_a2conc_g = zeros(3,192,70,420,length(sm));
so4_a3conc_g = zeros(3,192,70,420,length(sm));
nmv = {'so4_a1','so4_a2','so4_a3'};

for ri=1:3
    for si=1:length(sm)
        so4_a1conc_gd = ncread([fold nmv{1} '_' nm{ri} sm{si} '_zm_monthly.nc'],nmv{1});
        so4_a2conc_gd = ncread([fold nmv{2} '_' nm{ri} sm{si} '_zm_monthly.nc'],nmv{2});
        so4_a3conc_gd = ncread([fold nmv{3} '_' nm{ri} sm{si} '_zm_monthly.nc'],nmv{3});
        so4_a1conc_g(ri,:,:,:,si) = so4_a1conc_gd(:,:,1:420);
        so4_a2conc_g(ri,:,:,:,si) = so4_a2conc_gd(:,:,1:420);
        so4_a3conc_g(ri,:,:,:,si) = so4_a3conc_gd(:,:,1:420);
    end
end

lev = ncread([fold nmv{1} '_' nm{ri} sm{si} '_zm_monthly.nc'],'lev');
lat = ncread([fold nmv{1} '_' nm{ri} sm{si} '_zm_monthly.nc'],'lat');
ww = cos(lat/180*pi);

for si=1:1
    so4_a1conc_gd = ncread([fold nmv{1} '_' nm_b sm{si} '_zm_monthly.nc'],nmv{1});
    so4_a2conc_gd = ncread([fold nmv{2} '_' nm_b sm{si} '_zm_monthly.nc'],nmv{2});
    so4_a3conc_gd = ncread([fold nmv{3} '_' nm_b sm{si} '_zm_monthly.nc'],nmv{3});
    so4_a1conc_b(:,:,:,si) = so4_a1conc_gd(:,:,1:600);
    so4_a2conc_b(:,:,:,si) = so4_a2conc_gd(:,:,1:600);
    so4_a3conc_b(:,:,:,si) = so4_a3conc_gd(:,:,1:600);
end
%%
TMSO2_a1conc_g = zeros(3,192,420,length(sm));
TMso4_a1conc_g = zeros(3,192,420,length(sm));
TMso4_a2conc_g = zeros(3,192,420,length(sm));
TMso4_a3conc_g = zeros(3,192,420,length(sm));
nmv = {'TMSO2','TMso4_a1','TMso4_a2','TMso4_a3'};

for ri=1:3
    for si=1:length(sm)        
        TMSO2_a1conc_gd = ncread([fold nmv{1} '_' nm{ri} sm{si} '_zm_monthly.nc'],nmv{1});
        TMso4_a1conc_gd = ncread([fold nmv{2} '_' nm{ri} sm{si} '_zm_monthly.nc'],nmv{2});
        TMso4_a2conc_gd = ncread([fold nmv{3} '_' nm{ri} sm{si} '_zm_monthly.nc'],nmv{3});
        TMso4_a3conc_gd = ncread([fold nmv{4} '_' nm{ri} sm{si} '_zm_monthly.nc'],nmv{4});
        TMSO2_a1conc_g(ri,:,:,si) = TMSO2_a1conc_gd(:,1:420);
        TMso4_a1conc_g(ri,:,:,si) = TMso4_a1conc_gd(:,1:420);
        TMso4_a2conc_g(ri,:,:,si) = TMso4_a2conc_gd(:,1:420);
        TMso4_a3conc_g(ri,:,:,si) = TMso4_a3conc_gd(:,1:420);
    end
end

for si=1:3
    TMSO2_a1conc_gd = ncread([fold nmv{1} '_' nm_b sm{si} '_zm_monthly.nc'],nmv{1});
    TMso4_a1conc_gd = ncread([fold nmv{2} '_' nm_b sm{si} '_zm_monthly.nc'],nmv{2});
    TMso4_a2conc_gd = ncread([fold nmv{3} '_' nm_b sm{si} '_zm_monthly.nc'],nmv{3});
    TMso4_a3conc_gd = ncread([fold nmv{4} '_' nm_b sm{si} '_zm_monthly.nc'],nmv{4});
    TMSO2_a1conc_b(:,:,si) = TMSO2_a1conc_gd(:,1:600);
    TMso4_a1conc_b(:,:,si) = TMso4_a1conc_gd(:,1:600);
    TMso4_a2conc_b(:,:,si) = TMso4_a2conc_gd(:,1:600);
    TMso4_a3conc_b(:,:,si) = TMso4_a3conc_gd(:,1:600);
end

%%

so4_g = (so4_a1conc_g + so4_a2conc_g + so4_a3conc_g)*1e9*1/3;
so4_b = (so4_a1conc_b + so4_a2conc_b + so4_a3conc_b)*1e9*1/3;

TMso4_g = (TMso4_a1conc_g + TMso4_a2conc_g + TMso4_a3conc_g)*1e6*1/3;
TMso4_b = (TMso4_a1conc_b + TMso4_a2conc_b + TMso4_a3conc_b)*1e6*1/3;

TMSO2_g = (TMSO2_a1conc_g)*1e6*1/2;
TMSO2_b = (TMSO2_a1conc_b)*1e6*1/2;

so4_g = reshape(so4_g,3,192,70,12,35,length(sm));
so4_b = reshape(so4_b,192,70,12,50,1); so4_b=squeeze(mean(so4_b,5));

TMso4_g = reshape(TMso4_g,3,192,12,35,length(sm));
TMso4_b = reshape(TMso4_b,192,12,50,3); 

TMSO2_g = reshape(TMSO2_g,3,192,12,35,length(sm));
TMSO2_b = reshape(TMSO2_b,192,12,50,3); 

so4_g_2D = squeeze(mean(mean(mean(so4_g(:,:,:,:,16:35,:),6),5),4));
so4_b_2D = squeeze(mean(mean(so4_b(:,:,6:25),4),3));

TMso4_g_2D = squeeze(mean(mean(TMso4_g(:,:,:,16:35,:),4),3));
TMso4_b_2D = squeeze(mean(mean(TMso4_b(:,:,6:25,:),3),2));

TMSO2_g_2D = squeeze(mean(mean(TMSO2_g(:,:,:,16:35,:),4),3));
TMSO2_b_2D = squeeze(mean(mean(TMSO2_b(:,:,6:25,:),3),2));

%%

fold = '/Volumes/D_Visioni2/CESM2_TSMLT/TROP_P/';

tropo = zeros(3,192,420,length(sm));
nmv = {'TROP_P'};
for ri=1:3
    for si=1:length(sm)
        tropod = ncread([fold nmv{1} '_' nm{ri} sm{si} '_zm_monthly.nc'],nmv{1});
        tropo(ri,:,:,si) = tropod(:,1:420);
    end
end

for si=1:length(sm)
    tropod = ncread([fold nmv{1} '_' nm_b sm{si} '_zm_monthly.nc'],nmv{1});
    tropo_b(:,:,si) = tropod(:,1:600);
end

tropo = reshape(tropo,3,192,12,35,length(sm));
tropo_b = reshape(tropo_b,192,12,50,length(sm));

tropo_b_2D = squeeze(mean(mean(tropo_b(:,:,6:25,:),3),2))*1e-2;
tropo_g_2D = squeeze(mean(mean(tropo(:,:,:,15:35,:),4),3))*1e-2;

%%
fold = '/Volumes/D_Visioni2/CESM2_MA/TSMLT_GAUSS/';

aod = zeros(3,192,420,length(sm));
nmv = {'AODVISstdn'};
for ri=1:3
    for si=1:length(sm)
        tropod = ncread([fold nmv{1} '_' nm{ri} sm{si} '_zm_monthly.nc'],nmv{1});
        aod(ri,:,:,si) = tropod(:,1:420);
    end
end

for si=1:length(sm)
    tropod = ncread([fold nmv{1} '_' nm_b sm{si} '_zm_monthly.nc'],nmv{1});
    aod_b(:,:,si) = tropod(:,1:600);
end

aod = reshape(aod,3,192,12,35,length(sm));
aod_b = reshape(aod_b,192,12,50,length(sm));

aod_b_2D = squeeze(mean(mean(aod_b(:,:,6:25,:),3),2));
aod_g_2D = squeeze(mean(mean(aod(:,:,:,15:35,:),4),3));

for ri=1:3
    for e=1:3
        aod_G(ri,:,e) = sum(squeeze(mean(aod(ri,:,:,:,e),3)).*ww,1)/sum(ww);
    end
end
aod_bG = mean(squeeze(sum(squeeze(mean(aod_b,4)).*ww,1)/sum(ww)),1);

aod_G = squeeze(mean(aod_G,3));

%%
h_inj = 22; %altitude of injection in km as prescribed
h_scale = 7; % scale height
p0 = 1032; % surf pressure
p_inj = p0*exp(-h_inj/h_scale);

p_min = 39.3; %as described in paper
p_max = 47.1; %as described in paper

p_inj = (p_max+p_min)/2;

l_30N = [lat(64),lat(65)];
l_15N = [lat(80),lat(81)];
l_15S = [lat(112),lat(113)];
l_30S = [lat(128),lat(129)];

figure(1)

l_colb = 19;
fc = brewermap(l_colb+1,'Reds');
mmin=0;
mmax=100;
v = mmin:(mmax-mmin)/l_colb:mmax;
v2 = [0.1 0.2:.2:1 2:1:10];
fc(1,:) = [1 1 1];
set(gcf, 'Position',  [200, 200, 1800, 1000])

for ri=1:3
    
    subplot(2,3,ri)
    colormap(fc)
    contourf(lat,lev,squeeze(so4_g_2D(ri,:,:))'-so4_b_2D',v,'LineStyle','none')
    hold on
    contour(lat,lev,so4_b_2D',v2,'k','Showtext','on','Linewidth',.1)
    fill([l_30N(1) l_30N(1) l_30N(2) l_30N(2)],[p_min p_max p_max p_min],'k','EdgeColor','none','FaceColor',[.6 .6 .6])
    fill([l_15N(1) l_15N(1) l_15N(2) l_15N(2)],[p_min p_max p_max p_min],'k','EdgeColor','none','FaceColor',[.6 .6 .6])
    fill([l_15S(1) l_15S(1) l_15S(2) l_15S(2)],[p_min p_max p_max p_min],'k','EdgeColor','none','FaceColor',[.6 .6 .6])
    fill([l_30S(1) l_30S(1) l_30S(2) l_30S(2)],[p_min p_max p_max p_min],'k','EdgeColor','none','FaceColor',[.6 .6 .6])
    plot(lat,mean(tropo_b_2D,2),'b','Linewidth',2)
    plot(lat,squeeze(mean(tropo_g_2D(ri,:,:),3)),'r','Linewidth',2)
    axis([-90 90 5 1000])
    caxis([mmin mmax])
    set(gca,'Ydir','reverse')
    set(gca,'YScale','log')
    set(gca,'YTick',[0.1 0.5 1 2 5 10 20 50 100 200 500 1000],'FontSize',18,'FontWeight','Bold')
    set(gca,'XTick',[-90:30:90],'FontSize',18,'FontWeight','Bold')
    set(gca,'Linewidth',2,'FontSize',18,'FontWeight','Bold')
    title({[panels{ri} ' ' name{ri}];'SO_4 increase (\mug-S/kg air)'})
    hc1 = colorbar('FontSize',20,'Linewidth',2);
    hc1.Position(1)=hc1.Position(1)+0.012;
    ylabel('hPa')
    
end

fc1 = brewermap(4,'Set2');
fc1 = brighten(fc1,.7);
fc2 = brighten(fc1,-.7);
fc3 = brighten(fc1,-.1);
fc4 = brighten(fc2,-.1);
fc5 = brighten(fc2,-.7);
fc6 = brighten(fc5,-.7);
col = [fc2(1,:);fc2(2,:);fc2(3,:)];
col2 = [fc1(1,:);fc1(2,:);fc1(3,:)];
col3 = [fc3(1,:);fc3(2,:);fc3(3,:)];

subplot(4,3,7)

box on
hold on

for ri=3:-1:1
for e=1:3
    %plot(lat,squeeze(TMso4_g_2D(ri,:,e))-TMso4_b_2D(:,e)','Color',col3(ri,:),'Linewidth',1);
end
area(lat,squeeze(mean(TMso4_g_2D(ri,:,:),3))-mean(TMso4_b_2D,2)','FaceColor',col(ri,:),'Linewidth',.1,...
    'Linestyle','-');
sum(squeeze(mean(TMso4_g_2D(ri,:,:),3))-mean(TMso4_b_2D,2)'.*ww')/sum(ww)
end
set(gca,'XTick',[-90:30:90],'FontSize',18,'FontWeight','Bold')
set(gca,'Linewidth',2,'FontSize',18,'FontWeight','Bold')
axis([-90 90 0. 55])
title('d) Column Sulfate increase [2050-2069]')
ylabel('SO_4 (mg-S/m^2)')

subplot(4,3,10)

box on
hold on

for ri=3:-1:1
for e=1:3
    %plot(lat,squeeze(TMso4_g_2D(ri,:,e))-TMso4_b_2D(:,e)','Color',col3(ri,:),'Linewidth',1);
end
%area(lat,squeeze(mean(TMso4_g_2D(ri,:,:),3))-mean(TMso4_b_2D,2)','FaceColor',col(ri,:),'Linewidth',4);
area(lat,squeeze(mean(TMSO2_g_2D(ri,:,:),3))-mean(TMSO2_b_2D,2)','FaceColor',col(ri,:),'Linewidth',.1,...
    'Linestyle','-');
end
set(gca,'XTick',[-90:30:90],'FontSize',18,'FontWeight','Bold')
set(gca,'Linewidth',2,'FontSize',18,'FontWeight','Bold')
axis([-90 90 0. 15])
ylabel('SO_2 (mg-S/m^2)')
xlabel('Latitude')

subplot(2,3,5)

box on
hold on

for ri=1:3
for e=1:3
    plot(lat,squeeze(aod_g_2D(ri,:,e))-aod_b_2D(:,e)','Color',col3(ri,:),'Linewidth',1);
end
p(ri) = plot(lat,squeeze(mean(aod_g_2D(ri,:,:),3))-mean(aod_b_2D,2)','Color',col(ri,:),'Linewidth',4);
end
legend(p,name,'Location','best')
set(gca,'XTick',[-90:30:90],'FontSize',18,'FontWeight','Bold')
set(gca,'Linewidth',2,'FontSize',18,'FontWeight','Bold')
axis([-90 90 0. 0.5])
title('e) Latitudinal AOD increase [2050-2069]')
ylabel('AOD')
xlabel('latitude')

cooling = [0.9,1.4,1.8];

subplot(4,3,9)

box on
hold on

for ri=1:3
for e=1:3
    %plot(lat,squeeze(aod_g_2D(ri,:,e))-aod_b_2D(:,e)','Color',col3(ri,:),'Linewidth',1);
end
p(ri) = plot(lat,(squeeze(mean(aod_g_2D(ri,:,:),3))-mean(aod_b_2D,2)')/cooling(ri),'Color',col(ri,:),'Linewidth',4);
end
%legend(p,name,'Location','best')
set(gca,'XTick',[-90:30:90],'FontSize',18,'FontWeight','Bold')
set(gca,'Linewidth',2,'FontSize',18,'FontWeight','Bold')
axis([-90 90 0.05 0.25])
title('f) AOD increase per K of cooling [2050-2069]')
%xlabel('Latitude')
ylabel('AOD/K')

% subplot(4,3,9)
% 
% hold on
% box on
% 
% for ri=1:3
% scatter((2035:2069)+.5,(aod_G(ri,:)-aod_bG(16:50)),50,col(ri,:),...
%     'filled','Markeredgecolor','k')
% tt = aod_G(ri,:)-aod_bG(16:50);
% end
% set(gca,'XTick',[2035:10:2070],'FontSize',18,'FontWeight','Bold')
% set(gca,'Linewidth',2,'FontSize',18,'FontWeight','Bold')
% axis([2035 2070 0. 0.35])
% title('f) Global sOD increase vs time')

vol3 = '/Users/danielevisioni/Documents/GitHub/feedback_suite/';
ens = {'DefaultMA_','Lower-0.5-MA_','Lower-1.0-MA_'};

mem1 = {'001','002','003'};
mem2 = {'001','002','003'};
mem3 = {'001','002','003'};

for e=1:length(ens)
        if e==1, mem=mem1; end
        if e==2, mem=mem2; end
        if e==3, mem=mem3; end
        if e==4, mem=mem4; end
    for i=1:length(mem)
        FA = dlmread([vol3 'Controller_start_' ens{e} mem{i} '.txt'], ' ',1, 0);
        yy = FA(:,1);
        dt0{e,i} = FA(:,2);
        sdt0{e,i} = FA(:,3);
        dt1{e,i} = FA(:,4);
        sdt1{e,i} = FA(:,5);
        dt2{e,i} = FA(:,6);
        sdt2{e,i} = FA(:,7);
        L0{e,i} = FA(:,8);
        L1N{e,i} = FA(:,9);
        L1S{e,i} = FA(:,10);
        L2{e,i} = FA(:,11);
        S30{e,i} = FA(:,12);
        S15{e,i} = FA(:,13);
        N15{e,i} = FA(:,14);
        N30{e,i} = FA(:,15);
        
        sums{e,i}=(N15{e,i}+S15{e,i}+N30{e,i}+S30{e,i});
    end
end

subplot(4,3,12)

hold on
box on

for ri=1:3
scatter((sums{ri,1}(1:35)+sums{ri,2}(1:35)+sums{ri,3}(1:35))/3,aod_G(ri,:)-aod_bG(16:50),50,col(ri,:),...
    'filled','Markeredgecolor','k')
tt = aod_G(ri,:)-aod_bG(16:50);
end

for ri=1:3
    x=(sums{ri,1}(11:35)+sums{ri,2}(11:35)+sums{ri,3}(11:35))/3;
    y=aod_G(ri,11:35)-mean(aod_bG(1:50));
    %xp=x(1:20); yp=y(1:20);
    [P,S] = polyfit(x,y',1);
    
    yfit = P(1)*x+P(2);
    P(1)
    plot(x,yfit,'Color',col2(ri,:),'Linewidth',3,'Linestyle','-');
end
    
set(gca,'XTick',[0:5:35],'FontSize',18,'FontWeight','Bold')
set(gca,'Linewidth',2,'FontSize',18,'FontWeight','Bold')
axis([0 30 0. 0.35])
title('g) Global AOD increase vs injection rates')
xlabel('Tg-SO_2/yr')

set(gcf,'renderer','painters')
print(gcf,'-depsc2',['so4_changes_GAUSS.eps'])