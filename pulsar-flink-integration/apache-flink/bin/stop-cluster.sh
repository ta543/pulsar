#!/bin/bash

# Stop the JobManager
echo "Stopping JobManager..."
pkill -f org.apache.flink.runtime.jobmanager.JobManager

# Stop the TaskManagers
echo "Stopping TaskManagers..."
pkill -f org.apache.flink.runtime.taskmanager.TaskManager

echo "Flink cluster stopped."
