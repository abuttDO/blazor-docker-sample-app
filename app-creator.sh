#!/bin/bash

echo "Hello! DotNet Blazor App"




DIR=/BlazorServerDocker 

if [[ -d "$DIR" ]];
then
    echo "==================="
    echo "Blazor app creation"
    echo "==================="
    dotnet new blazorserver -n BlazorServerDocker
else
    echo "===================="
    echo "= Moving to Blazor ="
    echo "===================="
    cd BlazorServerDocker/
fi

echo "======================"
echo "= Copying Dockerfile ="
echo "======================"

cp ../dockerfile .

echo "========================="
echo "= Building Docker Image ="
echo "========================="

docker build -t blazor-server-docker .

echo "====================="
echo "= Running Container ="
echo "====================="

docker run -p 8080:80 -d blazor-server-docker

echo "======================"
echo "= Checking Container ="
echo "======================"

docker ps