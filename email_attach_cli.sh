#!/bin/sh

echo "Message body goes here" | mail -s "SUBJECT: Backup" -a attachment.zip  your_name@your_domain.com
