#!/bin/bash

# Push the first config map
kubectl create -f config_1.yml

# Startup the seb server
kubectl create -f nginx.yml

#Print instructions :
echo "In another shell run 'kubectl create -f config_2.yml'"
echo "The change will be there in 60-90 seconds"
echo "CTRL-C to break out of print loop"
# Loop while watching
date
./config_change &

START=`date +%s`
END=$(($START + 120))
while test  1==1
do
  sleep 5
  date +%s
  kubectl exec nginx cat /usr/share/nginx/html/index.html | grep -i h1\>sample
  if [ $END -lt `date +%s` ]
  then
    break
  fi
done


kubectl delete pod/nginx
kubectl delete cm/nginx-index
