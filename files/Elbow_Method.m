%% Elbow Method for K-means Clustering
% import the data set as numeric matrix as mentioned previously
% First Execute import_file

% Produce Fig 12 in article --> Optimising University Web Visibility:
% Strategies Using Wikidata Identifiers and Statements in
% Webometrics Rankings

X=Dataset_Trend(:,2:3);

% Range of K values to test
K_range = 1:10;  

% Initialize WCSS storage
WCSS = zeros(length(K_range),1);

% Compute K-means for each K and store WCSS
for i = 1:length(K_range)
    k = K_range(i);
    [idx, C, sumd] = kmeans(X, k, 'Replicates', 10, 'Display', 'off');
    WCSS(i) = sum(sumd); % Within-cluster sum of squares
end

% Plot Elbow Method
figure;
plot(K_range, WCSS, '-o', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('Number of clusters (K)');
ylabel('WCSS (Within-Cluster Sum of Squares)');
title('Elbow Method for Optimal K');
grid on;

%% Clear temporary variables
clearvars('X','K','WCSS','k','K_range','idx','C','sumd')
