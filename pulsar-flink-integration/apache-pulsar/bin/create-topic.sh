#!/bin/bash

PULSAR_HOME=$(dirname "$0")/..

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <topic-name>"
    exit 1
fi

TOPIC_NAME=$1

# Create a Pulsar topic
echo "Creating Pulsar topic: $TOPIC_NAME"
$PULSAR_HOME/bin/pulsar-admin topics create persistent://public/default/$TOPIC_NAME
echo "Topic $TOPIC_NAME created."
