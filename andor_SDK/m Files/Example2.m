%
%   This is an example on controlling the Andor camera to acquire three singel-track data.
%   The result is stored in the "ResultArray" matrix.
%
%   Date: 10/02/2006
%   By: Dermot
%

head_model = 'anyway';
data=zeros(1); % stores the image
addpath(fullfile(matlabroot,'toolbox','Andor'))
path = '';

bmpPath = fullfile(matlabroot,'toolbox','Andor','test','testBMP.bmp');
spoolPath = fullfile(matlabroot,'toolbox','Andor','test','spool');

disp('Start Andor Camera Control')
% init system
installpath = fullfile(matlabroot,'toolbox','Andor','Camera Files');
cd (installpath);
disp('AndorInitialize ---------------------------------------');
returnCode=AndorInitialize(path);
path
returnCode

XPixels = 0;
YPixels = 0;
[ret,XPixels, YPixels]=GetDetector;          %   Get the CCD size
XPixels
YPixels
[ret]=CoolerON;                               %   Turn on temperature cooler
TargetTemp = 10;
[ret]=SetTemperature(TargetTemp);             %   Set the desire temperature
CurTemp = 0;
[ret,CurTemp]=GetTemperature;                %   Get CCD temperature
CurTemp;
temp = 0;
Status = 0;
[ret,Status]=AndorGetStatus; 
while CurTemp > TargetTemp             %   Loop 'til CCD reach desire temperature
    pause(1.0);
    [ret,CurTemp]=GetTemperature;
    CurTemp
end
[ret]=SetTriggerMode(0);                      %   Set trigger mode; 0 for Internal
[ret]=SetAcquisitionMode(1);                  %   Set acquisition mode; 1 for Single Scan
[ret]=SetExposureTime(0.0001);                %   Set exposure time in second
[ret]=SetReadMode(3);                         %   Set read mode; 3 for Single-Track
[ret]=SetSingleTrack(124, 21);                %   Set single track parameters
[ret]=SetShutter(0, 0, 1, 1);                 %   Set the shutter mode
Exposure = 0;
Accumulate = 0;
Kinetic = 0;
[ret,Exposure, Accumulate, Kinetic]=GetAcquisitionTimings;    %   Get acquisition setting
Exposure
Accumulate
Kinetic
Status = 0;
[ret,Status]=AndorGetStatus;                      %   Make sure the system is at idle waiting for instruction
Iter = 3;                               %   Set the number of iteration loop
Count = 0;
while Count < Iter
    [ret]=StartAcquisition                    %   Start the acquisition
    [ret,gstatus]=AndorGetStatus;
    while(gstatus ~= 20073)%DRV_IDLE
      pause(0.5);
      disp('Acquiring');
      [ret,gstatus]=AndorGetStatus;
    end
    ResultArray = zeros(1, 1024);              
    [ret,ResultArray]=GetAcquiredData( 1024)  %   Copy the data to the ResultArray
    ResultArray                         %   Display the result on Command Window
    % process the data here, otherwise it will be overwritten on the next iteration.
    Count = Count + 1;
end
disp('Done!');
[ret]=AndorShutDown;