clear all;
shape='bunny';
shape=strcat('build/',shape);
filename=strcat(shape,'.raw');
headername=strcat(shape,'.mhd');

file = fopen(filename,'r');
header=fopen(headername, 'r');

text=fileread(headername);
exp='[0-9]+';
val=regexp(text,exp,'match');

x=str2double(val{2});
y=str2double(val{3});
z=str2double(val{4});
ccnt=x*y*z;

A=typecast(uint32(fread(file,'uint32')),'single');

% A=abs(A);
% B=rescale(A,-255,255);
C=reshape(A,x,y,z);
% B=rescale(A,0,255);
% box=reshape(B,x,y,z);
isosurface(C,[0]);
axis equal;