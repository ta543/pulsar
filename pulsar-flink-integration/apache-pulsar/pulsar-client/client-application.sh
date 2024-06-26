#!/bin/bash

PULSAR_HOME=$(dirname "$0")/..
CLIENT_JAR=$PULSAR_HOME/lib/pulsar-client.jar

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <produce|consume>"
    exit 1
fi

COMMAND=$1

if [ "$COMMAND" == "produce" ]; then
    java -cp $CLIENT_JAR org.apache.pulsar.client.cli.PulsarClient produce -m "Hello Pulsar" persistent://public/default/my-topic
elif [ "$COMMAND" == "consume" ]; then
    java -cp $CLIENT_JAR org.apache.pulsar.client.cli.PulsarClient consume -s "my-subscription" -n 0 persistent://public/default/my-topic
else
    echo "Unknown command: $COMMAND"
    echo "Usage: $0 <produce|consume>"
    exit 1
fi
