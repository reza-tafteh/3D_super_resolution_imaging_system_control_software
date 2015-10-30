function [ret] = SetSpoolThreadCount(int count)
% [ret] = SetSpoolThreadCount(int count)
%
% Description	This function sets the number of parallel threads used for writing data to disk when spooling 
%             is enabled. Increasing this to a value greater than the default of 1, can sometimes improve 
%             the data rate to the hard disk particularly with Solid State hard disks. In other cases increasing 
%             this value may actually reduce the rate at which data is written to disk.
%
% Parameters	count: The number of threads to use.
%
% Return        ret   : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, 
%                                                   DRV_ACQUIRING, DRV_P1INVALID              
%
% See also	    SetSpool
%
% NOTE:   This feature is currently only available when using the Neo camera.
[ret] = andorfunctions('SetSpoolThreadCount', count);



