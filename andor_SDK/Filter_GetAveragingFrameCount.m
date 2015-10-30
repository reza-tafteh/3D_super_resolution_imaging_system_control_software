function [ret, frames] = Filter_GetAveragingFrameCount()
% [ret, frames] = Filter_GetAveragingFrameCount()
%
% Description	Returns the current frame count value.
%
% Parameters	NONE
%
% Return        ret   : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED,  DRV_ACQUIRING,
%                                                   DRV_P1INVALID
%               frames : The current frame count value.
%
% See also	    Filter_SetDataAveragingMode
[ret, frames] = andorfunctions('Filter_GetAveragingFrameCount');



