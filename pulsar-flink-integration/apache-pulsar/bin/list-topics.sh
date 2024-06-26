#!/bin/bash

PULSAR_HOME=$(dirname "$0")/..

# List all Pulsar topics
echo "Listing all Pulsar topics in namespace public/default"
$PULSAR_HOME/bin/pulsar-admin topics list public/default
