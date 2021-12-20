clear ; 
 
fig = figure; 
filename = 'CCA.gif'; 
max= 14 ; 
threshold=1 ; 
A=randi(max+1,200)-1 ; 
A(1:200,1)=0 ; 
A(1:200,200)=0 ; 
A(1,1:200)=0; 
A(200,1:200)=0; 
 
 
for time=1:200 
    B=A ; 
     
    for i=2:199 
     
       for j=2:199 
          counter=0 ; 
           
       if (A(i,j)==max) 
           a=0 ; 
       else 
           a=A(i,j)+1 ; 
       end 
       if ( A(i-1,j-1) == a) 
           counter=counter+1;  
       end 
        
       if ( A(i-1,j) == a) 
           counter=counter+1;  
       end 
        
       if ( A(i-1,j+1) == a) 
           counter=counter+1;  
       end 
        
       if ( A(i,j-1) == a) 
           counter=counter+1;  
       end 
        
       if ( A(i,j+1) == a) 
           counter=counter+1;  
       end 
        
       if ( A(i+1,j-1) == a) 
           counter=counter+1;  
       end 
        
       if ( A(i+1,j) == a) 
           counter=counter+1;  
       end 
        
       if ( A(i+1,j+1) == a) 
           counter=counter+1;  
       end 
         
        if (counter>=threshold) 
            B(i,j)=A(i,j)+1 ; 
        end 
        if(B(i,j)>max) 
            B(i,j)=0 ; 
        end 
    end 
     
     
        end 
     
    imagesc(A(2:199,2:199)) ; 
    colormap(hsv) ; 
    pause(0.01) 
     
    A=B ; 
     
      frame = getframe(fig);  
      im = frame2im(frame);  
      [imind,cm] = rgb2ind(im,256);  
      if time == 1  
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf);  
      else  
          imwrite(imind,cm,filename,'gif','WriteMode','append');  
      end  
 
 
end