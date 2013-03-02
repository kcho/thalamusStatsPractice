rm -rf CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/left
mkdir -p CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/left
echo CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/lh_LPFC.nii.gz > CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/lh_LTC.nii.gz >> CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/lh_MPFC.nii.gz >> CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/lh_MTC.nii.gz >> CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/lh_OCC.nii.gz >> CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/lh_OFC.nii.gz >> CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/lh_PC.nii.gz >> CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/lh_SMC.nii.gz >> CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
probtrackx --mode=seedmask -x CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/lh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=CHR30_SHB/registration/freesurferToFA --forcedir --opd -s CHR30_SHB/DTI.bedpostX/merged -m CHR30_SHB/DTI.bedpostX/nodif_brain_mask --dir=CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/left --targetmasks=CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/left/targets.txt --os2t
rm -rf CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/right
mkdir -p CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/right
echo CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/rh_LPFC.nii.gz > CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/rh_LTC.nii.gz >> CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/rh_MPFC.nii.gz >> CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/rh_MTC.nii.gz >> CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/rh_OCC.nii.gz >> CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/rh_OFC.nii.gz >> CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/rh_PC.nii.gz >> CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/rh_SMC.nii.gz >> CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
probtrackx --mode=seedmask -x CHR30_SHB/segmentation/with_T1_freesurfer/ROIs/rh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=CHR30_SHB/registration/freesurferToFA --forcedir --opd -s CHR30_SHB/DTI.bedpostX/merged -m CHR30_SHB/DTI.bedpostX/nodif_brain_mask --dir=CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/right --targetmasks=CHR30_SHB/segmentation/with_T1_freesurfer/segmentation/right/targets.txt --os2t
