#!/bin/bash
# You need to change followings:
DOCKER_IMAGE_NAME="whatakeyama/prj_em:latest"
DOCKER_CONTAINER_NAME="ttsujino_host_runner"
MEMORY="2G"

echo "*******************************"
echo "Start creating docker image"
docker build --network host -t $DOCKER_IMAGE_NAME . --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g)
echo "Finished creating docker image"
echo "*******************************"

echo "Start creating docker container"
docker run --privileged \
           --net host \
           --shm-size=$MEMORY \
           --name $DOCKER_CONTAINER_NAME \
           -itd $DOCKER_IMAGE_NAME
echo "Finished creating docker container"
echo "*******************************"

echo "Please run this command in the container: 'cd tmp && ./setup_runner.sh'"
docker exec -it $DOCKER_CONTAINER_NAME /bin/bash