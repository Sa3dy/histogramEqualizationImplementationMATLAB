% Author: Mostafa Saady
% Facebook: facebook.com/Mostafa.Saady
img=imread('camMan.png');
numofpixels=size(img,1)*size(img,2);

figure,imshow(img);
title('Original Image');
figure,imhist(rgb2gray(img));
title('Original Histogram');

imgHistogramed=uint8(zeros(size(img,1),size(img,2)));
freq=zeros(256,1);
probf=zeros(256,1);
probc=zeros(256,1);
cum=zeros(256,1);
output=zeros(256,1);

for i=1:size(img,1)
    for j=1:size(img,2)
        value=img(i,j);
        freq(value+1)=freq(value+1)+1;
        probf(value+1)=freq(value+1)/numofpixels;
    end
end

sum=0;

for i=1:size(freq)
   sum=sum+freq(i);
   cum(i)=sum;
   probc(i)=cum(i)/numofpixels;
   output(i)=round(probc(i)*255);
end

for i=1:size(img,1)
    for j=1:size(img,2)
            imgHistogramed(i,j)=output(img(i,j)+1);
    end
end
figure,imshow(imgHistogramed);
title('Edited Image');
figure,imhist(imgHistogramed);
title('Edited Histogram');