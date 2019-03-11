#!/bin/sh

# Takes current folder and ZIPS it up  into a  file named BACKUO_FILENAME
# then it sends it as an email attachment via standard unix mail
# change  EMAIL_TO to  the receipient emial
# change BACKUP_FILENAME to  make the doler you want it to be

EMAIL_TO=user_name@your_domain.com
BACKUP_FILENAME="backup_folder.zip"
this_folder=$(pwd)
 
 
echo "------------------------\n";
echo "Zipping up folder to:"$BACKUP_FILENAME
echo "------------------------\n";
 
zip -r $BACKUP_FILENAME *
echo "Backed up folder "$this_folder | mail -s "Backup for"$this_folder  -a $BACKUP_FILENAME  $EMAIL_TO
 
echo "------------------------";
echo "Done sending "$BACKUP_FILENAME" via email to "$EMAIL_TO
