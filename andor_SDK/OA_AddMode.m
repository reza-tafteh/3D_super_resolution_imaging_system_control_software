function [ret] = OA_AddMode(name, description)
% [ret] = OA_AddMode(name, description)
%
% Description	This function will add a mode name and description to memory.  Note that this will not 
%               add the mode to file, a subsequent call to OA_WriteToFile must be made.
%
% Parameters	string name        : A name for the mode to be defined.
%               string description : A description of the user defined mode.
%
% Return        ret : Return code can be one of : DRV_SUCCESS, DRV_P1INVALID, DRV_P3INVALID,
%                                                 DRV_OA_INVALID_STRING_LENGTH, DRV_OA_INVALID_NAMING,
%                                                 DRV_OA_MODE_BUFFER_FULL, DRV_OA_INVALID_CHARS_IN_NAME,       
%                                                 DRV_OA_MODE_ALREADY_EXISTS, DRV_OA_INVALID_CHARS_IN_NAME
%
% See also	    OA_DeleteMode, OA_WriteToFile
[ret] = andorfunctions('OA_AddMode', name, description);

