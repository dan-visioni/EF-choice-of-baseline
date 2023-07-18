clear all

hist_WC = squeeze(ncread('out_WC_index_intensity_fromSLP_yearly_HIST_timeseries.nc','hist'));
ssp_WC = squeeze(ncread('out_WC_index_intensity_fromSLP_SSP2_yearly_timeseries.nc','ssp'));

SAI_15_WC = squeeze(ncread('out_WC_index_intensity_fromSLP_Ttargets_yearly_timeseries.nc','gauss1'));

SAI_10_WC = squeeze(ncread('out_WC_index_intensity_fromSLP_Ttargets_yearly_timeseries.nc','gauss2'));

SAI_05_WC = squeeze(ncread('out_WC_index_intensity_fromSLP_Ttargets_yearly_timeseries.nc','gauss3'));


histWC1 = squeeze(ncread('out_WC_index_intensity_fromSLP_Ttargets_yearly_BASEs.nc','cont1_clim'));
histWC1sd = squeeze(ncread('out_WC_index_intensity_fromSLP_Ttargets_yearly_BASEs.nc','cont1_sd'));
histWC2 = squeeze(ncread('out_WC_index_intensity_fromSLP_Ttargets_yearly_BASEs.nc','cont2_clim'));
histWC2sd = squeeze(ncread('out_WC_index_intensity_fromSLP_Ttargets_yearly_BASEs.nc','cont2_sd'));
histWC3 = squeeze(ncread('out_WC_index_intensity_fromSLP_Ttargets_yearly_BASEs.nc','cont3_clim'));
histWC3sd = squeeze(ncread('out_WC_index_intensity_fromSLP_Ttargets_yearly_BASEs.nc','cont3_sd'));
sspWC = squeeze(ncread('out_WC_index_intensity_fromSLP_Ttargets_yearly.nc','ssp_clim'));
sspWCsd = squeeze(ncread('out_WC_index_intensity_fromSLP_Ttargets_yearly.nc','ssp_sd'));
WC15 = squeeze(ncread('out_WC_index_intensity_fromSLP_Ttargets_yearly.nc','gauss1_clim'));
WC10 = squeeze(ncread('out_WC_index_intensity_fromSLP_Ttargets_yearly.nc','gauss2_clim'));
WC05 = squeeze(ncread('out_WC_index_intensity_fromSLP_Ttargets_yearly.nc','gauss3_clim'));
WC15sd = squeeze(ncread('out_WC_index_intensity_fromSLP_Ttargets_yearly.nc','gauss1_sd'));
WC10sd = squeeze(ncread('out_WC_index_intensity_fromSLP_Ttargets_yearly.nc','gauss2_sd'));
WC05sd = squeeze(ncread('out_WC_index_intensity_fromSLP_Ttargets_yearly.nc','gauss3_sd'));

figure(1)
set(gcf, 'Position',  [200, 200,1600,600])

subplot(1,2,1)

hold on
box on

fc1 = brewermap(4,'Set2');
fc1 = brighten(fc1,.7);
fc2 = brighten(fc1,-.7);
fc3 = brighten(fc1,-.35);
fc4 = brighten(fc1,-.85);
col = [fc2(1,:);fc2(2,:);fc2(3,:)];
col2 = [fc1(1,:);fc1(2,:);fc1(3,:)];
col3 = [fc3(1,:);fc3(2,:);fc3(3,:)];
colo = [fc4(1,:);fc3(2,:);fc3(3,:)];
mvm =5;
for i=1:3
    time=length(hist_WC);
    plot((1:time)+1849.5,movmean(hist_WC(:,i),mvm),'Color',[.5 .5 .5],'Linewidth',.1,'Linestyle','-');
    time=length(ssp_WC);
    plot((1:time)+2014.5,movmean(ssp_WC(:,i),mvm),'Color',[.5 .5 .5],'Linewidth',.1,'Linestyle','-');
    time=length(SAI_15_WC);
    plot((1:time)+2034.5,movmean(SAI_15_WC(:,i),mvm),'Color',col3(1,:),'Linewidth',.1,'Linestyle','-');
    plot((1:time)+2034.5,movmean(SAI_10_WC(:,i),mvm),'Color',col3(2,:),'Linewidth',.1,'Linestyle','-');
    plot((1:time)+2034.5,movmean(SAI_05_WC(:,i),mvm),'Color',col3(3,:),'Linewidth',.1,'Linestyle','-');    
end

plot([1900 2070],[histWC3 histWC3],'Color','k','Linewidth',1,'Linestyle','--');
plot([1900 2070],[histWC2 histWC2],'Color','k','Linewidth',1,'Linestyle','--');
plot([1900 2070],[histWC1 histWC1],'Color','k','Linewidth',1,'Linestyle','--');
text(2025,histWC3+6,'1993-2012 avg','Fontsize',16)
text(2025,histWC3-6,'(BASE-0.5)','Fontsize',16)
text(2035,histWC2+6,'2008-2027 avg','Fontsize',16)
text(2035,histWC2-6,'(BASE-1.0)','Fontsize',16)
text(1995,histWC1+6,'2020-2039 avg','Fontsize',16)
text(1995,histWC1-6,'(BASE-1.5)','Fontsize',16)

