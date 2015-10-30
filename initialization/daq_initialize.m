function daq_initialize(handles, sr, volt)
%% daqInitialization:  initialize or release an acquisition session 
% and moves the piezo to volt*conversionFactor (um)
%   (4,4,4)um in case of volt = 1
%   (0,0,0)um in case of volt = 0

% INPUT: 
%   sr: start (1) or release (2)
%   volt: voltage

switch sr
    case 1
        handles.stageDaq = daq.createSession('ni');
        handles.stageDaq.addAnalogOutputChannel('Dev1',0:2,'Voltage');
        handles.stageDaq.Rate = 1000;
    case 2
        release(handles.stageDaq);
    otherwise
        handles.msgLog = [handles.msgLog; {'ERROR: wrong sr in daq_initialze finction, sr value should be either 1 or 2'}];
        set(handles.msgLogInitialize_text, 'string', handles.msgLog);
        guidata(handles.output, handles);
end
guidata(handles.output, handles);
move_stage(handles, volt); 
guidata(handles.output, handles);

