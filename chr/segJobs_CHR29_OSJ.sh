rm -rf CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/left
mkdir -p CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/left
echo CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/lh_LPFC.nii.gz > CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/lh_LTC.nii.gz >> CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/lh_MPFC.nii.gz >> CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/lh_MTC.nii.gz >> CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/lh_OCC.nii.gz >> CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/lh_OFC.nii.gz >> CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/lh_PC.nii.gz >> CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/lh_SMC.nii.gz >> CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
probtrackx --mode=seedmask -x CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/lh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=CHR29_OSJ/registration/freesurferToFA --forcedir --opd -s CHR29_OSJ/DTI.bedpostX/merged -m CHR29_OSJ/DTI.bedpostX/nodif_brain_mask --dir=CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/left --targetmasks=CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt --os2t
rm -rf CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/right
mkdir -p CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/right
echo CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/rh_LPFC.nii.gz > CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/rh_LTC.nii.gz >> CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/rh_MPFC.nii.gz >> CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/rh_MTC.nii.gz >> CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/rh_OCC.nii.gz >> CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/rh_OFC.nii.gz >> CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/rh_PC.nii.gz >> CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/rh_SMC.nii.gz >> CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
probtrackx --mode=seedmask -x CHR29_OSJ/segmentation/with_T1_freesurfer/ROIs/rh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=CHR29_OSJ/registration/freesurferToFA --forcedir --opd -s CHR29_OSJ/DTI.bedpostX/merged -m CHR29_OSJ/DTI.bedpostX/nodif_brain_mask --dir=CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/right --targetmasks=CHR29_OSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt --os2t
