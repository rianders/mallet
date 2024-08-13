#!/bin/bash

# Function to build the Docker image
build_image() {
    echo "Building the Docker image..."
    docker build -t mallet-docker .
}

# Function to import data
import_data() {
    echo "Importing data..."
    docker run --rm -it -v $(pwd):/data mallet-docker import-dir --input /data/test-data --output /data/output.mallet --keep-sequence
}

# Function to train a topic model
train_topics() {
    echo "Training topics..."
    docker run --rm -it -v $(pwd):/data mallet-docker train-topics --input /data/output.mallet --num-topics 2 --output-topic-keys /data/topic-keys.txt --output-doc-topics /data/doc-topics.txt
}

# Main menu
case $1 in
    build)
        build_image
        ;;
    import)
        import_data
        ;;
    train)
        train_topics
        ;;
    *)
        echo "Usage: $0 {build|import|train}"
        ;;
esac
