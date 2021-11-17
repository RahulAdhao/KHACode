clc
clear all
close all;

% for KDD 
kdd_cla = [0.992	0.9985	0.999	0.9995	0.9996
0.881	0.8885	0.895333333	0.89025	0.8806
0.827	0.8025	0.836666667	0.846	0.8428
0.84	0.855	0.869666667	0.85875	0.8534];

kdd_cla = kdd_cla'*100;
h1 = figure;
plot(kdd_cla(:,1),'-r*','LineWidth',3); hold on
plot(kdd_cla(:,2),'-g*','LineWidth',3); hold on
plot(kdd_cla(:,3),'-m*','LineWidth',3.2); hold on
plot(kdd_cla(:,4),'-b*','LineWidth',3); hold on
xlim([0 6])
set(gca,'XTickLabel', {' ' , '1000' , '2000', '3000' , '4000' , '5000' , ' '})
ylim([64 130])
grid on
legend('Proposed' , 'Exist-SVM' , 'Exist-NB' , 'Exist-RF')
xlabel('size of input data')
ylabel('Accuracy')

kdd_opt = [0.992	0.9985	0.999	0.9995	0.9996
0.875	0.835	0.852333333	0.84525	0.855
0.788	0.7765	0.769	0.7535	0.7606];

kdd_opt = kdd_opt'*100;
figure;
plot(kdd_opt(:,1),'-r*','LineWidth',3); hold on
plot(kdd_opt(:,2),'-g*','LineWidth',3); hold on
plot(kdd_opt(:,3),'-b*','LineWidth',3.2); hold on
xlim([0 6])
set(gca,'XTickLabel', {' ' , '1000' , '2000', '3000' , '4000' , '5000' , ' '})
ylim([64 130])
grid on
legend('Proposed' , 'Exist-PSO' , 'Exist-GA')
xlabel('size of input data')
ylabel('Accuracy')

xkdd = [0	0	0	0
0.004424779	0.046460177	0.171681416	0.019911504
1	1	1	1];

ykdd = [0	0	0	0
0.989051095	0.821167883	0.890875912	0.724452555
1	1	1	1];
figure;plot(xkdd(:,1),ykdd(:,1),'r','LineWidth',2); hold on
plot(xkdd(:,2),ykdd(:,2),'g','LineWidth',2); hold on
plot(xkdd(:,3),ykdd(:,3),'y','LineWidth',2); hold on
plot(xkdd(:,4),ykdd(:,4),'b','LineWidth',2); hold on
grid on
xlabel('False Positive Rate')
ylabel('True Positive Rate')
legend('Proposed' , 'Exist-SVM' , 'Exist-NB' , 'Exist-RF')

%% for CIC
cic_cla = [0.995	0.988	0.985	0.9855	0.987
0.872	0.8605	0.862	0.87075	0.877
0.825	0.8435	0.851666667	0.85275	0.8536
0.86	0.8715	0.874666667	0.855	0.859];

cic_cla = cic_cla'*100;
figure;
plot(cic_cla(:,1),'-r*','LineWidth',3); hold on
plot(cic_cla(:,2),'-g*','LineWidth',3); hold on
plot(cic_cla(:,3),'-m*','LineWidth',3.2); hold on
plot(cic_cla(:,4),'-b*','LineWidth',3); hold on
xlim([0 6])
set(gca,'XTickLabel', {' ' , '1000' , '2000', '3000' , '4000' , '5000' , ' '})
ylim([64 130])
grid on
legend('Proposed' , 'Exist-SVM' , 'Exist-NB' , 'Exist-RF')
xlabel('size of input data')
ylabel('Accuracy')

cic_opt = [0.995	0.988	0.985	0.9855	0.987
0.872	0.8805	0.887	0.89225	0.8834
0.805	0.8405	0.853666667	0.84325	0.8242];

cic_opt = cic_opt'*100;
figure;
plot(cic_opt(:,1),'-r*','LineWidth',3); hold on
plot(cic_opt(:,2),'-g*','LineWidth',3); hold on
plot(cic_opt(:,3),'-b*','LineWidth',3.2); hold on
xlim([0 6])
set(gca,'XTickLabel', {' ' , '1000' , '2000', '3000' , '4000' , '5000' , ' '})
ylim([64 130])
grid on
legend('Proposed' , 'Exist-PSO' , 'Exist-GA')
xlabel('size of input data')
ylabel('Accuracy')

xcic = [0	0	0	0
0.004	0.1	0.144	0.114
1	1	1	1];

ycic = [0	0	0	0
0.994	0.844	0.794	0.834
1	1	1	1];

figure;plot(xcic(:,1),ycic(:,1),'r','LineWidth',2); hold on
plot(xcic(:,2),ycic(:,2),'g','LineWidth',2); hold on
plot(xcic(:,3),ycic(:,3),'y','LineWidth',2); hold on
plot(xcic(:,4),ycic(:,4),'b','LineWidth',2); hold on
grid on
xlabel('False Positive Rate')
ylabel('True Positive Rate')
legend('Proposed' , 'Exist-SVM' , 'Exist-NB' , 'Exist-RF')


