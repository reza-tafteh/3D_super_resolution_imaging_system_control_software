function [ret] = SetDualExposureTimes(exposure1, exposure2)
% [ret] = SetDualExposureTimes(exposure1, exposure2)
%
% Description	This function configures the two exposure times used in dual exposure mode.  
%               This mode is only available for certain sensors in run till abort mode, external trigger, 
%				full image.
%
% Parameters	exposure1: the exposure time in seconds for each odd numbered frame.
%               exposure2: the exposure time in seconds for each even numbered frame.
%
% Return        ret : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_NOT_SUPPORTED
%                                                 DRV_ACQUIRING, DRV_P1INVALID, DRV_P2INVALID	
%
% See also	    GetCapabilities, SetDualExposureMode, GetDualExposureTimes
[ret] = andorfunctions('SetDualExposureTimes', exposure1, exposure2);

