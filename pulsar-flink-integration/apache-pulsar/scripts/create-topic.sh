#!/bin/bash

PULSAR_HOME=$(dirname "$0")/..
TOPIC_NAME=$1

if [ -z "$TOPIC_NAME" ]; then
    echo "Usage: $0 <topic-name>"
    exit 1
fi

# Create a Pulsar topic
echo "Creating Pulsar topic: $TOPIC_NAME"
$PULSAR_HOME/bin/pulsar-admin topics create persistent://public/default/$TOPIC_NAME
echo "Topic $TOPIC_NAME created."
