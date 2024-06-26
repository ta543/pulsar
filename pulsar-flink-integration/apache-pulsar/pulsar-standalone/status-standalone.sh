#!/bin/bash

PULSAR_HOME=$(dirname "$0")/..

# Check status of Pulsar
if [ -f $PULSAR_HOME/logs/pulsar-standalone.pid ]; then
    PID=$(cat $PULSAR_HOME/logs/pulsar-standalone.pid)
    if ps -p $PID > /dev/null; then
        echo "Pulsar is running with PID $PID."
    else
        echo "Pulsar is not running, but PID file exists."
    fi
else
    echo "Pulsar is not running."
fi
