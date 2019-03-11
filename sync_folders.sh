#!/bin/sh

#rsyncs between two folders on different  servers
#complete the path infomration below to match your systems


SRC_PATH=/home/username/public_html

DEST_SERVER=your_domain.com
DEST_USER=user
DEST_PATH=/var/www/html/



a rsync -r -a -v -e "ssh -l $DEST_USER" --delete $SRC_PATH $DEST_SERVER:$DEST_PATH
