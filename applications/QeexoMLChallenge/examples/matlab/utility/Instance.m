classdef Instance
    % Instance class represents set of raw data collected per data instance
    properties(GetAccess = 'public', SetAccess = 'private')
        audio;
        touch;
        info;
    end
    methods
        function obj = Instance(instanceDir)
        % constructor
            obj.audio = Instance.loadAudio(instanceDir);
            obj.touch = Instance.loadTouchData(instanceDir);
            obj.info = Instance.loadInstanceInfo(instanceDir);
        end
    end
    methods (Static = true)
        function audio = loadAudio(instanceDir)
        % load audio data
            audio = audioread(fullfile(instanceDir, 'audio.wav'));
        end
        function touch = loadTouchData(instanceDir)
        % load touch data
            touch = readtable(fullfile(instanceDir, 'touch.csv'));
        end
        function info = loadInstanceInfo(instanceDir)
        % load touch info
            [dirname, basename] = fileparts(instanceDir);
            basenameSplit = strsplit(basename, '-');
            if length(basenameSplit) == 2
                classlabel = basenameSplit{2};
            else
                classlabel = NaN;
            end
            [parentDirname, parentBasename] = fileparts(dirname);            
            parentBasenameSplit = strsplit(parentBasename, '-');
            info = struct('surface', parentBasenameSplit{1},'user', parentBasenameSplit{2}, 'timestamp', basenameSplit{1}, 'classlabel', classlabel);
        end
    end
end