#!/bin/bash

PULSAR_HOME=$(dirname "$0")/..

# Start Pulsar in standalone mode
echo "Starting Pulsar in standalone mode..."
$PULSAR_HOME/bin/pulsar standalone > $PULSAR_HOME/logs/pulsar-standalone.log 2>&1 &
echo $! > $PULSAR_HOME/logs/pulsar-standalone.pid
echo "Pulsar started with PID $(cat $PULSAR_HOME/logs/pulsar-standalone.pid). Logs: $PULSAR_HOME/logs/pulsar-standalone.log"
