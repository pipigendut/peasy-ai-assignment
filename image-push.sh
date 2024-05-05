#!/bin/bash
# ./image-push -p <project-name>
# Example:
# ./image-push.sh -a x86 -p pipigendut
# ./image-push.sh -p pipigendut
while getopts a:p: flag
do
    case "${flag}" in
        a) arch=${OPTARG};;
        p) project_name=${OPTARG};;
    esac
done

if [[ ${arch} == "x86" ]]; then
   echo "docker push asia.gcr.io/${project_name}/peasy-ai-assignment:latest"
    docker push asia.gcr.io/${project_name}/peasy-ai-assignment:latest
else
    echo "docker push asia.gcr.io/${project_name}/peasy-ai-assignment:m1"
    docker push asia.gcr.io/${project_name}/peasy-ai-assignment:m1
fi
