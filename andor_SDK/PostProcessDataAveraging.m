function [ret, OutputImage] = PostProcessDataAveraging(pInputImage, iOutputBufferSize, iNumImages, iAveragingFilterMode, iHeight, iWidth, iFrameCount, iAveragingFactor)
% [ret, OutputImage] = PostProcessDataAveraging(pInputImage, iOutputBufferSize, iNumImages, 
%                                               iAveragingFilterMode, iHeight, iWidth, iFrameCount, 
%                                               iAveragingFactor)

[ret, OutputImage] = andorfunctions(' [ret, OutputImage] = PostProcessDataAveraging', pInputImage, iOutputBufferSize, iNumImages, iAveragingFilterMode, iHeight, iWidth, iFrameCount, iAveragingFactor);

