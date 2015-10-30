function [ret, minimum, maximum] = GetCountConvertWavelengthRange()
% [ret, minimum, maximum] = GetCountConvertWavelengthRange()
%
% Description	This function returns the valid wavelength range available in Count Convert mode.
%
% Parameters	NONE
%
% Return        ret     : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_NOT_SUPPORTED
%               minimum : minimum wavelength permited.
%               maximum : maximum wavelength permited.
%
% See also	    GetCapabilities, SetCountConvertMode, SetCountConvertWavelength
[ret, minimum, maximum] = andorfunctions('GetCountConvertWavelengthRange');

