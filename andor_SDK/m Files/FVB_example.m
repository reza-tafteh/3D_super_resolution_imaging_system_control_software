% variable declarations
status = zeros(1,1);
head_model = '....................';
xpixels = zeros(1,1);
ypixels = zeros(1,1);
minTemp = zeros(1,1);
maxTemp = zeros(1,1);
currentTemp = zeros(1,1);
setTemp = 5;
PCB = zeros(1,1);
Flex = zeros(1,1);
dummy1 = zeros(1,1);
dummy2 = zeros(1,1);
dummy3 = zeros(1,1);
dummy4 = zeros(1,1);
numberVSSpeeds = zeros(1,1);
VSSpeedIndex = zeros(1,1);
VSSpeed = zeros(1,1);
eprom = zeros(1,1);
cofFile = zeros(1,1);
vxdRev = zeros(1,1);
vxdVer = zeros(1,1);
dllRev = zeros(1,1);
dllVer = zeros(1,1);
numberHSSpeeds = zeros(1,1);
HSSpeedIndex = zeros(1,1);
HSSpeed = zeros(1,1);
ReadMode = 0;% FVB
ShutterType = 1;% TTL high
ShutterMode = 0;% Auto
ClosingTime = 0;% ms
OpeningTime = 0;
ExposureTime = 0;% setting zero will result in minimum possible (but non-zero) exposure time
TriggerMode = 0;% internal
AccCycleTime = 0;
NumAcc = 1;
NumKin = 1;
state=0;
acquisitionMode=1;
returnCode=0;
KinCycleTime = 0;
validExpTime = zeros(1,1);
validAccTime = zeros(1,1);
validKinTime = zeros(1,1);
% end of declarations


status=0;
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

pause(2.0)
acquisitionMode
[ret]=SetAcquisitionMode(acquisitionMode);
acquisitionMode

[ret,head_model]=GetHeadModel;
[ret,xpixels,ypixels]=GetDetector;
%returnCode=InAuxPort(4,state)
data = zeros(xpixels,1);
[ret,PCB,Flex,dummy1,dummy2,dummy3,dummy4] = GetHardwareVersion;
%test
x=1;
y=1;
[ret,x,y]=GetPixelSize;

%GetNumberVSSpeeds(numberVSSpeeds);
%GetVSSpeed(VSSpeedIndex,VSSpeed);
%GetSoftwareVersion(eprom,cofFile,vxdRev,vxdVer,dllRev,dllVer);
%GetNumberHSSpeeds(0,0,numberHSSpeeds);
%GetNumberHSSpeeds(0,1,numberHSSpeeds);
%GetNumberHSSpeeds(0,2,numberHSSpeeds);
%GetHSSpeed(0,0,HSSpeedIndex,HSSpeed);
%GetHSSpeed(0,1,HSSpeedIndex,HSSpeed);
%GetHSSpeed(0,2,HSSpeedIndex,HSSpeed);
%GetTemperatureRange(minTemp,maxTemp);
% test of new DLLs
%tracks = [20 30 32 40]

%SetRandomTracks(2,tracks);

[ret]=SetReadMode(ReadMode);
%SetShutter(ShutterType,ShutterMode,ClosingTime,OpeningTime);
[ret]=SetExposureTime(ExposureTime);
[ret]=SetTriggerMode(TriggerMode);
[ret]=SetAccumulationCycleTime(AccCycleTime);
[ret]=SetNumberAccumulations(NumAcc);
[ret]=SetNumberKinetics(NumKin);
[ret]=SetKineticCycleTime(KinCycleTime);
[ret,validExpTime,validAccTime,validKinTime]=GetAcquisitionTimings;
[ret]=SetHSSpeed(0,0);
[ret]=SetVSSpeed(0);
StartAcquisition;
[ret,gstatus]=AndorGetStatus;
while(gstatus ~= 20073)%DRV_IDLE
  pause(1.0);
  disp('Acquiring');
  [ret,gstatus]=AndorGetStatus;
end

[ret,data]=GetAcquiredData(xpixels);
%GetNewData(data,xpixels);
%SaveAsSif('D:\Matlab\testSIF.sif')
max(data)
min(data)

plot(data);% 2D data  
[ret]=AndorShutDown;