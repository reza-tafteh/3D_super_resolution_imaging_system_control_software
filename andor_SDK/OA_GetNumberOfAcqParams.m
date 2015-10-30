function [ret, noParams] = OA_GetNumberOfAcqParams (name)
% [ret, noParams] = OA_GetNumberOfAcqParams(name)
%
% Description	This function will return the parameters associated with a specified mode.  The mode must 
%               be present in either the Preset file or the User defined file.
%
% Parameters	string name  : The mode to search for a list of acquisition parameters.
%
% Return        ret          : Return code can be one of : DRV_SUCCESS, DRV_P1INVALID, DRV_P2INVALID,
%                                                          DRV_OA_NO_USER_DATA
%               noParams     : The number of acquisition parameters for the specified mode.
%
% See also	    OA_GetModeAcqParams 
[ret, noParams] = andorfunctions('OA_GetNumberOfAcqParams', name);

