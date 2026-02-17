%% Scattering plot (Identifiers vs Statements Trend)
% import the data set as numeric matrix as mentioned previously
% First Execute import_file

% Produce Fig 10 in article --> Optimising University Web Visibility:
% Strategies Using Wikidata Identifiers and Statements in
% Webometrics Rankings

Rank = Dataset_Trend(:,1);
Identifier = Dataset_Trend(:,2);
Statement = Dataset_Trend(:,3); 
plot(Rank,Statement,'--or',Rank,Identifier,':xk')
legend({'No. of Identifiers', 'No. of Statements'},'Location','southwest')
ylabel('No. of Identifiers No. of Statements')
xlabel('Ranking of Universities')

%% Clear temporary variables
clearvars('Rank','Identifier','Statement')