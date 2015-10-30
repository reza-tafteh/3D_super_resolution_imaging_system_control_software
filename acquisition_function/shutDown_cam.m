function shutDown_cam(handles, exit) 
% exit = 1; for camera shut down at the end of experiment.
% exit = 0; for camera shut down in the begining to keep only the target
% camera
[ret] = CoolerOFF;
guidata(handles.output, handles);
check_status(handles, ret, 'CoolerOFF', 'Turning off the cooling.');
handles = guidata(handles.output);

[ret] = SetShutter(0,2,0,0);
guidata(handles.output, handles);
check_status(handles, ret, 'SetShutterOff/closing Shutter', 'Closing the shutter.');
handles = guidata(handles.output);

[ret] = AndorShutDown();
guidata(handles.output, handles);
check_status(handles, ret, 'AndorShutDown', 'Camera shutting down.');
handles = guidata(handles.output);

if exit
    daq_initialize(handles,2,0); % release the daq, move the stage to 0um
end

