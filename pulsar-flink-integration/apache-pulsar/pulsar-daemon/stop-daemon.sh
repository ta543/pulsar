#!/bin/bash

PULSAR_HOME=$(dirname "$0")/..

# Stop Pulsar daemon
if [ -f $PULSAR_HOME/logs/pulsar-daemon-standalone.pid ]; then
    PID=$(cat $PULSAR_HOME/logs/pulsar-daemon-standalone.pid)
    echo "Stopping Pulsar daemon with PID $PID..."
    kill $PID
    rm $PULSAR_HOME/logs/pulsar-daemon-standalone.pid
    echo "Pulsar daemon stopped."
else
    echo "Pulsar daemon is not running or PID file not found."
fi
