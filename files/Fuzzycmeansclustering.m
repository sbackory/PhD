%% Fuzzy C-Means clustering (FCM)
% import the data set as numeric matrix as mentioned previously
% First Execute import_file

% Produce Fig 16 in article --> Optimising University Web Visibility:
% Strategies Using Wikidata Identifiers and Statements in
% Webometrics Rankings

%Generate dataset
X= [Dataset_Trend(:,3),Dataset_Trend(:,2)];

options=3; % Number of Cluster
[centers,U] = fcm(X,options);


maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);
index3 = find(U(3,:) == maxU);

plot(X(index1,1),X(index1,2),'.b','MarkerSize',15)
hold on
plot(X(index2,1),X(index2,2),'.r','MarkerSize',15)
hold on
plot(X(index3,1),X(index3,2),'.g','MarkerSize',15)
title('FCM');
ylabel('No. of Identifiers');
xlabel('No. of Statement');
legend('Cluster 1','Cluster 2','Cluster 3', 'location', 'northwest');

%% Clear temporary variables
clearvars('X','U','options','N',...
    'maxU','index1','index2','index3',...
    'centers')