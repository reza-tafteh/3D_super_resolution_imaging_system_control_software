function detect_cam(handles)

handles.msgLog = [];
get_available_cam_handles(handles);
handles = guidata(handles.output);

if handles.cam.num_avail_cam
    for i = 2:3  % cam.handles(2-3) refers to the cameras to be shutdown.
        if handles.cam.handles(i)
            ret = SetCurrentCamera(handles.cam.handles(i));
            guidata(handles.output, handles);
            check_status(handles, ret, 'SetCurrentCamera', 'Shutting down the untargeted camera');
            handles = guidata(handles.output);
            
            shutDown_cam(handles, 0);
        end
    end
    if handles.cam.handles(1)
        handles.cam.handle = handles.cam.handles(1);
        [ret]  = SetCurrentCamera(handles.cam.handle);
        guidata(handles.output, handles);
        check_status(handles, ret, 'SetCurrentCamera', 'The camera was set as the current camera.');
        handles = guidata(handles.output);
        pause(3);
        main({handles.cam.name, handles.cam.handles(1)});
        pause(2);
        close(handles.output);
    else
        err_msg = ['Error: couldn''t detect the targeted camera (' num2str(handles.cam.serialNum) ')'];
        errordlg(err_msg, 'Error in camera detection.');
        return;
    end
    
else
    err_msg = ['Error: couldn''t detect any camera (' num2str(handles.cam.serialNum) ')'];
    errordlg(err_msg, 'Error in camera detection.');
    return;
end

end

