%% PEARSON CORRELATION
% import the data set as numeric matrix as mentioned previously
% First Execute import_file

% Produce Table 7 in article --> Optimising University Web Visibility:
% Strategies Using Wikidata Identifiers and Statements in
% Webometrics Rankings

%% Generate dataset
Rank = Dataset_Trend(:,1);
Identifier = Dataset_Trend(:,2);
Statement = Dataset_Trend(:,3); 
%% Correlation coefficient Identifier vs Statement
% Pearson correlation (default is Pearson)
[r, p] = corr(Identifier, Statement);

%Manually Compute 95% Confidence Interval
n = length(Identifier);

% Fisher Z transform
z = atanh(r);
SE = 1/sqrt(n-3);

z_crit = norminv(0.975);   % for 95% CI

z_lower = z - z_crit * SE;
z_upper = z + z_crit * SE;

r_lower = tanh(z_lower);
r_upper = tanh(z_upper);




% Display results
fprintf('Correlation coefficient Identifier vs Statement (r): %.4f\n', r);
fprintf('Two-tailed p-value: %.4e\n', p);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', r_lower, r_upper);

%% Correlation coefficient Identifier vs Rank

% Pearson correlation (default is Pearson)
[r, p] = corr(Identifier, Rank);

%Manually Compute 95% Confidence Interval
n = length(Identifier);

% Fisher Z transform
z = atanh(r);
SE = 1/sqrt(n-3);

z_crit = norminv(0.975);   % for 95% CI

z_lower = z - z_crit * SE;
z_upper = z + z_crit * SE;

r_lower = tanh(z_lower);
r_upper = tanh(z_upper);




% Display results
fprintf('Correlation coefficient Identifier vs Rank (r): %.4f\n', r);
fprintf('Two-tailed p-value: %.4e\n', p);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', r_lower, r_upper);

%% Correlation coefficient Identifier vs Rank

% Pearson correlation (default is Pearson)
[r, p] = corr(Statement, Rank);

%Manually Compute 95% Confidence Interval
n = length(Statement);

% Fisher Z transform
z = atanh(r);
SE = 1/sqrt(n-3);

z_crit = norminv(0.975);   % for 95% CI

z_lower = z - z_crit * SE;
z_upper = z + z_crit * SE;

r_lower = tanh(z_lower);
r_upper = tanh(z_upper);




% Display results
fprintf('Correlation coefficient Statement vs Rank (r): %.4f\n', r);
fprintf('Two-tailed p-value: %.4e\n', p);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', r_lower, r_upper);

%% Clear temporary variables
clearvars ('Identifier','Statement','Rank','r_lower','r_upper',...
    'SE','z_crit','z_lower','z_upper','r','p','n','z')


