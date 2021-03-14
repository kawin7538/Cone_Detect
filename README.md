# Cone_Detect
This program is intended to measure the angle of cone in left side and right side
# How to use This Program
  1. Run program
  2. Select Picture file
  3. Wait until popup box be shown to you and you will get the answer.

# Algorithm and step to use this program

[You can click here to watch](https://youtu.be/8Op_wybdTJU)

## First, The Original Image
![test_1](https://user-images.githubusercontent.com/20518062/111057710-2a1a0b00-84bc-11eb-93aa-1a222e3aaca8.jpg)

Let's Convert to Grayscale
![grayscale](https://user-images.githubusercontent.com/20518062/111057762-7ebd8600-84bc-11eb-97ac-1ae0a1d48667.jpg)

Next, Using Floodfill algorithm to image, repaint black and white using constant threshold number
![Threshold](https://user-images.githubusercontent.com/20518062/111057784-a876ad00-84bc-11eb-8d7b-3886a6e24378.jpg)

After that, find the biggest contour for cone
![Img_contours](https://user-images.githubusercontent.com/20518062/111057806-c6dca880-84bc-11eb-8007-68cec1df8295.jpg)

Next, Find 3 points, top, bottom left and bottom right
lastly, Find slope of 2 linear equations, top-bottom-left and top-bottom-right pairs.


Create Using Scilab Library!

Develop By Kawin Chinpong (kawin7538)
