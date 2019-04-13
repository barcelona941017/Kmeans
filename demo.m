clear all; close all;

%% ���ݼ�
struct = load('D:\ѧϰ\ѧ��\�����׾����㷨���о�\MFSC\ProcessDataSetNew\Data6.mat');
XX = struct.XX;
group_num = struct.group_num;
i = 3;
data = XX{i};
k = group_num(i);
figure(1);clf;
plot(data(:,1),data(:,2),'ks', 'MarkerFaceColor','k','MarkerSize',5); axis image; hold on; 
SegLabel = kmeans(data,k);
cluster_color = ['rgbmyc'];
figure(2);clf;
for j=1:k,
    id = find(SegLabel == j);
    plot(data(id,1),data(id,2),[cluster_color(j),'s'], 'MarkerFaceColor',cluster_color(j),'MarkerSize',5); hold on; 
end
axis off;
hold off; axis image;


%% ͼ��
I = imread('D:\ѧϰ\ѧ��\�����׾����㷨���о�\MFSC\MFSC_Apply_Dataset\MatlabAndCpp\ͼ��\color_img\b17paul1444.png');
%I = rgb2gray(I);
%I = imresize(I,[256, 256],'bicubic');
%[x,y] = meshgrid(1:256,1:256);
%c= [y(:),x(:)];
tic;
[m, n, p] = size(I);
I_reshape = reshape(I,m*n,p);
I_reshape = double(I_reshape);
%I_reshape_posi = [c I_reshape];
k = 5;
I_seg = kmeans(I_reshape,k);
I_seg = reshape(I_seg,m,n);
% [C, label, J] = kmeansDIY(I, k);
% I_seg = reshape(label, m, n, p);
toc;
imagesc(I_seg);
showSegLabel = (255/k) * I_seg;
showSegLabel = uint8(showSegLabel);
figure(11),
imshow(showSegLabel);
imwrite(showSegLabel, 'C:\Users\Administrator\Desktop\��ҵ����\�㷨���õ���ͼƬ\�Ĳ����㷨\gray.png');
[ACC,RI,DICE] = showACCandSaveRes(I,I_seg,'D:\ѧϰ\ѧ��\�����׾����㷨���о�\MFSC\kmeans\golden2Obj256\b17paul1444_golden.jpg',2,k);


