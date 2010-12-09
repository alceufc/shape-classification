function [ matrix ] = classifiersMinimumDistance( vector, distance )
    addpath('../');
    
    %distance = 'euclidean';
    
    centroidMatrix = generateCentroidMatrix();
    [cx,cy] = size(centroidMatrix);
    
    if strcmp(distance,'euclidean')
        %euclideanDistance = zeros(cy);
        euclideanDistance = dist(centroidMatrix,vector');
        matrix = euclideanDistance;
        
    elseif strcmp(distance,'Mahalanobis')
        %mahalanobisDistance = zeros(cy); 
        mahalanobisDistance = MahalanobisDistance(centroidMatrix,vector);
        matrix = mahalanobisDistance;
    
    else
        
    end
            
end    