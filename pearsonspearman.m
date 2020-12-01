function [pcc,src] = pearsonspearman(img1,img2,thresh,plottype)
%function [pcc,src] = pearsonspearman(img1,img2,thresh,plottype)
%inputs:
%IMG1 and IMG2 are two 2D images of the same size and class
%THRESH is a 2-element vector that specifies the threshold values for
%image1 and image2, respectively
%PLOTTYPE specifies the scatterplot format.  1 denotes a simple "dot"
%scatterplot, 2 denotes a 2D histogram
%
%outputs:
%PCC: the Pearson's Correlation Coefficient
%SRC: The Spearman Correlation Coefficient

img1 = double(img1); img2 = double(img2);

if length(thresh) == 1
    thresh = [thresh thresh];
end

img1thresh = img1(img1>thresh(1) & img2>thresh(2));
img2thresh = img2(img1>thresh(1) & img2>thresh(2));

if plottype == 1
    figure; plot(img1thresh,img2thresh,'k.');
elseif plottype == 2
    figure; histogram2(img1thresh,img2thresh,'BinWidth',[200 200],'DisplayStyle','tile'); colorbar;
end
    

pcc = corr(img1thresh,img2thresh,'type','pearson');
src = corr(img1thresh,img2thresh,'type','spearman');

end

