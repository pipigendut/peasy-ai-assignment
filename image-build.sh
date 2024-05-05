#!/bin/bash
# ./image-build -a x86 -p <project-name>
# ./image-build -p <project-name>
# Example:
# ./image-build.sh -a x86 -p pipigendut
# ./image-build.sh -p pipigendut
while getopts a:p: flag
do
    case "${flag}" in
        a) arch=${OPTARG};;
        p) project_name=${OPTARG};;
    esac
done

if [[ ${arch} == "x86" ]]; then
    echo "docker buildx build --ssh default=~/.ssh/id_rsa --build-arg project_name=${project_name} --platform linux/amd64 --rm -t asia.gcr.io/${project_name}/peasy-ai-assignment:latest ."
    docker buildx build --ssh default=~/.ssh/id_rsa --build-arg project_name=${project_name} --platform linux/amd64 --rm -t asia.gcr.io/${project_name}/peasy-ai-assignment:latest .
else
    echo "docker build --ssh default=~/.ssh/id_rsa --build-arg project_name=${project_name}  --rm -t asia.gcr.io/${project_name}/peasy-ai-assignment:m1 ."
    docker build --ssh default=~/.ssh/id_rsa --build-arg project_name=${project_name}  --rm -t asia.gcr.io/${project_name}/peasy-ai-assignment:m1 .
fi