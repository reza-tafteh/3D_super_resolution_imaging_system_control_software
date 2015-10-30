function [ret, noModes] = OA_GetNumberOfUserModes()
% [ret, noModes] = OA_GetNumberOfUserModes()
%
% Description	This function will return the number of modes defined in the User file. 
%               The user defined file must exist.
%
% Parameters	NONE
%
% Return        ret          : Return code can be one of : DRV_SUCCESS, DRV_P1INVALID, DRV_OA_NULL_ERROR,
%                                                          DRV_OA_BUFFER_FULL
%               noModes      : The number of modes in the user file.
%
% See also	    OA_GetUserModeNames
[ret, noModes] = andorfunctions('OA_GetNumberOfUserModes ');

