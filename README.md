# ffmpeg-slideshow
Create a slideshow with different sized images using ffmpeg and imagemagick


### Requirements
- GNU Parallel
- ffmpeg
- imagemagick

#### Debian
`$ sudo apt-get install ffmpeg parallel imagemagick`

### How To
Usage:<br>
./scaledSlideshow.sh path_to_images extension xres yres fps out_file<br>
e.g.<br>
./scaledSlideshow.sh ./images/ jpg 2560 1440 60 out.mp4 [ffmpeg args]<br>
This will take all images in ./images/ with a .jpg extension and make a 2560x1440 60fps slideshow and place the output file in ./out.mp4<br>
<br>

```
git clone 'https://github.com/DavidoRotho/ffmpeg-slideshow.git'
cd ffmpeg-slideshow/
chmod +x ./scaledSlideshow.sh
./scaledSlideshow.sh ../ jpg 2560 1440 60 ../out.webm
```
Run this block in a folder full of jpgs to make a 1440p 60fps slideshow out of them

