%% DBSCAN Parameter Selection with k-Distance Plot
% This script demonstrates how to select eps (epsilon) and MinPts for DBSCAN
% using a k-distance plot.

% import the data set as numeric matrix as mentioned previously
% First Execute import_file

% Produce Fig 14 and Fig 15 in article --> Optimising University Web Visibility:
% Strategies Using Wikidata Identifiers and Statements in
% Webometrics Rankings


%% 1. Generate or load dataset
X= [Dataset_Trend(:,3),Dataset_Trend(:,2)];
data=X;
[nPoints, dim] = size(data);

%% 2. Choose MinPts
% Rule of thumb: MinPts >= dim + 1 or 2*dim
MinPts = 3; % example choice for 2D data

%% 3. Compute distances to MinPts-th nearest neighbor
% Use pdist2 to compute distance matrix
distances = pdist2(data, data); % nPoints x nPoints

% Sort each row to get neighbors in ascending order
sortedDist = sort(distances, 2);

% k-distance for each point = distance to MinPts-th nearest neighbor
kDistance = sortedDist(:, MinPts+1); % +1 because distance to itself is 0

%% 4. Sort k-distances for the plot
sortedKDist = sort(kDistance);

%% 5. Plot k-distance graph
figure; 
plot(sortedKDist, 'b-', 'LineWidth', 1.5);
xlabel('Points sorted by k-distance');
ylabel(sprintf('Distance to %d-th nearest neighbor', MinPts));
title('k-distance Plot for DBSCAN');
grid on;
hold on;

% Optional: Highlight approximate "knee" (manual inspection)
% Here we just demonstrate with the 90th percentile as an example
eps_est = sortedKDist(round(0.9*nPoints));
% Get current axis limits
yl = ylim;  % [ymin ymax]
% Draw a horizontal line at eps_est
line([0, length(kDistance)], [eps_est, eps_est], 'Color', 'r', 'LineStyle', '--', 'LineWidth', 1.5);
%yline(eps_est, 'r--', 'LineWidth',1.5);
text(0.5*nPoints, eps_est+1.55, sprintf('\\epsilon = %.2f', eps_est), 'Color','r','FontSize',12);

%% 6. Run DBSCAN with chosen parameters
% eps = eps_est, MinPts = chosen above
cluster_labels = DBSCAN(data, eps_est, MinPts);

% Plot the clustering result
figure;
gscatter(data(:,1), data(:,2), cluster_labels);
xlabel('X'); ylabel('Y');
title(sprintf('DBSCAN Clustering (eps=%.2f, MinPts=%d)', eps_est, MinPts));
grid on;

%% 7. Summary
fprintf('Chosen parameters:\n');
fprintf('MinPts = %d\n', MinPts);
fprintf('Estimated eps (from k-distance plot) = %.2f\n', eps_est);
fprintf('Cluster labels for points:\n');
disp(cluster_labels);

%% Clear temporary variables
clearvars('X','MinPts','data','dim',...
    'distances','kDistance','nPoints','sortedDist','sortedKDist',...
    'eps_est','yl','cluster_labels')
