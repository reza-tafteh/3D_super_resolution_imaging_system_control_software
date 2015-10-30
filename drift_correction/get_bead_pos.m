function get_bead_pos(handles)

axes(handles.imAxes);
[handles.cam.beadPosY, handles.cam.beadPosX] = ginput;
% x = handles.cam.beadPosX
% y = handles.cam.beadPosY
handles.cam.beadPosX = round(handles.cam.beadPosX);
handles.cam.beadPosY = round(handles.cam.beadPosY);
[handles.cam.numberOfBeads,~] = size(handles.cam.beadPosX);
guidata(handles.output, handles);
