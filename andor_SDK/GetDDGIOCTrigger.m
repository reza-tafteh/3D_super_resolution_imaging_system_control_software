function [ret, trigger] = GetDDGIOCTrigger()
% [ret, trigger] = GetDDGIOCTrigger()
%
% Description	This function can be used to determine how the IOC is triggered when the camera
%             is externally triggered
%
% Parameters	NONE
%
% Return        ret   : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_NOT_SUPPORTED ,
%                                                   DRV_ACQUIRING, DRV_ERROR_ACK, DRV_P2INVALID
%               trigger : Internally or externally triggered
%
% See also	    SetDDGIOCTrigger
[ret, trigger] = andorfunctions('GetDDGIOCTrigger');