time=length(hist_WC);a=movmean(mean(hist_WC,2),mvm);
p(1)=plot((1:time)+1849.5,movmean(mean(hist_WC,2),mvm),'Color',[0 0 0],'Linewidth',2,'Linestyle','-');
time=length(ssp_WC);
plot((1:time)+2014.5,movmean(mean(ssp_WC,2),mvm),'Color',[0 0 0],'Linewidth',2,'Linestyle','-');
time=length(SAI_15_WC);b=movmean(mean(ssp_WC,2),mvm);
plot([2014.5 2015.5],[a(165) b(1)],'Color',[0 0 0],'Linewidth',2,'Linestyle','-');
p(2)=plot((1:time)+2034.5,movmean(mean(SAI_15_WC,2),mvm),'Color',col(1,:),'Linewidth',2,'Linestyle','-');
p(3)=plot((1:time)+2034.5,movmean(mean(SAI_10_WC,2),mvm),'Color',col(2,:),'Linewidth',2,'Linestyle','-');
p(4)=plot((1:time)+2034.5,movmean(mean(SAI_05_WC,2),mvm),'Color',col(3,:),'Linewidth',2,'Linestyle','-');
ens_names={'SSP2-4.5','SAI-1.5','SAI-1.0','SAI-0.5'};
hl=legend(p,ens_names,'Location','east');
% hl.Position(1)=hl.Position(1)-.45;
hl.Position(2)=hl.Position(2)+.133;
set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)
axis([1990 2070 0 300])
ylabel('Pa')
xlabel('Year')
title('a) Annual mean Walker Cell intensity')


subplot(2,4,3)
hold on
box on
title({'b) WC changes compared';'to 2020-2039'})
sqrt((WC15sd^2/60)+(histWC1sd^2/60))
errorbar(2,WC15-histWC1,sqrt((WC15sd^2/60)+(histWC1sd^2/60)),'Color',col(1,:),'Linewidth',2)
scatter(2,WC15-histWC1,250,'filled','MarkerFaceColor',col(1,:))
errorbar(3,WC10-histWC1,sqrt((WC10sd^2/60)+(histWC1sd^2/60)),'Color',col(2,:),'Linewidth',2)
scatter(3,WC10-histWC1,250,'filled','MarkerFaceColor',col(2,:))
errorbar(4,WC05-histWC1,sqrt((WC05sd^2/60)+(histWC1sd^2/60)),'Color',col(3,:),'Linewidth',2)
scatter(4,WC05-histWC1,250,'filled','MarkerFaceColor',col(3,:))

errorbar(1,sspWC-histWC1,sqrt((sspWCsd^2/60)+(histWC1sd^2/60)),'Color','k','Linewidth',2)
scatter(1,sspWC-histWC1,250,'filled','MarkerFaceColor','k')
plot([0 6],[0 0],'Color','k','Linewidth',1,'Linestyle','-');
set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16,'xtick',1:4)
xticklabels(ens_names)
xtickangle(25)
axis([.5 4.5 -100 000])
ylabel('Pa')

hs=subplot(2,4,7);
hold on
box on
title({'d) WC changes compared';'to period with same T_s'})

errorbar(2,WC15-histWC1,sqrt((WC15sd^2/60)+(histWC1sd^2/60)),'Color',col(1,:),'Linewidth',2)
scatter(2,WC15-histWC1,250,'filled','MarkerFaceColor',col(1,:))
errorbar(3,WC10-histWC2,sqrt((WC10sd^2/60)+(histWC2sd^2/60)),'Color',col(2,:),'Linewidth',2)
scatter(3,WC10-histWC2,250,'filled','MarkerFaceColor',col(2,:))
errorbar(4,WC05-histWC3,sqrt((WC05sd^2/60)+(histWC3sd^2/60)),'Color',col(3,:),'Linewidth',2)
scatter(4,WC05-histWC3,250,'filled','MarkerFaceColor',col(3,:))

errorbar(1,sspWC-histWC1,sqrt((sspWCsd^2/60)+(histWC1sd^2/60)),'Color','k','Linewidth',2)
scatter(1,sspWC-histWC1,250,'filled','MarkerFaceColor','k')
plot([0 6],[0 0],'Color','k','Linewidth',1,'Linestyle','-');
set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16,'xtick',1:4)
labelArray={'SSP2-4.5 -\newlineBASE-1.5','SAI-1.5 -\newlineBASE-1.5','SAI-1.0 -\newlineBASE-1.0','SAI-0.5 -\newlineBASE-0.5'};
xticklabels(labelArray)
ax=gca;
ax.XAxis.FontSize = 12;
axis([.5 4.5 -150 000])
ylabel('Pa')
hs.Position(2)=hs.Position(2)-.022 ;

