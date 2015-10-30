%
%   This is an example on controlling the Andor camera to acquire singel-track data.
%   The result is stored in the "ResultArray" matrix.
%
%   Date: 10/02/2006
%   By: Dermot
%

addpath(fullfile(matlabroot,'toolbox','Andor'))
path = ''%fullfile(matlabroot,'toolbox','Andor','Camera Files','atmcd32d.dll');

installpath = fullfile(matlabroot,'toolbox','Andor','Camera Files');
cd (installpath);

disp('Start Andor Camera Control');
returnCode = AndorInitialize(path);
if returnCode == 20002
    disp('Camera initialized');
end
XPixels = 0
YPixels = 0 
[ret,XPixels,YPixels]=GetDetector;          %   Get the CCD size
disp('CCD size is ');
XPixels
YPixels
arrayLength= XPixels;
arrayLength

ret = SetTriggerMode(0);                    %   Set trigger mode; 0 for Internal
ret = SetAcquisitionMode(1);                  %   Set acquisition mode; 1 for Single Scan
disp('SetHSSpeed----------------------------------');
[returnCode,nospeeds]=GetNumberHSSpeeds(0,0);
[returnCode] = SetHSSpeed(0,nospeeds-1);
disp('SetVSSpeed----------------------------------');
[returnCode,nospeeds]=GetNumberVSSpeeds;
[returnCode] = SetVSSpeed(nospeeds-1);
disp('SetImage----------------------------------');
[returnCode]=SetImage(1,1,1,XPixels,1,1);

ret = SetExposureTime(0.022);                %   Set exposure time in second
ret = SetReadMode(3);                         %   Set read mode; 3 for Single-Track
ret = SetSingleTrack(50, 21);                %   Set single track parameters
ret = SetShutter(0, 0, 1, 1);                 %   Set the shutter mode
Exposure = 0;
Accumulate = 0;
Kinetic = 0;
[ret,Exposure,Accumulateb,Kinetic]=GetAcquisitionTimings;    %   Get acquisition setting
Exposure
Accumulate
Kinetic
Status = 0;
[ret,Status]=AndorGetStatus;                      %   Make sure the system is at idle waiting for instruction
ret = StartAcquisition;                       %   Start the acquisition
[ret,gstatus]=AndorGetStatus;
while(gstatus ~= 20073)%DRV_IDLE
    pause(0.1);
    [ret,gstatus]=AndorGetStatus;
end
ResultArray = zeros(1, XPixels);              

[ret,ResultArray]=GetAcquiredData(arrayLength);     %   Copy the data to the ResultArray
ResultArray;                            %   Display the result on Command Window
% process the data here, otherwise it will be overwritten on the next iteration.

max(ResultArray)
min(ResultArray)
figure;
colormap(gray);
pause(3.0);
imagesc(ResultArray);
disp('Done!');
[ret]=AndorShutDown;