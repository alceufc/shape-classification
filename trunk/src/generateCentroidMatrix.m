function [ centroidMatrix ] = generateCentroidMatrix(  )
    
    %@ATTRIBUTE class  {ag, bg, cg, lg, me, pe}
    classes = ['ag'; 'bg'; 'cg'; 'lg'; 'me'; 'pe'];   
    
    featureMatrix = generateDataSetMatrix();
    [fx, fy] = size(featureMatrix);
    
    class1 = featureMatrix(find(featureMatrix(:,fy)=='ag'),1:fy-1);
    
    %%%%%%%%%%%
    
    %[mx, my] = size(matrix);
    
    %cluster = matrix(1:mx-1,);
    
end