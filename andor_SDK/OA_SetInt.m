function [ret] = OA_SetInt (name, param, value)
% [ret, value] = OA_SetInt(name, param, value)
%
% Description	This function is used to set values for Integer type acquisition parameters 
%               where the new values are stored in memory.  To commit changes to file call WriteToFile().
%
% Parameters	string name  : The name of the mode for which an acquisition parameter
%                              will be edited.
%               string param : The name of the acquisition parameter for which a value will be 
%                              edited.
%               value        : The value of the acquisition parameter.
%
% Return        ret          : Return code can be one of : DRV_SUCCESS, DRV_P1INVALID, DRV_P2INVALID
%                                                          DRV_P3INVALID, DRV_OA_MODE_DOES_NOT_EXIST               
%
% See also	    OA_GetInt, OA_EnableMode, OA_WriteToFile
[ret] = andorfunctions('OA_SetInt', name, param, value);

