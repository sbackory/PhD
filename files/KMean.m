%% K-Means Clustering
% import the data set as numeric matrix as mentioned previously
% First Execute import_file

% Produce Fig 13 in article --> Optimising University Web Visibility:
% Strategies Using Wikidata Identifiers and Statements in
% Webometrics Rankings

X=Dataset_Trend;

Y=[X(:,3) X(:,2)];

[idx,C] = kmeans(Y,3);

h = gscatter(X(:,3), X(:,2), idx, 'bgm', 'o', 5); % 12 = larger marker size

% Fill the markers to make them solid (filled with cluster color)
for i = 1:length(h)
    set(h(i), 'MarkerFaceColor', h(i).Color);
end

legend('Cluster 1', 'Cluster 2','Cluster 3','location','northwest')  % add legend
xlabel('No. of Statements');
ylabel('No. of Identifiers');
title('K-means')
grid on
%% Clear temporary variables
clearvars('X','Y','idx','C','h','i')