#!/bin/bash

for i in $@  
 do  
    kubectl delete -f $i/ 
    echo "delete $i success"
done 

for i in $@ 
do  
    kubectl apply -f $i/ 
    echo "apply $i success"
done 
arr=("boss-mobile-h5"  "cloud-console-frontend" "apps-frontend" "accounts-frontend" "deprecated-apps-console-frontend" "developers-frontend" "mp-frontend")
for j in ${arr[*]}
do
    if [ "$j" == "$@" ];then
	       echo "delete proxy pod"
           kubectl -n galileo delete po $(kubectl -n galileo get po | grep proxy | awk '{print $1}')
        fi
done
exit 0