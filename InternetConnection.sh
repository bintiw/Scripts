#!/bin/bash

#AUTHOR: BINAYAK TIWARI
#DATE:   06/27/2014
#########################################################################
#THIS SCRIPT CHECKS THE CONNECTION STATUS OF THE INTERNET#
#########################################################################


FLAG_C=0
FLAG_NC=0

while [ 1 ]
do
    wget -q --tries=5 --timeout=20 -O - http://google.com > /dev/null
    
    if [ $? -eq 0 ]
    then
        FLAG_C=$((FLAG_C+1))
        FLAG_NC=0
        
	if [ $FLAG_C -gt 10 ]
        then
        FLAG_C=2
        fi
    
     
    else
	FLAG_NC=$((FLAG_NC+1))
        FLAG_C=0

	if [ $FLAG_NC -gt 10 ]
        then
        FLAG_NC=2
        fi

 

    fi
    
    if [ $FLAG_C -eq 1 ]
        then
		notify-send "Internet Connection Available" -u critical
		
    fi	

    if [ $FLAG_NC -eq 1 ]
        then
		notify-send "No Internet Connection" -u critical
		
    fi	

sleep 7
done