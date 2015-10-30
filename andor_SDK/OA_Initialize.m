function [ret] = OA_Initialize(filename)
% [ret] = OA_Initialize(filename)
%
% Description	This function will initialise the OptAcquire settings from a Preset file and a 
%               User defined file if it exists.
%
% Parameters	string filename : The name of a user xml file.  If the file exists then data will be read 
%                                 from the file.  If the file does not exist the file name may be used 
%                                 when the user calls WriteToFile().
%
% Return        ret : Return code can be one of : DRV_SUCCESS, DRV_P1INVALID, DRV_OA_CAMERA_NOT_SUPPORTED,
%                                                 DRV_OA_GET_CAMERA_ERROR, DRV_OA_ANDOR_FILE_NOT_LOADED,
%                                                 DRV_OA_USER_FILE_NOT_LOADED, DRV_OA_FILE_ACCESS_ERROR,
%                                                 DRV_OA_PRESET_AND_USER_FILE_NOT_LOADED
%
% See also	    OA_WriteToFile
[ret] = andorfunctions('OA_Initialize', filename);

