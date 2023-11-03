# Application Development Based on IOS

![截屏2023-11-03 下午2.46.55](images/%E6%88%AA%E5%B1%8F2023-11-03%20%E4%B8%8B%E5%8D%882.46.55-8994019.png)



## 1. Introduction

 This is the laboratory for the course "*Developing Intelligent Apps on iOS*" in 2023 fall, primarily focused on developing mobile intelligent applications for the iOS platform using Xcode, from the basic "Hello, world" to the image classification application based on CoreML.

Use `Swift` language.



## 2. Development Environment

* MacOS 10.15.2

* Xcode 12.4

  

## 3. Four Applications

### Hello, World

> See the code and presentation in `../iw00_Hello,world`

* Design Button 1 to display the text "Hello world" in the app when clicked.
* Design Button 2 to keep a count of the number of times it is clicked and display it in the app.

<img src="images/%E6%88%AA%E5%B1%8F2022-09-21%20%E4%B8%8B%E5%8D%8811.42.52.png" alt="截屏2022-09-21 下午11.42.52" style="zoom:25%;" />



### Calcuator

> See the code and presentation in `../iw01_Calculator`

* Create calculator app modeled after Apple's official iOS calculator. It should support two usage modes: portrait and landscape, utilizing Autolayout technology.

<img src="images/%E6%88%AA%E5%B1%8F2023-11-03%20%E4%B8%8B%E5%8D%882.47.21.png" alt="截屏2023-11-03 下午2.47.21" style="zoom: 33%;" />                        <img src="images/%E6%88%AA%E5%B1%8F2023-11-03%20%E4%B8%8B%E5%8D%882.47.37.png" alt="截屏2023-11-03 下午2.47.37" style="zoom: 33%;" />



### IOS Application

> See the code and presentation in `../iw02_IOS Application`

<img src="images/%E6%88%AA%E5%B1%8F2023-11-03%20%E4%B8%8B%E5%8D%882.53.42.png" alt="截屏2023-11-03 下午2.53.42" style="zoom: 67%;" />

Based on the template project [https://itsc.nju.edu.cn](https://itsc.nju.edu.cn/) , develop an iOS platform with the following functions:

1. A user-friendly interface with automatic layout adaptation for various devices. The main screen is divided into five tabs using a tab bar controller.
2. The first four tabs correspond to the four information sections of the website (listed below). 
   - https://itsc.nju.edu.cn/xwdt/list.htm
   - https://itsc.nju.edu.cn/tzgg/list.htm
   - https://itsc.nju.edu.cn/wlyxqk/list.htm
   - https://itsc.nju.edu.cn/aqtg/list.htm
3. When clicking on a cell in the Table View, the detailed content of the selected news item can be fetched and parsed.
4. Display the "About Us" section of https://itsc.nju.edu.cn/main.htm.
5. Optimize performance by using GCD for concurrent programming and consider buffering downloaded content for efficient network communication.



### CoreML-based Image Classification

> See the code and presentation in `../iw03_CoreML-based image classification`

Based on CoreML to develop an app for classifying snacks with the following steps:

1. Train an image classification model based on the provided snacks dataset using CreateML.
2. Use the trained model to classify snacks based on images taken with the camera or selected from the photo gallery.
3. Display the classification results from the neural network model on the screen.
4. When confronted with images that do not belong to the given snacks categories in the dataset or images that the model is uncertain about, provide a "I am not sure" classification.

<img src="images/%E6%88%AA%E5%B1%8F2023-11-03%20%E4%B8%8B%E5%8D%882.57.58.png" alt="截屏2023-11-03 下午2.57.58" style="zoom:50%;" />