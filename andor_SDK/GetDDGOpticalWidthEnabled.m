function [ret, enabled] = GetDDGOpticalWidthEnabled()
% [ret, enabled] = GetDDGOpticalWidthEnabled()
%
% Description	This function can be used to check whether optical gate widths are being used.
%
% Parameters	NONE
%
% Return        ret   : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_NOT_SUPPORTED ,
%                                                   DRV_ACQUIRING, DRV_ERROR_ACK, DRV_P2INVALID              
%
% See also	    GetCapabilities, GetDDGTTLWidth
[ret, enabled] = andorfunctions('GetDDGOpticalWidthEnabled');



