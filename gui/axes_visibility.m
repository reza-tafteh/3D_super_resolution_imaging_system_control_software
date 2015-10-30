function axes_visibility(handles,type)

switch type
    
    case 1 % video, userVideo, record, calibration
        handles.cam.axStat.imAxes = 'on';
        handles.cam.axStat.beadVid = 'off';
        handles.cam.axStat.beadVidFit = 'off';
        handles.cam.axStat.beadRec1 = 'off';
        handles.cam.axStat.beadRecFit1 = 'off';
        handles.cam.axStat.beadRec2 = 'off';
        handles.cam.axStat.beadRecFit2 = 'off';
        handles.cam.axStat.beadRec3 = 'off';
        handles.cam.axStat.beadRecFit3 = 'off';
        handles.cam.axStat.beadRec4 = 'off';
        handles.cam.axStat.beadRecFit4 = 'off';
        handles.cam.axStat.beadRec5 = 'off';
        handles.cam.axStat.beadRecFit5 = 'off';
        handles.cam.axStat.beadRec6 = 'off';
        handles.cam.axStat.beadRecFit6 = 'off';
        handles.cam.axStat.beadRec7 = 'off';
        handles.cam.axStat.beadRecFit7 = 'off';
        handles.cam.axStat.beadRec8 = 'off';
        handles.cam.axStat.beadRecFit8 = 'off';
        
    case 2 % trackingVideo
        handles.cam.axStat.imAxes = 'off';
        handles.cam.axStat.beadVid = 'on';
        handles.cam.axStat.beadVidFit = 'on';
        handles.cam.axStat.beadRec1 = 'off';
        handles.cam.axStat.beadRecFit1 = 'off';
        handles.cam.axStat.beadRec2 = 'off';
        handles.cam.axStat.beadRecFit2 = 'off';
        handles.cam.axStat.beadRec3 = 'off';
        handles.cam.axStat.beadRecFit3 = 'off';
        handles.cam.axStat.beadRec4 = 'off';
        handles.cam.axStat.beadRecFit4 = 'off';
        handles.cam.axStat.beadRec5 = 'off';
        handles.cam.axStat.beadRecFit5 = 'off';
        handles.cam.axStat.beadRec6 = 'off';
        handles.cam.axStat.beadRecFit6 = 'off';
        handles.cam.axStat.beadRec7 = 'off';
        handles.cam.axStat.beadRecFit7 = 'off';
        handles.cam.axStat.beadRec8 = 'off';
        handles.cam.axStat.beadRecFit8 = 'off';
        
    case 3 % tracking
        handles.cam.axStat.imAxes = 'off';
        handles.cam.axStat.beadVid = 'off';
        handles.cam.axStat.beadVidFit = 'off';
        
        handles.cam.axStat.beadRec1 = 'on'; % first one is always one, at least one bead exists always.
        handles.cam.axStat.beadRecFit1 = 'on';
        
        if handles.cam.numberOfBeads >1
            handles.cam.axStat.beadRec2 = 'on';
            handles.cam.axStat.beadRecFit2 = 'on';
        else
            handles.cam.axStat.beadRec2 = 'off';
            handles.cam.axStat.beadRecFit2 = 'off';
        end
        
        if handles.cam.numberOfBeads >2
            handles.cam.axStat.beadRec3 = 'on';
            handles.cam.axStat.beadRecFit3 = 'on';
        else
            handles.cam.axStat.beadRec3 = 'off';
            handles.cam.axStat.beadRecFit3 = 'off';
        end
        
        if handles.cam.numberOfBeads >3
            handles.cam.axStat.beadRec4 = 'on';
            handles.cam.axStat.beadRecFit4 = 'on';
        else
            handles.cam.axStat.beadRec4 = 'off';
            handles.cam.axStat.beadRecFit4 = 'off';
        end
        
        if handles.cam.numberOfBeads >4
            handles.cam.axStat.beadRec5 = 'on';
            handles.cam.axStat.beadRecFit5 = 'on';
        else
            handles.cam.axStat.beadRec5 = 'off';
            handles.cam.axStat.beadRecFit5 = 'off';
        end
        
        if handles.cam.numberOfBeads >5
            handles.cam.axStat.beadRec6 = 'on';
            handles.cam.axStat.beadRecFit6 = 'on';
        else
            handles.cam.axStat.beadRec6 = 'off';
            handles.cam.axStat.beadRecFit6 = 'off';
        end
        
        if handles.cam.numberOfBeads >6
            handles.cam.axStat.beadRec7 = 'on';
            handles.cam.axStat.beadRecFit7 = 'on';
        else
            handles.cam.axStat.beadRec7 = 'off';
            handles.cam.axStat.beadRecFit7 = 'off';
        end
        
        if handles.cam.numberOfBeads >7
            handles.cam.axStat.beadRec8 = 'on';
            handles.cam.axStat.beadRecFit8 = 'on';
        else
            handles.cam.axStat.beadRec8 = 'off';
            handles.cam.axStat.beadRecFit8 = 'off';
        end
