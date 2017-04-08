function writeResults(timestamps, classlabels, filename)
%WRITERESULTS write classification results to an output file
%
% writeResults(timestamps, classlabels, filename)
%
% An utility function to save classification results
%
% Examples:
%
% writeResults(timestamps, classlabels, filename)
%

N = length(timestamps);
if N ~= length(classlabels)
    error('The number of timestamps and classlabels does not match.')
end
fid = fopen(filename, 'w');
fprintf(fid, 'timestamp,label\n');
for k = 1 : N
    fprintf(fid, '%s,%s\n', timestamps{k}, classlabels{k});
end
fclose(fid) ;
end