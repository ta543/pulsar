#!/bin/bash

PULSAR_HOME=$(dirname "$0")/..
TOPIC_NAME=$1
MESSAGE=$2

if [ -z "$TOPIC_NAME" ] || [ -z "$MESSAGE" ]; then
    echo "Usage: $0 <topic-name> <message>"
    exit 1
fi

# Produce a message to a Pulsar topic
echo "Producing message to topic: $TOPIC_NAME"
$PULSAR_HOME/bin/pulsar-client produce -m "$MESSAGE" persistent://public/default/$TOPIC_NAME
echo "Message produced to topic $TOPIC_NAME"
