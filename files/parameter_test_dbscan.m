%% DBSCAN Parameter-Sensitivity Test
% import the data set as numeric matrix as mentioned previously
% First Execute import_file

% Produce Fig 14 in article --> Optimising University Web Visibility:
% Strategies Using Wikidata Identifiers and Statements in
% Webometrics Rankings

%% Generate dataset
X= [Dataset_Trend(:,3),Dataset_Trend(:,2)];


%% Define parameter ranges
epsilon_values = 0.1:0.1:8.0;   % Range of epsilon values
MinPts_values = 3:2:15;         % Range of MinPts values

%% Initialize matrices to store results
num_clusters_matrix = zeros(length(MinPts_values), length(epsilon_values));
num_noise_matrix = zeros(length(MinPts_values), length(epsilon_values));

%% Run DBSCAN for all parameter combinations
for ei = 1:length(epsilon_values)
    for mi = 1:length(MinPts_values)
        epsilon = epsilon_values(ei);
        MinPts = MinPts_values(mi);
        
        % Run DBSCAN
        [IDX, isnoise] = DBSCAN(X, epsilon, MinPts);
        
        % Store results
        num_clusters_matrix(mi, ei) = max(IDX); % number of clusters
        num_noise_matrix(mi, ei) = sum(isnoise); % number of noise points
    end
end

%% Plot heatmap: number of clusters
figure; 
imagesc(epsilon_values, MinPts_values, num_clusters_matrix);
set(gca,'YDir','normal');
xlabel('\epsilon'); ylabel('MinPts');
title('Number of Clusters for Different Parameters');
colorbar;

%% Plot heatmap: number of noise points
figure;
imagesc(epsilon_values, MinPts_values, num_noise_matrix);
set(gca,'YDir','normal');
xlabel('\epsilon'); ylabel('MinPts');
title('Number of Noise Points for Different Parameters');
colorbar;

%% Optional: 3D surface plots for better visualization
figure;
surf(epsilon_values, MinPts_values, num_clusters_matrix);
xlabel('\epsilon'); ylabel('MinPts'); zlabel('Number of Clusters');
title('3D Surface: Number of Clusters');

figure;
surf(epsilon_values, MinPts_values, num_noise_matrix);
xlabel('\epsilon'); ylabel('MinPts'); zlabel('Number of Noise Points');
title('3D Surface: Noise Points');

%% Clear temporary variables
clearvars('X','epsilon_values','MinPts_values','num_clusters_matrix',...
    'num_noise_matrix','epsilon','mi','MinPts','ei','IDX','isnoise')