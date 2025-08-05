#!/bin/bash

# Requirement: Should be logged in to Docker Hub or private registry

# Build and/or push toggles
BUILD="true"
PUSH="true"

# Architecture and cores
architecture=$(uname -m)
CORES=6
SRS_VERSION="_20_10"

# Tag format
image_tag=$(date +"%m_%d_%Y")

# Image names
UHD_IMAGE="uhd_3_15:$image_tag"
SRS_IMAGE="srsran-4g${SRS_VERSION}_${architecture}:$image_tag"

# Registry path
repo_path="its-registry.unl.edu/cpn/doe-xgfabric-repos/srsran-4g"

# Full registry image paths
UHD_REGISTRY_PATH="$repo_path/uhd_3_15_${architecture}:$image_tag"
SRS_REGISTRY_PATH="$repo_path/srsran-4g${SRS_VERSION}_${architecture}:$image_tag"

# Build
if [ "$BUILD" = "true" ]; then
    echo "Building: $UHD_IMAGE"
    docker build --build-arg CORES="$CORES" -f Dockerfile.uhd -t "$UHD_IMAGE" .

    echo "Building: $SRS_IMAGE"
    docker build --build-arg CORES="$CORES" --build-arg VERSION="$SRS_VERSION" --build-arg UHD_IMAGE="$UHD_IMAGE" -f Dockerfile.srslte -t "$SRS_IMAGE" .
fi

# Push
if [ "$PUSH" = "true" ]; then
    echo "Pushing to: $UHD_REGISTRY_PATH"
    docker tag "$UHD_IMAGE" "$UHD_REGISTRY_PATH"
    docker push "$UHD_REGISTRY_PATH"

    echo "Pushing to: $SRS_REGISTRY_PATH"
    docker tag "$SRS_IMAGE" "$SRS_REGISTRY_PATH"
    docker push "$SRS_REGISTRY_PATH"
fi