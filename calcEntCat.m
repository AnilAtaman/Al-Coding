function infoGain = calcEntCat(data, dataClass, targetCatVals)

dataclassC = categorical(dataClass);

threshValMatrix = (dataclassC(ismember(data,targetCatVals)));
nonThreshValMatrix = (dataclassC(~ismember(data,targetCatVals)));

classList = categories(categorical(dataClass));

totalThreshEnt = 0;
totalNonThreshEnt = 0;
         %Conditional Entropy of Above Threshold
        for i = 1:numel(classList)
            propThresh = nnz((classList(i) == threshValMatrix)) / numel(threshValMatrix);
            totalThreshEnt = -1*nansum((propThresh * log2(propThresh))) + totalThreshEnt;
        end
        %Conditional Entropy of Below Threshold
         for i = 1:numel(classList)
            propNonThresh = nnz((classList(i) == nonThreshValMatrix)) / numel(nonThreshValMatrix);
            totalNonThreshEnt = -1*nansum((propNonThresh * log2(propNonThresh))) + totalNonThreshEnt ;
         end

 pThresh = numel(threshValMatrix) / numel(dataclassC);
 pNonThresh = numel(nonThreshValMatrix) / numel(dataclassC);
        
totalEntropy = calcEnt(dataclassC,classList);

infoGain = totalEntropy - ((pThresh*totalThreshEnt) +(pNonThresh*totalNonThreshEnt));

end