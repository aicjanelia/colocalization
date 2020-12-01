function [moc,m1,m2,img1thresh,img2thresh] = manders(img1,img2,thresh1,thresh2)
%function [moc,m1,m2,img1thresh,img2thresh] = manders(img1,img2,thresh1,thresh2)
%inputs:
%IMG1 and IMG2 are two 2D images of the same size and class
%THRESH1 and THRESH2 are the pixel intensity thresholds for img1 and img2,
%respectively, below which Manders will not compute overlap
%
%Outputs:
%MOC:  the Manders' overlap coefficient
%M1 and M2: The fractional mander's overlap of img1 to img2, and img2 to
%img1, respectively
%IMG1THRESH and IMAGE2THRESH: the masked version of IMG1 and IMG2,
%respectively, given the thresholds supplied.


img1 = double(img1);
img2 = double(img2);

img1mask = img1 > thresh1;
img2mask = img2 > thresh2;

img1thresh = img1.*img1mask;
img2thresh = img2.*img2mask;

mocn = sum(sum(img1thresh.*img2thresh));
mocd1 = sqrt(sum(sum(img1thresh.^2)));
mocd2 = sqrt(sum(sum(img2thresh.^2)));
moc = mocn/(mocd1*mocd2);

m1 = sum(sum(img1thresh(img2thresh>0)))/sum(sum(img1thresh));
m2 = sum(sum(img2thresh(img1thresh>0)))/sum(sum(img2thresh));
