rm -rf EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/left
mkdir -p EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/left
echo EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/lh_LPFC.nii.gz > EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/lh_LTC.nii.gz >> EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/lh_MPFC.nii.gz >> EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/lh_MTC.nii.gz >> EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/lh_OCC.nii.gz >> EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/lh_OFC.nii.gz >> EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/lh_PC.nii.gz >> EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
echo EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/lh_SMC.nii.gz >> EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/left/targets.txt
probtrackx --mode=seedmask -x EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/lh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=EMO_8_Jung_Ji_Yoon/registration/freesurferToFA --forcedir --opd -s EMO_8_Jung_Ji_Yoon/DTI.bedpostX/merged -m EMO_8_Jung_Ji_Yoon/DTI.bedpostX/nodif_brain_mask --dir=EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/left --targetmasks=EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/left/targets.txt --os2t
rm -rf EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/right
mkdir -p EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/right
echo EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/rh_LPFC.nii.gz > EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/rh_LTC.nii.gz >> EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/rh_MPFC.nii.gz >> EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/rh_MTC.nii.gz >> EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/rh_OCC.nii.gz >> EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/rh_OFC.nii.gz >> EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/rh_PC.nii.gz >> EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
echo EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/rh_SMC.nii.gz >> EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/right/targets.txt
probtrackx --mode=seedmask -x EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/ROIs/rh_thalamus.nii -l -c 0.2 -S 2000 --steplength=0.5 -P 5000 --xfm=EMO_8_Jung_Ji_Yoon/registration/freesurferToFA --forcedir --opd -s EMO_8_Jung_Ji_Yoon/DTI.bedpostX/merged -m EMO_8_Jung_Ji_Yoon/DTI.bedpostX/nodif_brain_mask --dir=EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/right --targetmasks=EMO_8_Jung_Ji_Yoon/segmentation/with_T1_freesurfer/segmentation/right/targets.txt --os2t
