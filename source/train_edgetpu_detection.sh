#!/bin/bash

function message() {
  local color=$1; shift;
  local message=$@

  # Output command being executed
  echo -e "\e[${color}m${message}\e[0m"
}

if [ -z "$1" ]; then
    message 31 "Set path to dataset is required"
    exit 1
fi

DATASET_DIR=$(realpath $1); shift 1;
DATASET_NAME=$(basename $DATASET_DIR)

if [ ! -e $DATASET_DIR/train/JPEGImages -o \
       ! -e $DATASET_DIR/train/class_names.txt ]; then
    message 31 "Invalid VOC format annotation"
    exit 1
fi

DATE=$(date +"%Y%m%d-%H%M%S")
## DATE=20200510 FOR DEBUG

set -x
scp -q -r $DATASET_DIR dlbox1.jsk.imi.i.u-tokyo.ac.jp:$DATE-$DATASET_NAME
cat <<EOF | ssh -t dlbox1.jsk.imi.i.u-tokyo.ac.jp
    wget https://raw.githubusercontent.com/knorth55/coral_usb_ros/master/training/labelme_voc/run.sh -O run.sh
    bash run.sh $DATE-$DATASET_NAME $@
EOF

scp -r dlbox1.jsk.imi.i.u-tokyo.ac.jp:$DATE-$DATASET_NAME/learn $DATASET_DIR