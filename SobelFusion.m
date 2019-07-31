clc
clear all;
close all;
% 
% [I1]=imgetfile;
% [I2]=imgetfile;
% [I3]=imgetfile;
% 
% i1=im2double(rgb2gray(imread(I1)));
% i2=im2double(rgb2gray(imread(I2)));
% I3=im2double(rgb2gray(imread(I3)));


I1=imread('fig8.9b-758x569.jpg');
 I2=imread('fig8.9a-758x568.jpg');
 I3=imread('fig8.9c-758x570.jpg');
 figure,imshow(I1);
  figure,imshow(I2);
  figure,imshow(I3);
i1=im2double(rgb2gray(I1));
i2=im2double(rgb2gray(I2));
I3=im2double(rgb2gray(I3));

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

 figure,imshow(E1);
  figure,imshow(E2);
for k=1:c
    b(1,k,1)=0;
    b(r,k,1)=0;
     b(1,k,2)=0;
    b(r,k,2)=0;
     b(1,k,3)=0;
    b(r,k,3)=0;
end
for k=1:r
    b(k,1,1)=0;
    b(k,c,1)=0;
     b(k,1,2)=0;
    b(k,c,2)=0;
     b(k,1,3)=0;
    b(k,c,3)=0;
end

for i=2:r-2
    for j=2:c-2
        c1=abs(E1(i,j)-E1(i-1,j))+abs(E1(i,j)-E1(i,j-1))+abs(E1(i,j)-E1(i+1,j))+abs(E1(i,j)-E1(i,j+1));
        c2=abs(E2(i,j)-E2(i-1,j))+abs(E2(i,j)-E2(i,j-1))+abs(E2(i,j)-E2(i+1,j))+abs(E2(i,j)-E2(i,j+1));
        if c1>c2
            b(i,j,1)=I1(i,j,1);
            b(i,j,2)=I1(i,j,2);
            b(i,j,3)=I1(i,j,3);
        else
            b(i,j,1)=I2(i,j,1);
            b(i,j,2)=I1(i,j,2);
            b(i,j,3)=I1(i,j,3);
        end
    end
end
b=mat2gray(b);

figure,imshow(i1);
figure,imshow(i2);
figure,imshow(E1);title('I1');
impixelinfo;
figure,imshow(E2);title('I2');
impixelinfo;
figure,imshow(b);title('F');
impixelinfo;