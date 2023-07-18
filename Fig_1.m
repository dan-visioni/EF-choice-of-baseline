clear all
vol3 = '/Users/danielevisioni/Documents/GitHub/feedback_suite/';
ens = {'DefaultMA','Lower-0.5-MA','Lower-1.0-MA'};
es = {'001','002','003'};
ensn = {'MA-Default','MA-Lower-0.5','MA-Lower-1.0'};
ensn2 = {'MA-Default','MA-Lower-0.5','MA-Lower-1.0'};
ensN = {'SAI-1.5','SAI-1.0','SAI-0.5'};
for e=1:length(ens)
    for i=1:3
    FA = dlmread([vol3 'Controller_start_' ens{e} '_' es{i} '.txt'], ' ',1, 0);
    yy = FA(:,1);
    dt0i{e,i} = FA(1:36,2);
    sdt0i{e,i} = FA(1:36,3);
    dt1i{e,i} = FA(1:36,4);
    sdt1i{e,i} = FA(1:36,5);
    dt2i{e,i} = FA(1:36,6);
    sdt2i{e,i} = FA(1:36,7);
    L0i{e,i} = FA(1:36,8);
    L1Ni{e,i} = FA(1:36,9);
    L1Si{e,i} = FA(1:36,10);
    L2i{e,i} = FA(1:36,11);
    S30i{e,i} = FA(1:36,12);
    S15i{e,i} = FA(1:36,13);
    N15i{e,i} = FA(1:36,14);
    N30i{e,i} = FA(1:36,15);
    end   
end
for e=1:length(ens)
    dt0{e} = (dt0i{e,1}+dt0i{e,2}+dt0i{e,3})/3;
    sdt0{e} = (sdt0i{e,1}+sdt0i{e,2}+sdt0i{e,3})/3;
    dt1{e} = (dt1i{e,1}+dt1i{e,2}+dt1i{e,3})/3;
    sdt1{e} = (sdt1i{e,1}+sdt1i{e,2}+sdt1i{e,3})/3;
    dt2{e} = (dt2i{e,1}+dt2i{e,2}+dt2i{e,3})/3;
    sdt2{e} = (sdt2i{e,1}+sdt2i{e,2}+sdt2i{e,3})/3;
    L0{e} = (L0i{e,1}+L0i{e,2}+L0i{e,3})/3;
    L1N{e} = (L1Ni{e,1}+L1Ni{e,2}+L1Ni{e,3})/3;
    L1S{e} = (L1Si{e,1}+L1Si{e,2}+L1Si{e,3})/3;
    L2{e} = (L2i{e,1}+L2i{e,2}+L2i{e,3})/3;
    S30{e} = (S30i{e,1}+S30i{e,2}+S30i{e,3})/3;
    S15{e} = (S15i{e,1}+S15i{e,2}+S15i{e,3})/3;
    N15{e} = (N15i{e,1}+N15i{e,2}+N15i{e,3})/3;
    N30{e} = (N30i{e,1}+N30i{e,2}+N30i{e,3})/3;
end
vol = '/Volumes/D_Visioni2/CESM2_MA/TSMLT_GAUSS/';
var = 'AODVISstdn';
ee = {'001','002','003'};

for i=1:3
nam = ['_b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-DEFAULT.' ee{i} '_zm_monthly.nc'];
AOD_MA15{i} = ncread([vol var nam],var);
end

AOD_MA{1}=squeeze(mean(reshape((AOD_MA15{1}+AOD_MA15{2}+AOD_MA15{3})/3,192,12,size(AOD_MA15{1},2)/12),2));

lat = ncread([vol var nam],'lat');
ww = cos(lat/180*pi);

for i=1:3
nam = ['_b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-LOWER-0.5.' ee{i} '_zm_monthly.nc'];
AOD_MA10{i} = ncread([vol var nam],var);
end

AOD_MA{2}=squeeze(mean(reshape((AOD_MA10{1}+AOD_MA10{2}+AOD_MA10{3})/3,192,12,size(AOD_MA10{1},2)/12),2));

for i=1:3
nam = ['_b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-LOWER-1.0.' ee{i} '_zm_monthly.nc'];
AOD_MA05{i} = ncread([vol var nam],var);
end

AOD_MA{3}=squeeze(mean(reshape((AOD_MA05{1}(:,1:420)+AOD_MA05{2}(:,1:420)+AOD_MA05{3}(:,1:420))/3,192,12,size(AOD_MA05{1},2)/12),2));


l0 = ones(length(lat),1);
l1 = sind(lat);
l2 = (1.5*l1.^2-.5);

