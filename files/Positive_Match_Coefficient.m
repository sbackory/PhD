%% Positive Match Coefficient (PMC)  
% Equal weights for (1-1) matches and ignore (0-0) matches
% import the data set as numeric matrix as mentioned previously
% First Execute import_file

% Produce Fig 3 and Fig 7 in article --> Optimising University Web Visibility:
% Strategies Using Wikidata Identifiers and Statements in
% Webometrics Rankings
%%
% For Potential Identifier Variable
figure
DI=Dataset_Identifier; %DI stands for Dataset Identifier
D=DI';
a=0;
b=0;
c=0;
d=0;
S=size(D); p=S(1,2); n=S(1,1);
SCM=zeros(n,n);
for i=1:n
    for t=1:n
    for j=1:p
        if D(i,j)==1 && D(t,j)==1;
            a=a+1;
        elseif D(i,j)==1 && D(t,j)==0;
            b=b+1;
        elseif D(i,j)==0 && D(t,j)==1;
            c=c+1;
        elseif D(i,j)==0 && D(t,j)==0;
            d=d+1;
        else print('incorrect data');
        end
        
    end
    SCM(t,i)=(a)/(a+b+c+d); % Positive Match Coefficient (PMC) 
    a=0;b=0;c=0;d=0;
    end
end
SCM;
w= 100-100*SCM; 
w = w - diag(diag(w)); % to generate square matrix with zero diagonal
y = squareform(w);

subplot(2,2,1)
Z= linkage(y,'single');
cutoff= median([Z(1,3) Z(end,3)]);
dendrogram(Z,'ColorThreshold',cutoff);title('Single');
ylabel('Distance'); xlabel('Identifier');

subplot(2,2,2)
Z= linkage(y,'complete');
cutoff= median([Z(1,3) Z(end,3)]);
dendrogram(Z,'ColorThreshold',cutoff);title('Complete');
ylabel('Distance'); xlabel('Identifier');

subplot(2,2,3)
Z= linkage(y,'average');
cutoff= median([Z(1,3) Z(end,3)]);
dendrogram(Z,'ColorThreshold',cutoff); title('Average');
ylabel('Distance'); xlabel('Identifier');

subplot(2,2,4)
Z= linkage(y,'weighted');
cutoff= median([Z(1,3) Z(end,3)]);
dendrogram(Z,'ColorThreshold',cutoff); title('Weighted')
ylabel('Distance'); xlabel('Identifier');

 
%%
% For Potential Statement Variable
figure 
DS=Dataset_Statement; %DS stands for Dataset Statement
D=DS';
a=0;
b=0;
c=0;
d=0;
S=size(D); p=S(1,2); n=S(1,1);
SCM=zeros(n,n);
for i=1:n
    for t=1:n
    for j=1:p
        if D(i,j)==1 && D(t,j)==1;
            a=a+1;
        elseif D(i,j)==1 && D(t,j)==0;
            b=b+1;
        elseif D(i,j)==0 && D(t,j)==1;
            c=c+1;
        elseif D(i,j)==0 && D(t,j)==0;
            d=d+1;
        else print('incorrect data');
        end
        
    end
    SCM(t,i)=(a)/(a+b+c+d); % Positive Match Coefficient (PMC) 
    a=0;b=0;c=0;d=0;
    end
end
SCM;
w= 100-100*SCM; 
w = w - diag(diag(w)); % to generate square matrix with zero diagonal
y = squareform(w);

subplot(2,2,1)
Z= linkage(y,'single');
cutoff= median([Z(1,3) Z(end,3)]);
dendrogram(Z,'ColorThreshold',cutoff);title('Single');
ylabel('Distance'); xlabel('Statement');

subplot(2,2,2)
Z= linkage(y,'complete');
cutoff= median([Z(1,3) Z(end,3)]);
dendrogram(Z,'ColorThreshold',cutoff);title('Complete');
ylabel('Distance'); xlabel('Statement');

subplot(2,2,3)
Z= linkage(y,'average');
cutoff= median([Z(1,3) Z(end,3)]);
dendrogram(Z,'ColorThreshold',cutoff); title('Average');
ylabel('Distance'); xlabel('Statement');

subplot(2,2,4)
Z= linkage(y,'weighted');
cutoff= median([Z(1,3) Z(end,3)]);
dendrogram(Z,'ColorThreshold',cutoff); title('Weighted')
ylabel('Distance'); xlabel('Statement');

%% Clear temporary variables
clearvars('SCM','Z','y','w','S','a','b','c','d','DI','DS','S','i','j','p','n','t','cutoff','D')




