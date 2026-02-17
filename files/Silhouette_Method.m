%% Silhouette Method
% import the data set as numeric matrix as mentioned previously
% First Execute import_file

% Produce Fig 12 in article --> Optimising University Web Visibility:
% Strategies Using Wikidata Identifiers and Statements in
% Webometrics Rankings

X=Dataset_Trend(:,2:3);

% Range of K values to try
k_values = 2:10;

% Pre-allocate the array for storing silhouette averages
silhouette_averages = zeros(length(k_values), 1);

% Loop through different values of K (number of clusters)
for k = k_values
    % Perform k-means clustering
    [cluster_idx, cluster_centers] = kmeans(X, k);
    
    % Compute silhouette values
    silhouette_values = silhouette(X, cluster_idx);
    
    % Store the average silhouette value
    silhouette_averages(k - 1) = mean(silhouette_values);
    
    % Optionally, plot the silhouette for each K (optional for detailed analysis)
    % figure;
    % silhouette(X, cluster_idx);
    % title(['Silhouette for K = ', num2str(k)]);
end

% Plot Silhouette average against K
figure;
plot(k_values, silhouette_averages, '-o', 'LineWidth', 2);
xlabel('Number of Clusters (K)');
ylabel('Average Silhouette Value');
title('Silhouette Analysis: Average Silhouette vs. K');
grid on;

% Identify the optimal K (where silhouette value is highest)
[~, optimal_k_idx] = max(silhouette_averages);
optimal_k = k_values(optimal_k_idx);
fprintf('The optimal number of clusters (K) is %d, with an average silhouette value of %.3f.\n', ...
    optimal_k, silhouette_averages(optimal_k_idx));

%% Clear temporary variables
clearvars('X','k_values','silhouette_averages','silhouette_values',...
    'optimal_k_idx', 'optimal_k' ,'k', 'cluster_idx', 'cluster_centers')