for e=1:3
    L0_true{e} = squeeze(sum(AOD_MA{e}.*ww.*l0)/sum(ww));
    L1_true{e} = squeeze(sum(AOD_MA{e}.*ww.*l1)/sum(ww.*l1.^2));
    L2_true{e} = squeeze(sum(AOD_MA{e}.*ww.*l2)/sum(ww.*l2.^2));
end

%%

for e=1:3
    AOD_MA15i{e} = squeeze(mean(reshape(AOD_MA15{e}(:,1:420),192,12,size(AOD_MA15{1},2)/12),2));
    AOD_MA10i{e} = squeeze(mean(reshape(AOD_MA10{e}(:,1:420),192,12,size(AOD_MA10{1},2)/12),2));
    AOD_MA05i{e} = squeeze(mean(reshape(AOD_MA05{e}(:,1:420),192,12,size(AOD_MA05{1},2)/12),2));
    L0i_true{1,e} = squeeze(sum(AOD_MA15i{e}(:,1:35).*ww.*l0)/sum(ww));
    L1i_true{1,e} = squeeze(sum(AOD_MA15i{e}(:,1:35).*ww.*l1)/sum(ww.*l1.^2));
    L2i_true{1,e} = squeeze(sum(AOD_MA15i{e}(:,1:35).*ww.*l2)/sum(ww.*l2.^2));
    L0i_true{2,e} = squeeze(sum(AOD_MA10i{e}(:,1:35).*ww.*l0)/sum(ww));
    L1i_true{2,e} = squeeze(sum(AOD_MA10i{e}(:,1:35).*ww.*l1)/sum(ww.*l1.^2));
    L2i_true{2,e} = squeeze(sum(AOD_MA10i{e}(:,1:35).*ww.*l2)/sum(ww.*l2.^2));
    L0i_true{3,e} = squeeze(sum(AOD_MA05i{e}(:,1:35).*ww.*l0)/sum(ww));
    L1i_true{3,e} = squeeze(sum(AOD_MA05i{e}(:,1:35).*ww.*l1)/sum(ww.*l1.^2));
    L2i_true{3,e} = squeeze(sum(AOD_MA05i{e}(:,1:35).*ww.*l2)/sum(ww.*l2.^2));
end
%%

vol = '/Volumes/D_Visioni2/CESM2_MA/TSMLT_GAUSS/';
var = 'TREFHT';

nam = ['_b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.001_zm_monthly.nc'];
AOD = ncread([vol var nam],var);
T_B=squeeze(mean(reshape(AOD,192,12,size(AOD,2)/12),2));

nam = ['_b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-DEFAULT.001_zm_monthly.nc'];
AOD = ncread([vol var nam],var);
T_MA{1}=squeeze(mean(reshape(AOD,192,12,size(AOD,2)/12),2));

lat = ncread([vol var nam],'lat');
ww = cos(lat/180*pi);

nam = ['_b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-LOWER-0.5.001_zm_monthly.nc'];
AOD = ncread([vol var nam],var);
T_MA{2}=squeeze(mean(reshape(AOD,192,12,size(AOD,2)/12),2));

nam = ['_b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.SSP245-MA-GAUSS-LOWER-1.0.001_zm_monthly.nc'];
AOD = ncread([vol var nam],var);
T_MA{3}=squeeze(mean(reshape(AOD,192,12,size(AOD,2)/12),2));

nam = ['_b.e21.BWSSP245.f09_g17.release-cesm2.1.3.WACCM-MA-1deg.feedback_60N.002_zm_monthly.nc'];
AOD = ncread([vol var nam],var);
T_MA{4}=squeeze(mean(reshape(AOD,192,12,size(AOD,2)/12),2));


%%
figure(1)
l_colb = 37;

set(gcf, 'Position',  [200, 200, 1800,1200])

subplot(2,3,[2 3])
fc1 = brewermap(l_colb,'Spectral');
colormap(gca,fc1)
box on
hold on
ex = [-2 0 2];
for e=1:length(ens)
    time=length(dt0{e});
    sums{e}=(N15{e}+S15{e}+N30{e}+S30{e});
    for i=1:(time)
        norm=sums{e}(i);
        scatter(0+ex(e),N15{e}(i)/norm,150,'filled','MarkerFaceColor',fc1(i,:),'MarkerEdgeColor','none')
        scatter(-15+ex(e),S15{e}(i)/norm,150,'filled','MarkerFaceColor',fc1(i,:),'MarkerEdgeColor','none')
        scatter(15+ex(e),N30{e}(i)/norm,150,'filled','MarkerFaceColor',fc1(i,:),'MarkerEdgeColor','none')
        scatter(-30+ex(e),S30{e}(i)/norm,150,'filled','MarkerFaceColor',fc1(i,:),'MarkerEdgeColor','none')
    end
    axis([-35 20 0 .75])
    caxis([1 37])
    set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)
    set(gca,'XTick',[-30:15:15],'XTickLabel',{'30S','15S','15N','30N','All amount'})
    hc = colorbar('Linewidth',2,'Location','eastoutside','YTick',1.5:5:(time)+1.5,...
        'YTickLabel',2035:5:(2035+time+1));
    hc.Position(1) = hc.Position(1)+.012;
    title('b) Fraction of SO_2/yr injected at four locations (amount normalized to total injection rate)')
    ylabel('Fraction per location')
    text(-30+ex(e)-.5,.62+e*0.025,ensN{e},'FontWeight','bold','Fontsize',12)
    plot([-30+ex(e) -30+ex(e)],[max(S30{e})/norm+.05 .6],':k')
