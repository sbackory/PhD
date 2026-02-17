% -----------------------------------------------------------
% Helper Functions
% -----------------------------------------------------------

function ari = rand_index_adjusted(labels1, labels2)
    % Adjusted Rand Index (ARI)
    n = length(labels1);
    contingency = crosstab(labels1, labels2);
    
    sumCombC = sum(nchoosek2(sum(contingency,2))); % sum over rows
    sumCombK = sum(nchoosek2(sum(contingency,1))); % sum over cols
    sumComb = sum(nchoosek2(contingency(:)));
    
    expectedIndex = sumCombC * sumCombK / nchoosek2(n);
    maxIndex = (sumCombC + sumCombK)/2;
    ari = (sumComb - expectedIndex) / (maxIndex - expectedIndex + eps);
end



function c = nchoosek2(n)
    % Fast compute nC2 for vector n
    c = n.*(n-1)/2;
end