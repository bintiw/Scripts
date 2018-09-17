#!/bin/bash

#AUTHOR: BINAYAK TIWARI
#DATE:   06/27/2014
#############################################################################################################
#THIS SCRIPT KILLS PROGRAM THAT ARE NOT RESPONDING, CAN BE USED FOR THE PROGRAMS THAT ARE RESPONDING AS WELL#
#############################################################################################################

echo "Enter program to kill: "
read name

touch test_kill.txt
ps ax | grep "$name" | cut -d ' ' -f 1 > test_kill.txt 

while read line
do
  kill "$line" 2> /dev/null
done < test_kill.txt

rm -rf test_kill.txt
echo "Done!!"
