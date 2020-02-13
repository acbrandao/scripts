# Various Shell Scripts : bash etc... 
Shell scripts mostly for Linux systems . This is where I will keep utility SNIPPETS and shell scripts that I find useful and will serve as a reference library.
Most of the scripts are pretty short and self-explanatory.

# Simple one / two line shell scripts that may be usefull

  - Get directory listing with filesize in human readable format
    ``` du -shc uploads/2019/*  ```  
  - Find largest file in a directory recursively
     ``` sudo du -ah /dir_name/ | sort -n -r | head -n 20 ```

# Running
Simply chmod +x <scriptname > and run them form a linux command line
  
# Scripts and Descriptions

| Script Name  | Description   |
|---|---|
|  apache_logs.sh |  Reads Apache Log files and displays basic stats like top popular pages, hits bu IP etc.  |
|  curl_site_change.sh |  Issues a curl command -> md5 hashes results and runs a diff to compare for changes |
|  email_attach_cli.sh | Creates an email and ataches file from command line  |
|  open_ports.sh |  simple open port scanner using nc |
|  sync_folders.sh | rsync two folders between two different servers  |
|  zipfolder_sendemail.sh | zips up a folder and sends it as an email attachment  |
|   |   |
|   |   |
|   |   |
