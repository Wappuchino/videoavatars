#!/bin/bash

if [ "$#" -le 1 ]; then
    echo "usage: run_step1.sh <path_to_subject_directory> <output_directory> [options]" >&2
    exit 1
fi

SUBJ="$1"
OUT="$2"

if [[ $SUBJ = *"female"* ]]; then
  MODEL='--model vendor/smpl/models/basicModel_f_lbs_10_207_0_v1.0.0.pkl'
fi

python2 step1_pose.py $SUBJ/keypoints.hdf5 $SUBJ/masks.hdf5 $SUBJ/camera.pkl $OUT/reconstructed_poses.hdf5 $MODEL ${@:3}