%% HIERARCHICHAL CLUSTERING AGGLOMERATIVE METHOD

% import the data set as numeric matrix as mentioned previously
% First Execute import_file

% Produce Fig 16 in article --> Optimising University Web Visibility:
% Strategies Using Wikidata Identifiers and Statements in
% Webometrics Rankings

%Generate dataset
X= [Dataset_Trend(:,3),Dataset_Trend(:,2)];
raw_data = X;

% Standardize data
%raw_data = zscore(raw_data); 

Tree = linkage(raw_data,'complete','euclidean');

[H,T,n]=dendrogram(Tree,100,'ColorThreshold',60);
    % Plots the hierarchical clustering dendrogram with a maximum of 100 leaves,
    % colors clusters formed below the distance threshold of 60,
    % and returns:
    % H - handles to the dendrogram lines,
    % T - cluster assignments for each observation,
    % n - permutation order of the leaves.

idx = cluster(Tree,'Cutoff',60,'Criterion','distance');
    % Assigns cluster labels to observations by cutting the hierarchical
    % clustering tree at a distance threshold of 60.
    % idx contains the cluster index for each data point.

%unique(idx); % Returns the unique values contained in the vector idx

gscatter(raw_data(:,1),raw_data(:,2),idx);
title('AGGLOMERATIVE');
ylabel('No. of Identifiers');
xlabel('No. of Statement');
legend('Cluster 1','Cluster 2','Cluster 3', 'location', 'northwest');

%% Clear temporary variables
clearvars('X','T','Tree','raw_data',...
    'n','idx','H')