end

subplot(2,3,1)

hold on
box on

fc1 = brewermap(3,'Pastel2');
fc2 = brighten(fc1,-.7);
col = [fc2(1,:);fc2(2,:);fc2(3,:)];
lw = [2,2,2];
sumstd=0;
for e=1:length(ens)
    time=length(dt0{e});
    sums{e}=(N15{e}+S15{e}+N30{e}+S30{e});
    p(e)=plot((1:time)+2034,sums{e},'Color',col(e,:),'Linewidth',lw(e));
    for i=1:3
        sumsi=(N15i{e,i}+S15i{e,i}+N30i{e,i}+S30i{e,i});
        plot((1:time)+2034,sumsi,'Color',col(e,:),'Linewidth',.1);
    end
end
legend(p(1:3),ensN,'Location','best')
set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)
ylabel('Tg-SO2/yr')
title('a) Total Amount of SO_2 injected per year')
axis([2035 2070 0 Inf])

subplot(4,3,7)

hold on
box on
q(1)=plot([2035 2070],[0 0],'k');
q(2)=plot([2035 2070],[0 0],':k');
for e=1:length(ens)
    time=length(L0_true{e});
    plot((1:time)+2034,L0_true{e},'Color',col(e,:),'Linewidth',lw(e))
    for i=1:3
       plot((1:time)+2034,L0i_true{e,i},'Color',col(e,:),'Linewidth',.1)
    end
end
title({'c) Global mean AOD (L0)'})
set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)
axis([2035 2070 -Inf Inf])

subplot(4,3,8)
hold on
box on
plot([2035 2070],[0 0],'k')
for e=1:length(ens)
    time=length(L1_true{e});
    plot((1:time)+2034,L1_true{e},'Color',col(e,:),'Linewidth',lw(e))
    for i=1:3
       plot((1:time)+2034,L1i_true{e,i},'Color',col(e,:),'Linewidth',.1)
    end
end
axis([2035 2070 -Inf Inf])
title({'d) Inter-hemispheric AOD projection (L1)'})

set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)

subplot(4,3,9)
hold on
box on
plot([2035 2070],[0 0],'k')
for e=1:length(ens)
    time=length(L1_true{e});
    plot((1:time)+2034,L2_true{e},'Color',col(e,:),'Linewidth',lw(e))
    for i=1:3
       plot((1:time)+2034,L2i_true{e,i},'Color',col(e,:),'Linewidth',.1)
    end
end
axis([2035 2070 -Inf Inf])
title({'e) Equator-to-pole AOD projection (L2)'})
set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)

for e=1:4
    T0_true{e} = squeeze(sum(T_MA{e}.*ww.*l0)/sum(ww));
    T1_true{e} = squeeze(sum(T_MA{e}.*ww.*l1)/sum(ww.*l1.^2));
    T2_true{e} = squeeze(sum(T_MA{e}.*ww.*l2)/sum(ww.*l2.^2));
end

    T0_trueB = squeeze(sum(T_B.*ww.*l0)/sum(ww));
    T1_trueB = squeeze(sum(T_B.*ww.*l1)/sum(ww.*l1.^2));
    T2_trueB = squeeze(sum(T_B.*ww.*l2)/sum(ww.*l2.^2));

T0B_true = squeeze(sum(T_B.*ww.*l0)/sum(ww));

subplot(4,3,10)

targs = [288.51,288.01,287.5];
PI=13.85;
hold on
box on
plot([2035 2070],[0 0],'k')
for e=1:3
    time=length(L0_true{e});
    p(e)=plot((1:time)+2034.5,T0_true{e}-273.15-PI,'Color',col(e,:),'Linewidth',lw(e));
    plot((1:time)+2034.5,zeros(length(1:time))+targs(e)-273.15-PI,'Color',col(e,:),'Linewidth',lw(e),'Linestyle',':')
