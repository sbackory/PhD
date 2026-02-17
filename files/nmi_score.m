% -----------------------------------------------------------
% Helper Functions
% -----------------------------------------------------------

function nmi = nmi_score(labels1, labels2)
    % Normalized Mutual Information (NMI)
    contingency = crosstab(labels1, labels2);
    N = sum(contingency(:));
    
    pi = sum(contingency,2) / N;
    pj = sum(contingency,1) / N;
    
    % Mutual Information
    MI = 0;
    for i = 1:size(contingency,1)
        for j = 1:size(contingency,2)
            if contingency(i,j) > 0
                MI = MI + (contingency(i,j)/N) * log((contingency(i,j)/N)/(pi(i)*pj(j)));
            end
        end
    end
    
    % Entropies
    Hi = -sum(pi .* log(pi + eps));
    Hj = -sum(pj .* log(pj + eps));
    
    % NMI
    nmi = 2 * MI / (Hi + Hj + eps);
end