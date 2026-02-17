%% 2-Dimensional Plot
% import the data set as numeric matrix as mentioned previously
% First Execute import_file

% Produce Fig 11 in article --> Optimising University Web Visibility:
% Strategies Using Wikidata Identifiers and Statements in
% Webometrics Rankings

X=Dataset_Trend;

Y=[X(:,3) X(:,2)];

n = size(Y,1);          % Number of rows (should be 100)
Y_new = [];             % Initialize new matrix

for i = 1:n
    repeat_count = n - i + 1;   % 100, 99, 98, ..., 1
    Y_new = [Y_new; repmat(Y(i,:), repeat_count, 1)];
end
Y_new;

hist3(Y_new,[60 100],'CDataMode','auto','FaceColor','interp')

xlabel('No. of Statements')     % X-axis label
ylabel('No. of Identifiers')     % Y-axis label

view(2)
colorbar
caxis([0 100])   % Limit color scale from 0 to 100
grid on

%% Clear temporary variables
clearvars('X','Y','n','Y_new','repeat_count','i')