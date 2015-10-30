function [ret, list] = OA_GetPreSetModeNames()
% [ret, list] = OA_GetPreSetModeNames ()
%
% Description	This function will return the available mode names from the Preset file.  
%               The mode and the Preset file must exist.    The user must allocate enough memory for all 
%               of the acquisition parameters.
%
% Parameters	NONE
%
% Return        ret          : Return code can be one of : DRV_SUCCESS, DRV_P1INVALID, DRV_OA_NULL_ERROR
%               string list  : A list of prset mode names.  Modes will be delimited by a ‘,’.
%
% See also	    OA_GetNumberOfPreSetModes
[ret, list] = andorfunctions('OA_GetPreSetModeNames');

