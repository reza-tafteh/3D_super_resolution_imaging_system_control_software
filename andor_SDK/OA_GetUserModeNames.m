function [ret, list] = OA_GetUserModeNames()
% [ret, list] = OA_GetUserModeNames ()
%
% Description	This function will return the available mode names from a User defined file.  The mode 
%               and the User defined file must exist.
%
% Parameters	NONE
%
% Return        ret          : Return code can be one of : DRV_SUCCESS, DRV_P1INVALID, DRV_OA_NULL_ERROR
%               string list  : A list of user mode names.  Modes will be delimited by a ‘,’.
%
% See also	    OA_GetNumberOfUserModes
[ret, list] = andorfunctions('OA_GetUserModeNames');

