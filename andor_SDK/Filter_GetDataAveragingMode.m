function [ret, mode] = Filter_GetDataAveragingMode()
% [ret, mode] = Filter_GetDataAveragingMode()
%
% Description	Returns the current averaging mode.
%
% Parameters	NONE
%
% Return        ret   : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED,  DRV_ACQUIRING,
%                                                   DRV_P1INVALID
%               mode  : The current averaging mode.
%
% See also	    Filter_SetDataAveragingMode
[ret, mode] = andorfunctions('Filter_GetDataAveragingMode');