end
time=length(T0B_true);
p(4)=plot((1:time)+2014.5,T0B_true-273.15-PI,'Color','k','Linewidth',lw(e));
ensn = {'SAI-1.5','SAI-1.0','SAI-0.5','SSP2-4.5'};
hl=legend(p(4),ensn{4},'Location','northwestoutside');
hl.Position(1)=hl.Position(1)+0.03;
hl.Position(2)=hl.Position(2)-0.04;
axis([2035 2070 287.3-273.15-PI Inf])
title('f) Global mean temperatures above PI')
ylabel('K')
set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)

% set(gcf,'renderer','painters')
% print(gcf,'-depsc2',['tsurf_MA.eps'])


clear p
% subplot(4,3,11)
% targs = [288.51,288.01,287.51];
% hold on
% box on
% plot([2035 2070],[0 0],'k')
% for e=1:length(ens)
%     time=length(L0_true{e});
%     p(e)=plot((1:time)+2034,T0_true{e}-T0B_true(21:20+time),'Color',col(e,:),'Linewidth',lw(e));
%     %plot((1:time)+2034,zeros(length(1:time))+targs(e),'Color',col(e,:),'Linewidth',lw(e),'Linestyle',':')
% end
% 
% axis([2035 2070 -Inf Inf])
% title('g) Global mean temperatures compared to SSP2-4.5')
% set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)

subplot(4,3,11)
hold on
box on
plot([2035 2070],[0 0],'k')
for e=1:length(ens)
    time=length(L0_true{e});
    p(e)=plot((1:time)+2034,abs(movmean(T0_true{e}-T0B_true(21:20+time),5)./sums{e}(1:35)'),'Color',col(e,:),'Linewidth',lw(e));
    %plot((1:time)+2034,zeros(length(1:time))+targs(e),'Color',col(e,:),'Linewidth',lw(e),'Linestyle',':')
end

axis([2035 2070 0 Inf])
title('g) Cooling achieved per Tg-SO_2')
set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)
ylabel('K/Tg-SO_2')

subplot(4,3,12)
hold on
box on
plot([2035 2070],[0 0],'k')
for e=1:length(ens)
    time=length(L0_true{e});
    p(e)=plot((1:time)+2034,abs(movmean(T0_true{e}-T0B_true(21:20+time),5)./L0_true{e}),'Color',col(e,:),'Linewidth',lw(e));
    %plot((1:time)+2034,zeros(length(1:time))+targs(e),'Color',col(e,:),'Linewidth',lw(e),'Linestyle',':')
end



axis([2035 2070 0 Inf])
title('h) Cooling achieved per unit of AOD')
set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)
ylabel('K/AOD')

set(gcf,'renderer','painters')
print(gcf,'-depsc2',['log_allruns_MA.eps'])

%%

figure(2)

set(gcf, 'Position',  [200, 200, 1800,1200])

subplot(4,3,7)
hold on
box on
q(1)=plot([2035 2070],[0 0],'k');
q(2)=plot([2035 2070],[0 0],':k');
for e=1:length(ens)
    time=length(dt0{e});
    plot((1:time)+2034,L0{e},'Color',col(e,:),'Linewidth',lw(e),'Linestyle',':')
    for i=1:3
       plot((1:time)+2034,L0i{e},'Color',col(e,:),'Linewidth',.1,'Linestyle',':')
    end
end
for e=1:length(ens)
    time=length(L0_true{e});
    plot((1:time)+2034,L0_true{e},'Color',col(e,:),'Linewidth',lw(e))
end
legend(q(1:2),{'Actual AOD value','Required by controller'},'Location','best')
title({'a) Global mean AOD (L0):';'expected by controller vs actual'})
set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)
axis([2035 2070 -Inf Inf])

subplot(4,3,8)
hold on
box on
plot([2035 2070],[0 0],'k')
for e=1:length(ens)
    time=length(dt0{e});
    plot((1:time)+2034,L1N{e}-L1S{e},'Color',col(e,:),'Linewidth',lw(e),'Linestyle',':')
end
for e=1:length(ens)
    time=length(L1_true{e});
    plot((1:time)+2034,L1_true{e},'Color',col(e,:),'Linewidth',lw(e))
end
axis([2035 2070 -Inf Inf])
title({'b) Inter-hemispheric AOD projection (L1):';'expected by controller vs actual'})

set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)

subplot(4,3,9)
hold on
box on
plot([2035 2070],[0 0],'k')
for e=1:length(ens)
    time=length(dt0{e});
    plot((1:time)+2034,L2{e},'Color',col(e,:),'Linewidth',lw(e),'Linestyle',':')
end
for e=1:length(ens)
    time=length(L1_true{e});
    plot((1:time)+2034,L2_true{e},'Color',col(e,:),'Linewidth',lw(e))
end
axis([2035 2070 -Inf Inf])
title({'c) Equator-to-pole AOD projection (L2):';'expected by controller vs actual'})
set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)

set(gcf,'renderer','painters')
print(gcf,'-depsc2',['log_vs_actual_AOD.eps'])