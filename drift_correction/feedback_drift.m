function feedback_drift(handles,i)

%global drift stageDaq daqVol newton averageError newtonTime
%avCoef(1:3) = 0.5;

% if i==1
%     averageError(1:3) = 0;
% else
%     averageError(1) = 0.95*averageError(1)+0.05*drift(i,end-2);
%     averageError(2) = 0.95*averageError(2)+0.05*drift(i,end-1);
%     averageError(3) = 0.95*averageError(3)+0.05*drift(i,end);
% end
% 
% aveCoef = 0;

% if abs(drift(i,end-2))>= 3
%     gain(1) = 1.;
% else
%     gain(1) = 0.5; %.0.35
% end

if abs(handles.cam.drift(i,end-2))>= 50
    gain(1) = 1;
elseif abs(handles.cam.drift(i,end-2))>= 30
    gain(1) = 1;%0.9;
elseif abs(handles.cam.drift(i,end-2))>= 10
    gain(1) = 1;%0.85;       
elseif abs(handles.cam.drift(i,end-2))>= 5
    gain(1) = 1;%0.7; 
else
    gain(1) = 1.3; 
end

% if abs(drift(i,end-1))>= 3
%     gain(2) = 1;
% else
%     gain(2) = 0.5; %0.35
% end

if abs(handles.cam.drift(i,end-1))>= 50
    gain(2) = 1;
elseif abs(handles.cam.drift(i,end-1))>= 30
    gain(2) = 1;%0.9;
elseif abs(handles.cam.drift(i,end-1))>= 10
    gain(2) = 1;%0.85;       
elseif abs(handles.cam.drift(i,end-1))>= 5
    gain(2) = 1;%0.7; 
else
    gain(2) = 1.3; 
end




if abs(handles.cam.drift(i,end))>= 50
    gain(3) = 1;
elseif abs(handles.cam.drift(i,end))>= 30
    gain(3) = 1;%0.9; %0.8
elseif abs(handles.cam.drift(i,end))>= 10
    gain(3) = 1;%0.8; % 0.6       
elseif abs(handles.cam.drift(i,end))>= 5
    gain(3) = 1;%0.75; % 0.5
else
    gain(3) = 1; % 1.2
end


volt(1,1) = handles.daqVol(1,1) + handles.cam.nmToVolt*gain(1)*handles.cam.drift(i,end-1);  % imaging cams: -
volt(1,2) = handles.daqVol(1,2) + handles.cam.nmToVolt*gain(2)*handles.cam.drift(i,end-2);
volt(1,3) = handles.daqVol(1,3) - handles.cam.nmToVolt*gain(3)*handles.cam.drift(i,end);
handles.cam.trackingTime(i,1:6) = datevec(now);
guidata(handles.output, handles);

% if (handles.cam.expT < 0.3)
%     [ret] = SetAcquisitionMode(2); % 2: Accumulation mode
%     check_status(handles, ret, 'SetAcquisitionMode');
%     handles = guidata(handles.output);
%     
%     [ret] = SetNumberAccumulations(3);
%     check_status(handles, ret, 'SetNumberAccumulations');
%     handles = guidata(handles.output);
% end

if (max(volt(:))<4.5) && (min(volt(:))>0.2)
    move_stage(handles, volt);
    handles = guidata(handles.output);
    %     if handles.cam.expT > 0.4
    %         move_stage(handles, volt);
    %         %handles.cam.image = int32(zeros(handles.cam.xPixel, handles.cam.yPixel));
    %         handles = guidata(handles.output);
    %     else
    %         handles.cam.feedExpCounter = handles.cam.feedExpCounter + 1;
    %         if fix(handles.cam.feedExpCounter/3) == 1
    %             move_stage(handles, volt);
    %             %handles.cam.image = int32(zeros(handles.cam.xPixel, handles.cam.yPixel));
    %             handles = guidata(handles.output);
    %             handles.cam.feedExpCounter = 0;
    %         end
    %     end
else
    msg = 'Voltage OUT OF RANGE .. No input given to the piezo';
    handles.msgLog = [handles.msgLog; {msg}];
    set(handles.msgLogInitialize_text, 'String', flipud(handles.msgLog));
end
handles.cam.trackingTime(i,8:13) = datevec(now);
guidata(handles.output, handles);


