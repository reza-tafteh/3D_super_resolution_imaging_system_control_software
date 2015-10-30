function [ret, minclosingtime, minopeningtime] = GetShutterMinTimes()
% [ret, minclosingtime, minopeningtime] = GetShutterMinTimes()
%
% Description	This function will return the minimum opening and closing times in milliseconds for the 
%               shutter on the current camera.
%
% Parameters	none
%
% Return        ret            : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_ERROR_ACK, 
%                                                     DRV_P1INVALID
%               minclosingtime : The minimum closing time in milliseconds that the shutter of the camera supports.
%               minopeningtime : The minimum opening time in milliseconds that the shutter of the camera supports.
[ret, minclosingtime, minopeningtime] = andorfunctions('GetShutterMinTimes');

