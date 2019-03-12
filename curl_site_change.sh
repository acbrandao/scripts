#!/bin/bash

#Checks a particular URL site if a folder has changed or not
#Replace http://example.com with the URL you need to watch,
# session_id=DEADBEEF with whatever cookie name and value your browser has stored for that site,
# and your@address.com with your e-mail address.

URL="http://www.abrandao.com"
MAIL_TO="your@address.com"
SESSION_D="DEADBEEF"

echo "Checking for URL Changes at $URL"

curl -s $URL -b session_id=$SESSION_ID | md5sum| tee new - | diff -q - old || echo "$URL has changed" | mail -s 'IT CHANGED!' $MAI$
 




