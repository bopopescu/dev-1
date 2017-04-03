function y = loadLabels(instances)
%LOADLABELS load class labels
%
% y = loadLabels(instances)
%
% Given a training or test data instances, loadLabels read classlabels and
% returns in an array.
%
% Examples:
%
% y = loadLabels(instances)
%
% See also:
% INSTANCE
% LOADINSTANCES
N = length(instances);
y = zeros(1,N);
for k = 1 : N
    if strcmp(instances(k).info.classlabel, 'knuckle')
        y(k) = 1;
    end
end
end