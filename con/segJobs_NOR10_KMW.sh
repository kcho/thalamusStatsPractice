rm -rf NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/left
mkdir -p NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/left
echo NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/lh_LPFC.nii.gz > NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/lh_LTC.nii.gz >> NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/lh_MPFC.nii.gz >> NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/lh_MTC.nii.gz >> NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/lh_OCC.nii.gz >> NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/lh_OFC.nii.gz >> NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/lh_PC.nii.gz >> NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/lh_SMC.nii.gz >> NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
probtrackx --mode=seedmask -x NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/lh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=NOR10_KMW/registration/freesurferToFA --forcedir --opd -s NOR10_KMW/DTI.bedpostX/merged -m NOR10_KMW/DTI.bedpostX/nodif_brain_mask --dir=NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/left --targetmasks=NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/left/targets.txt --os2t
rm -rf NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/right
mkdir -p NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/right
echo NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/rh_LPFC.nii.gz > NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/rh_LTC.nii.gz >> NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/rh_MPFC.nii.gz >> NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/rh_MTC.nii.gz >> NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/rh_OCC.nii.gz >> NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/rh_OFC.nii.gz >> NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/rh_PC.nii.gz >> NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/rh_SMC.nii.gz >> NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
probtrackx --mode=seedmask -x NOR10_KMW/segmentation/with_T1_freesurfer/ROIs/rh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=NOR10_KMW/registration/freesurferToFA --forcedir --opd -s NOR10_KMW/DTI.bedpostX/merged -m NOR10_KMW/DTI.bedpostX/nodif_brain_mask --dir=NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/right --targetmasks=NOR10_KMW/segmentation/with_T1_freesurfer/segmentation/right/targets.txt --os2t
