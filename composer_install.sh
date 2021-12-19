#!/bin/bash

# Define Ansi color code variables
red="\e[0;91m"
yellow="\e[1;33m "
green="\e[0;92m"
bold="\e[1m"
clr="\e[0m"  #clear back to default


echo -e "Installing ${green} composer ${clr}"
curl -s https://getcomposer.org/installer | php
