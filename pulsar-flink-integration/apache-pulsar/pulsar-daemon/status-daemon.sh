#!/bin/bash

PULSAR_HOME=$(dirname "$0")/..

# Check status of Pulsar daemon
if [ -f $PULSAR_HOME/logs/pulsar-daemon-standalone.pid ]; then
    PID=$(cat $PULSAR_HOME/logs/pulsar-daemon-standalone.pid)
    if ps -p $PID > /dev/null; then
        echo "Pulsar daemon is running with PID $PID."
    else
        echo "Pulsar daemon is not running, but PID file exists."
    fi
else
    echo "Pulsar daemon is not running."
fi
