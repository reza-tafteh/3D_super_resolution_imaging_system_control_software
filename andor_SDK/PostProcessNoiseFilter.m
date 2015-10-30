function [ret, OutputImage] = PostProcessNoiseFilter(InputImage, OutputBufferSize, Baseline, Mode, Threshold, Height, Width)
% [ret, OutputImage] = PostProcessNoiseFilter(InputImage, OutputBufferSize, Baseline, Mode, Threshold, 
%                                             Height, Width)
%
% Description	This function will apply a filter to the input image and return the processed image 
%               in the output buffer.  The filter applied is chosen by the user by setting Mode to a 
%               permitted value.
%
% Parameters	InputImage       : The input image data to be processed.
%               OutputBufferSize : The size of the output buffer.
%               Baseline         : The baseline associated with the image.
%               Mode             : The mode to use to process the data.  Valid options are:
%                                  1 – Use Median Filter.
%                                  2 – Use Level Above Filter.
%                                  3 – Use Interquartile Range Filter.
%                                  4 – Use Noise Threshold Filter.
%               Threshold        : This is the Threshold multiplier for the Median, Interquartile and 
%                                  Noise Threshold filters.  For the Level Above filter this is Threshold
%                                  count above the baseline.
%               Height           : The height of the image.
%               Width            : The width of the image.
%
% Return        ret : Return code can be one of : DRV_SUCCESS, DRV_NOT_SUPPORTED, DRV_NOT_INITIALIZED, 
%                                                 DRV_ACQUIRING, DRV_P1INVALID, DRV_P2INVALID, 
%                                                 DRV_P4INVALID, DRV_P5INVALID, DRV_P6INVALID,  
%                                                 DRV_P7INVALID, DRV_P8INVALID, DRV_ERROR_BUFFSIZE
%               OutputImage : The processed image.
%
% See also	    
[ret, OutputImage] = andorfunctions('PostProcessNoiseFilter',InputImage, OutputBufferSize, Baseline, Mode, Threshold, Height, Width);

