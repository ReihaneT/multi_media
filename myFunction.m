function imageWithWatermak = myFunction(imageWithoutWatermark,W1D,a,alpha)

if W1D==1 && imageWithoutWatermark(a,a+1)>imageWithoutWatermark(a+1,a)
    temp=imageWithoutWatermark(a+1,a);
    imageWithoutWatermark(a+1,a)=imageWithoutWatermark(a,a+1)+alpha/5;
    imageWithoutWatermark(a,a+1)=temp-alpha/5;
elseif W1D==0 && imageWithoutWatermark(a,a+1)<imageWithoutWatermark(a+1,a)
   temp=imageWithoutWatermark(a,a+1);
    imageWithoutWatermark(a,a+1)=imageWithoutWatermark(a+1,a)+alpha/5;
    imageWithoutWatermark(a+1,a)=temp-alpha/5; 
elseif W1D==1 && imageWithoutWatermark(a,a+1)<imageWithoutWatermark(a+1,a)
    imageWithoutWatermark(a+1,a)=imageWithoutWatermark(a+1,a)+alpha/5;
    imageWithoutWatermark(a,a+1)=imageWithoutWatermark(a,a+1)-alpha/5;
elseif W1D==0 && imageWithoutWatermark(a,a+1)>imageWithoutWatermark(a+1,a)
   imageWithoutWatermark(a,a+1)=imageWithoutWatermark(a,a+1)+alpha/5;
   imageWithoutWatermark(a+1,a)=imageWithoutWatermark(a+1,a)-alpha/5;
end
    
imageWithWatermak=imageWithoutWatermark;

end