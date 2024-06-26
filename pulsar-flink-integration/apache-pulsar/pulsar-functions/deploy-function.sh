#!/bin/bash

PULSAR_HOME=$(dirname "$0")/..

# Deploy a Pulsar function
echo "Deploying Pulsar function..."
$PULSAR_HOME/bin/pulsar-admin functions create   --tenant public   --namespace default   --name example-function   --inputs persistent://public/default/input-topic   --output persistent://public/default/output-topic   --classname com.example.pulsar.functions.ExampleFunction   --jar $PULSAR_HOME/pulsar-functions/example-function.jar
