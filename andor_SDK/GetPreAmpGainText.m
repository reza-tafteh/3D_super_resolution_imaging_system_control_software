function [ret, text] = GetPreAmpGainText(index)
% [ret, text] = GetPreAmpGainText (int index)
%
% Description	This function will return a string with a pre amp gain description.  The pre amp gain
%               is selected using the index.  The SDK has a string associated with each of its pre amp
%               gains.
%
% Parameters	index - gain index - valid values : 0 to GetNumberPreAmpGains - 1
%
% Return        ret   : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_P1INVALID,
%                                                   DRV_P2INVALID, DRV_NOT_SUPPORTED
%               text  : description of the pre amp gain
%
% See also	    IsPreAmpGainAvailable, GetNumberPreAmpGains, SetPreAmpGain, GetCapabilities
[ret, text] = andorfunctions('GetPreAmpGainText', index);

