#!/bin/bash

WORKING_DIR='./tmpSlideDir' # Temp dir location, no trailing slash

display_usage() { 
	echo -e "Usage:\n\t$0 path_to_images extension xres yres fps out_file\n" 
	echo -e "e.g.\n$0 ./images/ jpg 2560 1440 60 out.mp4 [ffmpeg args]\n"
	echo -e "This will take all images in ./images/ with a .jpg extension and make a 2560x1440 60fps slideshow and place the output file in ./out.mp4"
} 	
if [  $# != 6 ] 
then
	display_usage
	exit 1
fi

mkdir $WORKING_DIR 2>/dev/null
echo "Processing your images in parallel, this will take some time during which there will be no output. You can check $WORKING_DIR to see the intermediate files"
find $1 -name "*.$2" | parallel -I% --max-args 1 convert % -resize "$3x$4" -background Black -gravity center -extent "$3x$4" $WORKING_DIR/{#}-scaled.jpg
echo "Finished converting images, creating video file"
ffmpeg -framerate $5 -pattern_type glob -i $WORKING_DIR/'*.jpg' $7 $6
echo "Created video file, cleaning intermediate files"
rm $WORKING_DIR

