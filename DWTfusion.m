clc
clear all;
close all;

[I1]=imgetfile;
[I2]=imgetfile;
[I3]=imgetfile;
i1=im2double(rgb2gray(imread(I1)));
i2=im2double(rgb2gray(imread(I2)));
I3=im2double(rgb2gray(imread(I3)));
[cA1,cH1,cV1,cD1] = dwt2(i1,'sym4');
[cA2,cH2,cV2,cD2] = dwt2(i2,'sym4');
figure, imshow(I3),title('I1');
figure, imshow(i2),title('I2');
figure, imshow(i1),title('F');
figure,
subplot(2,2,1);imshow(cA1);title('CA1');
subplot(2,2,2);imshow(cH1);title('CH1');
subplot(2,2,3);imshow(cV1);title('CV1');
subplot(2,2,4);imshow(cD1);title('CD1');
figure,
subplot(2,2,1);imshow(cA2);title('CA2');
subplot(2,2,2);imshow(cH2);title('CH2');
subplot(2,2,3);imshow(cV2);title('CV2');
subplot(2,2,4);imshow(cD2);title('CD2');

m=[1 1 1,1 1 1 ,1 1 1];
c11=entropyfilt(cA1,m);
c21=entropyfilt(cA2,m);
% c12=entropyfilt(cH1,m);
% c22=entropyfilt(cH2,m);
% c13=entropyfilt(cV1,m);
% c23=entropyfilt(cV2,m);
% c14=entropyfilt(cD1,m);
% c24=entropyfilt(cD2,m);

[r,c]=size(i1);
for k=1:c
    b(1,k)=0;
    b(r,k)=0;
end
for k=1:r
    b(k,1)=0;
    b(k,c)=0;
end

for i=2:r-3
    for j=2:c-3
        if c11(i,j)>c21(i,j)
            b(i,j)=i1(i,j);
        else
            b(i,j)=i2(i,j);
        end
    end
end
b=mat2gray(b);
[rf,cf]=size(b);
%fprintf('diff%d %d %d',c-cf,r-rf);
%fid=(I3-b);
figure, imshow(b),title('Result');
%figure,imshow(fid);
