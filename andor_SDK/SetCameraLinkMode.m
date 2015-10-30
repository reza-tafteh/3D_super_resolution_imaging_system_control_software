function [ret] = SetCameraLinkMode(mode)
% [ret] = SetCameraLinkMode(mode)
%
% Description	This function allows the user to enable or disable the Camera Link
%               functionality for the camera. Enabling this functionality will start 
%               to stream all acquired data through the camera link interface.
%
% Parameters	mode : Enables/Disables Camera Link mode
%		               1 – Enable Camera Link
%		               0 – Disable Camera Link
%
% Return        ret            : Return code can be one of : DRV_SUCCESS, DRV_ACQUIRING,
%                                                            DRV_NOT_SUPPORTED, DRV_P1INVALID
% NOTE          Only vailable with iXon Ultra
[ret] = andorfunctions('SetCameraLinkMode', mode);

