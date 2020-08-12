function totalEnt = calcEnt(dataClass,classList)
totalEnt = 0;
    for i = 1:numel(classList)
        prop = nnz((classList(i) == dataClass))/numel(dataClass);
        totalEnt = -1*nansum(prop * log2(prop))+totalEnt;
    end
end