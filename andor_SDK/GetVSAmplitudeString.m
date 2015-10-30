function [ret, text] = GetVSAmplitudeString(index)
% [ret, amplitude] = GetVSAmplitudeString(index)
%
% Description	This Function is used to get the index of the Vertical Clock Amplitude that corresponds 
%               to the string passed in. 
%
% Parameters	index : VS amplitude index required
%
% Return        ret            : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED,
%                                                     DRV_P1INVALID, DRV_P2INVALID
%               index : Returns the amplitude string corresponding to the index
%
% See also      GetVSAmplitudeFromString, GetVSAmplitudeValue
[ret, text] = andorfunctions('GetVSAmplitudeString', index);



