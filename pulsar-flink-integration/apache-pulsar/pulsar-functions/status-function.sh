#!/bin/bash

PULSAR_HOME=$(dirname "$0")/..

# Check status of a Pulsar function
echo "Checking status of Pulsar function..."
$PULSAR_HOME/bin/pulsar-admin functions status   --tenant public   --namespace default   --name example-function
