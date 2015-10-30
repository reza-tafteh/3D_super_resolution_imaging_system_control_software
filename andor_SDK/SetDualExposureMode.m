function [ret] = SetDualExposureMode(state)
% [ret] = GetDualExposureMode()
%
% Description	This function turns on and off the option to acquire 2 frames for each external trigger 
%               pulse.  This mode is only available for certain sensors in run till abort mode, external 
%               trigger, full image.
%
% Parameters	state: Enables/Disables dual exposure mode
%                      1 – Enable mode
%                      0 – Disable mode
%
% Return        ret : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_NOT_SUPPORTED
%                                                 DRV_ACQUIRING, DRV_P1INVALID
%
% See also	    GetCapabilities, SetDualExposureTimes, SetDualExposureTimes
[ret] = andorfunctions('SetDualExposureMode', state);

