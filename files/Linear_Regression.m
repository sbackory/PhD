% Sample data
Rank = Dataset_Trend(:,1);
Identifier = Dataset_Trend(:,2);
Statement = Dataset_Trend(:,3); 

%% Linear Regression between Rank vs Identifiers
figure

% Perform linear regression
p = polyfit(Rank, Identifier, 1);   % 1 = degree (linear)

% Get slope and intercept
slope = p(1);
intercept = p(2);

% Predicted values (Generate fitted line)
y_fit = polyval(p,Rank);

% Display results
disp(['Slope: ', num2str(slope)])
disp(['Intercept: ', num2str(intercept)])

% Plot data and fitted line
scatter(Rank, Identifier, 'filled')
hold on
plot(Rank, y_fit, 'r', 'LineWidth', 2)

% Create equation text
eqn = sprintf('y = %.2fx + %.2f', slope, intercept);

% Display equation on graph
text(min(Rank), max(Identifier), eqn, 'FontSize', 12, 'Color', 'blue')

ylabel('No. of Identifiers')
xlabel('Rank')
title('Linear Regression')
legend('Data', 'Fitted Line')
grid on

%% Linear Regression between Rank vs Statements
figure

% Perform linear regression
p = polyfit(Rank, Statement, 1);   % 1 = degree (linear)

% Get slope and intercept
slope = p(1);
intercept = p(2);

% Predicted values (Generate fitted line)
y_fit = polyval(p,Rank);

% Display results
disp(['Slope: ', num2str(slope)])
disp(['Intercept: ', num2str(intercept)])

% Plot data and fitted line
scatter(Rank, Statement, 'filled')
hold on
plot(Rank, y_fit, 'r', 'LineWidth', 2)

% Create equation text
eqn = sprintf('y = %.2fx + %.2f', slope, intercept);

% Display equation on graph
text(min(Rank), max(Statement), eqn, 'FontSize', 12, 'Color', 'blue')

ylabel('No. of Statements')
xlabel('Rank')
title('Linear Regression')
legend('Data', 'Fitted Line')
grid on

%% Linear Regression between Identifier vs Statements
figure

% Perform linear regression
p = polyfit(Statement, Identifier, 1);   % 1 = degree (linear)

% Get slope and intercept
slope = p(1);
intercept = p(2);

% Predicted values (Generate fitted line)
y_fit = polyval(p,Statement);

% Display results
disp(['Slope: ', num2str(slope)])
disp(['Intercept: ', num2str(intercept)])

% Plot data and fitted line
scatter(Statement, Identifier, 'filled')
hold on
plot(Statement, y_fit, 'r', 'LineWidth', 2)

% Create equation text
eqn = sprintf('y = %.2fx + %.2f', slope, intercept);

% Display equation on graph
text(min(Statement), max(Identifier), eqn, 'FontSize', 12, 'Color', 'blue')

ylabel('No. of Identifiers')
xlabel('No. of Statements')
title('Linear Regression')
legend('Data', 'Fitted Line')
grid on

%% Clear temporary variables
clearvars('eqn','slope','intercept','Identifier','Statement',...
    'Rank','y_fit','p')
