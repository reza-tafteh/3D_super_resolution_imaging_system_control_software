function [ret, value] = OA_GetFloat (name, param)
% [ret, value] = OA_GetFloat(name, param)
%
% Description	This function is used to get the values for floating point type acquisition parameters.
%               Values are retrieved from memory for the specified mode name.
%
% Parameters	string name        : The name of the mode for which an acquisition parameter
%                                    will be retrieved.
%               string param       : The name of the acquisition parameter for which a value will be 
%                                    retrieved.
%
% Return        ret   : Return code can be one of : DRV_SUCCESS, DRV_P1INVALID, DRV_P2INVALID, 
%                                                   DRV_P3INVALID
%               value : The value of the acquisition parameter.
%
% See also	    OA_SetFloat
[ret, value] = andorfunctions('OA_GetFloat', name, param);

