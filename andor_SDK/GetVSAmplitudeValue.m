function [ret, value] = GetVSAmplitudeValue(index)
% [ret, value] = GetVSAmplitudeValue(index)
%
% Description	This Function is used to get the value of the Vertical Clock Amplitude found at the index passed in.  
%
% Parameters	index : VS amplitude index required
%
% Return        ret            : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED,
%                                                     DRV_P1INVALID, DRV_P2INVALID
%               value : Returns the corresponding alue of the Vertical Clock Amplitude
%
% See also      GetVSAmplitudeFromString, GetVSAmplitudeString
[ret, value] = andorfunctions('GetVSAmplitudeValue', index);

