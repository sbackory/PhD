%% Stability Analysis of K-Means using ARI and NMI

% import the data set as numeric matrix as mentioned previously
% First Execute import_file

% Produce Fig 12 in article --> Optimising University Web Visibility:
% Strategies Using Wikidata Identifiers and Statements in
% Webometrics Rankings

%% Step 1:
X=Dataset_Trend(:,2:3);

%% Step 2: Define range of clusters and number of runs
K = 2:6;           % candidate values for number of clusters
nRuns = 20;        % number of repeated K-Means runs per k

% store stability metrics
avgARI = zeros(size(K));
avgNMI = zeros(size(K));

%% Step 3: Loop over each k
for idx = 1:length(K)
    k = K(idx);
    
    % Store clustering results for multiple runs
    clusterings = zeros(size(X,1), nRuns);
    
    for r = 1:nRuns
        clusterings(:,r) = kmeans(X, k, 'Replicates', 1, 'Display','off');
    end
    
    % --- Compute pairwise similarities (ARI & NMI) ---
    ariVals = [];
    nmiVals = [];
    
    for i = 1:nRuns
        for j = i+1:nRuns
            labels1 = clusterings(:,i);
            labels2 = clusterings(:,j);
            
            % Compute ARI
            ariVals(end+1) = rand_index_adjusted(labels1, labels2);
            
            % Compute NMI
            nmiVals(end+1) = nmi_score(labels1, labels2);
        end
    end
    
    % Average stability scores for this k
    avgARI(idx) = mean(ariVals);
    avgNMI(idx) = mean(nmiVals);
    
    fprintf('k=%d: ARI=%.3f, NMI=%.3f\n', k, avgARI(idx), avgNMI(idx));
end

%% Step 4: Plot stability scores
figure;
plot(K, avgARI, '-o', 'LineWidth',2, 'MarkerSize',8); hold on;
plot(K, avgNMI, '-s', 'LineWidth',2, 'MarkerSize',8);
xlabel('Number of Clusters (k)');
ylabel('Stability Score');
legend('Adjusted Rand Index (ARI)','Normalised Mutual Information (NMI)');
title('Stability Analysis of K-Means');
grid on;

%% Clear temporary variables
clearvars('avgARI','avgNMI','ariVals','nmiVals','clusterings','nRuns',...
    'X','K','r','j','i','idx','k','labels1','labels2')

