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
AcquisitionMode = 1;% single scan
ReadMode = 4;% Image
ShutterType = 1;% TTL high
ShutterMode = 0;% Auto
ClosingTime = 0;% ms
OpeningTime = 0;
ExposureTime = 0;% setting zero will result in minimum possible (but non-zero) exposure time
TriggerMode = 0;% internal
AccCycleTime = 0;
NumAcc = 1;
NumKin = 1;
KinCycleTime = 0;
validExpTime = zeros(1,1);
validAccTime = zeros(1,1);
validKinTime = zeros(1,1);

head_model = 'anyway';
data=zeros(1); % stores the image
addpath(fullfile(matlabroot,'toolbox','Andor'))
path = '';


disp('Start Andor Camera Control')
% init system
installpath = fullfile(matlabroot,'toolbox','Andor','Camera Files');
cd (installpath);
disp('AndorInitialize ---------------------------------------');
returnCode=AndorInitialize(path);
path
returnCode


pause(2.0)
[ret,head_model]=GetHeadModel;
[ret,xpixels,ypixels]=GetDetector;
[ret]=SetImage(1,1,1,xpixels,1,ypixels);
data = zeros(xpixels*ypixels,1);
[ret,PCB,Flex,dummy1,dummy2,dummy3,dummy4]=GetHardwareVersion;
[ret,numberVSSpeeds]=GetNumberVSSpeeds;
[ret,VSSpeed]=GetVSSpeed(VSSpeedIndex);
[ret,eprom,cofFile,vxdRev,vxdVer,dllRev,dllVer]=GetSoftwareVersion;
[ret,numberHSSpeeds]=GetNumberHSSpeeds(0,0);
[ret,HSSpeed]=GetHSSpeed(0,0,HSSpeedIndex);
[ret,minTemp,maxTemp]=GetTemperatureRange;
[ret]=CoolerON;
[ret,currentTemp]=GetTemperature;
setTemp = 10;
setTemp
[ret]=SetTemperature(setTemp);
while(abs(currentTemp - setTemp) > 1)
    pause(1.0);
    [ret,currentTemp]=GetTemperature;
    currentTemp
end
[ret]=SetAcquisitionMode(AcquisitionMode);
[ret]=SetReadMode(ReadMode);
[ret]=SetShutter(ShutterType,ShutterMode,ClosingTime,OpeningTime);
[ret]=SetExposureTime(ExposureTime);
[ret]=SetTriggerMode(TriggerMode);
[ret]=SetAccumulationCycleTime(AccCycleTime);
[ret]=SetNumberAccumulations(NumAcc);
[ret]=SetNumberKinetics(NumKin);
[ret]=SetKineticCycleTime(KinCycleTime);
[ret,validExpTime,validAccTime,validKinTime]=GetAcquisitionTimings;
[ret]=SetHSSpeed(0,0);
[ret]=SetVSSpeed(0);
[ret]=StartAcquisition;
[ret,gstatus]=AndorGetStatus;
while(gstatus ~= 20073)%DRV_IDLE
    pause(1.0);
    [ret,gstatus]=AndorGetStatus;
end
[ret,data]=GetAcquiredData(xpixels*ypixels); 
plot(data)% 3D data 
[ret]=SetCoolerMode(1);
[ret]=AndorShutDown;