#!/bin/bash

# Builds a docker image for the given dockerfile and pushes it to the docker registry
# given by the env variable

image_name=$1
env=$2

# Just checking that the user has provided the correct number of arguments
if [ -z "$image_name" ]; then
    echo "Usage: $0 <image_name> <env>"
    exit 1
fi

if [ -z "$env" ]; then
    echo "Usage: $0 <image_name> <env>"
    exit 1
fi

# Check that env is either "dev" or "prod"
if [ "$env" != "dev" ] && [ "$env" != "prod" ]; then
    echo "env must be either dev or prod"
    exit 1
fi

if [ "$env" = "dev" ]; then
    echo "Building image ${image_name} for dev"
	docker build -t ${image_name}:dev -f docker/${image_name}.Dockerfile .
    kind load docker-image ${image_name}:dev --name rwml-34fa
else
    echo "Building image ${image_name} for prod"
    BUILD_DATE=$(date +%s)
	docker buildx build --push \
        --platform linux/amd64 \
        -t ghcr.io/real-world-ml/${image_name}:0.1.5-beta.${BUILD_DATE}  \
        --label org.opencontainers.image.revision=$(git rev-parse HEAD) \
        --label org.opencontainers.image.created=$(date -u +%Y-%m-%dT%H:%M:%SZ) \
        --label org.opencontainers.image.url="https://github.com/Real-World-ML/real-time-ml-system-cohort-4/docker/${image_name}.Dockerfile" \
        --label org.opencontainers.image.title="${image_name}" \
        --label org.opencontainers.image.description="${image_name} Dockerfile" \
        --label org.opencontainers.image.licenses="" \
        --label org.opencontainers.image.source="https://github.com/Real-World-ML/real-time-ml-system-cohort-4" \
        -f docker/${image_name}.Dockerfile .
fi