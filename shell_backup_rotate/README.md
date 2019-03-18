# Bash shell script to BACKUP and Perform backup rotations
Example of code expalined here  www.abrandao.com/2014/01/linux-backup-and-rotate-script/

This script is used to backup a particular direcotry to a particular location, and then rotates the backups so that you have different
snapshots and versions fo the backups. 


# Usage

```shell
backup_rotate.sh  -p 5 /source_folder/ /destination_folder/
```

The * -p  n *  , where n is used to determine how many Rotations (Backup versions) to keep


# Requirements
*  Access to Linux shell, the ability to execute this script
*  File Write permissions on the specific direcotries.


## Installation

* Download this shell script to your system. 
* Change it to Run permission
* Verify Write permissions on the various folders


 Open the file and customize code  to match your requirements. 
 Be sure to change the following varaibles near the top of the script:

```shell
SOURCE_FOLDER="/source/" # source folder
DESTINATION_FOLDER="/backup/" # mounted folder
BASENAME="basename $SOURCE_FOLDER"
ROTATE_PERIOD=10
```

  To execute  in a regular basis use the a cron entry as below
```
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h     dom mon dow   command
  0  5,20 *   *    *   /home/backup/backup_rotate.sh   #backups up at 5am and 8pm daily.
  
```


## Contributing
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History
TODO: Write history
## Credits
TODO: Write credits
## License
TODO: Write license

