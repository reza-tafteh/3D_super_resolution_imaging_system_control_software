function [ret] = Filter_SetThreshold(threshold)
% [ret] = Filter_SetThreshold(threshold)
%
% Description	Sets the threshold value for the Noise Filter.
%
% Parameters	threshold : Threshold value used to process image. Valid values are :
%                           0 – 65535  for Level Above filter.
%                           0 – 10 for all other filters. 
%
% Return        ret   : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_NOT_SUPPORTED,
%                                                   DRV_P1INVALID
%
% See also	    Filter_GetThreshold
[ret] = andorfunctions('Filter_SetThreshold', threshold);



