## Post Discord messages using cURL
##Source: https://stackoverflow.com/questions/70906007/unable-to-send-curl-output-to-discord-using-webhook-which-is-otherwise-printing

#!/bin/bash
webhookurl="https://mywebhook"
messagearray=($(curl -i -s https://www.google.com/ | awk 'NR==1'))
#this next line removes nasty characters that give json errors (keeps only letters, numbers SPACE and -)
message=`echo ${messagearray[@]} | sed 's/[^0-9A-Za-z -]*//g'`;
sendcontent='{"username": "Botname", "content": "'"$message"'"}'
curl -H "Content-Type: application/json" -d "$sendcontent" "$webhookurl"
