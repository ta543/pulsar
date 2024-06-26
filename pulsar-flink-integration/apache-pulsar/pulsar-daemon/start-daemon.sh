#!/bin/bash

PULSAR_HOME=$(dirname "$0")/..

# Start Pulsar daemon in standalone mode
echo "Starting Pulsar daemon in standalone mode..."
$PULSAR_HOME/bin/pulsar-daemon start standalone > $PULSAR_HOME/logs/pulsar-daemon-standalone.log 2>&1 &
echo $! > $PULSAR_HOME/logs/pulsar-daemon-standalone.pid
echo "Pulsar daemon started with PID $(cat $PULSAR_HOME/logs/pulsar-daemon-standalone.pid). Logs: $PULSAR_HOME/logs/pulsar-daemon-standalone.log"