%% for ISCX
iscx_cla = [0.995	0.9945	0.994	0.99475	0.995
0.882	0.844	0.824	0.8245	0.8314
0.819	0.843	0.828666667	0.8405	0.8542
0.839	0.8395	0.830333333	0.85925	0.8604];

iscx_cla = iscx_cla'*100;
figure;
plot(iscx_cla(:,1),'-r*','LineWidth',3); hold on
plot(iscx_cla(:,2),'-g*','LineWidth',3); hold on
plot(iscx_cla(:,3),'-m*','LineWidth',3.2); hold on
plot(iscx_cla(:,4),'-b*','LineWidth',3); hold on
xlim([0 6])
set(gca,'XTickLabel', {' ' , '1000' , '2000', '3000' , '4000' , '5000' , ' '})
ylim([64 130])
grid on
legend('Proposed' , 'Exist-SVM' , 'Exist-NB' , 'Exist-RF')
xlabel('size of input data')
ylabel('Accuracy')

iscx_opt = [0.995	0.9945	0.994	0.99475	0.995
0.871	0.8835	0.891	0.89325	0.895
0.836	0.8505	0.839333333	0.84525	0.8496];

iscx_opt = iscx_opt'*100;
figure;
plot(iscx_opt(:,1),'-r*','LineWidth',3); hold on
plot(iscx_opt(:,2),'-g*','LineWidth',3); hold on
plot(iscx_opt(:,3),'-b*','LineWidth',3.2); hold on
xlim([0 6])
set(gca,'XTickLabel', {' ' , '1000' , '2000', '3000' , '4000' , '5000' , ' '})
ylim([64 130])
grid on
legend('Proposed' , 'Exist-PSO' , 'Exist-GA')
xlabel('size of input data')
ylabel('Accuracy')

xiscx = [0	0	0	0
0.00125	0.0675	0.10875	0.10625
1	1	1	1];

yiscx = [0	0	0	0
0.98	0.68	0.53	0.62
1	1	1	1];

figure;plot(xiscx(:,1),yiscx(:,1),'r','LineWidth',2); hold on
plot(xiscx(:,2),yiscx(:,2),'g','LineWidth',2); hold on
plot(xiscx(:,3),yiscx(:,3),'y','LineWidth',2); hold on
plot(xiscx(:,4),yiscx(:,4),'b','LineWidth',2); hold on
grid on
xlabel('False Positive Rate')
ylabel('True Positive Rate')
legend('Proposed' , 'Exist-SVM' , 'Exist-NB' , 'Exist-RF')


%% for CICDDOS
cddos_cla = [0.996	0.9955	0.995333333	0.995	0.992
0.903	0.899	0.898666667	0.8955	0.8918
0.836	0.827	0.816333333	0.813	0.8104
0.874	0.879	0.881666667	0.87975	0.8762];

cddos_cla = cddos_cla'*100;
figure;
plot(cddos_cla(:,1),'-r*','LineWidth',3); hold on
plot(cddos_cla(:,2),'-g*','LineWidth',3); hold on
plot(cddos_cla(:,3),'-m*','LineWidth',3.2); hold on
plot(cddos_cla(:,4),'-b*','LineWidth',3); hold on
xlim([0 6])
set(gca,'XTickLabel', {' ' , '1000' , '2000', '3000' , '4000' , '5000' , ' '})
ylim([64 130])
grid on
legend('Proposed' , 'Exist-SVM' , 'Exist-NB' , 'Exist-RF')
xlabel('size of input data')
ylabel('Accuracy')

cddos_opt = [0.996	0.9955	0.995333333	0.995	0.992
0.875	0.884	0.888333333	0.8825	0.8908
0.816	0.8445	0.853666667	0.8555	0.849];

cddos_opt = cddos_opt'*100;
figure;
plot(cddos_opt(:,1),'-r*','LineWidth',3); hold on
plot(cddos_opt(:,2),'-g*','LineWidth',3); hold on
plot(cddos_opt(:,3),'-b*','LineWidth',3.2); hold on
xlim([0 6])
set(gca,'XTickLabel', {' ' , '1000' , '2000', '3000' , '4000' , '5000' , ' '})
ylim([64 130])
grid on
legend('Proposed' , 'Exist-PSO' , 'Exist-GA')
xlabel('size of input data')
ylabel('Accuracy')

xcdos = [0	0	0	0
0.008	0.18	0.348	0.236
1	1	1	1];

ycdos = [0	0	0	0
0.997333333	0.930666667	0.897333333	0.910666667
1	1	1	1];
figure;plot(xcdos(:,1),ycdos(:,1),'r','LineWidth',2); hold on
plot(xcdos(:,2),ycdos(:,2),'g','LineWidth',2); hold on
plot(xcdos(:,3),ycdos(:,3),'y','LineWidth',2); hold on
plot(xcdos(:,4),ycdos(:,4),'b','LineWidth',2); hold on
grid on
xlabel('False Positive Rate')
ylabel('True Positive Rate')
legend('Proposed' , 'Exist-SVM' , 'Exist-NB' , 'Exist-RF')