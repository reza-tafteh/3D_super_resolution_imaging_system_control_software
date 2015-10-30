function [ret, ttlWidth] = GetDDGTTLGateWidth(opticalWidth)
% [ret, ttlWidth] = GetDDGTTLGateWidth(opticalWidth)
%
% Description	This function can be used to get the TTL gate width which corresponds 
%             to a particular optical gate width.
%
% Parameters	opticalWidth: optical gate width in picoseconds. 
%
% Return        ret   : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_NOT_SUPPORTED ,
%                                                   DRV_ACQUIRING, DRV_ERROR_ACK, DRV_P2INVALID
%               ttlWidth : TTL gate width in picoseconds.
%
% See also	    GetCapabilities SetDDGOpticalEnabled
[ret, ttlWidth] = andorfunctions('GetDDGTTLGateWidth', opticalWidth);



