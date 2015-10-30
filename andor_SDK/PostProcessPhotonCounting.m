function [ret, OutputImage] = PostProcessPhotonCounting(InputImage, OutputBufferSize, NumImages, NumFrames, NumberOfThresholds, Threshold, Height, Width)
% [ret, OutputImage] = PostProcessPhotonCounting(InputImage, OutputBufferSize, NumImages, NumFrames, 
%                                                NumberOfThresholds, Threshold, Height, Width)
%
% Description	This function will convert the input image data to photons and return the processed 
%               image in the output buffer.
%
% Parameters	InputImage       : The input image data to be processed.
%               OutputBufferSize : The size of the output buffer.
%               NumImages        : The number of images if a kinetic series is supplied as the input data.
%               NumFrames        : The number of frames per output image.
%               NumberOfThresholds : The number of thresholds provided by the user.
%               Threshold        : Array of Thresholds used to define a photon.
%               Height           : The height of the image.
%               Width            : The width of the image.
%
% Return        ret : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_ACQUIRING, 
%                                                 DRV_P1INVALID, DRV_P2INVALID, DRV_P4INVALID, 
%                                                 DRV_P5INVALID, DRV_P6INVALID, DRV_P7INVALID, 
%                                                 DRV_P8INVALID, DRV_P9INVALID, DRV_ERROR_BUFFSIZE
%               OutputImage : The processed image.
%
% See also	    
[ret, OutputImage] = andorfunctions('PostProcessPhotonCounting', InputImage, OutputBufferSize, NumImages, NumFrames, NumberOfThresholds, Threshold, Height, Width);

