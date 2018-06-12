#!/bin/bash

# ################## #
# BUILDING THE IMAGE #
# ################## #

IMAGE_NAME=oracle11:v0.1

echo "Building image '$IMAGE_NAME' ..."

# BUILD THE IMAGE (replace all environment variables)
BUILD_START=$(date '+%s')
echo $BUILD_START
docker build -t $IMAGE_NAME -f Dockerfile-oracle11g.ee . || {
  echo ""
  echo "ERROR: Oracle Database Docker Image was NOT successfully created."
  echo "ERROR: Check the output and correct any reported problems with the docker build operation."
  exit 1
}
echo ""

BUILD_END=$(date '+%s')
BUILD_ELAPSED=`expr $BUILD_END - $BUILD_START`
echo $BUILD_ELAPSED
