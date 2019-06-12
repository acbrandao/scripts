###############################################
#  Simple script filewatcer Awaits file changes on DEV_FOLDER then
#  updates TARGET Folder with changes using rsync.
#  If permissions in TARGET folder different  then Requires SSH keyless setup for file copy
###############################################
DEV_FOLDER=/home/username/code/src
TARGET_FOLDER=/var/www/html
TARGET_USER=username
POLLING_TIME=3 

echo "-----------------------------------------------------------------------"
echo WATCHING files from $DEV_FOLDER ..to.. $TARGET_FOLDER every $POLLING_TIME s
echo "-----------------------------------------------------------------------"
 
while true     
do 
       touch  ./lastwatch   
       sleep $POLLING_TIME
       find $DEV_FOLDER -cnewer ./lastwatch -exec rsync -Paz --progress -e "ssh -i $HOME/.ssh/id_rsa"  $DEV_FOLDER $TARGET_USER@localhost:$TARGET_FOLDER \;
       echo -e ".\c"
done
   echo FINISHED copying files from $DEV_FOLDER ..to.. $TARGET_FOLDER
   clear
fi
