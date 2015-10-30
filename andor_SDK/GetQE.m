function [ret, QE] = GetQE(sensor, wavelength, mode)
% [ret, QE] = GetQE(sensor, wavelength, mode)
%
% Description	Returns the percentage QE for a particular head model at a user specified wavelength.
%
% Parameters	string sensor : head model
%               wavelength    : wavelength at which QE is required 
%               mode          : Clara mode (Normal (0) or Extended NIR (1)).  0 for all other systems 
%
% Return        ret     : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED
%               QE      : requested QE
%
% See also	    GetHeadModel, GetCapabilities
[ret, QE] = andorfunctions('GetQE',sensor, wavelength, mode);

