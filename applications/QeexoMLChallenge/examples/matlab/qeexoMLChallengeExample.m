function qeexoMLChallengeExample()
% an example of performing a simple classification with Qeexo ML Challenge
% data set

% add utility to MATLAB path
addpath('./utility')

% prepare training data
train_instances = loadInstances('../../data/train');
X_train = generateFeatures(train_instances);
y_train = loadLabels(train_instances);

% build a model
model = trainModel(X_train, y_train);

% prepare test data
test_instances = loadInstances('../../data/test');
X_test = generateFeatures(test_instances);
timestamps = loadTimestamps(test_instances);

% predict
y_test = testModel(X_test, model);
classlabels = convertToClasslabels(y_test);

% save results
writeResults(timestamps, classlabels, './fingersense-test-labels.csv');

end

function X = generateFeatures(instances)
% generate features
N = length(instances);
X = zeros(N, length(instances(1).audio));
for l = 1 : N
    X(l, :) = instances(l).audio;
end
end

function model = trainModel(X, y)
% train a model (1 nearest neighbor)
model = {X, y};
end


function y_test = testModel(X_test, model)
% test a model (1 nearest neighbor)
X_train = model{1};
y_train = model{2};
N_train = length(X_train);
N = length(X_test);
y_test = zeros(N, 1);
for k = 1 : N
    [~, argmin]=min(sum((X_train-repmat(X_test(k,:), N_train, 1)).^2, 2).^0.5);
    y_test(k) = y_train(argmin);
end
end
