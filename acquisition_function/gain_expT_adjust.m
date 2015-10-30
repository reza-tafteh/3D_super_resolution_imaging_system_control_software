function gain_expT_adjust(handles,k)
%% k = 0 down, k = 1 up
switch k
    case 0
        if handles.cam.gain  > 5
            handles.cam.gain = handles.cam.gain - 10;
            guidata(handles.output, handles);
            [ret] = SetEMCCDGain(handles.cam.gain);
            check_status(handles, ret, 'SetEMCCDGain');
            handles = guidata(handles.output);
            
            handles.cam.expT = 0.9 * handles.cam.expT;
            %aa = handles.cam.expT;
            %fprintf('aa=%0.0f \n', aa);
            guidata(handles.output, handles);
            [ret] = SetExposureTime(handles.cam.expT);
            check_status(handles, ret, 'SetExposureTime');
            handles = guidata(handles.output);
        else
            handles.cam.expT = 0.8 * handles.cam.expT;
            %aa = handles.cam.expT;
            %fprintf('aa=%0.0f \n', aa);
            guidata(handles.output, handles);
            [ret] = SetExposureTime(handles.cam.expT);
            check_status(handles, ret, 'SetExposureTime');
            handles = guidata(handles.output);
        end
        
    case 1
        if (handles.cam.gain < 150) && (handles.cam.expT>= 0.7)
            handles.cam.gain = handles.cam.gain + 10;
            guidata(handles.output, handles);
            [ret] = SetEMCCDGain(handles.cam.gain);
            check_status(handles, ret, 'SetEMCCDGain');
            handles = guidata(handles.output);
            
            handles.cam.expT = 1.1 * handles.cam.expT;
            guidata(handles.output, handles);
            [ret] = SetExposureTime(handles.cam.expT);
            check_status(handles, ret, 'SetExposureTime');
            handles = guidata(handles.output);
        else
            handles.cam.expT = 1.25 * handles.cam.expT;
            guidata(handles.output, handles);
            [ret] = SetExposureTime(handles.cam.expT);
            check_status(handles, ret, 'SetExposureTime');
            handles = guidata(handles.output);
        end
end
guidata(handles.output, handles);
 
end