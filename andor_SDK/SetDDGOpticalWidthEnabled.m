function [ret] = SetDDGOpticalWidthEnabled(enabled)
% [ret] = SetDDGOpticalWidthEnabled(enabled)
%
% Description	This function can be used to configure a system to use optical gate width.
%
% Parameters	enabled: optical gate width option (0 – Off, 1 – On). 
%
% Return        ret   : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_NOT_SUPPORTED ,
%                                                   DRV_ACQUIRING, DRV_ERROR_ACK, DRV_P1INVALID              
%
% See also	    GetCapabilities, GetDDGTTLWidth, GetDDGOpticalGateWidthEnabled
[ret] = andorfunctions('SetDDGOpticalWidthEnabled', enabled);



