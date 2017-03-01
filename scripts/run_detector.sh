#!/bin/bash

#if [ -z "$1" ] 
#  then
#    echo "No folder supplied!"
#    echo "Usage: bash `basename "$0"` mot_video_folder"
#    exit
#fi

DIR=$PWD; # Foveated_YOLT

# Choose set mode for caffe  [CPU | GPU]
SET_MODE=CPU

# Choose which GPU the detector runs on
GPU_ID=0

# Choose which video from the test set to start displaying
START_VIDEO_NUM=0

# Set to 0 to pause after each frame
PAUSE_VAL=1

# Choose number of top prediction that you want
TOP=5

# Size of the images received by the network
SIZE_MAP=227

# Define number of kernel levels
LEVELS=5

# Define size of the fovea
#SIGMAs={10,20,30,40,50,60,70,80,90,100,110,120,130,140}
SIGMA=50

# Choose segmentation threshold
THRESHOLD=0.75

# change this path to the absolute location of the network related files
FILES_FOLDER_ABSOLUTE_PATH=$PWD"/files/"
MODEL_FILE="deploy_caffenet.prototxt"
WEIGHTS_FILE="bvlc_caffenet.caffemodel"
MEAN_FILE="imagenet_mean.binaryproto"
LABELS_FILE="synset_words_change.txt"
#DATASET="/home/filipa/Documents/Validation_Part/"
DATASET=$PWD"/dataset/"
#BBOX=$PWD"/bbox/"
GROUND_TRUTH_LABELS=$FILES_FOLDER_ABSOLUTE_PATH"ground_truth_labels_ilsvrc12.txt"


for SIGMA in {20,40,60,80,100}
do
    for THRESHOLD in {0.75,0.95}
    do

        # /home/filipa/Documents/Foveated_YOLT/files/ deploy_caffenet.prototxt bvlc_caffenet.caffemodel imagenet_mean.binaryproto val.txt
        build/yolt $FILES_FOLDER_ABSOLUTE_PATH $MODEL_FILE $WEIGHTS_FILE $MEAN_FILE $LABELS_FILE $SET_MODE $GPU_ID $DATASET $TOP $THRESHOLD $SIZE_MAP $LEVELS $SIGMA $GROUND_TRUTH_LABELS
    done
done

