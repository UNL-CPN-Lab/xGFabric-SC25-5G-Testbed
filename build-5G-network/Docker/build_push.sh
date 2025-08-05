#!/bin/bash

# Requirement: Should be logged in to Docker Hub or private registry

# Build and/or push toggles
BUILD="true"
PUSH="true"

# Architecture and cores
architecture=$(uname -m)
CORES=6
# SRS_VERSION="_20_10"

# Tag format
image_tag=$(date +"%m_%d_%Y")

# Image names
BASE_IMAGE="base:$image_tag"
UHD_IMAGE="its-registry.unl.edu/nextt/runtime/base-uhd/arm64-uhd_4.8:main-1a24a702"
SRS_IMAGE="srsran-5g${SRS_VERSION}_${architecture}:$image_tag"

# Registry path
repo_path="its-registry.unl.edu/cpn/doe-xgfabric-repos/srsran-5g"

# Full registry image paths
UHD_REGISTRY_PATH="$repo_path/uhd_4_8_${architecture}:$image_tag"
SRS_REGISTRY_PATH="$repo_path/srsran-5g${SRS_VERSION}_${architecture}:$image_tag"

# Build
if [ "$BUILD" = "true" ]; then
    # echo "Building: Base Image"
    # docker build --build-arg CORES="$CORES" -f Dockerfile.base -t "$BASE_IMAGE" .

    # echo "Building: $UHD_IMAGE"
    # docker build --build-arg BASE="$BASE_IMAGE" --build-arg CORES="$CORES" -f Dockerfile.uhd -t "$UHD_IMAGE" .

    echo "Building: $SRS_IMAGE"
    docker build --build-arg CORES="$CORES" --build-arg VERSION="$SRS_VERSION" --build-arg BASE="$UHD_IMAGE" -f Dockerfile.srsgNB -t "$SRS_IMAGE" .
fi

# Push
if [ "$PUSH" = "true" ]; then
    # echo "Pushing to: $UHD_REGISTRY_PATH"
    # docker tag "$UHD_IMAGE" "$UHD_REGISTRY_PATH"
    # docker push "$UHD_REGISTRY_PATH"

    echo "Pushing to: $SRS_REGISTRY_PATH"
    docker tag "$SRS_IMAGE" "$SRS_REGISTRY_PATH"
    docker push "$SRS_REGISTRY_PATH"
fi