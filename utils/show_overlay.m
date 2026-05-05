clear all; close all; clc;
% fname = '/old/Linea-litoranea/';
fname = '/S2B_MSIL2A_20201010';th = 0.1;
% fname = '/S2A_MSIL2A_20200609';th = 0.2;
% fname = '/S2B_MSIL1C_20201021'; th=0.1;
% fname = '/S1A_IW_SLC__1SDV_20200930';th = 0.05;

inputImg = load(['./mat/',fname,'.mat']);
img = inputImg.img;
% img_eea = inputImg.img_eea;
% img_euh = inputImg.img_euh;
img_coast = inputImg.img_coast;
% th = 0.2;
figure();
ax(1)=subplot(121);imshow(img,[0 th]); title('img');
% ax(2)=subplot(222);imshow(img_eea,[0 th]); title('eea line')
% ax(3)=subplot(223);imshow(img_euh,[0 th]); title('euh line');
ax(4)=subplot(122);imshow(img_coast,[0 th]); title('result');
linkaxes(ax,'xy');

