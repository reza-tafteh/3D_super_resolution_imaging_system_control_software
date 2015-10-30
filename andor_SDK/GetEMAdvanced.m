function [ret, state] = GetEMAdvanced()
% [ret, state] = GetEMAdvanced
%
% Description	Returns the current Advanced gain setting. 
%
% Parameters	none
%
% Return        ret     : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_ERROR_ACK, 
%                                                     DRV_P1INVALID
%               state   : current EM advanced gain setting
%
% See also	    SetEMAdvanced
[ret, state] = andorfunctions('GetEMAdvanced');

