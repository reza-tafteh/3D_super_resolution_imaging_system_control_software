function [ret, threshold] = Filter_GetThreshold()
% [ret, threshold] = Filter_GetThreshold()
%
% Description	Returns the current Noise Filter threshold value.
%
% Parameters	NONE
%
% Return        ret   : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_NOT_SUPPORTED,
%                                                   DRV_P1INVALID
%               threshold : The current threshold value.
%
% See also	    Filter_SetThreshold
[ret, threshold] = andorfunctions('Filter_GetThreshold');



