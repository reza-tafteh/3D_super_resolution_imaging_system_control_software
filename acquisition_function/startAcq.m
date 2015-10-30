function startAcq(handles)
global ctrl

clc

if strcmp(handles.cam.name,'Tracking_7508')
    move_stage(handles,1);
    handles = guidata(handles.output);
end

ctrl.stopAcq = 0;
[ret] = SetSpool(handles.cam.setSpool, 7, handles.path_full, 1);
guidata(handles.output, handles);
check_status(handles,ret, 'SetSpool');
handles = guidata(handles.output);

% if handles.cam.trig == 0
    [ret] = StartAcquisition();
    guidata(handles.output, handles);
    check_status(handles, ret, 'StartAcquisition');
    handles = guidata(handles.output);
% end

switch handles.cam.acqMode
    case {1,7} %Video and UserVideo
%         if strcmp(handles.cam.name, 'Alexa532_6816');
%             set(handles.image, 'CDataMapping', 'scaled');
%             axis image xy;
%             colormap winter;
%             handles = guidata(handles.output);
%         end
        axes_visibility(handles,1);
%         move_stage(handles,1);
%         handles = guidata(handles.output);
        %axes(handles.imAxes);
        while ~ctrl.stopAcq
            [~] = WaitForAcquisition();
            [~, A] = GetMostRecentImage(handles.cam.xPixel*handles.cam.yPixel);
            %             guidata(handles.output, handles);
            %             check_status(handles, ret, 'GetMostRecentImage');
            %             handles = guidata(handles.output);
            if strcmp(handles.cam.name,'Alexa532_6816')
                handles.cam.image = (reshape(A, handles.cam.xPixel, handles.cam.yPixel))';
            else
                handles.cam.image = flipud((reshape(A, handles.cam.xPixel, handles.cam.yPixel))');
            end
            set(handles.image, 'CData', handles.cam.image);
            %caxis(handles.imAxes, [0 max(A(:)/2)]);
            %num2str(max(handles.cam.image(:)))
            set(handles.maxInt_txt, 'string', num2str(max(handles.cam.image(:))));
            set(handles.minInt_txt, 'string', num2str(min(handles.cam.image(:))));
            guidata(handles.output, handles);
            pause(1e-30);
        end
        
    case {2,3} %PreSTORM and STORM
        axes_visibility(handles,1);
        i = 1;
        handles.cam.totNumAcqImage = 0;
        hanldes.cam.timeStamp = zeros(handles.cam.seriesLength,7);
        %axes(handles.imAxes);
        while ~ctrl.stopAcq && (handles.cam.totNumAcqImage < handles.cam.seriesLength)
            [~] = WaitForAcquisition();
            [~, handles.cam.totNumAcqImage] = GetTotalNumberImagesAcquired();
            hanldes.cam.timeStamp(handles.cam.totNumAcqImage,2:7) = datevec(now);
            hanldes.cam.timeStamp(handles.cam.totNumAcqImage,1) = handles.cam.totNumAcqImage;
            if (rem(handles.cam.totNumAcqImage,10) == 0) || (handles.cam.expT >=0.1)
                [~, A] = GetMostRecentImage(handles.cam.xPixel*handles.cam.yPixel);
                if strcmp(handles.cam.name,'Alexa532_6816')
                    handles.cam.image = (reshape(A, handles.cam.xPixel, handles.cam.yPixel))';
                else
                    handles.cam.image = flipud((reshape(A, handles.cam.xPixel, handles.cam.yPixel))');
                end
                %axes(handles.imAxes);
                set(handles.image, 'CData', handles.cam.image);
                %num2str(max(handles.cam.image(:)))
                set(handles.maxInt_txt, 'string', num2str(max(handles.cam.image(:))));
                set(handles.minInt_txt, 'string', num2str(min(handles.cam.image(:))));
                set(handles.totNumAcqImage_txt, 'string', num2str(min(handles.cam.totNumAcqImage)));
                
            end
            guidata(handles.output, handles);
            pause(1e-30);
            i = i+1;
        end
        if handles.cam.acqMode == 3 %save timeStamp
            handles.path_timeStamp = fullfile(handles.path,'iXonTime.mat');
            iXonTime = hanldes.cam.timeStamp;
            save(handles.path_timeStamp, 'iXonTime');
        end
        guidata(handles.output, handles);
        
    case 4 %Tracking
        %handles.cam.image = int32(zeros(handles.cam.xPixel, handles.cam.yPixel));
        [ret] = AbortAcquisition;
        guidata(handles.output, handles);
        check_status(handles, ret, 'AbortAcquisition');
        handles = guidata(handles.output);
%         move_stage(handles,1);
%         handles = guidata(handles.output);
        
        handles.cam.BeadCutSize = 10; % BeadCutSize for while tracking the bead
        handles.cam.fullFrameWidth = 2*handles.cam.BeadCutSize+1;
        guidata(handles.output, handles);
        fig_prop(handles);
        handles = guidata(handles.output);
        [YMesh, XMesh] = meshgrid(1:handles.cam.fullFrameWidth, 1:handles.cam.fullFrameWidth);
        XYMesh(:,1) = XMesh(:);
        XYMesh(:,2) = YMesh(:);
        handles.cam.trackingTime = zeros(2000,27);  
        % 1:6 => just after stage moved to the new position, 
        % 8:13 => just before sending out the feedback to the piezo
        % 15:20 => just before starting new single image acq
        % 15:20 => just after single image acq 
        handles.cam.feedExpCounter = 0;
        handles.cam.numOfAccFeed = 10;
        handles.cam.numOfAccFeed_real = 0;
        guidata(handles.output, handles);
        i = 1;
        while (~ctrl.stopAcq) && (i <= handles.cam.seriesLength)
            handles.cam.trackingTime(i,15:20) = datevec(now);
            [ret] = StartAcquisition();
            guidata(handles.output, handles);
            check_status(handles, ret, 'StartAcquisition');
            handles = guidata(handles.output);
            [~] = WaitForAcquisition();
            handles.cam.trackingTime(i,22:27) = datevec(now);
            [~, A] = GetMostRecentImage(handles.cam.xPixel*handles.cam.yPixel);
            %             guidata(handles.output, handles);
            %             check_status(handles, ret, 'GetMostRecentImage');
            %             handles = guidata(handles.output);
            handles.cam.image = flipud((reshape(A, handles.cam.xPixel, handles.cam.yPixel))');
            guidata(handles.output, handles);
            
            if i == 1
                axes_visibility(handles,1);
                handles = guidata(handles.output);
                %axes(handles.imAxes);
                set(handles.image, 'CData', handles.cam.image);
                %num2str(max(handles.cam.image(:)))
                set(handles.maxInt_txt, 'string', num2str(max(handles.cam.image(:))));
                set(handles.minInt_txt, 'string', num2str(min(handles.cam.image(:))));
                guidata(handles.output, handles);
                
                get_bead_pos(handles);
                handles = guidata(handles.output);
                
                handles.cam.drift = zeros(handles.cam.seriesLength, 6*handles.cam.numberOfBeads+3);
                handles.cam.fitErr = zeros(handles.cam.numberOfBeads,6);
                handles.cam.beadImageComp = zeros(handles.cam.numberOfBeads*handles.cam.fullFrameWidth, handles.cam.fullFrameWidth,handles.cam.seriesLength);
                handles.cam.targetPos.x = zeros(1, handles.cam.numberOfBeads);
                handles.cam.targetPos.y = zeros(1, handles.cam.numberOfBeads);
                handles.cam.targetPos.z = zeros(1, handles.cam.numberOfBeads);
                guidata(handles.output, handles);
                
                axes_visibility(handles,3);
                handles = guidata(handles.output);
                guidata(handles.output, handles);
                
                multiple_beads_fit(handles, i, XMesh, YMesh, XYMesh);
                handles = guidata(handles.output);
%                 axes_visibility(handles,3);
%                 handles = guidata(handles.output);
%                 guidata(handles.output, handles);
            else
                I_max = 0;
                cut = handles.cam.BeadCutSize;
                beadPosX = handles.cam.beadPosX;
                beadPosY = handles.cam.beadPosY;
                for kk = 1:handles.cam.numberOfBeads
                    beadCut = handles.cam.image(beadPosX(kk)-cut:beadPosX(kk)+cut, beadPosY(kk)-cut:beadPosY(kk)+cut);
                    I_max = max(max(beadCut(:)), I_max);
                end

                if (I_max > 40000) || (I_max < 1000) %max(handles.cam.image(:)) > 50000
                    up_dn = 0;
                    if I_max < 5000
                        up_dn = 1;
                    end
                    %fprintf('i=%0.0f \n', i);
                    %bb = handles.cam.image(:);
                    %fprintf('bb=%0.0f \n', bb);
                    gain_expT_adjust(handles,up_dn);
                    handles = guidata(handles.output);
                    i = i+1;
                    continue; 
                end
                
                multiple_beads_fit(handles, i, XMesh, YMesh, XYMesh);
                handles = guidata(handles.output);
                guidata(handles.output, handles);
%                 gain_temp = handles.cam.gain
%                 exTime_temp = handles.cam.expT
                
            end
            i = i+1;
            %pause(1e-30);
            guidata(handles.output, handles);
        end
        
        a = 2*handles.cam.BeadCutSize+1;
        for k = 1:handles.cam.numberOfBeads
            A = zeros(a,a);
            beadNo =['Bead' num2str(k) '.tif'];
            handles.path_bead = fullfile(handles.path, beadNo);
            imwrite(uint16(A),handles.path_bead,'Compression','none')
            s = Tiff(fullfile(handles.path_bead),'w');
            iminf.ImageLength = a;
            iminf.ImageWidth = a;
            iminf.PlanarConfiguration = Tiff.PlanarConfiguration.Chunky;
            iminf.DateTime = datestr(now,'yyyy:mm:dd HH:MM:SS');
            iminf.SamplesPerPixel = 1;
            iminf.BitsPerSample = 16;
            iminf.Photometric = Tiff.Photometric.MinIsBlack;
            for j=1:i-1
                A = handles.cam.beadImageComp((k-1)*a+1:k*a, :, j);
                s.setTag(iminf);
                s.write(uint16(A));
                s.writeDirectory();
            end
            s.close;
        end
        msg = 'Bead images: written to the disk';
        handles.msgLog = [handles.msgLog; {msg}];
        set(handles.msgLogInitialize_text, 'String', flipud(handles.msgLog));
        
        handles.path_trakingTime = fullfile(handles.path, 'trackingTime.mat');
        trackingTime = handles.cam.trackingTime;
        save(handles.path_trakingTime, 'trackingTime');
        msg = 'Tracking timestamp: written to the disk';
        handles.msgLog = [handles.msgLog; {msg}];
        set(handles.msgLogInitialize_text, 'String', flipud(handles.msgLog));
        guidata(handles.output, handles);
        
        handles.path_drift = fullfile(handles.path, 'drift.mat');
        drift = handles.cam.drift;
        save(handles.path_drift, 'drift');
        msg = 'Drfit.mat file: written to the disk';
        handles.msgLog = [handles.msgLog; {msg}];
        set(handles.msgLogInitialize_text, 'String', flipud(handles.msgLog));
        guidata(handles.output, handles);

        
    case 5 % calibration
        axes_visibility(handles,1);
        handles.cam.zStepVol = handles.cam.zStep*(5/20000);%5v for 20um
        calData = zeros(handles.cam.xPixel, handles.cam.yPixel,handles.cam.seriesLength);
        %axes(handles.imAxes);
        i = 1;
        while (~ctrl.stopAcq) && (i <= handles.cam.seriesLength)
            if (i~=1) && (handles.cam.trig == 0)
                [ret] = StartAcquisition();
                guidata(handles.output, handles);
                check_status(handles, ret, 'StartAcquisition');
                handles = guidata(handles.output);
            end
            [~] = WaitForAcquisition();
            [~, A] = GetMostRecentImage(handles.cam.xPixel*handles.cam.yPixel);
            
            if strcmp(handles.cam.name,'Alexa532_6816')
                handles.cam.image = (reshape(A, handles.cam.xPixel, handles.cam.yPixel))';
            else
                handles.cam.image = flipud((reshape(A, handles.cam.xPixel, handles.cam.yPixel))');
            end
            
            if (rem(i,2) == 0) || (handles.cam.expT >=0.1)
                set(handles.image, 'CData', handles.cam.image);
                %num2str(max(handles.cam.image(:)))
                set(handles.maxInt_txt, 'string', num2str(max(handles.cam.image(:))));
                set(handles.minInt_txt, 'string', num2str(min(handles.cam.image(:))));
                set(handles.totNumAcqImage_txt, 'string', num2str(i));
            end
            pause(1e-30);
            guidata(handles.output, handles);
            calData(:,:,i) =  handles.cam.image;
            if handles.cam.trig == 0  % only the trigering camera will move the stage
                switch i
                    case handles.cam.seriesLength
                        move_stage(handles,1);
                    otherwise
                        v = i*handles.cam.zStepVol+1;
                        move_stage(handles,[1 1 v]);
                end
                pause(0.03);% 30ms to settle down the piezo
            end
            handles = guidata(handles.output);
            i = i+1;
            
        end
        
        calData = uint16(calData);
        for i = 1:handles.cam.seriesLength
            imwrite(calData(:,:,i),handles.path_full,'writemode','append');
        end
        handles.msgLog = [handles.msgLog; {'Done: writing the calibration data to the path'}];
        set(handles.msgLogInitialize_text, 'String', flipud(handles.msgLog));
        guidata(handles.output, handles);
        
    case 8 %TrackingVideo
%          move_stage(handles,1);
%          handles = guidata(handles.output);
        handles.cam.BeadCutSize = 10; % BeadCutSize when Rxy of bead is being adjusted.
        guidata(handles.output, handles);
        fig_prop(handles);
        handles = guidata(handles.output);
        [YMesh, XMesh] = meshgrid(1:2*handles.cam.BeadCutSize+1, 1:2*handles.cam.BeadCutSize+1);
        XYMesh(:,1) = XMesh(:);
        XYMesh(:,2) = YMesh(:);
        handles.cam.drift = zeros(2000,9); %2000 is random to just provide enough time for acq.
        guidata(handles.output, handles);
        i = 1;
        while ~ctrl.stopAcq
            [~] = WaitForAcquisition();
            [~, A] = GetMostRecentImage(handles.cam.xPixel*handles.cam.yPixel);
            %             guidata(handles.output, handles);
            %             check_status(handles, ret, 'GetMostRecentImage');
            %             handles = guidata(handles.output);
            
            if strcmp(handles.cam.name,'Alexa532_6816')
                handles.cam.image = (reshape(A, handles.cam.xPixel, handles.cam.yPixel))';
            else
                handles.cam.image = flipud((reshape(A, handles.cam.xPixel, handles.cam.yPixel))');
            end
            %handles.cam.image = reshape(A, handles.cam.xPixel, handles.cam.yPixel)';
            guidata(handles.output, handles);

            if i == 1
                axes_visibility(handles,1);
                handles = guidata(handles.output);
                %axes(handles.imAxes);
                set(handles.image, 'CData', handles.cam.image);
                %num2str(max(handles.cam.image(:)))
                set(handles.maxInt_txt, 'string', num2str(max(handles.cam.image(:))));
                set(handles.minInt_txt, 'string', num2str(min(handles.cam.image(:))));
                guidata(handles.output, handles);
                
                get_bead_pos(handles);
                handles = guidata(handles.output);
                guidata(handles.output, handles);
            else
                axes_visibility(handles,2);
                handles = guidata(handles.output);
                bead_nlinfit(handles, i, 1, XMesh, YMesh, XYMesh);
                handles = guidata(handles.output);
                guidata(handles.output, handles);
            end
            i = i+1;
            guidata(handles.output, handles);
            pause(1e-30);
        end
        
        
        
end

[ret] = AbortAcquisition;
guidata(handles.output, handles);
check_status(handles, ret, 'AbortAcquisition');
%handles = guidata(handles.output);
end

