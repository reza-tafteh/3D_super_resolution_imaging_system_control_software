
% variables
status=0;
returnCode=0;
acquisitionMode=1;
readmode = 4;

xpixels=0;
ypixels=0;

exposureTime=0;
accuTime = 0;
kinTime=0; 

filterMode=0;

PCB=0;
Flex=0;
dummy1=0;
dummy2=0;
dummy3=0;
dummy4=0;

index=0;

speed=0;
channel=1;
type=1;

number=0;

xsize=0;
ysize=0;

eprom=0;
cofFile=0;
vxdRev=0;
vxdVer=0;
dllRev=0;
dllVer=0;

temperature=0;
minTemp=0;
maxTemp=0;

port=1;
state=0;

height=10;
offset=3;
bottom=10;
gap=0;

head_model = 'anyway';
data=zeros(1); % stores the image
addpath(fullfile(matlabroot,'toolbox','Andor'))
path = ''

bmpPath = fullfile(matlabroot,'toolbox','Andor','test','testBMP.bmp');
spoolPath = fullfile(matlabroot,'toolbox','Andor','test','spool');

yMin=0;
yMax=255;


% init system
installpath = fullfile(matlabroot,'toolbox','Andor','Camera Files');
cd (installpath);
disp('AndorInitialize ---------------------------------------');
returnCode=AndorInitialize(path);
path
returnCode

pause(2.0)

disp('AndorGetStatus ---------------------------------------');
[returnCode,status] = AndorGetStatus;
returnCode
status

disp('CoolerON---------------------------------------');
returnCode  =CoolerON;
returnCode

disp('SetAcquisitionMode--------------------------------------');
returnCode = SetAcquisitionMode(acquisitionMode);
returnCode
acquisitionMode

disp('SetReadMode--------------------------------------');
returnCode = SetReadMode(readmode);
returnCode
readmode

disp('GetDetector--------------------------------------');
[returnCode,xpixels,ypixels] = GetDetector;
returnCode
xpixels
ypixels

disp('GetPixelSize--------------------------------------');
[returnCode,xsize,ysize] = GetPixelSize;
returnCode
xsize
ysize

disp('GetTemperatureRange--------------------------------------');
[returnCode,minTemp,maxTemp] = GetTemperatureRange;
returnCode
minTemp
maxTemp


disp('GetHeadModel--------------------------------------');
[returnCode,head_model]=GetHeadModel;
returnCode
head_model

disp('GetFilterMode----------------------------------');
[returnCode,filterMode]=GetFilterMode;
returnCode
filterMode

disp('GetHardwareVersion----------------------------------');
[returnCode,PCB,Flex,dummy1,dummy2,dummy3,dummy4]=GetHardwareVersion;
returnCode
PCB
Flex
dummy1
dummy2
dummy3
dummy4

disp('GetSoftwareVersion----------------------------------');
[returnCode,eprom,cofFile,vxdRev,vxdVer,dllRev,dllVer] = GetSoftwareVersion;
returnCode
eprom
cofFile
vxdRev
vxdVer
dllRev
dllVer

disp('SetImage----------------------------------');
[returnCode]=SetImage(1,1,1,xpixels,1,ypixels);

disp('SetHSSpeed----------------------------------');
[returnCode,nospeeds]=GetNumberHSSpeeds(0,0);
[returnCode] = SetHSSpeed(0,nospeeds-1);

disp('SetVSSpeed----------------------------------');
[returnCode,nospeeds]=GetNumberVSSpeeds;
[returnCode] = SetVSSpeed(nospeeds-1);


disp('SetExposureTime----------------------------------');
returnCode = SetExposureTime(0.3);
returnCode

disp('GetAcquisitionTimings----------------------------------');
[returnCode,exposureTime,accuTime,kinTime] =  GetAcquisitionTimings;
returnCode
exposureTime
accuTime
kinTime 

disp('GetTemperature------------------------------------');
[returnCode,temperature]=GetTemperature;
returnCode
temperature

disp('StartAcquisition--------------------------------------');
returnCode= StartAcquisition;
returnCode

[ret,gstatus]=AndorGetStatus;
while(gstatus ~= 20073)%DRV_IDLE
    pause(1.0);
    [ret,gstatus]=AndorGetStatus;
end

data = zeros(xpixels*ypixels,1);

disp('GetAcquiredData --------------------------------------');
[returnCode,data]=GetAcquiredData(xpixels*ypixels);

disp('Plotting: ');
max(data)
min(data)

disp('CoolerOFF---------------------------------------');
returnCode  =CoolerOFF;
returnCode

plot(data)% 2D data  
disp('AndorShutDown --------------------------------------');
pause(2.0);
[ret] = AndorShutDown;