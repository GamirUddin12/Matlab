videoFReader = vision.VideoFileReader('v2.avi');
videoPlayer = vision.VideoPlayer;

u=0;
mkdir('MainFrame')
mkdir('Temporal')
while ~isDone(videoFReader)
  videoFrame = step(videoFReader);
  
  d= videoFrame;
  %d = videoFrame(:, :, 2);
  
  if(u==0)
  
  else
          
      p=d;
      q=e;
      %p=rgb2gray(d);
      %q=rgb2gray(e);
      
      final=imabsdiff(p,q);
      %final=d;

      
 %{      
[x,y,z]=size(d);

i=1;
j=1;
k=1;
while i<=z
    j=1
    while j<=x
        k=1;
        while k<=y
            
            final(j,k,i)=d(j,k,i)-e(j,k,i);
            
            %if(final(j,k,i)>=1)
            %final(j,k,i)=112;
            %else
            %final(j,k,i)=0;
            %end
            
            k=k+1;
        end
        j=j+1;
        
    end
    i=i+1;
    
end
%}

X=final;
BW = im2bw(X,maps,0.4);
%0.2
imshow(d);
%imshow(X,maps);
%figure, imshow(BW)
hold on;
contour(BW,[0 0],'r', 'LineWidth', 6); 

      
      %fname=['Temporal/Temp_0' num2str(u) '.jpg'];
      %imwrite(final,fname,'jpg')
      
  
  end
  
  e=d;  
 
  
  
  
  
  
  %fname=['MainFrame/main_0' num2str(u) '.jpg'];
  %imwrite(videoFrame,fname,'jpg')
  
  
  step(videoPlayer, videoFrame);
  
  
  u=u+1;
end
release(videoPlayer);
release(videoFReader);





