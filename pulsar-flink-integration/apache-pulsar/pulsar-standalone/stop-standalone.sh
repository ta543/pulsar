#!/bin/bash

PULSAR_HOME=$(dirname "$0")/..

# Stop Pulsar
if [ -f $PULSAR_HOME/logs/pulsar-standalone.pid ]; then
    PID=$(cat $PULSAR_HOME/logs/pulsar-standalone.pid)
    echo "Stopping Pulsar with PID $PID..."
    kill $PID
    rm $PULSAR_HOME/logs/pulsar-standalone.pid
    echo "Pulsar stopped."
else
    echo "Pulsar is not running or PID file not found."
fi
