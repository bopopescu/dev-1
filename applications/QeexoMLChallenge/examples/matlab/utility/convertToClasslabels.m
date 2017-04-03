function classlabels = convertToClasslabels(y)
%
% convert numeric class labels to strings
%
N = length(y);
classlabels = cell(1, N);
labels = {'pad', 'knuckle'};
for k = 1 : N
    classlabels{k} = labels{y(k)+1};
end
end