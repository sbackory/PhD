%% Gaussian Mixture Model (GMM)
% import the data set as numeric matrix as mentioned previously
% First Execute import_file

% Produce Fig 16 in article --> Optimising University Web Visibility:
% Strategies Using Wikidata Identifiers and Statements in
% Webometrics Rankings

%Generate dataset
X= [Dataset_Trend(:,3),Dataset_Trend(:,2)];

%% fit a GMM
k=3;
options = statset('MaxIter',1000);

gmfit = fitgmdist(X,k,'CovarianceType','diagonal','SharedCovariance',false,'Options',options);
clusterind = cluster(gmfit,X); 
disp('mean points are at:');
disp(gmfit.mu)
disp('covariances are:');
disp(gmfit.Sigma)
disp('Components Proportions are:');
disp(gmfit.ComponentProportion)

%% plot the results
x1 = linspace(min(X(:,1))-2, max(X(:,1))+2, 500);
x2 = linspace(min(X(:,2))-2, max(X(:,2))+2, 500);
[x1grid,x2grid] = meshgrid(x1,x2);
X0 = [x1grid(:) x2grid(:)];

mahalDist = mahal(gmfit,X0); 

figure;
h1=gscatter(X(:,1),X(:,2),clusterind);
IDXG=clusterind;
xlabel('No. of Statements');
ylabel('No. of Identifiers');
title('GMM')
legend('Cluster 1','Cluster 2','Cluster 3', 'location', 'northwest');

%% Clear temporary variables
clearvars('x2grid','x2','x1grid','X0',...
    'options','mahalDist','k','IDXG','h1','gmfit',...
    'clusterind','X','x1')