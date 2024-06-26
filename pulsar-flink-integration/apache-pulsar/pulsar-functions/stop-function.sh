#!/bin/bash

PULSAR_HOME=$(dirname "$0")/..

# Stop a Pulsar function
echo "Stopping Pulsar function..."
$PULSAR_HOME/bin/pulsar-admin functions delete   --tenant public   --namespace default   --name example-function
