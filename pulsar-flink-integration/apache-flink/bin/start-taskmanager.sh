#!/bin/bash

FLINK_HOME=$(dirname "$0")/..
LOG_DIR=$FLINK_HOME/log
LOG_FILE=$LOG_DIR/taskmanager.log

mkdir -p $LOG_DIR

# Start the TaskManager
echo "Starting TaskManager..."
nohup java -classpath $FLINK_HOME/lib/* org.apache.flink.runtime.taskmanager.TaskManager > $LOG_FILE 2>&1 &
echo $! > $LOG_DIR/taskmanager.pid

echo "TaskManager started with PID $(cat $LOG_DIR/taskmanager.pid). Logs: $LOG_FILE"
