#!/bin/bash

# Start the JobManager
echo "Starting JobManager..."
./start-jobmanager.sh

# Start the TaskManagers
echo "Starting TaskManagers..."
NUM_TASKMANAGERS=2
for i in $(seq 1 $NUM_TASKMANAGERS); do
    ./start-taskmanager.sh &
done

echo "Flink cluster started."
