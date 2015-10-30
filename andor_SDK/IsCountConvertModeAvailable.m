function [ret] = IsCountConvertModeAvailable(mode)
% [ret] = IsCountConvertModeAvailable(mode)
%
% Description	This function checks if the hardware and current settings permit the use of the 
%               specified Count Convert mode. 
%
% Parameters	mode    : Count Convert mode to be checked
%
% Return        ret     : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_NOT_SUPPORTED,
%                                                     DRV_INVALID_COUNTCONVERT_MODE
%
% See also	    GetCapabilities, SetCountConvertMode, SetCountConvertWavelength
[ret] = andorfunctions('IsCountConvertModeAvailable',mode);

