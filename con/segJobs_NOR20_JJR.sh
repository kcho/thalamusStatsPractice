rm -rf NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/left
mkdir -p NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/left
echo NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/lh_LPFC.nii.gz > NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/lh_LTC.nii.gz >> NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/lh_MPFC.nii.gz >> NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/lh_MTC.nii.gz >> NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/lh_OCC.nii.gz >> NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/lh_OFC.nii.gz >> NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/lh_PC.nii.gz >> NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/lh_SMC.nii.gz >> NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
probtrackx --mode=seedmask -x NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/lh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=NOR20_JJR/registration/freesurferToFA --forcedir --opd -s NOR20_JJR/DTI.bedpostX/merged -m NOR20_JJR/DTI.bedpostX/nodif_brain_mask --dir=NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/left --targetmasks=NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/left/targets.txt --os2t
rm -rf NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/right
mkdir -p NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/right
echo NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/rh_LPFC.nii.gz > NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/rh_LTC.nii.gz >> NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/rh_MPFC.nii.gz >> NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/rh_MTC.nii.gz >> NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/rh_OCC.nii.gz >> NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/rh_OFC.nii.gz >> NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/rh_PC.nii.gz >> NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/rh_SMC.nii.gz >> NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
probtrackx --mode=seedmask -x NOR20_JJR/segmentation/with_T1_freesurfer/ROIs/rh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=NOR20_JJR/registration/freesurferToFA --forcedir --opd -s NOR20_JJR/DTI.bedpostX/merged -m NOR20_JJR/DTI.bedpostX/nodif_brain_mask --dir=NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/right --targetmasks=NOR20_JJR/segmentation/with_T1_freesurfer/segmentation/right/targets.txt --os2t
