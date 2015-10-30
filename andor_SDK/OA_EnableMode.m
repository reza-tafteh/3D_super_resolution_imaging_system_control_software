function [ret] = OA_EnableMode(name)
% [ret] = OA_EnableMode(name)
%
% Description	This function will set all the parameters associated with the specified mode to be used 
%               for all subsequent acquisitions.  The mode specified by the user must be in either the 
%               Preset file or the User defined file.
%
% Parameters	string name        : The mode to be used for all subsequent acquisitions.
%
% Return        ret : Return code can be one of : DRV_SUCCESS, DRV_P1INVALID DRV_OA_MODE_DOES_NOT_EXIST,
%                                                 DRV_OA_CAMERA_NOT_SUPPORTED
%
% See also	    OA_AddMode
[ret] = andorfunctions('OA_EnableMode', name);

