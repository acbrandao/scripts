## Using ImageMagick  Recipes and shortcuts

Below are some of the common shortcuts and recipes that I used to manipulate images and  , to cut, trim, optimize and transcode video when  needed. 

## REquires:
Download and install recent copies of :
  * [ImageMagick ] (https://imagemagick.org/ )  Image file format converter  utilities.
  * [GhostScript] (https://www.ghostscript.com/releases/gsdnld.html) Handles rasterization of Vecotr and PDF files

If you are using windows , try https://chocolatey.org/  Windows package  manager using these commands:
  * `choco install iamgemagick`
  * `choco install ghostscript` 

### Convert ALL PDF pages into iamge files
In Linux : Loops through all thePDF pages in  a document and produces seperate JPEG images.
  * density = 100, 150, 300 dpi
  * quality = JPG compression quality
  * 
```magick -density 150 source.pdf -quality 90 output-%3d.jpg```

### Convert single PDF pages into iamge files

Convert a specific page [0] from a longer list of PDF pages 

```magick -density 150 source.pdf[0] -quality 90 test.jpg```

Convert and RESIZE a speific PDF page

```magick -density 150 source.pdf[0] -quality 90 -resize 50% test.jpg```

Convert a RANGE [0-5] PDF pages.

```magick -density 150 source.pdf[0-5] -quality 90 test.jpg```
