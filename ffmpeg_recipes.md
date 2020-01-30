## FFMPEG Recipes and shortcuts

Below are some of the common shortcuts and recipes that I used to manipulate video , to cut, trim, optimize and transcode video when  needed.  I typicall yfind myself combining multiple clips and other times extracting sepcific segments. Of course I can always open up the clips in  [Adobe Premiere] ( https://www.adobe.com/products/premiere-elements.html  ) or [DaVinci Resolve ] (https://www.blackmagicdesign.com/products/davinciresolve ) but sometimes its just easier, especially for long or complicated workflows , its easier to use the command line.

## REquires:
A recent copy of [FFMPEG ] (https://ffmpeg.org/ )  video codec utilities.
* Download and install FFMPEG for Linux , Windows or Max https://ffmpeg.org/download.html
* More good examples here: https://www.ostechnix.com/20-ffmpeg-commands-beginners/

### Extract A Video Clip
This takes the sample2.mp4 file, and outputs sample-trimmed.mp4 which is just the video between 2 seconds and 67
```ffmpeg -i sample2.mp4 -vf trim=2:67 -an sample2-trimmed.mp4```

### Add padding to make a video a certain size
```ffmpeg -i input.mp4 -vf pad=800:600:160:60:black -an output.mp4```

### Extract audio only (mp3) from video file
```ffmpeg -i input.mp4 -vn output.mp3```

### Change Video size resolution
```ffmpeg -i input.mp4 -filter:v scale=1280:720 -c:a copy output.mp4```

### Compressing video files
Optimize video file to a specific scale (1280, 960) etc. Please note that you will lose the quality if you try to reduce the video file size. You can lower that crf value to 23 or lower if 24 is too aggressive.
```ffmpeg -i input.mp4 -vf scale=960:-1 -c:v libx264 -preset veryslow -crf 24 output.mp4```

### Compressing audio files
-ab indicated the bit rate to re-encode at: 96,112,128,160,192...320kpbs
```ffmpeg -i input.mp3 -ab 128 output.mp3```

### Extracting images from the video
Extract video frames into seperate iamge files.
```ffmpeg -i input.mp4 -r 1 -f image2 image-%2d.png```

### Cropping a video to a rectangular area
Let us say you want to a video with a width of 640 pixels and a height of 480 pixels, 
from the position (200,150), the command would be:
```ffmpeg -i input.mp4 -filter:v "crop=640:480:200:150" output.mp4```
general foramt is
```ffmpeg -i input.mp4 -filter:v "crop=w:h:x:y" output.mp4```



### Merge multiple Video clips (same format) into one file
```shell
ffmpeg -i 1.MOV -c:v copy -c:a aac -strict -2 1.mp4
ffmpeg -i 2.MOV -c:v copy -c:a aac -strict -2 2.mp4
ffmpeg -i 1.mp4 -c copy  -bsf:v h264_mp4toannexb 1.ts
ffmpeg -i 2.mp4 -c copy -bsf:v h264_mp4toannexb 2.ts
ffmpeg -i concat:"1.ts|2.ts" -c copy  -bsf:a aac_adtstoasc final_video.mp4

ffmpeg -i TriRock-Olympic_A.MOV -c copy -bsf:v h264_mp4toannexb temp0.ts
ffmpeg -i TriRock-Olympic_B.MOV -c copy -bsf:v h264_mp4toannexb temp1.ts
ffmpeg -i "concat:temp0.ts|temp1.ts" -c copy -bsf:a aac_adtstoasc merged_video.mp4
```

### trim video from to
```shell
ffmpeg -ss [00:00:0.000] -i in.mp4 -t [duration] -c:v copy -c:a copy out.mp4
```
### trim video sections cut without re-encoding
```shell
ffmpeg -i video.mp4 -vcodec copy -acodec copy -ss 00:00:55.000 -t 01:19:25.000 video_out.mp4 
ffmpeg -i 2015_SunsetClassic.mp4 -s 1280x720 2015_SunsetClassic720p.mp4
ffmpeg -i source_video.mp4 .mp4 -ss 00:00:00 -t 01:20:15 -c:v copy -c:a copy output_video.mp4
```

### optimize bit rate for improved performance
```shell
ffmpeg -i source_video.mp4 -vcodec libx264 -crf 22 out.mp4
ffmpeg -i TriPhilBike120.mp4  -sws_flags lanczos+accurate_rnd -vf "scale=320:240" -c:v libx264 -crf 20 -preset fast -profile:v main -tune fastdecode -c:a copy TriPhilBike960.mp4
```
### Scale to shrink video size
```shell
ffmpeg -i in.mp4  -filter:v scale=960:-1 -c:a copy out.mp4
```


### Merge multiple Video clips (same format) into one file
ffmpeg -i 1.MOV -c:v copy -c:a aac -strict -2 1.mp4
ffmpeg -i 2.MOV -c:v copy -c:a aac -strict -2 2.mp4
ffmpeg -i 1.mp4 -c copy  -bsf:v h264_mp4toannexb 1.ts
ffmpeg -i 2.mp4 -c copy -bsf:v h264_mp4toannexb 2.ts
ffmpeg -i concat:"1.ts|2.ts" -c copy  -bsf:a aac_adtstoasc 2015nyctri_bike.mp4

ffmpeg -i TriRock-Olympic_A.MOV -c copy -bsf:v h264_mp4toannexb temp0.ts
ffmpeg -i TriRock-Olympic_B.MOV -c copy -bsf:v h264_mp4toannexb temp1.ts
ffmpeg -i "concat:temp0.ts|temp1.ts" -c copy -bsf:a aac_adtstoasc merged_video.mp4
##trim video from to
ffmpeg -ss [00:00:0.000] -i in.mp4 -t [duration] -c:v copy -c:a copy out.mp4
#trim video sections cut without re-encoding
ffmpeg -i 2015nyctri_bike.mp4 -vcodec copy -acodec copy -ss 00:00:55.000 -t 01:19:25.000 2015nyctri_out.mp4
 
ffmpeg -i 2015_SunsetClassic.mp4 -s 1280x720 2015_SunsetClassic720p.mp4
 
ffmpeg -i source_video.mp4 .mp4 -ss 00:00:00 -t 01:20:15 -c:v copy -c:a copy output_video.mp4
### optimize bit rate for improved performance
ffmpeg -i source_video.mp4 -vcodec libx264 -crf 22 out.mp4
ffmpeg -i TriPhilBike120.mp4  -sws_flags lanczos+accurate_rnd -vf "scale=320:240" -c:v libx264 -crf 20 -preset fast -profile:v main -tune fastdecode -c:a copy TriPhilBike960.mp4
### Scale to shrink video
ffmpeg -i TriPhilBike120.mp4  -filter:v scale=960:-1 -c:a copy TriPhilBike960.mp4

