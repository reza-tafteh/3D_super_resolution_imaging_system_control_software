function [ret] = Filter_SetDataAveragingMode(mode)
% [ret] = Filter_SetDataAveragingMode(mode)
%
% Description	Sets the current data averaging mode.
%
% Parameters	mode  : The averaging factor mode to use.
%
% Return        ret   : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED,  DRV_ACQUIRING,
%                                                   DRV_P1INVALID
%
% See also	    Filter_GetDataAveragingMode
[ret] = andorfunctions('Filter_SetDataAveragingMode', mode);



