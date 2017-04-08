function instances = loadInstances(dataDir)
%LOADINSTANCES function for loading raw data instances
%
% instances = loadInstances(dataDir)
%
% Given a training or test data directory as an input, loadInstances read
% all raw data under the directory, and returns an array of Instance class
% objects.
%
% Examples:
%
% train_instances = loadInstances('../task_data/train')
% test_instances = loadInstances('../task_data/test')
%
% See also:
% INSTANCE

userDirs = listDirs(dataDir);
instances=Instance.empty;
count = 1;

for k = 1 : length(userDirs)
    if strncmpi(userDirs(k).name, 'hand', 4) || strncmpi(userDirs(k).name, 'table', 5)
        instanceDirs = listDirs(fullfile(dataDir, userDirs(k).name));
        for l = 1 : length(instanceDirs)
            if ~strncmpi(instanceDirs(l).name, '.', 1)
                instances(count) = Instance(fullfile(dataDir, userDirs(k).name, instanceDirs(l).name));
                count = count + 1;
            end
        end
    end
end
end

function subDirs = listDirs(dataDir)
    files = dir(dataDir);
    subDirs = files([files.isdir]);
end