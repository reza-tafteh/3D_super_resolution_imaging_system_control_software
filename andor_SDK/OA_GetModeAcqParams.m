function [ret, list] = OA_GetModeAcqParams(name)
% [ret, list] = OA_GetModeAcqParams(name)
%
% Description	This function will return all acquisition parameters associated with the specified mode.
%               The mode specified by the user must be in either the Preset file or the User defined file.  The user must allocate enough memory for all of the acquisition parameters.
%
% Parameters	string name        : The mode for which all acquisition parameters must be returned.
%
% Return        ret          : Return code can be one of : DRV_SUCCESS, DRV_P1INVALID, DRV_P2INVALID,
%                                                          DRV_OA_NO_USER_DATA
%               string list  : A string of acquisition parameters.  Parameters will be delimited by a ‘,’.
%
% See also	    OA_GetNumberOfAcqParams
[ret, list] = andorfunctions('OA_GetModeAcqParams', name);

