function [ret] = OA_DeleteMode(name)
% [ret] = OA_DeleteMode(name)
%
% Description	This function will add a mode name and description to memory.  Note that this will not 
%               add the mode to file, a subsequent call to OA_WriteToFile must be made.
%
% Parameters	string name        : The name of the mode to be removed.
%
% Return        ret : Return code can be one of : DRV_SUCCESS, DRV_P1INVALID, DRV_OA_MODE_DOES_NOT_EXIST
%
% See also	    OA_AddMode, OA_WriteToFile
[ret] = andorfunctions('OA_DeleteMode', name);

