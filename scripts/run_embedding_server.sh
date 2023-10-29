#!/bin/bash

# Declare constants
MODEL="BAAI/bge-large-en-v1.5"
REVISION="main"
VOLUME="$PWD/data"
IMAGE_VERSION="0.2.2"
IMAGE="ghcr.io/huggingface/text-embeddings-inference:$IMAGE_VERSION"

# Run the Docker command
docker run \
  --gpus all \
  -p 8080:80 \
  -v $VOLUME:/data \
  $IMAGE \
  --model-id $MODEL \
  --max-batch-tokens 131072 \
  --max-client-batch-size 64 \
  --revision $REVISION
