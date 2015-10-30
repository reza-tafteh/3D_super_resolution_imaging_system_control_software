function multiple_beads_fit(handles, i, XMesh, YMesh, XYMesh)

%global drift newton fitError targetPos

%[xDrift, yDrift, zDrift] = deal(0,0,0);
handles.cam.useBead = ones(1,handles.cam.numberOfBeads); % initially assuming all beads are usable
actDriftX = zeros(1,handles.cam.numberOfBeads);
actDriftY = actDriftX;
actDriftZ = actDriftX;
guidata(handles.output, handles);

if i <= handles.cam.numOfAccFeed  % accumulation for the first 10 frames
    handles.cam.numOfAccFeed_real = handles.cam.numOfAccFeed_real + 1;
    for j = 1:handles.cam.numberOfBeads
        bead_nlinfit(handles, i, j, XMesh, YMesh, XYMesh);
        handles = guidata(handles.output);
        handles.cam.targetPos.x(j) =  handles.cam.targetPos.x(j) + handles.cam.drift(i,6*j-5);
        handles.cam.targetPos.y(j) =  handles.cam.targetPos.y(j) + handles.cam.drift(i,6*j-4);
        handles.cam.targetPos.z(j) =  handles.cam.targetPos.z(j) + handles.cam.drift(i,6*j-2);
        guidata(handles.output, handles);
        if i == handles.cam.numOfAccFeed
            handles.cam.targetPos.x(j) = handles.cam.targetPos.x(j) / handles.cam.numOfAccFeed_real;
            handles.cam.targetPos.y(j) = handles.cam.targetPos.y(j) / handles.cam.numOfAccFeed_real;
            handles.cam.targetPos.z(j) = handles.cam.targetPos.z(j) / handles.cam.numOfAccFeed_real;
            guidata(handles.output, handles);
        end
    end
    handles.cam.drift(i,end-2:end) = 0; % no feedback for the first 5 newton acq
    guidata(handles.output, handles);
    
else
    for j = 1:handles.cam.numberOfBeads
        bead_nlinfit(handles,i, j, XMesh, YMesh, XYMesh);
        handles = guidata(handles.output);
        actDriftX(j) = handles.cam.drift(i,6*j-5) - handles.cam.targetPos.x(j);
        actDriftY(j) = handles.cam.drift(i,6*j-4) - handles.cam.targetPos.y(j);
        actDriftZ(j) = handles.cam.drift(i,6*j-2) - handles.cam.targetPos.z(j);
        guidata(handles.output, handles);
    end
    
    driftX_mean = mean(actDriftX);
    driftX_std = std(actDriftX);
    driftY_mean = mean(actDriftY);
    driftY_std = std(actDriftY);
    driftZ_mean = mean(actDriftZ);
    driftZ_std = std(actDriftZ);
    
    % bead rejection according to drift
    for j = 1:handles.cam.numberOfBeads
        boolX = (actDriftX(j) > driftX_mean + driftX_std) || (actDriftX(j) < driftX_mean - driftX_std); % x-drift
        boolY = (actDriftY(j) > driftY_mean + driftY_std) || (actDriftY(j) < driftY_mean - driftY_std); % y-drift
        boolZ = (actDriftZ(j) > driftZ_mean + driftZ_std) || (actDriftZ(j) < driftZ_mean - driftZ_std); % z-drift
        boolRxy = false;%(handles.cam.drift(i,6*j-3) <= 0.8) && (handles.cam.drift(i,6*j-3)>= 1.4); % Rxy
        boolSNR = false;%(handles.cam.drift(i,6*j-1)<= 2) && (handles.cam.drift(i,6*j)<= 0.9);  % SNR and GoF
        if (boolX || boolY || boolZ || boolRxy || boolSNR) %&& (handles.cam.numberOfBeads>1)   % if any of them is true and we have more than one bead
            handles.cam.useBead(1,j) = 0;
        end
    end
    
    a = handles.cam.useBead;
    k = size(a(a == 1),2); % find number of beads which fullfill the conditions
    
    guidata(handles.output, handles);
    if k
        driftX_f = sum(actDriftX.* handles.cam.useBead) / k;
        driftY_f = sum(actDriftY .* handles.cam.useBead) / k;
        driftZ_f = sum(actDriftZ .* handles.cam.useBead) / k;
        handles.cam.drift(i,end-2) = driftX_f;
        handles.cam.drift(i,end-1) = driftY_f;
        handles.cam.drift(i,end) = driftZ_f;
        guidata(handles.output, handles);
    else
        handles.cam.drift(i,end-2:end) = 0;
        guidata(handles.output, handles);
    end
    
    set(handles.maxInt_txt, 'string', num2str(handles.cam.maxIntOfBead));
    set(handles.totNumAcqImage_txt, 'string', num2str(i));
    guidata(handles.output, handles);
    
    %     if handles.cam.expT > 0.3
    %         a = 10000;
    %     else
    %         a = 40000;
    %     end
    %     if max(handles.cam.maxIntOfBead) < a
    %         gain_expT_adjust(handles,1);
    %         handles = guidata(handles.output);
    %     end
    feedback_drift(handles,i);
    handles = guidata(handles.output);
    pause(1e-10);
    

end

if handles.cam.expT >= 0.5
    a = 20000;
else
    a = 40000;
end
if max(handles.cam.maxIntOfBead) < a
    gain_expT_adjust(handles,1);
    handles = guidata(handles.output);
end

set(handles.dx_txt, 'String', num2str(handles.cam.drift(i,end-2),'%.0f')); % drift in x(nm)
set(handles.dy_txt, 'String', num2str(handles.cam.drift(i,end-1),'%.0f')); % drift in y(nm)
set(handles.dz_txt, 'String', num2str(handles.cam.drift(i,end)/1.6, '%.0f'));  % drift in z(nm)

% if i==15
%     1;
% end
pause(1e-10);
guidata(handles.output, handles);








