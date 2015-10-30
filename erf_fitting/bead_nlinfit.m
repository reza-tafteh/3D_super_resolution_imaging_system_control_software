function bead_nlinfit(handles, i, j, XMesh, YMesh, XYMesh)
% newtonFitImage_nlinfit fits the specified bead in "newton.data"
% INPUT:
  % - i: acquisition number from newton cam.
  % - j: index of bead to fit
  
% OUTPUT (as global values);
  % - drift(i,6*j) =>  xc(nm), yc(nm), Rxy, z(nm), SNR, GoF
  % - fitError(i,6*j) => fitting uncertainty => xc(nm), wx(%), yc(nm), wy(%), Rxy, z(nm) 

%global newton drift fitError bead

%% cutting and initializing
image = handles.cam.image;
beadPosX = handles.cam.beadPosX(j);
beadPosY = handles.cam.beadPosY(j);
cut = handles.cam.BeadCutSize;
beadCut = double(image(beadPosX-cut:beadPosX+cut, beadPosY-cut:beadPosY+cut));


if j == 1
    handles.cam.maxIntOfBead = max(beadCut(:));
else
    if max(beadCut(:)) > handles.cam.maxIntOfBead
        handles.cam.maxIntOfBead = max(beadCut(:));
    end
end
maxIntensity = max(beadCut(:));
[xc0,yc0,amp0,wx0,wy0]=gauss2dellipse(beadCut(:,:),XMesh, YMesh, 2);

%% fitting 
%if (wx0 > 0.8) && (wy0 > 0.8)
    %if (wx0 < 5) && (wy0 < 5)
        amp0=amp0*wx0*wy0;
        bg0 = mean2(beadCut(1:2,1:2)); % use four pixles to get intial bg
        coeff0 = [bg0 amp0 xc0 2 yc0 2];
        %coeff0 = [bg0 amp0 xc0 wx0 yc0 wy0];
        [cFit, beadCut_fit] = fit_erf_bead(beadCut(:,:),coeff0, XMesh, YMesh, XYMesh);
        % x(nm) - y(nm) - Rxy - z(nm) - SNR ... repeat for # of beads .. calculated
        % drift for each frame .. dx(nm) - dy(nm) - dz(nm)
        drift(6*j-5) = cFit(3)*handles.cam.xPxSize;  % x(px)->x(nm)
        drift(6*j-4) = cFit(5)*handles.cam.yPxSize;  % y(px)->y(nm)
        drift(6*j-3) = cFit(4)/cFit(6);  % Rxy=wx/wy
        drift(6*j-2) = polyval(handles.cam.zCoef, drift(6*j-3));  % Rxy -> z(nm)
        drift(6*j-1) = maxIntensity/cFit(1); % SNR=maxIntensity/a, a obtained from fitting
        drift(6*j) = cFit(13); % goodness of fit
        
%         fitErr(6*j-5) = cFit(9)*handles.cam.xPxSize; % xc uncertainty
%         fitErr(6*j-4) = cFit(10)/cFit(4); % wx uncertatinty percentage
%         fitErr(6*j-3) = cFit(11)*handles.cam.yPxSize; % yc uncertainty
%         fitErr(6*j-2) = cFit(12)/cFit(6); % wy uncertatinty percentage
%         fitErr(6*j-1) = sqrt(fitErr(6*j-4)^2 + fitErr(6*j-2)^2) * drift(5*j-2); % Rxy uncertainty
%         Rxy_ub = drift(6*j-2) + fitErr(6*j-1); 
%         z_ub = polyval(handles.cam.zCoef, Rxy_ub); 
%         Rxy_lb = drift(6*j-2) - fitErr(6*j-1);
%         z_lb = polyval(handles.cam.zCoef, Rxy_lb);
%         fitErr(6*j) = abs(z_ub - z_lb); % uncertainty in Z(nm)
    %end
%end

handles.cam.drift(i,6*j-5:6*j) = drift(6*j-5:6*j);
%handles.cam.firErr(i,6*j-5:6*j) = fitErr(6*j-5:6*j);

% handles.cam.beadCut = beadCut;
% handles.cam.beadCut_fit = beadCut_fit;
% set(handles.beadVidImage, 'CData', handles.cam.beadCut);
% set(handles.beadVidFitImage, 'CData', handles.cam.beadCut_fit);
% set(handles.Rxy_txt, 'string', num2str(handles.cam.drift(i,3)), '%.2f');
switch handles.cam.acqMode 
    case 8
    set(handles.beadVidImage, 'CData', beadCut);
    set(handles.beadVidFitImage, 'CData', beadCut_fit);
    set(handles.Rxy_txt, 'string', num2str(handles.cam.drift(i,3), '%.2f'));
    
    case 4
        switch j
            case 1
                set(handles.beadRecImage1, 'CData', beadCut);
                set(handles.beadRecFitImage1, 'CData', beadCut_fit);
                if handles.cam.numberOfBeads %== 1
                    set(handles.Rxy_txt, 'string', num2str(handles.cam.drift(i,3), '%.2f'));
                end
                guidata(handles.output, handles);
                pause(1e-10);
            case 2
                set(handles.beadRecImage2, 'CData', beadCut);
                set(handles.beadRecFitImage2, 'CData', beadCut_fit);
                guidata(handles.output, handles);
            case 3
                set(handles.beadRecImage3, 'CData', beadCut);
                set(handles.beadRecFitImage3, 'CData', beadCut_fit);
                guidata(handles.output, handles);
            case 4
                set(handles.beadRecImage4, 'CData', beadCut);
                set(handles.beadRecFitImage4, 'CData', beadCut_fit);
                guidata(handles.output, handles);
            case 5
                set(handles.beadRecImage5, 'CData', beadCut);
                set(handles.beadRecFitImage5, 'CData', beadCut_fit);
                guidata(handles.output, handles);
            case 6
                set(handles.beadRecImage6, 'CData', beadCut);
                set(handles.beadRecFitImage6, 'CData', beadCut_fit);
                guidata(handles.output, handles);
            case 7
                set(handles.beadRecImage7, 'CData', beadCut);
                set(handles.beadRecFitImage7, 'CData', beadCut_fit);
                guidata(handles.output, handles);
            case 8
                set(handles.beadRecImage8, 'CData', beadCut);
                set(handles.beadRecFitImage8, 'CData', beadCut_fit);
                guidata(handles.output, handles);
        end  
end
guidata(handles.output, handles);

%% plotting
% newtonBeadsPlotUpdate(beadCut,fitImage,i,j);
if handles.cam.acqMode == 4  % handles.cam.beadImageComp only for bead tracking mode
    a = handles.cam.fullFrameWidth;
    handles.cam.beadImageComp((j-1)*a+1:j*a, 1:a, i) = beadCut;
end
guidata(handles.output, handles);










