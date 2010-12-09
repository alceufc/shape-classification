function [ class ] = classifiersMinimumDistance( vector, distance )
    addpath('../');
    
    %distance = 'euclidean';
    
    centroidMatrix = generateCentroidMatrix();
    [cx,cy] = size(centroidMatrix);
    
    if strcomp(distance,'euclidean')
        %euclideanDistance = zeros(cy);
        euclideanDistance = dist(centroidMatrix,vector);
        
    elseif strcomp(distance,'Mahalanobis')
        %mahalanobisDistance = zeros(cy); 
        mahalanobisDistance = mahal(centroidMatrix,vector);
    
    else
        
    end
            
end    