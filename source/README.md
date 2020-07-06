# SSD learning

using label me to annotate. [instance segmentation example](https://github.com/wkentaro/labelme/tree/master/examples/instance_segmentation )
```
labelme data_annotated --labels labels.txt data_annotated_dir
```
```
./labelme2voc.py data_annotated_dir/train data_dataset_voc_dir/train --labels labels.txt
```
