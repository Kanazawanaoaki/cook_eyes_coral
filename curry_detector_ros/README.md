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

## How to run curry detection

roscore
```
roscore
```

rosbag play
```
cd ~/Desktop/codes/in_jsk/my_dataset/rosbag/record-test/
rosbag play tomato-on-cutboard-2020-05-20-16-20-29.bag -l
```
coral launch
```
source ~/coral_ws/devel/setup.bash
roslaunch curry_detector_ros edgetpu_curry_ingredients_detector.launch INPUT_IMAGE:=/camera/rgb/image_raw
```
view result
```
rosrun image_view image_view image:=/edgetpu_object_detector/output/image
```
adjust threshold
```
rosrun rqt_reconfigure rqt_reconfigure
```

### veg_detector
for now it is the best model.
```
source ~/coral_ws/devel/setup.bash
roslaunch curry_detector_ros edgetpu_vegs_detector.launch INPUT_IMAGE:=/camera/rgb/image_raw
```

### epic_kitchens_2018 object_detection
[epic_kitchens_2018](https://epic-kitchens.github.io/2020-55.html )'s dataset for object_detection
```
source ~/coral_ws/devel/setup.bash
roslaunch curry_detector_ros edgetpu_epic_object_detector.launch INPUT_IMAGE:=/camera/rgb/image_raw
```

### pr2_look_around_object_detector
```
source ~/coral_ws/devel/setup.bash
roslaunch curry_detector_ros edgetpu_epic_object_detector.launch INPUT_IMAGE:=/image_publisher/output model_name:=20220304_mask_aug_n2_rembg_and_mask_test-xml-config
```
