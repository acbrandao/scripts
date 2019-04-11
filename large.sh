#!/bin/bash

#Checks your system for any LARGE files over 100MB in size

find / -xdev -type f -size +100M
