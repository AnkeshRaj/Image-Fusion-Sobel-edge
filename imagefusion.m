clc
clear all;
close all;


[I1]=imgetfile;
[I2]=imgetfile;
[I3]=imgetfile;
i1=im2double(rgb2gray(imread(I1)));
i2=im2double(rgb2gray(imread(I2)));
I3=im2double(rgb2gray(imread(I3)));
%i1 = imsharpen(i1);
%i2 = imsharpen(i2);
%i1=imread('IMG_20150913_070524.jpg');
%i2=imread('IMG_20150913_0705241.jpg');
[r,c]=size(i1);

%b1=edge(i1,'Roberts',0.01);
%b2=edge(i2,'Roberts',0.01);

k = [1 4 1; 0 0 0; -1 -4 -1];
H1 = conv2(double(i1),k, 'same');
V1 = conv2(double(i1),k','same');
E1 = sqrt(H1.*H1 + V1.*V1);

k2 = [1 4 1; 0 0 0; -1 -4 -1];
H2 = conv2(double(i2),k2, 'same');
V2 = conv2(double(i2),k2','same');
E2 = sqrt(H2.*H2 + V2.*V2);


 

[r1,c]=size(i1);
i3(1:r1,1:c)=0;

m=[1 1 1 1 1 1 1 1 1,1 1 1 1 1 1 1 1 1 ,1 1 1 1 1 1 1 1 1];
c1=entropyfilt(E1,m);
c2=entropyfilt(E2,m);
for i=1:r1
    for j=1:c
        if(c1(i,j)>=c2(i,j))
            i3(i,j)=i1(i,j);
        else 
            i3(i,j)=i2(i,j);
        end
    end
end
i3=mat2gray(i3);
%i3=imsharpen(i3,'amount',.3);
figure,imshow(i3);
figure,imshow(I3-i3);
figure,imshow(i1);
figure,imshow(i2);

