# FSGroupSurfTtest
This MATLAB script performs comparison between GM surface thicknesses of two populations of subjects that have already been processed using FreeSurfer anatomical processing pipeline(recon-all)

You need MATLAB and FreeSurfer to execute this code.

Sample usage(MATLAB script): SurfTtest(P1,P2,'P1vsP2','P1','P2','PN');

P1 and P2 are the names of the subjects in two groups being compared. These have to be MATLAB strings.
Each of these subjects must have already been processed using FreeSurfer processing pipeline(recon-all or similar) and their surface stats must be present in $FREESURFER_DIR/subjects/Sub1/surf/ directory.

The directory 'P1vsP2' contains all the intermediate/FSGD etc files created.

The script, after processing, display the statistically significant differences between LH and RH surfaces of two groups using FreeSurfer.

