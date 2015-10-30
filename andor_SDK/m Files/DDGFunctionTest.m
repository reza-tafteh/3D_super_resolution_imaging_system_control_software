status=0;
returnCode=0;

head_model = 'anyway';
data=zeros(1); % stores the image
addpath(fullfile(matlabroot,'toolbox','Andor'))
addpath(fullfile(matlabroot,'toolbox','Andor','Camera Files'))
path = ''% fullfile(matlabroot,'toolbox','Andor','Camera Files','atmcd32d.dll');

bmpPath = fullfile(matlabroot,'toolbox','Andor','test','testBMP.bmp');
spoolPath = fullfile(matlabroot,'toolbox','Andor','test','spool');

xpixels=0;
ypixels=0;

% init system
installpath = fullfile(matlabroot,'toolbox','Andor','Camera Files');
cd (installpath);

disp('AndorInitialize ---------------------------------------');
returnCode=AndorInitialize(path);
returnCode

pause(2.0)

disp('AndorGetStatus ---------------------------------------');
[returnCode,status] = AndorGetStatus;
returnCode
status

disp('GetDetector--------------------------------------');
[returnCode,xpixels,ypixels] = GetDetector;
returnCode
xpixels
ypixels


disp('CoolerON---------------------------------------');
returnCode  =CoolerON;
returnCode


disp('SetDDGGain--------------------------------------');
returnCode  = SetDDGGain(255);
returnCode


disp('SetDDGGateStep--------------------------------------');
returnCode  = SetDDGGateStep(2000);
returnCode


disp('SetDDGInsertionDelay--------------------------------------');
returnCode  = SetDDGInsertionDelay(0);
returnCode

disp('SetDDGIOC--------------------------------------');
returnCode  = SetDDGIOC(0);
returnCode

disp('SetDDGTriggerMode------------------------------------');
returnCode  = SetDDGTriggerMode(0);
returnCode


disp('SetDDGVariableGateStep-----------------------------------');
returnCode  = SetDDGVariableGateStep(0,44,22);
returnCode



disp('StartAcquisition--------------------------------------');
returnCode= StartAcquisition;
returnCode

[ret,gstatus]=AndorGetStatus;
while(gstatus ~= 20073)%DRV_IDLE
    pause(1.0);
    [ret,gstatus]=AndorGetStatus;
end

disp('GetAcquiredData --------------------------------------');
[returnCode,data]=GetAcquiredData(xpixels);

disp('Extrema: ');
max(data)
min(data)

disp('CoolerOFF---------------------------------------');
returnCode  =CoolerOFF;
returnCode

plot(data)% 2D data  
disp('AndorShutDown --------------------------------------');
[ret]=AndorShutDown;