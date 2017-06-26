
CompName=$1
FsgdF=$2

mris_preproc --target fsaverage --hemi lh --meas thickness --out lh.paired-diff.thickness.mgh --fsgd $FsgdF

mri_surf2surf --s fsaverage --hemi lh --fwhm 5 --sval lh.paired-diff.thickness.mgh --tval lh.paired-diff.thickness.sm05.mgh

mri_glmfit --y lh.paired-diff.thickness.sm05.mgh --fsgd $FsgdF --surf fsaverage lh --cortex --glmdir $CompName --C lh-mean.mtx

mris_preproc --target fsaverage --hemi rh --meas thickness --out rh.paired-diff.thickness.mgh --fsgd $FsgdF

mri_surf2surf --s fsaverage --hemi rh --fwhm 5 --sval rh.paired-diff.thickness.mgh --tval rh.paired-diff.thickness.sm05.mgh

mri_glmfit --y rh.paired-diff.thickness.sm05.mgh --fsgd $FsgdF --surf fsaverage rh --cortex --glmdir $CompName --C rh-mean.mtx

cd $CompName

freeview -f /home/fmri/UsmanData/freesurfer/subjects/fsaverage/surf/lh.inflated:overlay=lh-mean/sig.mgh:annot=aparc.annot:overlay_threshold=3,5 -viewport 3d -f /home/fmri/UsmanData/freesurfer/subjects/fsaverage/surf/rh.inflated:overlay=rh-mean/sig.mgh:annot=aparc.annot:overlay_threshold=3,5 -viewport 3d
