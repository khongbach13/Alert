#!/bin/bash

API_TOKEN="7138980867:AAFSCc-O_l1owbq6mdQBb0J6W18dMvYS0l0"
CHAT_ID="-4215079471"
API="https://api.telegram.org/bot$API_TOKEN/sendMessage"
MESSAGE="Login Fail"
SERVER=$(hostname -I | awk '{print $1}')
FILE=$(cat /var/log/auth.log)
TEXT="*authentication failure*"
DATE=$(date +%F)
COMAND=$(ping -c 5 $SERVER)
if [[ $FILE == $TEXT  ]]; then
  curl -s -X POST $API -d chat_id="$CHAT_ID" -d text="$MESSAGE - $SERVER"
fi 
curl -s -X POST $API -d chat_id="$CHAT_ID" -d text="RESULT $COMAND"
