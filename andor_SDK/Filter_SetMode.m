function [ret] = Filter_SetMode (mode)
% [ret] = Filter_SetMode (mode)
%
% Description	Set the Noise Filter to use.
%
% Parameters	mode : Filter mode to use.
%                      0 – No Filter
%                      1 – Median Filter
%                      2 – Level Above Filter
%                      3 – Interquartile Range Filter
%                      4 – Noise Threshold Filter
%
% Return        ret   : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_NOT_SUPPORTED,
%                                                   DRV_P1INVALID
%
% See also	    Filter_GetMode
[ret] = andorfunctions('Filter_SetMode', mode);