histWC1 = squeeze(ncread('out_latWC_PSI0_Ttargets_yearly_BASEs.nc','cont1_clim'));
histWC1sd = squeeze(ncread('out_latWC_PSI0_Ttargets_yearly_BASEs.nc','cont1_sd'));
histWC2 = squeeze(ncread('out_latWC_PSI0_Ttargets_yearly_BASEs.nc','cont2_clim'));
histWC2sd = squeeze(ncread('out_latWC_PSI0_Ttargets_yearly_BASEs.nc','cont2_sd'));
histWC3 = squeeze(ncread('out_latWC_PSI0_Ttargets_yearly_BASEs.nc','cont3_clim'));
histWC3sd = squeeze(ncread('out_latWC_PSI0_Ttargets_yearly_BASEs.nc','cont3_sd'));
sspWC = squeeze(ncread('out_latWC_PSI0_Ttargets_yearly.nc','ssp_clim'));
sspWCsd = squeeze(ncread('out_latWC_PSI0_Ttargets_yearly.nc','ssp_sd'));
WC15 = squeeze(ncread('out_latWC_PSI0_Ttargets_yearly.nc','gauss1_clim'));
WC10 = squeeze(ncread('out_latWC_PSI0_Ttargets_yearly.nc','gauss2_clim'));
WC05 = squeeze(ncread('out_latWC_PSI0_Ttargets_yearly.nc','gauss3_clim'));
WC15sd = squeeze(ncread('out_latWC_PSI0_Ttargets_yearly.nc','gauss1_sd'));
WC10sd = squeeze(ncread('out_latWC_PSI0_Ttargets_yearly.nc','gauss2_sd'));
WC05sd = squeeze(ncread('out_latWC_PSI0_Ttargets_yearly.nc','gauss3_sd'));

subplot(2,4,4)
hold on
box on
title({'c) WC location shift';'compared to 2020-2039'})

errorbar(2,WC15-histWC1,sqrt((WC15sd^2/60)+(histWC1sd^2/60)),'Color',col(1,:),'Linewidth',2)
scatter(2,WC15-histWC1,250,'filled','MarkerFaceColor',col(1,:))
errorbar(3,WC10-histWC1,sqrt((WC10sd^2/60)+(histWC1sd^2/60)),'Color',col(2,:),'Linewidth',2)
scatter(3,WC10-histWC1,250,'filled','MarkerFaceColor',col(2,:))
errorbar(4,WC05-histWC1,sqrt((WC05sd^2/60)+(histWC1sd^2/60)),'Color',col(3,:),'Linewidth',2)
scatter(4,WC05-histWC1,250,'filled','MarkerFaceColor',col(3,:))

errorbar(1,sspWC-histWC1,sqrt((sspWCsd^2/60)+(histWC1sd^2/60)),'Color','k','Linewidth',2)
scatter(1,sspWC-histWC1,250,'filled','MarkerFaceColor','k')
plot([0 6],[0 0],'Color','k','Linewidth',1,'Linestyle','-');
set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16,'xtick',1:4)
xticklabels(ens_names)
xtickangle(25)
axis([.5 4.5 -1 10])
ylabel('degrees East')

hs=subplot(2,4,8);
hold on
box on
title({'e) WC location shift compared to';'period with same T_s'})

errorbar(2,WC15-histWC1,sqrt((WC15sd^2/60)+(histWC1sd^2/60)),'Color',col(1,:),'Linewidth',2)
scatter(2,WC15-histWC1,250,'filled','MarkerFaceColor',col(1,:))
errorbar(3,WC10-histWC2,sqrt((WC10sd^2/60)+(histWC2sd^2/60)),'Color',col(2,:),'Linewidth',2)
scatter(3,WC10-histWC2,250,'filled','MarkerFaceColor',col(2,:))
errorbar(4,WC05-histWC3,sqrt((WC05sd^2/60)+(histWC3sd^2/60)),'Color',col(3,:),'Linewidth',2)
scatter(4,WC05-histWC3,250,'filled','MarkerFaceColor',col(3,:))

errorbar(1,sspWC-histWC1,sqrt((sspWCsd^2/60)+(histWC1sd^2/60)),'Color','k','Linewidth',2)
scatter(1,sspWC-histWC1,250,'filled','MarkerFaceColor','k')
plot([0 6],[0 0],'Color','k','Linewidth',1,'Linestyle','-');
set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16,'xtick',1:4)
labelArray={'SSP2-4.5 -\newlineBASE-1.5','SAI-1.5 -\newlineBASE-1.5','SAI-1.0 -\newlineBASE-1.0','SAI-0.5 -\newlineBASE-0.5'};
xticklabels(labelArray)
ax=gca;
ax.XAxis.FontSize = 12;
axis([.5 4.5 -1 15])
ylabel('degrees East')
hs.Position(2)=hs.Position(2)-.022;

set(gcf,'renderer','painters')
print(gcf,'-depsc2',['WC.eps'])