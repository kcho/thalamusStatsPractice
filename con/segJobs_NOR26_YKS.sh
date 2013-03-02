rm -rf NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/left
mkdir -p NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/left
echo NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/lh_LPFC.nii.gz > NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/lh_LTC.nii.gz >> NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/lh_MPFC.nii.gz >> NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/lh_MTC.nii.gz >> NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/lh_OCC.nii.gz >> NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/lh_OFC.nii.gz >> NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/lh_PC.nii.gz >> NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/lh_SMC.nii.gz >> NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
probtrackx --mode=seedmask -x NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/lh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=NOR26_YKS/registration/freesurferToFA --forcedir --opd -s NOR26_YKS/DTI.bedpostX/merged -m NOR26_YKS/DTI.bedpostX/nodif_brain_mask --dir=NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/left --targetmasks=NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/left/targets.txt --os2t
rm -rf NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/right
mkdir -p NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/right
echo NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/rh_LPFC.nii.gz > NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/rh_LTC.nii.gz >> NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/rh_MPFC.nii.gz >> NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/rh_MTC.nii.gz >> NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/rh_OCC.nii.gz >> NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/rh_OFC.nii.gz >> NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/rh_PC.nii.gz >> NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/rh_SMC.nii.gz >> NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
probtrackx --mode=seedmask -x NOR26_YKS/segmentation/with_T1_freesurfer/ROIs/rh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=NOR26_YKS/registration/freesurferToFA --forcedir --opd -s NOR26_YKS/DTI.bedpostX/merged -m NOR26_YKS/DTI.bedpostX/nodif_brain_mask --dir=NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/right --targetmasks=NOR26_YKS/segmentation/with_T1_freesurfer/segmentation/right/targets.txt --os2t
