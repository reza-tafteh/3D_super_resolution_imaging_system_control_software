function [ret, noModes] = OA_GetNumberOfPreSetModes()
% [ret, noModes] = OA_GetNumberOfPreSetModes()
%
% Description	This function will return the number of modes defined in the Preset file.  
%               The Preset file must exist.
%
% Parameters	NONE
%
% Return        ret          : Return code can be one of : DRV_SUCCESS, DRV_P1INVALID, DRV_OA_NULL_ERROR
%                                                          DRV_OA_BUFFER_FULL

%               noModes      : The number of modes in the Andor file.
%
% See also	    OA_GetPreSetModeNames
[ret, noModes] = andorfunctions('OA_GetNumberOfPreSetModes ');

