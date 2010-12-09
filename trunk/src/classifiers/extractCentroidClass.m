function [ centroid ] = extractCentroidClass( Y )
   % Y is the matrix's feature of cluster
   
   [my, ny] = size(Y);
   centroid = sum(Y, 1)/my;              
   
end