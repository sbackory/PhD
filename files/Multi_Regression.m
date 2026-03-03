% Example data (replace with your real data)
Rank = Dataset_Trend(:,1);          % Dependent variable
Identifier = Dataset_Trend(:,2);    % Independent variable 1
Statement = Dataset_Trend(:,3);     % Independent variable 2

%%
% Combine independent variables into matrix
X = [Identifier Statement];

% Run multiple regression
mdl = fitlm(X, Rank);

% Display results
disp(mdl)

% Get coefficients
coeff = mdl.Coefficients.Estimate;

a  = coeff(1);   % Intercept
b1 = coeff(2);   % Identifier coefficient
b2 = coeff(3);   % Statement coefficient

% Display equation
fprintf('Regression Equation:\n')
fprintf('Rank = %.3f + %.3f*(Identifier) + %.3f*(Statement)\n', a, b1, b2)

%% Clear temporary variables
clearvars('a','b1','b2','coeff','Statement',...
    'Rank','X','mdl','Identifier')