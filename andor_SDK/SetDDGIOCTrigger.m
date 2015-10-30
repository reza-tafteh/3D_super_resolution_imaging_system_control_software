function [ret] = SetDDGIOCTrigger(trigger)
% [ret] = SetDDGIOCTrigger(trigger)
%
% Description	This function can be used to set how the IOC is triggered when the camera
%             is externally triggered
%
% Parameters	trigger : Internally or externally triggered
%
% Return        ret   : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_NOT_SUPPORTED ,
%                                                   DRV_ACQUIRING, DRV_ERROR_ACK, DRV_P2INVALID              
%
% See also	    SetDDGIOCTrigger
[ret] = andorfunctions('SetDDGIOCTrigger', trigger);



