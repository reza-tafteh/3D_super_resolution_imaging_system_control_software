# dSTORM_instrument_control
A software developed in MATLAB to

- control a home-built dSTORM setup designed for signel-molecule localization microscopy. List of the devices on the current setup are as the following

             - Illumination sources ( Coherent Inc.'s lasers + LEDs)
             - Opto-elctical devices (phase modulators, adaptive optics, tunable lenses and filters)
             - Andor cameras (iXon and Newton cameras) 
             - Piezo stages (ASI, PI and Thorlabs)
             
- maintain 3D stability of the setup by real-time drift correction, even when imaging deep within cells. The currenct setup uses a bifocal desgin with two independent and variable focal planes.
          
- obtain depth-dependent calibration curve.
- do on-line image processing and monitort the setup performance during image acquisition.
