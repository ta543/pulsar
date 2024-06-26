#!/bin/bash

PULSAR_HOME=$(dirname "$0")/..
TOPIC_NAME=$1
SUBSCRIPTION_NAME=$2

if [ -z "$TOPIC_NAME" ] || [ -z "$SUBSCRIPTION_NAME" ]; then
    echo "Usage: $0 <topic-name> <subscription-name>"
    exit 1
fi

# Consume messages from a Pulsar topic
echo "Consuming messages from topic: $TOPIC_NAME"
$PULSAR_HOME/bin/pulsar-client consume -s "$SUBSCRIPTION_NAME" -n 0 persistent://public/default/$TOPIC_NAME
