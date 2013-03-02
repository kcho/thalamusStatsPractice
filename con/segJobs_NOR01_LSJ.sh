rm -rf NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/left
mkdir -p NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/left
echo NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/lh_LPFC.nii.gz > NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/lh_LTC.nii.gz >> NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/lh_MPFC.nii.gz >> NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/lh_MTC.nii.gz >> NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/lh_OCC.nii.gz >> NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/lh_OFC.nii.gz >> NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/lh_PC.nii.gz >> NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/lh_SMC.nii.gz >> NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
probtrackx --mode=seedmask -x NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/lh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=NOR01_LSJ/registration/freesurferToFA --forcedir --opd -s NOR01_LSJ/DTI.bedpostX/merged -m NOR01_LSJ/DTI.bedpostX/nodif_brain_mask --dir=NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/left --targetmasks=NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/left/targets.txt --os2t
rm -rf NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/right
mkdir -p NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/right
echo NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/rh_LPFC.nii.gz > NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/rh_LTC.nii.gz >> NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/rh_MPFC.nii.gz >> NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/rh_MTC.nii.gz >> NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/rh_OCC.nii.gz >> NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/rh_OFC.nii.gz >> NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/rh_PC.nii.gz >> NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/rh_SMC.nii.gz >> NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
probtrackx --mode=seedmask -x NOR01_LSJ/segmentation/with_T1_freesurfer/ROIs/rh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=NOR01_LSJ/registration/freesurferToFA --forcedir --opd -s NOR01_LSJ/DTI.bedpostX/merged -m NOR01_LSJ/DTI.bedpostX/nodif_brain_mask --dir=NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/right --targetmasks=NOR01_LSJ/segmentation/with_T1_freesurfer/segmentation/right/targets.txt --os2t
