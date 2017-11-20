
clear;

vid=videoinput('winvideo',1,'YUY2_320x240');
%preview(vid);
set(vid,'FramesPerTrigger',inf);
set(vid,'ReturnedColorspace','rgb')
vid.FrameGrabinterval=0.5;

mkdir('MainFrame_Cam')
mkdir('Temporal_Cam')

start(vid);
u=1;
i=1;
final = imread('black.jpg');

while(vid.FramesAcquired<=500) 
  
    
    if(i==1)
    d = getsnapshot(vid);     
    i=199;
    
    
    else
    e = getsnapshot(vid);
    p=d;
    q=e;
    
    %p=rgb2gray(d);
    %q=rgb2gray(e);

    final=imabsdiff(p,q);
    
    %imshow(final);
    %hold on
    
    
    %Capturepic/image
    
    %fname=['Temporal_Cam/Temp_Cam_' num2str(u) '.jpg'];
    %imwrite(final,fname,'jpg')
    
    
    %fname=['MainFrame_Cam/Main_Camera_' num2str(u) '.jpg'];
    %imwrite(d,fname,'jpg')
    
    
X=final;

BW = im2bw(X,maps,0.2);

figure,imshow(d);
%imshow(X,maps);
%figure, imshow(BW)
hold on;
contour(BW,[0 0],'r', 'LineWidth', 6); 


    u=u+1;

    
    
    d=e;
    end
end





stop(vid);






fname=['final.jpg'];
%imwrite(final,fname,'jpg')
%disp(final);
clc; 
    
    


