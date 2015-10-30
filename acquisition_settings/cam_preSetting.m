function cam_preSetting(handles)
%% sets the camera parameters which will be kept as set during the acquisiton

handles.cam.setT = str2double(get(handles.setT_edit, 'string'));
[ret] = SetTemperature(handles.cam.setT);
guidata(handles.output, handles);
check_status(handles, ret, 'SetTemperature');
handles = guidata(handles.output);

[ret] = CoolerON;
check_status(handles, ret, 'CoolerON');

[ret, handles.cam.xPixel, handles.cam.yPixel] = GetDetector;
check_status(handles, ret, 'GetDetector');

% [cam.ret] = SetShutter(0,1,0,0); 
% check_status(handles, cam.ret, 'SetShutter');

% Horizonatal Shift Speed: 0-3, 0 is the index for 17MHz
[ret] = SetHSSpeed(0,0);
check_status(handles, ret, 'SetHSSpeed');
% Pre-Amplifier Gain: 0-2, 2 is the index for Gain3 in Solis software
[ret] = SetPreAmpGain(2);
check_status(handles, ret, 'SetPreAmpGain');
% Vertical Shift Speed: 0-4, 2 is the index for VSS of 0.9
[ret] = SetVSSpeed(2);
check_status(handles, ret, 'SetVSSpeed');
% Vertical clocl voltage amp;litude: 0-4, 0 for normal and others for +1 to +4
[ret] = SetVSAmplitude(0);
check_status(handles, ret, 'SetVSAmplitude');
% triggering mode
[ret] = SetTriggerMode(0); % 0: internal triggering
check_status(handles, ret, 'SetTriggerMode');

[ret]  = SetFrameTransferMode(1);
check_status(handles, ret, 'SetFrameTransferMode');

guidata(handles.output, handles);

end






