%
%   This is an example on controlling the Andor camera to acquire singel-track data.
%   The result is stored in the "ResultArray" matrix.
%
%   Date: 10/02/2006
%   By: Dermot
%
% An M-file script to produce       % Comment lines
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


[ret]=CoolerON;                               %   Turn on temperature cooler
mode = 0;
[ret]=SetTriggerMode(mode);                      %   Set trigger mode; 0 for Internal
[ret]=SetAcquisitionMode(1);                  %   Set acquisition mode; 1 for Single Scan
[ret]=SetExposureTime(0.017);                 %   Set exposure time in second
[ret]=SetReadMode(4);                         %   Set read mode; 4 for Image
[ret]=SetShutter(0, 0, 1, 1);                 %   Set the shutter mode
[ret,XPixels, YPixels]=GetDetector;          %   Get the CCD size
[ret]=SetImage(1, 1, 1, XPixels, 1, YPixels);        %   Set the image size
Exposure = 0;
Accumulate = 0;
Kinetic = 0;
[ret,Exposure, Accumulate, Kinetic]=GetAcquisitionTimings    %   Get acquisition setting
Exposure
Accumulate
Kinetic
Status = 0;
[ret,gstatus]=AndorGetStatus;
while(gstatus ~= 20073)%DRV_IDLE
  pause(1.0);
  disp('Not ready');
  [ret,gstatus]=AndorGetStatus;
end
StartAcquisition;                       %   Start the acquisition
[ret,gstatus]=AndorGetStatus;
while(gstatus ~= 20073)%DRV_IDLE
  pause(1.0);
  disp('Acquiring');
  [ret,gstatus]=AndorGetStatus;
end
ResultArray = zeros(YPixels, XPixels);              
[ret,ResultArray]=GetAcquiredData( XPixels * YPixels);  %   Copy the data to the ResultArray
ResultArray;                            %   Display the result on Command Window
% process the data here, otherwise it will be overwritten on the next iteration.
figure;
colormap(gray);
imagesc(ResultArray);
disp('Done!');
[ret]=AndorShutDown;