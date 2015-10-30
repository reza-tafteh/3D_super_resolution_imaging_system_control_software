function [ret, index] = GetVSAmplitudeFromString(amplitude)
% [ret, index] = GetVSAmplitudeFromString(amplitude)
%
% Description	This Function is used to get the index of the Vertical Clock Amplitude that corresponds 
%               to the string passed in. 
%
% Parameters	amplitude : VS amplitude string to test
%
% Return        ret            : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED,
%                                                     DRV_P1INVALID, DRV_P2INVALID
%               index : Returns the Index of the VSAmplitude that matches string passed in
%
% See also      GetVSAmplitudeString, GetVSAmplitudeValue
[ret, index] = andorfunctions('GetVSAmplitudeFromString',amplitude);

