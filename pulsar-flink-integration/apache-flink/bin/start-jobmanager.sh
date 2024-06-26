#!/bin/bash

FLINK_HOME=$(dirname "$0")/..
LOG_DIR=$FLINK_HOME/log
LOG_FILE=$LOG_DIR/jobmanager.log

mkdir -p $LOG_DIR

# Start the JobManager
echo "Starting JobManager..."
nohup java -classpath $FLINK_HOME/lib/* org.apache.flink.runtime.jobmanager.JobManager > $LOG_FILE 2>&1 &
echo $! > $LOG_DIR/jobmanager.pid

echo "JobManager started with PID $(cat $LOG_DIR/jobmanager.pid). Logs: $LOG_FILE"
