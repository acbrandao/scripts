#!/bin/bash

#Checks your system for any LARGE files over 50MB in size

find / -type f -size +50M -exec ls -lh {} \; | awk '{ print $NF ": " $5 }'
