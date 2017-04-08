function timestamps = loadTimestamps(instances)
%LOADTIMESTAMPS load timestamps from an array of Instance class objects
%
% timestamps = loadTimestamps(instances)
%
% Given a training or test data instances, loadTimestamps read timestamps and
% returns in an array.
%
% Examples:
%
% timestamps = loadTimestamps(instances)
%
% See also:
% INSTANCE
% LOADINSTANCES
N = length(instances);
timestamps = cell(1, N);
for k = 1 : N
    timestamps{k} = instances(k).info.timestamp;
end
end