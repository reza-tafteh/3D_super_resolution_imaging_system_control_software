function [ret, mode] = Filter_GetMode()
% [ret, mode] = Filter_GetMode ()
%
% Description	Returns the current Noise Filter mode.
%
% Parameters	NONE
%
% Return        ret   : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_NOT_SUPPORTED,
%                                                   DRV_P1INVALID
%               mode  : Noise Filter mode. one of :
%                       0 – No Filter
%                       1 – Median Filter
%                       2 – Level Above Filter
%                       3 – Interquartile Range Filter
%                       4 – Noise Threshold Filter
%
% See also	    Filter_SetMode
[ret, mode] = andorfunctions('Filter_GetMode');



