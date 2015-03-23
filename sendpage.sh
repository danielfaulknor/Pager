#!/usr/bin/env bash
source config.sh

while [[ $var < 4 ]]
do
loopcount=0
rm result.txt 2> /dev/null
curl -L -u $AUTH_ID:$AUTH_TOKEN https://api.plivo.com/v1/Account/$AUTH_ID/Call/ \
-H "Content-type: application/json" \
-X POST \
-d '{
	"to" : "'$TONUMBER'",
	"from" : "'$FROMNUMBER'",
	"time_limit" : "30",
	"answer_url" : "'$ANSWERURL'xml.php?type='$1'"
}'

echo "Waiting for result..."
while [ ! -f result.txt ]
do
  if [[ $loopcount = 60 ]]
  then
	break
  fi
  sleep 1s
  ((loopcount++))
done

if grep -Fxq OK result.txt
then
    echo "All Good!"
    rm result.txt 2> /dev/null
    break
    exit 0
else
   echo "Something went wrong, trying again. Echoing result now..."
   cat result.txt 2> /dev/null
   if [[ $loopcount > 60 ]]
   then
	echo "Waiting for result timed out"
   fi
   continue
fi

((var++))

done

if [[ $var > 4 ]]
then
	echo "Giving up!"
        rm result.txt 2> /dev/null
	exit 1
fi

rm result.txt 2> /dev/null

