function set_acq_mode_parameters(handles)    

handles.cam.acqMode = get(handles.acqMode_ppm, 'value'); 
% 1: Video, 2: Pre-STORM, 3: STORM, 4: Tracking, 5: Calibration, 6:
% Stability

switch handles.cam.acqMode
    case 1 %Video
        handles.cam.file_name = ''; 
        handles.cam.expT = 0.2; 
        handles.cam.gain = 1;
        handles.cam.acqModeIndex = 5; % 1:single, 3:kinetics; 5:until abort
        handles.cam.setSpool = 0;

    case 2 %PreSTORM
        handles.cam.file_name = 'PreSTORM';
        handles.cam.expT = 0.5;
        handles.cam.seriesLength = 1; 
        handles.cam.gain = 1;
        handles.cam.acqModeIndex = 3; % 1:single
        handles.cam.setSpool = 1;

    case 3  %STORM
        handles.cam.file_name = 'STORM';
        handles.cam.expT = 0.02;%str2double(get(handles.expT_edit,'string'));%0.02;%str2double(get(handles.expT_edit,'string'));%0.02;  
        %expT_temp = handles.cam.expT
        handles.cam.seriesLength = 40000;%str2double(get(handles.seriesLength_edit, 'string'));%100000;
        handles.cam.gain = 300;%str2double(get(handles.gain_edit,'string'));
        %gain_temp = handles.cam.gain
        handles.cam.acqModeIndex = 3; % 3: kinetic
        handles.cam.setSpool = 1;
        
    case 4 %Tracking
        handles.cam.file_name = '';
        handles.cam.expT = 0.1;
        handles.cam.seriesLength = 30000;
        handles.cam.gain = 11;
        handles.cam.acqModeIndex = 1; % 1:single, 3:kinetics; 5:until abort
        handles.cam.setSpool = 0;
        handles.cam.zCoef = load('p_z_Rxy.dat');
        %handles.cam.zCoef = fliplr(handles.cam.zCoef);
        
        
        
    case 5  %z-calibration
        handles.cam.file_name = 'cal.tif';
        handles.cam.expT = 0.1;
        handles.cam.seriesLength = str2double(get(handles.seriesLength_edit, 'string'));
        handles.cam.gain = str2double(get(handles.gain_edit, 'string')); 
        if handles.cam.trig == 0
            handles.cam.acqModeIndex = 1; % 1:single, 3:kinetics; 5:until abort
        else
            handles.cam.acqModeIndex = 3; % 1:single, 3:kinetics; 5:until abort
        end
        handles.cam.setSpool = 0;
        handles.cam.zStep = str2double(get(handles.zStep_edit, 'string'));
%         trig_val = get(handles.trig_ppm, 'value');
%         switch trig_val
%             case 1
%                 handles.cam.trig = 0; % 0: internal start
%             case 2
%                 'ext';
%                 handles.cam.trig = 6; % 6: external start
%         end
     
    case 6
        
        
    case 7  %UserVideo
        handles.cam.file_name = '';
        handles.cam.expT = str2double(get(handles.expT_edit,'string'));
        handles.cam.gain = str2double(get(handles.gain_edit,'string'));
        handles.cam.acqModeIndex = 5; % 1:single, 3:kinetics; 5:until abort
        handles.cam.setSpool = 0; 
        
    case 8 %TrackingVideo
        handles.cam.file_name = '';
        handles.cam.expT = 0.2;
        handles.cam.gain = 11;
        handles.cam.acqModeIndex = 5; % 1:single, 3:kinetics; 5:until abort
        handles.cam.setSpool = 0;
        handles.cam.zCoef = load('p_z_Rxy.dat');
        %handles.cam.zCoef = fliplr(handles.cam.zCoef);
        
end

guidata(handles.output, handles);
set(handles.expT_edit,'string', num2str(handles.cam.expT));
set(handles.seriesLength_edit,'string', num2str(handles.cam.seriesLength));
set(handles.gain_edit,'string', num2str(handles.cam.gain));
handles.path_full = fullfile(handles.path, handles.cam.file_name);
guidata(handles.output, handles);

[ret] = SetAcquisitionMode(handles.cam.acqModeIndex); % 5: till until abort mode
check_status(handles, ret, 'SetAcquisitionMode');
handles = guidata(handles.output);

[ret] = SetReadMode(4); % 4: image
check_status(handles, ret, 'SetAcquisitionMode');
handles = guidata(handles.output);

[ret] = SetShutter(0,1,0,0);
check_status(handles, ret, 'SetShutter');
handles = guidata(handles.output);

if handles.cam.acqModeIndex == 3  % excluding 'until abort' mode
    [ret] = SetNumberKinetics(handles.cam.seriesLength);
    check_status(handles, ret, 'SetNumberKinetics');
    handles = guidata(handles.output);
end

aa = handles.cam.trig
[ret] = SetTriggerMode(handles.cam.trig) 
check_status(handles, ret, 'SetTriggerMode');
handles = guidata(handles.output);


[ret] = SetExposureTime(handles.cam.expT);
check_status(handles, ret, 'SetExposureTime');
handles = guidata(handles.output);

[ret] = SetKineticCycleTime(0);
check_status(handles, ret, 'SetKineticCycleTime');
handles = guidata(handles.output);

[ret]  = SetFrameTransferMode(1);
check_status(handles, ret, 'SetFrameTransferMode');
handles = guidata(handles.output);

[ret] = SetEMCCDGain(handles.cam.gain); 
check_status(handles, ret, 'SetEMCCDGain');
handles = guidata(handles.output);

[ret] = SetImage(1, 1, 1, 512, 1, 512);
check_status(handles, ret, 'SetImage');
handles = guidata(handles.output);

[ret, handles.cam.realExposureTime, handles.cam.realAccTime, ...
    handles.cam.realKineticsTime] = GetAcquisitionTimings;
check_status(handles, ret, 'GetAcquisitionTimings');

set(handles.image, 'CDataMapping', 'scaled');
axis image xy;
map = zeros(101,3);

switch handles.cam.name
    case 'Alexa647_7140'
        %map(1:101, 1) = (0:0.01:1);
        colormap hot;%(map); 
    case 'Alexa532_6816'
        map(1:101, 2) = (0:0.01:1);
        colormap(map);
    case 'Tracking_7508'
        colormap jet;
end

guidata(handles.output, handles);
end