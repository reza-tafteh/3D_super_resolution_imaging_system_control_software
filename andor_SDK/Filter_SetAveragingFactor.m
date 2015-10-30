function [ret, factor] = Filter_GetAveragingFactor()
% [ret, factor] = Filter_GetAveragingFactor(factor)
%
% Description	Sets the averaging factor.
%
% Parameters	NONE
%
% Return        ret    : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED,  DRV_ACQUIRING,
%                                                    DRV_P1INVALID
%               factor : The current averaging factor value.
%
% See also	    Filter_SetAveragingFactor
[ret, factor] = andorfunctions('Filter_GetAveragingFactor');