end

set(handles.imAxes, 'visible', handles.cam.axStat.imAxes);
set(allchild(handles.imAxes), 'visible', handles.cam.axStat.imAxes);


set(allchild(handles.beadVid), 'visible', handles.cam.axStat.beadVid);
set(handles.beadVid, 'visible', handles.cam.axStat.beadVid);

set(allchild(handles.beadVidFit), 'visible', handles.cam.axStat.beadVidFit);
set(handles.beadVidFit, 'visible', handles.cam.axStat.beadVidFit);

set(allchild(handles.beadRec1), 'visible', handles.cam.axStat.beadRec1);
set(handles.beadRec1, 'visible', handles.cam.axStat.beadRec1);

set(allchild(handles.beadRecFit1), 'visible', handles.cam.axStat.beadRecFit1);
set(handles.beadRecFit1, 'visible', handles.cam.axStat.beadRecFit1);

set(allchild(handles.beadRec2), 'visible', handles.cam.axStat.beadRec2);
set(handles.beadRec2, 'visible', handles.cam.axStat.beadRec2);

set(allchild(handles.beadRecFit2), 'visible',handles.cam.axStat.beadRecFit2);
set(handles.beadRecFit2, 'visible', handles.cam.axStat.beadRecFit2);

set(allchild(handles.beadRec3), 'visible', handles.cam.axStat.beadRec3);
set(handles.beadRec3, 'visible', handles.cam.axStat.beadRec3);

set(allchild(handles.beadRecFit3), 'visible', handles.cam.axStat.beadRecFit3);
set(handles.beadRecFit3, 'visible', handles.cam.axStat.beadRecFit3);

set(allchild(handles.beadRec4), 'visible', handles.cam.axStat.beadRec4);
set(handles.beadRec4, 'visible', handles.cam.axStat.beadRec4);

set(allchild(handles.beadRecFit4), 'visible', handles.cam.axStat.beadRecFit4);
set(handles.beadRecFit4, 'visible', handles.cam.axStat.beadRecFit4);

set(allchild(handles.beadRec5), 'visible', handles.cam.axStat.beadRec5);
set(handles.beadRec5, 'visible', handles.cam.axStat.beadRec5);

set(allchild(handles.beadRecFit5), 'visible', handles.cam.axStat.beadRecFit5);
set(handles.beadRecFit5, 'visible', handles.cam.axStat.beadRecFit5);

set(allchild(handles.beadRec6), 'visible', handles.cam.axStat.beadRec6);
set(handles.beadRec6, 'visible', handles.cam.axStat.beadRec6);

set(allchild(handles.beadRecFit6), 'visible', handles.cam.axStat.beadRecFit6);
set(handles.beadRecFit6, 'visible', handles.cam.axStat.beadRecFit6);

set(allchild(handles.beadRec7), 'visible', handles.cam.axStat.beadRec7);
set(handles.beadRec7, 'visible', handles.cam.axStat.beadRec7);

set(allchild(handles.beadRecFit7), 'visible', handles.cam.axStat.beadRecFit7);
set(handles.beadRecFit7, 'visible', handles.cam.axStat.beadRecFit7);

set(allchild(handles.beadRec8), 'visible', handles.cam.axStat.beadRec8);
set(handles.beadRec8, 'visible', handles.cam.axStat.beadRec8);

set(allchild(handles.beadRecFit8), 'visible', handles.cam.axStat.beadRecFit8);
set(handles.beadRecFit8, 'visible', handles.cam.axStat.beadRecFit8);

guidata(handles.output, handles);

end