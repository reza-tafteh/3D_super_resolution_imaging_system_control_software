function [ret, exposure1, exposure2] = GetDualExposureTimes()
% [ret, exposure1, exposure2] = GetDualExposureTimes()
%
% Description	This function will return the current “valid” acquisition timing information for dual
%               exposure mode.  This mode is only available for certain sensors in run till abort mode, 
%               external trigger, full image.
%
% Parameters	NONE
%
% Return        ret : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_NOT_SUPPORTED
%                                                 DRV_ACQUIRING, DRV_NOTAVAILABLE
%               exposure1: valid exposure time in seconds for each odd numbered frame.
%               exposure2: valid exposure time in seconds for each even numbered frame.
%
% See also	    GetCapabilities, SetDualExposureMode, SetDualExposureTimes
[ret, exposure1, exposure2] = andorfunctions('GetDualExposureTimes');

