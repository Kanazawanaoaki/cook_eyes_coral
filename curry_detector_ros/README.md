# curry_detector_ros
Coralを使ってROSのトピックに対して物体検出(SSD)を行う。

## How to run sample
roscore
```
roscore
```

image_publisher
```
source ~/ros/jsk_demo_ws/devel/setup.bash
rosrun jsk_perception image_publisher.py _file_name:=/home/kanazawa/ros/jsk_demo_ws/src/cook_eyes/food_detector/curry_first_try/train/train_annotated/train_01.jpg
```
coral launch
```
source ~/coral_ws/devel/setup.bash
roslaunch curry_detector_ros edgetpu_kitchen_dataset_detector.launch INPUT_IMAGE:=/image_publisher/output
```
view result
```
rosrun image_view image_view image:=/edgetpu_object_detector/output/image
```
adjust threshold
```
rosrun rqt_reconfigure rqt_reconfigure
```
