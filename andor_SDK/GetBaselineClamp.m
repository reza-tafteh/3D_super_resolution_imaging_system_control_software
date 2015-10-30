function [ret, state] = GetBaselineClamp()
% [ret, state] = GetBaselineClamp()
%
% Description	This function returns the status of the baseline clamp functionality. With this feature 
%               enabled the baseline level of each scan in a kinetic series will be more consistent 
%               across the sequence.
%
% Parameters	NONE
%
% Return        ret   : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_ACQUIRING
%                                                   DRV_NOT_SUPPORTED, DRV_P1INVALID
%               state : Baseline clamp functionality Enabled/Disabled
%                       1 – Baseline Clamp Enabled
%                       0 – Baseline Clamp Disabled
%
% See also	    SetBaselineClamp, SetBaselineOffset
[ret, state] = andorfunctions('GetBaselineClamp');

