clear all
fc1 = brewermap(4,'Set2');
fc1 = brighten(fc1,.7);
fc2 = brighten(fc1,-.7);
fc3 = brighten(fc1,-.1);
fc4 = brighten(fc2,-.5);
col = [fc2(1,:);fc2(2,:);fc2(3,:)];
col2 = [fc1(1,:);fc1(2,:);fc1(3,:)];
col3 = [fc3(1,:);fc3(2,:);fc3(3,:)];
col4 = [fc4(1,:);fc4(2,:);fc4(3,:)];

vol = '/Volumes/D_Visioni2/CESM2_MA/TSMLT_GAUSS/';

load post_AMOC.mat
dt_DE = 2044.5; mvm = 3;

%%

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

time_SAI=35;
lw = [.1,.1,.1];
ds = [2014.5,2014.5,2014.5];
dt = [2034.5,2044.5,2044.5];

for e=1:3
    for i=1:3
        time_SAI=length(AMOC{e,i});
        plot((1:time_SAI)+2034.5,AMOC{e,i},'Color',col3(e,:),'Linewidth',lw(e));
    end
    p(e+1)=plot((1:35)+2034.5,AMOC_AVG{e},'Color',col(e,:),'Linewidth',4);
end
for i=1:3
    time=length(AMOC_B{i});
    plot((1:time)+ds(i),AMOC_B{i},'Color',[.5 .5 .5],'Linewidth',.1,'Linestyle','-');
end
for i=1:3
    time=length(AMOC_H{i});
    plot((1:time)+1849.5,AMOC_H{i},'Color',[.5 .5 .5],'Linewidth',.1,'Linestyle','-');
end
time=length(AMOC_HAVG);
p(1)=plot((1:time)+1849.5,AMOC_HAVG,'Color','k','Linewidth',4,'Linestyle','-');
time=length(AMOC_BAVG);
p(1)=plot((1:time)+ds(1),AMOC_BAVG,'Color','k','Linewidth',4,'Linestyle','-');
plot([2014.5 2015.5],[AMOC_HAVG(length(AMOC_HAVG)) AMOC_BAVG(1)],'Color','k','Linewidth',4,'Linestyle','-');
plot([1900 2070],[mean(AMOC_BAVG(6:25)) mean(AMOC_BAVG(6:25))],'Color','k','Linewidth',1,'Linestyle','--');

mn_AMOC_1 = [AMOC_HAVG(159:165)' AMOC_BAVG(1:13)']; mn_AMOC_1=mean(mn_AMOC_1);
mn_AMOC_2 = mean(AMOC_HAVG(144:163));


plot([1900 2070],[mn_AMOC_1 mn_AMOC_1],'Color','k','Linewidth',1,'Linestyle','--');
plot([1900 2070],[mn_AMOC_2 mn_AMOC_2],'Color','k','Linewidth',1,'Linestyle','--');
text(2020,mn_AMOC_2+.3,'1993-2012 avg','Fontsize',16)
text(2020,mn_AMOC_2-.3,'(BASE-0.5)','Fontsize',16)
text(2025,mn_AMOC_1+.3,'2008-2027 avg','Fontsize',16)
text(2025,mn_AMOC_1-.3,'(BASE-1.0)','Fontsize',16)
text(1995,mean(AMOC_BAVG(6:25))+.3,'2020-2039 avg','Fontsize',16)
text(1995,mean(AMOC_BAVG(6:25))-.3,'(BASE-1.5)','Fontsize',16)
axis([1990 2070 15 30])
title('a) Atlantic Meridional Overturning Circulation timeseries')
ylabel('Sv')
set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16)
ens_names={'SSP2-4.5','SAI-1.5','SAI-1.0','SAI-0.5'};
hl=legend(p,ens_names,'Location','east');
% hl.Position(1)=hl.Position(1)-.45;
hl.Position(2)=hl.Position(2)+.133;

subplot(2,4,3)
hold on
box on
title('b) AMOC changes compared to 2020-2039')
for i=1:3
    ss = [AMOC{i,1}(16:35)' AMOC{i,2}(16:35)' AMOC{i,3}(16:35)']; st=std(ss',0,1);
    errorbar(i+1,mean(AMOC_AVG{i}(16:35))-mean(AMOC_BAVG(6:25)),st,'Color',col(i,:),'Linewidth',2)
    scatter(i+1, mean(AMOC_AVG{i}(16:35))-mean(AMOC_BAVG(6:25)),250,'filled','MarkerFaceColor',col(i,:))
end
errorbar(1,mean(AMOC_BAVG(36:55))-mean(AMOC_BAVG(6:25)),std(AMOC_BAVG(36:55),0,1),'Color','k','Linewidth',2)
scatter(1, mean(AMOC_BAVG(36:55))-mean(AMOC_BAVG(6:25)),250,'filled','MarkerFaceColor','k')
plot([0 6],[0 0],'Color','k','Linewidth',1,'Linestyle','-');
set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16,'xtick',1:4)
xticklabels(ens_names)
xtickangle(25)
axis([.5 4.5 -5.5 1])
ylabel('\DeltaSv')
mn = flip([mean(AMOC_BAVG(6:25)) mn_AMOC_1 mn_AMOC_2]);

subplot(2,4,7)
hold on
box on
title('c) AMOC changes compared to period with same T_s')
for i=1:3
    ss = [AMOC{i,1}(16:35)' AMOC{i,2}(16:35)' AMOC{i,3}(16:35)']; st=std(ss',0,1);
    errorbar(i+1,mean(AMOC_AVG{i}(16:35))-mn(4-i),st,'Color',col(i,:),'Linewidth',2)
    scatter(i+1, mean(AMOC_AVG{i}(16:35))-mn(4-i),250,'filled','MarkerFaceColor',col(i,:))
end
% errorbar(4,mean(AMOC_BAVG(36:55))-mean(AMOC_BAVG(6:25)),std(AMOC_BAVG(36:55),0,1),'Color','k','Linewidth',2)
% scatter(4, mean(AMOC_BAVG(36:55))-mean(AMOC_BAVG(6:25)),250,'filled','MarkerFaceColor','k')
plot([0 6],[0 0],'Color','k','Linewidth',1,'Linestyle','-');
set(gca,'Linewidth',2,'FontWeight','bold','Fontsize',16,'xtick',2:4)
labelArray={'SAI-1.5 -\newlineBASE-1.5','SAI-1.0 -\newlineBASE-1.0','SAI-0.5 -\newlineBASE-0.5'};
xticklabels(labelArray)
%xtickangle(25)
axis([1.5 4.5 -6.5 0])
ylabel('\DeltaSv')

set(gcf,'renderer','painters')
print(gcf,'-depsc2',['AMOC_plot.eps'])