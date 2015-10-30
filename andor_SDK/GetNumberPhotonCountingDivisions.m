function [ret,noDivisions]=GetNumberPhotonCountingDivisions()

%unsigned int GetNumberPhotonCountingDivisions(unsigned long * noOfDivisions)
%
%
%Description :	Available in some systems is photon counting mode.  This function 
%               gets the number of photon counting divisions available.  The functions
%               SetPhotonCounting and GetPhotonCountingThreshold can be used to
%               specify which of these divisions is to be used.
%
%Arguments	 :  none
%
%Return		 :  ret    - Check the help for return code meanings
%               noDivisions - The number of allowed photon counting divisions
%

[ret,noDivisions] = andorfunctions('GetNumberPhotonCountingDivisions');

