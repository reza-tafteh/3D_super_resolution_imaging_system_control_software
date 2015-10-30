function get_available_cam_handles(handles)

%% ixonInitialization
% - detects all available cameras
% - initializes iXon camera
% - saves the camera's handle
% - sets parametes such as HSSpeed, VSspedd, shuuter ...
%% Set path for Andor camera files. This is necessary to make SDK functions work properly

addpath(fullfile(matlabroot,'toolbox','Andor'));
path = fullfile(matlabroot,'toolbox','Andor','Camera Files','atmcd64d.dll');
installpath = fullfile(matlabroot,'toolbox','Andor','Camera Files');
cd(installpath);

%% Detect all available cameras

[ret, handles.cam.num_avail_cam] = GetAvailableCameras;
guidata(handles.output, handles);
check_status(handles, ret, 'GetAvailableCameras');
handles = guidata(handles.output);

msg = ['Total number of detected cameras: ' num2str(handles.cam.num_avail_cam)];
handles.msgLog = [handles.msgLog; {msg}];
set(handles.msgLogInitialize_text, 'String', handles.msgLog);

%% Obtaie camera handle => necessary as handles may vary from time to time

handles.cam.handles = zeros(1,3);
j = 2;
%cam.NIR_handle = 0; cam.red_handle = 0; cam.orange_handle = 0;

if handles.cam.num_avail_cam >=1
    
    for i = 0:handles.cam.num_avail_cam-1
        
        [ret, handle_temp] = GetCameraHandle(i);
        guidata(handles.output, handles);
        check_status(handles, ret, 'GetCameraHandle');
        handles = guidata(handles.output);
        
        [ret] = SetCurrentCamera(handle_temp); 
        guidata(handles.output, handles);
        check_status(handles, ret, 'SetCurrentCamera');
        handles = guidata(handles.output);
        
        [ret] = AndorInitialize(path);
        guidata(handles.output, handles);
        check_status(handles, ret, 'AndorInitialize');
        handles = guidata(handles.output);
        
        if ret == 20002
            [ret, sn_temp] = GetCameraSerialNumber;
            check_status(handles, ret, 'GetCameraSerialNumber');
            if sn_temp == handles.cam.serialNum
                handles.cam.handles(1) = handle_temp;
                handles.msgLog = [handles.msgLog; {'The target camera was detected.'}];
                set(handles.msgLogInitialize_text, 'String', handles.msgLog);
            else
                handles.cam.handles(j) = handle_temp;
                handles.msgLog = [handles.msgLog; {'Another camera detected.'}];
                set(handles.msgLogInitialize_text, 'String', handles.msgLog);
                j = j+1;
            end
            
            switch sn_temp
                case 7140  % NIR
                    handles.msgLog = [handles.msgLog; {'7140_Alexa647'}];
                    set(handles.msgLogInitialize_text, 'String', handles.msgLog);
                case 6816  % Red
                    handles.msgLog = [handles.msgLog; {'6816_Alexa532'}];
                    set(handles.msgLogInitialize_text, 'String', handles.msgLog);
                case 7508  % Orange
                    handles.msgLog = [handles.msgLog; {'7508_Tracking'}];
                    set(handles.msgLogInitialize_text, 'String', handles.msgLog);
            end
   
        else
            handles.msgLog = [handles.msgLog; {'Error with initialization, no camera detected => turn on the cameras'}];
            set(handles.msgLogInitialize_text, 'String', handles.msgLog);
        end
    end
end

guidata(handles.output, handles);

% if handles.cam.handles(1) == 0
%     err_msg = ['Error: couldn''t detect the targeted camera (' num2str(handles.cam.serialNum) ')']; 
%     errordlg(err_msg, 'Error in camera detection.');
%     return;
% end


    





        
    
    
    
    
    
    
