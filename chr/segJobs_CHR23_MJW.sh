rm -rf CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/left
mkdir -p CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/left
echo CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/lh_LPFC.nii.gz > CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/lh_LTC.nii.gz >> CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/lh_MPFC.nii.gz >> CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/lh_MTC.nii.gz >> CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/lh_OCC.nii.gz >> CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/lh_OFC.nii.gz >> CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/lh_PC.nii.gz >> CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/lh_SMC.nii.gz >> CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
probtrackx --mode=seedmask -x CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/lh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=CHR23_MJW/registration/freesurferToFA --forcedir --opd -s CHR23_MJW/DTI.bedpostX/merged -m CHR23_MJW/DTI.bedpostX/nodif_brain_mask --dir=CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/left --targetmasks=CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt --os2t
rm -rf CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/right
mkdir -p CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/right
echo CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/rh_LPFC.nii.gz > CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/rh_LTC.nii.gz >> CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/rh_MPFC.nii.gz >> CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/rh_MTC.nii.gz >> CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/rh_OCC.nii.gz >> CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/rh_OFC.nii.gz >> CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/rh_PC.nii.gz >> CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/rh_SMC.nii.gz >> CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
probtrackx --mode=seedmask -x CHR23_MJW/segmentation/with_T1_freesurfer/ROIs/rh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=CHR23_MJW/registration/freesurferToFA --forcedir --opd -s CHR23_MJW/DTI.bedpostX/merged -m CHR23_MJW/DTI.bedpostX/nodif_brain_mask --dir=CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/right --targetmasks=CHR23_MJW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt --os2t