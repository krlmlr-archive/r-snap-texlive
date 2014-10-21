#!/bin/bash
## April 26, 2010
## RWD Nickalls & A Syropoulos
## mathspic.sh   # mathspic  script
## put this file in  /usr/local/bin
## rename it:  mathspic.sh --> mathspic
## and make it executable (chmod 755 mathspic)
#################
##  format is:
##     bash mathspic.sh  <options>  filename
##     mathspic [-b] [-c] [-h] [-o outfile]  infile
#################

perl   /usr/local/bin/mathspic113.pl    $1  $2  $3  $4  $5
