function [ret, sensitivity] = GetSensitivity(channel, horzShift, amplifier, pa)
% [ret, sensitivity] = GetSensitivity(channel, horzShift, amplifier, pa)
%
% Description	This function returns the sensitivity for a particular speed. 
%
% Parameters	channel   : AD channel index.
%               amplifier : Type of output amplifier.
%               index     :	Channel speed index.
%                pa       : PreAmp gain index.
%
% Return        ret     : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_ACQUIRING, 
%                                                     DRV_P1INVALID, DRV_P2INVALID, DRV_P3INVALID, 
%                                                     DRV_P4INVALID
%               sensitivity  : requested sensitivity
%
% See also	    GetCapabilities
[ret, sensitivity] = andorfunctions('GetSensitivity',channel, horzShift, amplifier, pa);

