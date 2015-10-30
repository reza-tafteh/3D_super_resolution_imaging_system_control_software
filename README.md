# dSTORM_instrument_control
A software developed in MATLAB to:

- Control a home-built dSTORM setup designed for signel-molecule localization microscopy. List of devices to control is as following

             - Lasers (Coherent Inc.'s lasers mainly)
             - Opto-elctical devices (phase modulators, adaptive optics, tunable lenses and filters)
             - Andor cameras (iXon and Newton cameras) 
             - Piezo stages (ASI, PI and Thorlabs)

- Maintain stability of the setup by real-time drift correction, even when imaging deep into cell/tissue. In the current setup in LASIR, this is done by an optical design featuring two independent and variable focal planes 
-
             - For a comprehensive description please refer to "Single molecule localization deep within thick cells; a novel                  super-resolution microscope" by Tafteh et al. DOI: 10.1002/jbio.201500140) - http://onlinelibrary.wiley.com/doi/10.1002/jbio.201500140/abstract
             

- Obtain depth-dependent calibration curve.
- Provide user-friendly tools for on-line image processing and better monitoring of the setup upon image acquisition.
