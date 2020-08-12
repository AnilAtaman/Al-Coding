function infoGain = calcEntThresh(data,dataclass,threshVal)

belowThreshValIdx = (data<threshVal); % Index Numbers of Below Values
aboveThreshValIdx = (data>=threshVal); % Index Numbers of Above Values

dataclassC = categorical(dataclass); 
classList = categories(categorical(dataclass));

belowSurvivorMatrix = dataclassC(belowThreshValIdx); %Survivor and Non-Survivor Information (Below)
aboveSurvivorMatrix = dataclassC(aboveThreshValIdx); %Survivor and Non-Survivor Information (Above)

totalAboveEnt = 0;
totalBelowEnt = 0;
         %Conditional Entropy of Above Threshold
        for i = 1:numel(classList)
            propAbove = nnz((classList(i) == aboveSurvivorMatrix)) / nnz(aboveThreshValIdx);
            totalAboveEnt = -1*nansum((propAbove * log2(propAbove))) + totalAboveEnt;
        end
        %Conditional Entropy of Below Threshold
         for i = 1:numel(classList)
            propBelow = nnz((classList(i) == belowSurvivorMatrix)) / nnz(belowThreshValIdx);
            totalBelowEnt = -1*nansum((propBelow * log2(propBelow))) + totalBelowEnt ;
         end

 pAbove = nnz(aboveThreshValIdx) / numel(dataclassC) ;
 pBelow = nnz(belowThreshValIdx) / numel(dataclassC);
        
totalEntropy = calcEnt(dataclassC,classList);

infoGain = totalEntropy - ((pAbove*totalAboveEnt) +(pBelow*totalBelowEnt));


   
end