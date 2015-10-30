function [ret, OutputImage] = PostProcessCountConvert(InputImage, OutputBufferSize, NumImages,  Baseline, Mode, EmGain, QE, Sensitivity, Height, Width)
% [ret, OutputImage] = PostProcessCountConvert(InputImage, OutputBufferSize, NumImages,  Baseline, Mode, 
%                                              EmGain, QE, Sensitivity, Height, Width)
%
% Description	This function will convert the input image data to either Photons or Electrons based on 
%               the mode selected by the user.  The input data should be in counts.
%
% Parameters	InputImage       : The input image data to be processed.
%               OutputBufferSize : The size of the output buffer.
%               NumImages        : The number of images if a kinetic series is supplied as the input data.
%               Baseline         : The baseline associated with the image.
%               Mode             : The mode to use to process the data.  Valid options are:
%                                  1 – Convert to Electrons
%                                  2 – Convert to Photons
%               EmGain           : The gain level of the input image.
%               QE               : The Quantum Efficiency of the sensor.
%               Sensitivity      : The Sensitivity value used to acquire the image.
%               Height           : The height of the image.
%               Width            : The width of the image.
%
% Return        ret : Return code can be one of : DRV_SUCCESS, DRV_NOT_INITIALIZED, DRV_ACQUIRING, 
%                                                 DRV_P1INVALID, DRV_P2INVALID, DRV_P4INVALID, 
%                                                 DRV_P5INVALID, DRV_P6INVALID, DRV_P7INVALID, 
%                                                 DRV_P8INVALID, DRV_P9INVALID, DRV_P10INVALID, 
%                                                 DRV_P11INVALID, DRV_ERROR_BUFFSIZE
%               OutputImage : The processed image.
%
% See also	    
[ret, OutputImage] = andorfunctions('PostProcessCountConvert',InputImage, OutputBufferSize, NumImages,  Baseline, Mode, EmGain, QE, Sensitivity, Height, Width);

