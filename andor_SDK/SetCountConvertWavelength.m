function [ret] = SetCountConvertWavelength(wavelength)
% [ret] = SetCountConvertWavelength(wavelength)
%
% Description	This function configures the wavelength used in Count Convert mode.
%
% Parameters	wavelength    : wavelength used to determine QE
%
% Return        ret     : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_ACQUIRING, 
%                                                     DRV_NOT_AVAILABLE, DRV_P1INVALID
%
% See also	    GetCapabilities, SetCountConvertMode
[ret] = andorfunctions('SetCountConvertWavelength',wavelength);

