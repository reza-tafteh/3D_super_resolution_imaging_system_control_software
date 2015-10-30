function [ret] = SetCountConvertMode(mode)
% [ret] = SetCountConvertMode(mode)
%
% Description	This function configures the Count Convert mode.
%
% Parameters	mode    : Count Convert mode to be used
%                         0 – Data in Counts
%                         1 – Data in Electrons
%                         2 – Data in Photons
%
% Return        ret     : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_ACQUIRING, 
%                                                     DRV_NOT_AVAILABLE, DRV_P1INVALID
%
% See also	    GetCapabilities, SetCountConvertWavelength
[ret] = andorfunctions('SetCountConvertMode',mode);

