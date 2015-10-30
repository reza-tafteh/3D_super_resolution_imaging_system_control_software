function [ret] = Filter_SetAveragingFrameCount(frames)
% [ret] = Filter_SetAveragingFrameCount(frames)
%
% Description	Sets the averaging frame count.
%
% Parameters	frames : The averaging frame count to use.
%
% Return        ret   : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED,  DRV_ACQUIRING,
%                                                   DRV_P1INVALID
%
% See also	    Filter_GetAveragingFrameCount
[ret] = andorfunctions('Filter_SetAveragingFrameCount', frames);



