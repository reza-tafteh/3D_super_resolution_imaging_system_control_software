function [ret] = OA_SetString (name, param, value)
% [ret, value] = OA_SetString(name, param, value)
%
% Description	This function is used to set values for string type acquisition parameters where the
%               new values are stored in memory.  To commit changes to file call WriteToFile().
%
% Parameters	string name  : The name of the mode for which an acquisition parameter
%                              will be edited.
%               string param : The name of the acquisition parameter for which a value will be 
%                              edited.
%               string value : The value of the acquisition parameter.
%
% Return        ret          : Return code can be one of : DRV_SUCCESS, DRV_P1INVALID, DRV_P2INVALID
%                                                          DRV_P3INVALID, DRV_OA_MODE_DOES_NOT_EXIST               
%
% See also	    OA_GetString, OA_EnableMode, OA_WriteToFile
[ret] = andorfunctions('OA_SetString', name, param, value);

