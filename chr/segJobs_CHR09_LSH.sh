rm -rf CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/left
mkdir -p CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/left
echo CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/lh_LPFC.nii.gz > CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/lh_LTC.nii.gz >> CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/lh_MPFC.nii.gz >> CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/lh_MTC.nii.gz >> CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/lh_OCC.nii.gz >> CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/lh_OFC.nii.gz >> CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/lh_PC.nii.gz >> CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/lh_SMC.nii.gz >> CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
probtrackx --mode=seedmask -x CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/lh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=CHR09_LSH/registration/freesurferToFA --forcedir --opd -s CHR09_LSH/DTI.bedpostX/merged -m CHR09_LSH/DTI.bedpostX/nodif_brain_mask --dir=CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/left --targetmasks=CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/left/targets.txt --os2t
rm -rf CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/right
mkdir -p CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/right
echo CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/rh_LPFC.nii.gz > CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/rh_LTC.nii.gz >> CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/rh_MPFC.nii.gz >> CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/rh_MTC.nii.gz >> CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/rh_OCC.nii.gz >> CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/rh_OFC.nii.gz >> CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/rh_PC.nii.gz >> CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/rh_SMC.nii.gz >> CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
probtrackx --mode=seedmask -x CHR09_LSH/segmentation/with_T1_freesurfer/ROIs/rh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=CHR09_LSH/registration/freesurferToFA --forcedir --opd -s CHR09_LSH/DTI.bedpostX/merged -m CHR09_LSH/DTI.bedpostX/nodif_brain_mask --dir=CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/right --targetmasks=CHR09_LSH/segmentation/with_T1_freesurfer/segmentation/right/targets.txt --os2t