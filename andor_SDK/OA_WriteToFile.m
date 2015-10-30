function [ret] = OA_WriteToFile(filename)
% [ret] = OA_WriteToFile(filename)
%
% Description	This function will write a User defined list of modes to the User file.  
%               The Preset file will not be affected.
%
% Parameters	string filename : :  The name of the file to be written to.
%
% Return        ret : Return code can be one of : DRV_SUCCESS, DRV_P1INVALID, DRV_OA_INVALID_STRING_LENGTH,
%                                                 DRV_OA_INVALID_FILE, DRV_ERROR_FILESAVE, 
%                                                 DRV_OA_FILE_HAS_BEEN_MODIFIED,DRV_OA_INVALID_CHARS_IN_NAME
%
% See also	    OA_WriteToFile
[ret] = andorfunctions('OA_WriteToFile', filename);

