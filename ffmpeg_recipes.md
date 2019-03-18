## FFMPEG Recipes and shortcuts

Below are some of the common shortcuts and recipes that I used to manipulate video , to cut, trim, optimize and transcode video when  needed.  I typicall yfind myself combining multiple clips and other times extracting sepcific segments. Of course I can always open up the clips in  [https://www.adobe.com/products/premiere-elements.html ] (Adobe Premiere ) or [https://www.blackmagicdesign.com/products/davinciresolve ] (DaVinci Resolve ) but sometimes its just easier, especially for long or complicated workflows , its easier to use the command line.

## REquires:
A recent copy of [https://ffmpeg.org/ | FFMPEG] (FFMPEG)  video codec utilities.
* Download and install FFMPEG for Linux , Windows or Max https://ffmpeg.org/download.html

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
### Scale to shrink video
```shell
ffmpeg -i TriPhilBike120.mp4  -filter:v scale=960:-1 -c:a copy TriPhilBike960.mp4
```
