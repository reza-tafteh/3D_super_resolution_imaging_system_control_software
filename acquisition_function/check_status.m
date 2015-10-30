function check_status(handles, ret, errMessage, progress)
%% checkStatus checks potential errors in returns from SDK commands
% INPUT: 
%     - ret: return form SDK command (integer)
%     - errMessage: a string indicating the SDK command, e.g. 'GetAvailableCameras'
%     - progress: a string showing the progress, e.g. 'Getting available cameras'


if ret == 20002
    if nargin > 3
        handles.msgLog = [handles.msgLog; {progress}];
        set(handles.msgLogInitialize_text, 'String', flipud(handles.msgLog));
        guidata(handles.output, handles);
    end
    return
else
    msg = ['ERROR: ' errMessage];
    handles.msgLog = [handles.msgLog; {msg}];
    set(handles.msgLogInitialize_text, 'String', flipud(handles.msgLog));
end

guidata(handles.output, handles);